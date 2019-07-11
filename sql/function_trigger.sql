



-----------------------------------------------------------FUNCTION ADD_ID------------------------------------------------------
-----------------------------------------------------------FUNCTION ADD_ID------------------------------------------------------
-----------------------------------------------------------FUNCTION ADD_ID------------------------------------------------------
-- ID 자동 추가 함수
-- 사용 예시
-- ADD_ID('테이블명', 'ID컬럼명', '접두사')
-- INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '구이름');
CREATE OR REPLACE FUNCTION ADD_ID
( TABLE_NAME        IN VARCHAR2
, ID_COLUMN IN VARCHAR2
, ID_SUFFIX IN VARCHAR2
)
RETURN VARCHAR2
IS
    V_RESULT    VARCHAR2(10);
    V_SQL       VARCHAR2(1000);
    V_SUFFIX    VARCHAR2(10);
BEGIN
    V_SUFFIX := ID_SUFFIX;
    V_SQL := 'SELECT ''' || V_SUFFIX || ''' || LPAD( TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('|| ID_COLUMN ||', 3))), 0) + 1), 5, ''0'') FROM ' || TABLE_NAME ;

    EXECUTE IMMEDIATE V_SQL INTO V_RESULT;

    RETURN V_RESULT;
END;


-------------------------------------------------TRIIGER BEFORE_REVIEW_SUB_TRIGGER----------------------------------------------
-------------------------------------------------TRIIGER BEFORE_REVIEW_SUB_TRIGGER----------------------------------------------
-------------------------------------------------TRIIGER BEFORE_REVIEW_SUB_TRIGGER----------------------------------------------
-- REVIEW_SUB에 INSERT하기 전에 검사해본다.
-- REVIEW_SUB에 INSERT할 TAKEUSER의 내 이번에 받을 BADGEPOINTID와 동일한 유효기간내 BADGEPOINTID가 2개 이상이면(이번꺼 받으면 3개 이상)
-- REVIEW_SUB에 INSERT하기 전에 USER_BADGE_LOG에도 넣어준다.
-- ※ 이게 잘 돌아가려면 REVIEW_SUB에 INSERT 하기 전에 REVIEW에 INSERT 해야됨
-- 원래 AFTER 트리거로 만들어서, REVIEW_SUB에 INSERT한 결과 해당 뱃지 포인트가 3개 이상이면 USER_BADGE_LOG에 INSERT하고 싶었으나, 
-- 지금 트리거 내에서 REVIEW_SUB를 조회해야 되는데 바뀌는 중인 테이블을 참조하면 에러가남(안정성 때문)
-- 그래서 BEFORE 트리거로 만듬. BEFORE 트리거는 아직 테이블이 변형 전이기 때문에 그 테이블을 참조해도 됨
CREATE OR REPLACE TRIGGER BEFORE_REVIEW_SUB_TRIGGER
    BEFORE 
    INSERT ON REVIEW_SUB
    FOR EACH ROW
DECLARE
    V_TAKEUSERID            REVIEW.TAKEUSERID%TYPE;
    V_REVIEWDATE            REVIEW.REVIEWDATE%TYPE;
    V_COUNT                 NUMBER;
    V_GETREVIEWID           REVIEW.REVIEWID%TYPE;
    V_EXPIRATIONREVIEWID    REVIEW.REVIEWID%TYPE;
BEGIN
    -- REVIEW_SUB에 INSERT할 REVIEWID로 REVIEW테이블에서 TAKEUSERID와 REVIEWDATE를 찾아옴
    -- ※ 이게 잘 돌아가려면 REVIEW_SUB에 INSERT 하기 전에 REVIEW에 INSERT 해야됨
    SELECT TAKEUSERID, REVIEWDATE INTO V_TAKEUSERID, V_REVIEWDATE
    FROM  REVIEW
    WHERE REVIEWID=:NEW.REVIEWID;
    
    -- REVIEW_SUB와 REVIEW를 붙여준뒤 이번에 TAKEUSERID가 받을 BADGEPOIONTID와 동일한 BADGEPOINTID가 유효기간 내 몇개 있는지 조사 
    SELECT COUNT(*) INTO V_COUNT
    FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
    WHERE RV.TAKEUSERID = V_TAKEUSERID
      AND RS.BADGEPOINTID = :NEW.BADGEPOINTID
      AND ADD_MONTHS(RV.REVIEWDATE,12) > V_REVIEWDATE;
    
    -- 조사 결과, 유효기간내 뱃지포인트가 2개 이상이라면(이번에 받으면 3개가 되는 상황)
    IF V_COUNT >= 2 
        THEN -- USER_BADGE_LOG에 들어갈 뱃지 받은 후기ID는 이번에 REVIEW_SUB에 들어갈 REVIEWID가 되고
             V_GETREVIEWID := :NEW.REVIEWID;
             
             -- 유효기간내 뱃지포인트 리스트중 2번째 REVIEWID를 가져와 만료 후기ID로 함.
             SELECT REVIEWID INTO V_EXPIRATIONREVIEWID
             FROM
             (
             SELECT ROWNUM AS NUM, RV.REVIEWID -- ,RV.TAKEUSERID, RS.BADGEPOINTID, RV.REVIEWDATE, RS.ID
             FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
             WHERE RV.TAKEUSERID = V_TAKEUSERID
               AND RS.BADGEPOINTID = :NEW.BADGEPOINTID
               AND ADD_MONTHS(RV.REVIEWDATE,12) > V_REVIEWDATE
             ORDER BY RV.REVIEWDATE DESC
             )
             WHERE NUM=2;
             
             -- 그냥 안내문
             DBMS_OUTPUT.PUT_LINE('TRIGGER ON!');
             DBMS_OUTPUT.PUT_LINE(V_TAKEUSERID);
             DBMS_OUTPUT.PUT_LINE(:NEW.BADGEPOINTID);             
             DBMS_OUTPUT.PUT_LINE(V_GETREVIEWID);                          
             DBMS_OUTPUT.PUT_LINE(V_EXPIRATIONREVIEWID);
             
             -- USER_BADGE_LOG에 INSERT
             INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
             VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_TAKEUSERID, :NEW.BADGEPOINTID, V_GETREVIEWID, V_EXPIRATIONREVIEWID);
    END IF;
END;