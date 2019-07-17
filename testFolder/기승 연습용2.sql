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
FROM JOIN;
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



-- REVIEWID ������ֱ�
SELECT ADD_ID('REVIEW','REVIEWID', 'RV')
FROM DUAL;

-- REVIEW INSERT ����
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW','REVIEWID', 'RV'), 'POSTID', 'GIVEUSERID', 'TAKEUSERID', 'GRADE', SYSDATE);

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------


-- REVIEW�� REVIEW ID�� BADGEPOINTID�� �޾� ���� + CONTENTS�� �־�� ��
-- REVIEW_SUB�� INSERT
INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) 
VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'REVIEWID', 'BADGEPOINTID', 'CONTENTS');
-- ��� INSERT�� REVIEWID�� TAKEUSERID�� ������
SELECT TAKEUSERID
FROM REVIEW
WHERE REVIEWID='RV00001';
-- ��ȿ�Ⱓ �� ���� ����Ʈ�� TAKEUSERID�� ��� ���� BADGEPOINTID�� �ش��ϴ� ������ ��
SELECT COUNT(*)
FROM REVIEW_SUB RS JOIN REVIEW R ON RS.REVIEWID=R.REVIEWID
WHERE TAKEUSERID = 'anlant'
  AND ADD_MONTHS(REVIEWDATE,12)>=SYSDATE
  AND BADGEPOINTID='BP00002';
-- ������ 3�̻��̸� USER_BADGE_LOG�� ����� ������� �ϴµ� 
-- ��� ������� �߰��� �ʿ��Ѱ� GETREVIEWID�� EXPIRATIONREVIEWID��. 
-- GETREVIEWID�� �̹� ������ ����.
-- EXPIRATIONREVIEWID�� �̾ƿ�. �� ��ȸ������ 3��°�� ������ ��
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
-- �޾ƿ� �ɷ� USER_BADGE_LOG�� INSERT ���ָ� ��
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'USERID', 'BP00011', 'GETREVIEWID', 'EXPIRATIONREVIEWID');  

CREATE OR REPLACE PROCEDURE INSERT_REVIEW_SUB(V_REVIEWID VARCHAR2, V_BADGEPOINTID VARCHAR2, V_CONTETNS VARCHAR2)
IS
    V_TAKEUSERID            USER_ESSENTIAL.USERID%TYPE;
    V_EXPIRATIONREVIEWID    REVIEW.REVIEWID%TYPE;
    V_COUNT                 NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('���ν��� ����');
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
                
                DBMS_OUTPUT.PUT_LINE('USER_BADGE_LOG ��ϳ���');
                
                INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
                VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_TAKEUSERID, V_BADGEPOINTID, V_REVIEWID, V_EXPIRATIONREVIEWID); 
    END IF;
     DBMS_OUTPUT.PUT_LINE('���ν��� ����');
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



-- TotalPage, TotalLargePage�� �̾���
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
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'BROGAN', 'caroin', '���� ��� BRGAN', SYSDATE, SYSDATE);
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

-- TotalPage, TotalLargePage�� �̾���
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
    WHERE TITLE LIKE '%'||'����'||'%'
      OR CONTENTS LIKE '%'||'����'||'%'
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
    WHERE TITLE LIKE '%'||'����'||'%'
      OR CONTENTS LIKE '%'||'����'||'%'
    ORDER BY FAQDATE DESC
)
WHERE PAGENUM=1;

-- TotalPage, TotalLargePage�� �̾���
SELECT CEIL(COUNT(*)/15) AS TOTALPAGE
FROM NOTICE
WHERE TITLE LIKE '%'||'����'||'%'
   OR CONTENTS LIKE '%'||'����'||'%';

SELECT CEIL(CEIL(COUNT(*)/15)/5) AS TOTALLARGEPAGE
FROM NOTICE
WHERE TITLE LIKE '%'||'����'||'%'
   OR CONTENTS LIKE '%'||'����'||'%';
