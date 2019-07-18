-- 입력받은 userId가 postId에 후기를 남겼나(참여실패 등등 전부 그냥 0처리 후기 있으면 1이상)
-- 이게 되려면 3일 지나서 자동으로 후기 남겨지는 액션에선 giveUserId가 null이 되어야 함 → quartz
select count(*)
from review
where postid='PT00008'
  and giveuserid='advice'
;


-------

SELECT POSTID ,USERID, GIVEUSERID, GIVEUSERNAME, GIVEUSERURL, GRADE, TAKEURL, CONTENTS
FROM VIEW_REVIEW_INQURY
WHERE POSTID = 'PT00778'
  AND USERID='BROGAN';


SELECT *
FROM POST P JOIN REVIEW RV ON P.POSTID=RV.POSTID
            JOIN REVIEW_SUB RS ON RV.REVIEWID=RS.REVIEWID
            JOIN JOIN J ON P.POSTID=J.POSTID
WHERE P.POSTID='PT00778';




SELECT J.POSTID, RV.GIVEUSERID, UE.NICKNAME AS GIVEUSERNICKNAME,RV.TAKEUSERID, UBV.URL, RV.GRADE, RS.BADGEPOINTID, PT.URL, RS.CONTENTS 
FROM JOIN J JOIN REVIEW RV ON (J.USERID=RV.GIVEUSERID AND J.POSTID=RV.POSTID)
            JOIN REVIEW_SUB RS ON RV.REVIEWID=RS.REVIEWID
            JOIN USER_BADGE_VIEW UBV ON J.USERID=UBV.USERID
            JOIN POINT PT ON RS.BADGEPOINTID=PT.BADGEPOINTID
            JOIN USER_ESSENTIAL UE ON RV.GIVEUSERID=UE.USERID
WHERE J.POSTID='PT00064'
  AND J.STATUSID='ST00003'
  AND J.USERID='BROGAN'
;

SELECT *
FROM USER_BADGE_VIEW;
SELECT *
FROM REVIEW_SUB;



-- 모임 조회 리스트(개설자, 참여자 모두)
SELECT T1.TAKEUSERID as USERID, T2.GIVEUSERID, UE.NICKNAME as GIVEUSERNAME, PT.URL as GIVEUSERURL
    , NVL(FN_GET_REVIEW_GRADE(T2.GIVEUSERID, T1.TAKEUSERID, 'PT00066'),3) AS GRADE
    , NVL(FN_GET_REVIEW_SUB_URL(T2.GIVEUSERID, T1.TAKEUSERID, 'PT00066'),'img/Logo.png') AS TAKEURL
    , NVL(FN_GET_REVIEW_SUB_CONTENTS(T2.GIVEUSERID, T1.TAKEUSERID, 'PT00066'), '해당참여자가 아직 후기를 남기지 않았습니다.') AS CONTENTS
FROM
(
    SELECT USERID AS TAKEUSERID
    FROM POST
    WHERE POSTID='PT00066'
    UNION
    SELECT USERID
    FROM JOIN
    WHERE POSTID='PT00066'
) T1 CROSS JOIN (
    SELECT USERID AS GIVEUSERID
    FROM POST
    WHERE POSTID='PT00066'
    UNION
    SELECT USERID
    FROM JOIN
    WHERE POSTID='PT00066'
) T2 JOIN USER_ESSENTIAL UE ON T2.GIVEUSERID=UE.USERID 
     JOIN USER_BADGE_LOG UBL ON UE.BADGELOGID=UBL.BADGELOGID
     JOIN POINT PT ON UBL.BADGEPOINTID=PT.BADGEPOINTID
WHERE T1.TAKEUSERID!=T2.GIVEUSERID
  AND T1.TAKEUSERID='BROGAN'
;





-- FN_GET_REVIEW_GRADE
CREATE OR REPLACE FUNCTION FN_GET_REVIEW_GRADE(V_GIVEUSERID VARCHAR, V_TAKEUSERID VARCHAR, V_POSTID VARCHAR)
RETURN VARCHAR2
IS
    V_GRADE NUMBER;
