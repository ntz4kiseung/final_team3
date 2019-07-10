



-----------------------------------------------------------FUNCTION ADD_ID------------------------------------------------------
-----------------------------------------------------------FUNCTION ADD_ID------------------------------------------------------
-----------------------------------------------------------FUNCTION ADD_ID------------------------------------------------------
-- ID �ڵ� �߰� �Լ�
-- ��� ����
-- ADD_ID('���̺��', 'ID�÷���', '���λ�')
-- INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���̸�');
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
-- REVIEW_SUB�� INSERT�ϱ� ���� �˻��غ���.
-- REVIEW_SUB�� INSERT�� TAKEUSER�� �� �̹��� ���� BADGEPOINTID�� ������ ��ȿ�Ⱓ�� BADGEPOINTID�� 2�� �̻��̸�(�̹��� ������ 3�� �̻�)
-- REVIEW_SUB�� INSERT�ϱ� ���� USER_BADGE_LOG���� �־��ش�.
-- �� �̰� �� ���ư����� REVIEW_SUB�� INSERT �ϱ� ���� REVIEW�� INSERT �ؾߵ�
-- ���� AFTER Ʈ���ŷ� ����, REVIEW_SUB�� INSERT�� ��� �ش� ���� ����Ʈ�� 3�� �̻��̸� USER_BADGE_LOG�� INSERT�ϰ� �;�����, 
-- ���� Ʈ���� ������ REVIEW_SUB�� ��ȸ�ؾ� �Ǵµ� �ٲ�� ���� ���̺��� �����ϸ� ��������(������ ����)
-- �׷��� BEFORE Ʈ���ŷ� ����. BEFORE Ʈ���Ŵ� ���� ���̺��� ���� ���̱� ������ �� ���̺��� �����ص� ��
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
    -- REVIEW_SUB�� INSERT�� REVIEWID�� REVIEW���̺��� TAKEUSERID�� REVIEWDATE�� ã�ƿ�
    -- �� �̰� �� ���ư����� REVIEW_SUB�� INSERT �ϱ� ���� REVIEW�� INSERT �ؾߵ�
    SELECT TAKEUSERID, REVIEWDATE INTO V_TAKEUSERID, V_REVIEWDATE
    FROM  REVIEW
    WHERE REVIEWID=:NEW.REVIEWID;
    
    -- REVIEW_SUB�� REVIEW�� �ٿ��ص� �̹��� TAKEUSERID�� ���� BADGEPOIONTID�� ������ BADGEPOINTID�� ��ȿ�Ⱓ �� � �ִ��� ���� 
    SELECT COUNT(*) INTO V_COUNT
    FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
    WHERE RV.TAKEUSERID = V_TAKEUSERID
      AND RS.BADGEPOINTID = :NEW.BADGEPOINTID
      AND ADD_MONTHS(RV.REVIEWDATE,12) > V_REVIEWDATE;
    
    -- ���� ���, ��ȿ�Ⱓ�� ��������Ʈ�� 2�� �̻��̶��(�̹��� ������ 3���� �Ǵ� ��Ȳ)
    IF V_COUNT >= 2 
        THEN -- USER_BADGE_LOG�� �� ���� ���� �ı�ID�� �̹��� REVIEW_SUB�� �� REVIEWID�� �ǰ�
             V_GETREVIEWID := :NEW.REVIEWID;
             
             -- ��ȿ�Ⱓ�� ��������Ʈ ����Ʈ�� 2��° REVIEWID�� ������ ���� �ı�ID�� ��.
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
             
             -- �׳� �ȳ���
             DBMS_OUTPUT.PUT_LINE('TRIGGER ON!');
             DBMS_OUTPUT.PUT_LINE(V_TAKEUSERID);
             DBMS_OUTPUT.PUT_LINE(:NEW.BADGEPOINTID);             
             DBMS_OUTPUT.PUT_LINE(V_GETREVIEWID);                          
             DBMS_OUTPUT.PUT_LINE(V_EXPIRATIONREVIEWID);
             
             -- USER_BADGE_LOG�� INSERT
             INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
             VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_TAKEUSERID, :NEW.BADGEPOINTID, V_GETREVIEWID, V_EXPIRATIONREVIEWID);
    END IF;
END;