BEGIN
    SELECT MAX(GRADE) INTO V_GRADE
    FROM REVIEW 
    WHERE GIVEUSERID=V_GIVEUSERID 
      AND TAKEUSERID=V_TAKEUSERID
      AND POSTID=V_POSTID;
    
    RETURN V_GRADE;
END;

-- FN_GET_REVIEW_SUB_URL
CREATE OR REPLACE FUNCTION FN_GET_REVIEW_SUB_URL(V_GIVEUSERID VARCHAR, V_TAKEUSERID VARCHAR, V_POSTID VARCHAR)
RETURN VARCHAR2
IS
    V_GRADE NUMBER;
    V_REVIEWID  REVIEW.REVIEWID%TYPE;
    V_URL       POINT.URL%TYPE;
BEGIN
    SELECT MAX(REVIEWID) INTO V_REVIEWID
    FROM REVIEW 
    WHERE GIVEUSERID=V_GIVEUSERID 
      AND TAKEUSERID=V_TAKEUSERID
      AND POSTID=V_POSTID;
    
    SELECT URL  INTO V_URL
    FROM REVIEW_SUB RS JOIN POINT PT ON RS.BADGEPOINTID=PT.BADGEPOINTID
    WHERE REVIEWID=V_REVIEWID;
    
    RETURN V_URL;
END;


-- FN_GET_REVIEW_SUB_CONTENTS
CREATE OR REPLACE FUNCTION FN_GET_REVIEW_SUB_CONTENTS(V_GIVEUSERID VARCHAR, V_TAKEUSERID VARCHAR, V_POSTID VARCHAR)
RETURN VARCHAR2
IS
    V_GRADE         NUMBER;
    V_REVIEWID      REVIEW.REVIEWID%TYPE;
    V_CONTENTS      REVIEW_SUB.CONTENTS%TYPE;
BEGIN
    SELECT MAX(REVIEWID) INTO V_REVIEWID
    FROM REVIEW 
    WHERE GIVEUSERID=V_GIVEUSERID 
      AND TAKEUSERID=V_TAKEUSERID
      AND POSTID=V_POSTID;
    
    SELECT CONTENTS  INTO V_CONTENTS
    FROM REVIEW_SUB RS JOIN POINT PT ON RS.BADGEPOINTID=PT.BADGEPOINTID
    WHERE REVIEWID=V_REVIEWID;
    
    RETURN V_CONTENTS;
END;









SELECT GRADE FROM REVIEW WHERE GIVEUSERID='' AND TAKEUSERID='' AND POSTID='';


SELECT *
FROM REVIEW_SUB
WHERE REVIEWID='PT01031';

SELECT *
FROM REVIEW
WHERE POSTID='PT01031'
  AND GIVEUSERID;
SELECT *
FROM JOIN
WHERE POSTID='PT01031';




SELECT *
FROM USERBADGELOG_VIEW;




SELECT *
FROM REVIEW;
select *
from post_view
where postid='PT00966';

--guestReview

SELECT P.USERID, UE.NICKNAME, PT.URL, 0 AS NUM
FROM POST P JOIN USER_ESSENTIAL UE ON P.USERID=UE.USERID
            JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
            JOIN POINT PT ON BL.BADGEPOINTID=PT.BADGEPOINTID
WHERE P.POSTID='PT01301'
UNION
SELECT J.USERID, UE.NICKNAME, PT.URL, ROW_NUMBER() OVER(ORDER BY J.USERID DESC) AS NUM
FROM POST P JOIN JOIN J ON J.POSTID=P.POSTID
            JOIN USER_ESSENTIAL UE ON J.USERID=UE.USERID
            JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
            JOIN POINT PT ON BL.BADGEPOINTID=PT.BADGEPOINTID
WHERE P.POSTID='PT01301'
  AND J.USERID NOT IN ('BAHEELA')
  ;



SELECT *
FROM user_badge_log
where userid='BROGAN'
   and badgepointid = '';
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------



		SELECT POSTID ,USERID, GIVEUSERID, GIVEUSERNAME, GIVEUSERURL, GRADE, TAKEURL, CONTENTS
		FROM VIEW_REVIEW_INQURY
		WHERE UPPER(USERID) = UPPER('BROGAN') AND POSTID = 'PT01081';

SELECT R.REVIEWID, R.TAKEUSERID AS USERID, R.GIVEUSERID, R.NICKNAME AS GIVEUSERNAME, VU.URL AS GIVEUSERURL, R.POSTID, R.GRADE, RS.BADGEPOINTID AS BADGEPOINTID, RS.URL AS TAKEURL, RS.CONTENTS AS CONTENTS
FROM VIEW_REVIEW_NICK R, VIEW_SUB_URL RS, VIEW_DAEPO_BADGE_URL VU
WHERE RS.REVIEWID(+) = R.REVIEWID AND VU.USERID = R.GIVEUSERID
ORDER BY TAKEUSERID, REVIEWID;

SELECT USERID
FROM POST
WHERE POSTID='PT00003'
;
select *
from user_essential
where userid='BROGAN';
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------



-- REVIEWID 만들어주기
SELECT ADD_ID('REVIEW','REVIEWID', 'RV')
FROM DUAL;

-- REVIEW INSERT 구문
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW','REVIEWID', 'RV'), 'POSTID', 'GIVEUSERID', 'TAKEUSERID', 'GRADE', SYSDATE);

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------


-- REVIEW할 REVIEW ID와 BADGEPOINTID를 받아 놓음 + CONTENTS도 있어야 함
-- REVIEW_SUB에 INSERT
INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) 
VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'REVIEWID', 'BADGEPOINTID', 'CONTENTS');
-- 방금 INSERT한 REVIEWID로 TAKEUSERID를 가져옴
SELECT TAKEUSERID
FROM REVIEW
WHERE REVIEWID='RV00001';
-- 유효기간 내 뱃지 포인트중 TAKEUSERID가 방금 받은 BADGEPOINTID에 해당하는 갯수를 찍어봄
SELECT COUNT(*)
FROM REVIEW_SUB RS JOIN REVIEW R ON RS.REVIEWID=R.REVIEWID
WHERE TAKEUSERID = 'anlant'
  AND ADD_MONTHS(REVIEWDATE,12)>=SYSDATE
  AND BADGEPOINTID='BP00002';
-- 찍은게 3이상이면 USER_BADGE_LOG에 기록을 남겨줘야 하는데 
-- 기록 남기려면 추가로 필요한게 GETREVIEWID와 EXPIRATIONREVIEWID임. 
-- GETREVIEWID는 이미 가지고 있음.
-- EXPIRATIONREVIEWID를 뽑아옴. 위 조회문에서 3번째걸 뽑으면 됨
SELECT REVIEWID
FROM
(
SELECT RS.REVIEWID, RS.BADGEPOINTID, R.REVIEWDATE, ROW_NUMBER() OVER(ORDER BY R.REVIEWDATE DESC) AS NUM
FROM REVIEW_SUB RS JOIN REVIEW R ON RS.REVIEWID=R.REVIEWID
WHERE TAKEUSERID = 'anlant'
  AND ADD_MONTHS(REVIEWDATE,12)>=SYSDATE
  AND BADGEPOINTID='BP00002'
)
WHERE NUM=3;
-- 받아온 걸로 USER_BADGE_LOG에 INSERT 해주면 됨
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'USERID', 'BP00011', 'GETREVIEWID', 'EXPIRATIONREVIEWID');  

CREATE OR REPLACE PROCEDURE INSERT_REVIEW_SUB(V_REVIEWID VARCHAR2, V_BADGEPOINTID VARCHAR2, V_CONTETNS VARCHAR2)
IS
    V_TAKEUSERID            USER_ESSENTIAL.USERID%TYPE;
    V_EXPIRATIONREVIEWID    REVIEW.REVIEWID%TYPE;
    V_COUNT                 NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('프로시저 시작');
    INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) 
    VALUES(REVIEW_SUB_SEQ.NEXTVAL, V_REVIEWID, V_BADGEPOINTID, V_CONTETNS);
    
    SELECT TAKEUSERID INTO V_TAKEUSERID
    FROM REVIEW
    WHERE REVIEWID=V_REVIEWID;
    
    SELECT COUNT(*) INTO V_COUNT
    FROM REVIEW_SUB RS JOIN REVIEW R ON RS.REVIEWID=R.REVIEWID
    WHERE TAKEUSERID = V_TAKEUSERID
      AND ADD_MONTHS(REVIEWDATE,12)>=SYSDATE
      AND BADGEPOINTID=V_BADGEPOINTID;
      
    IF V_COUNT>=3
        THEN    SELECT REVIEWID INTO V_EXPIRATIONREVIEWID
                FROM
                (
                SELECT RS.REVIEWID, RS.BADGEPOINTID, R.REVIEWDATE, ROW_NUMBER() OVER(ORDER BY R.REVIEWDATE DESC) AS NUM
                FROM REVIEW_SUB RS JOIN REVIEW R ON RS.REVIEWID=R.REVIEWID
                WHERE TAKEUSERID = V_TAKEUSERID
                  AND ADD_MONTHS(REVIEWDATE,12)>=SYSDATE
                  AND BADGEPOINTID=V_BADGEPOINTID
                )
                WHERE NUM=3;
                
                DBMS_OUTPUT.PUT_LINE('USER_BADGE_LOG 기록남김');
                
                INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
                VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_TAKEUSERID, V_BADGEPOINTID, V_REVIEWID, V_EXPIRATIONREVIEWID); 
    END IF;
     DBMS_OUTPUT.PUT_LINE('프로시저 종료');
END;



--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------


SELECT *
FROM
(
    SELECT M.MESSAGEID,M.CONTENTS,M.GIVEUSERID,M.TAKEUSERID,M.SENDDATE,M.CHECKDATE
             , FLOOR( (ROW_NUMBER() OVER(ORDER BY M.SENDDATE DESC) - 1)/10 )+1 AS PAGENUM
         , CEIL( (FLOOR( (ROW_NUMBER() OVER(ORDER BY M.SENDDATE DESC) - 1)/10 )+1)/5 ) AS LARGEPAGENUM
    FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.TAKEUSERID=DM.USERID)
    WHERE DM.MESSAGEID IS NULL AND UPPER(TAKEUSERID)=UPPER('BROGAN')
    ORDER BY M.SENDDATE DESC
)
WHERE PAGENUM=1
;



-- TotalPage, TotalLargePage를 뽑아줌
SELECT CEIL(COUNT(*)/10) AS TOTALPAGE
FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.TAKEUSERID=DM.USERID)
WHERE DM.MESSAGEID IS NULL AND UPPER(TAKEUSERID)=UPPER('BROGAN')
ORDER BY M.SENDDATE DESC
;

SELECT CEIL(CEIL(COUNT(*)/10)/5) AS TOTALLARGEPAGE
FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.TAKEUSERID=DM.USERID)
WHERE DM.MESSAGEID IS NULL AND UPPER(TAKEUSERID)=UPPER('BROGAN')
ORDER BY M.SENDDATE DESC
;
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'BROGAN', 'caroin', '보낸 사람 BRGAN', SYSDATE, SYSDATE);
COMMIT;

------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM
(
    SELECT M.MESSAGEID,M.CONTENTS,M.GIVEUSERID,M.TAKEUSERID,M.SENDDATE,M.CHECKDATE
             , FLOOR( (ROW_NUMBER() OVER(ORDER BY M.SENDDATE DESC) - 1)/10 )+1 AS PAGENUM
         , CEIL( (FLOOR( (ROW_NUMBER() OVER(ORDER BY M.SENDDATE DESC) - 1)/10 )+1)/5 ) AS LARGEPAGENUM
    FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.GIVEUSERID=DM.USERID)
    WHERE DM.MESSAGEID IS NULL AND UPPER(GIVEUSERID)=UPPER('BROGAN')
    ORDER BY M.SENDDATE
)
WHERE PAGENUM=1
;

-- TotalPage, TotalLargePage를 뽑아줌
SELECT CEIL(COUNT(*)/10) AS TOTALPAGE
FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.GIVEUSERID=DM.USERID)
WHERE DM.MESSAGEID IS NULL AND UPPER(GIVEUSERID)=UPPER('BROGAN')
ORDER BY M.SENDDATE
;

SELECT CEIL(CEIL(COUNT(*)/10)/5) AS TOTALLARGEPAGE
FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.GIVEUSERID=DM.USERID)
WHERE DM.MESSAGEID IS NULL AND UPPER(GIVEUSERID)=UPPER('BROGAN')
ORDER BY M.SENDDATE
;
--------------------------------------------------------------------------------------------------------------------------------





select count(*)
from post p join interest_sub s on p.intersubid=s.intersubid
where intermainid='IM00001'
  and meetdate>=sysdate;

select *
from post_view
where postid='PT00858';

select *
from same_gender;
select *
from interest_main;

SELECT USERID, INTERSUBID AS INTERSUBID1, INTERMAINID AS INTERMAINID1, INTERSUBNAME AS INTERSUBNAME1, INTERMAINNAME AS INTERMAINNAME1
FROM
(
    SELECT UI.ID, UI.USERID, UI.INTERSUBID, "IS".INTERMAINID, "IS".INTERSUBNAME, IM.INTERMAINNAME
    FROM USER_INTEREST UI JOIN INTEREST_SUB "IS" ON UI.INTERSUBID="IS".INTERSUBID
                          JOIN INTEREST_MAIN IM ON "IS".INTERMAINID=IM.INTERMAINID
    WHERE USERID='BROGAN'
    ORDER BY UI.ID
)
WHERE ROWNUM=1	;

SELECT *
FROM
(
    SELECT UI.ID, UI.USERID, UI.INTERSUBID, "IS".INTERMAINID 
    FROM USER_INTEREST UI JOIN INTEREST_SUB "IS" ON UI.INTERSUBID="IS".INTERSUBID
    WHERE USERID='BROGAN'
    ORDER BY UI.ID
)
WHERE ROWNUM=1	;

SELECT *
FROM INTEREST_MAIN;



















--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------







SELECT *
FROM
(
    SELECT ID, TITLE, CONTENTS, TO_CHAR(NOTICEDATE, 'YYYY-MM-DD HH24:MI') AS CSDATE
         , FLOOR( (ROW_NUMBER() OVER(ORDER BY NOTICEDATE DESC) - 1)/15 )+1 AS PAGENUM
         , CEIL( (FLOOR( (ROW_NUMBER() OVER(ORDER BY NOTICEDATE DESC) - 1)/15 )+1)/5 ) AS LARGEPAGENUM
    FROM NOTICE
    WHERE TITLE LIKE '%'||'고객'||'%'
      OR CONTENTS LIKE '%'||'고객'||'%'
    ORDER BY NOTICEDATE DESC
)
WHERE PAGENUM=1;

		SELECT COUNT(*) AS IDPWCHECK
		FROM LOGIN
		WHERE PWD = CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$')
        AND USERID='BROGAN';

SELECT *
FROM
(
    SELECT ID,TITLE, CONTENTS, TO_CHAR(FAQDATE, 'YYYY-MM-DD HH24:MI') AS CSDATE
         , FLOOR( (ROW_NUMBER() OVER(ORDER BY FAQDATE DESC) - 1)/15 )+1 AS PAGENUM
         , CEIL( (FLOOR( (ROW_NUMBER() OVER(ORDER BY FAQDATE DESC) - 1)/15 )+1)/5 ) AS LARGEPAGENUM
    FROM FAQ
    WHERE TITLE LIKE '%'||'고객'||'%'
      OR CONTENTS LIKE '%'||'고객'||'%'
    ORDER BY FAQDATE DESC
)
WHERE PAGENUM=1;

-- TotalPage, TotalLargePage를 뽑아줌
SELECT CEIL(COUNT(*)/15) AS TOTALPAGE
FROM NOTICE
WHERE TITLE LIKE '%'||'고객'||'%'
   OR CONTENTS LIKE '%'||'고객'||'%';

SELECT CEIL(CEIL(COUNT(*)/15)/5) AS TOTALLARGEPAGE
FROM NOTICE
WHERE TITLE LIKE '%'||'고객'||'%'
   OR CONTENTS LIKE '%'||'고객'||'%';
