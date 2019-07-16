
SELECT *
FROM REVIEW_SUB RS JOIN REVIEW R ON RS.REVIEWID=R.REVIEWID
WHERE TAKEUSERID= 'EDROSINK'
  AND BADGEPOINTID='BP00002'; 

SELECT *
FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.GETREVIEWID=RV.REVIEWID
                       LEFT JOIN REVIEW RV2 ON BL.EXPIRATIONREVIEWID=RV2.REVIEWID
WHERE BL.USERID= 'EDROSINK'
  AND BL.BADGEPOINTID='BP00002';

SELECT RV.REVIEWDATE AS GET,RV2.REVIEWDATE AS AA , ADD_MONTHS(RV2.REVIEWDATE,12) AS EXPIR
FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.GETREVIEWID=RV.REVIEWID
                       LEFT JOIN REVIEW RV2 ON BL.EXPIRATIONREVIEWID=RV2.REVIEWID
WHERE BL.USERID= 'EDROSINK'
  AND BL.BADGEPOINTID='BP00002'
  AND (ADD_MONTHS(RV.REVIEWDATE,12) >= SYSDATE OR SUBSTR(BL.BADGEPOINTID,3) >= 11);

SELECT BL.USERID, MAX(BL.BADGELOGID) AS BADGELOGID, P.BADGEPOINTNAME
FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.EXPIRATIONREVIEWID=RV.REVIEWID
                            JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
WHERE (ADD_MONTHS(RV.REVIEWDATE,12) >= SYSDATE OR SUBSTR(BL.BADGEPOINTID,3) >= 11)
  AND BL.USERID= 'BROGAN'
  AND BL.BADGEPOINTID='BP00002'
GROUP BY BL.BADGEPOINTID, BL.USERID, P.BADGEPOINTNAME
ORDER BY USERID;

SELECT *
FROM POINT;
-- ���� ���ɻ� �̱�
SELECT USERID, INTERSUBID AS INTERSUBID1, INTERMAINID AS INTERMAINID1
FROM
(
    SELECT UI.ID, UI.USERID, UI.INTERSUBID, "IS".INTERMAINID 
    FROM USER_INTEREST UI JOIN INTEREST_SUB "IS" ON UI.INTERSUBID="IS".INTERSUBID
    WHERE USERID='adiard'
    ORDER BY UI.ID
)
WHERE ROWNUM=1
;

-- �Խ�Ʈ�� ���հ˻� ������


-- 1. ��α��ν� �ѷ��ִ� ���� ����
SELECT *
FROM
(
    SELECT POSTID, USERID, NICKNAME, TITLE, CONTENTS, MEETDATE, ADDRSINAME, ADDRGUNAME, URL, URLBAD
    FROM POST_VIEW
    WHERE MEETDATE>=SYSDATE
      AND FN_POST_IS_ACCEPTED(POSTID)=0
      AND INTERMAINID=(SELECT INTERMAINID
                        FROM
                        (
                            SELECT IM.INTERMAINID, RANK() OVER(ORDER BY COUNT(*)) AS RANK
                            FROM POST P JOIN INTEREST_SUB "IS" ON P.INTERSUBID="IS".INTERSUBID
                                        JOIN INTEREST_MAIN IM ON "IS".INTERMAINID=IM.INTERMAINID
                            WHERE P.MEETDATE>=SYSDATE
                            GROUP BY IM.INTERMAINID
                            ORDER BY RANK() OVER(ORDER BY COUNT(*))
                        )
                        WHERE ROWNUM=1)
    ORDER BY MEETDATE DESC
)
WHERE ROWNUM <=5;


-- 2. �α��ν� �ѷ��ִ� �����Կ��� ��õ�ϴ� ����
SELECT POSTID, USERID, NICKNAME, TITLE, CONTENTS, MEETDATE, ADDRSINAME, ADDRGUNAME, URL, URLBAD
FROM
(
    SELECT *
    FROM POST_VIEW 
    WHERE MEETDATE>=SYSDATE
      AND FN_POST_IS_ACCEPTED(POSTID)=0
    ORDER BY FN_CAL_RANK(POSTID, 'adiard', '||') DESC, MEETDATE DESC
)
WHERE ROWNUM <=5;

-- 3. ���� �ӹ� ����
SELECT *
FROM
(
    SELECT POSTID, USERID, NICKNAME, TITLE, CONTENTS, MEETDATE, ADDRSINAME, ADDRGUNAME, URL, URLBAD
    FROM POST_VIEW PV
    WHERE FN_POST_IS_ACCEPTED(POSTID)=0
      AND MEETDATE>=SYSDATE
    ORDER BY MEETDATE DESC
)
WHERE ROWNUM<=5;

-- 4-1. ���� ���� �Ұ� 2��
SELECT *
FROM
(
SELECT BADGEPOINTNAME, BADGEPOINTDESC1, URL, BADGEPOINTID
FROM POINT
ORDER BY DBMS_RANDOM.VALUE
)
WHERE ROWNUM<=2;
-- 4-2. �� ���� �ֱ� ȹ�� ���� ��
SELECT NICKNAME
FROM
(
    SELECT NICKNAME
    FROM USER_BADGE_LOG BL JOIN REVIEW RV ON BL.GETREVIEWID=RV.REVIEWID
                           JOIN USER_ESSENTIAL UE ON BL.USERID=UE.USERID
    WHERE BADGEPOINTID = 'BP00005'
    GROUP BY UE.NICKNAME, RV.REVIEWDATE
    ORDER BY REVIEWDATE DESC
)
WHERE ROWNUM<=3;
/*
�����ð�
�� ������id        userId
������ ����
�� ����            title
�� �������(��)	   addrSiId
��               addrSiName
�� �������(��)	   addrGuId
��               addrGuName
�ݸ������ ��	   addrDetail
��               interMainId
��ī�װ� ��з�  interMainName
��               interSubId
��ī�װ� �Һз�  interSubName
��ī�װ� �󼼳��� interDetail
���ּ��ο�	        minNum
���ִ��ο�	        maxNum
�ݰԽ���	        postDate
�ݸ�����	        meetDate
�ݵ�������	        samegender
�����ֿ���	        drink
����������	        grade
�ݺ�����	        mood
�ݳ���	            contents


�ݰ����� ���߹��� url	            urlBad
�ݰ����� ��ǥ���� url	            url

�ݰ����� �г���	                    nickname

��ȸ�ѻ��x�Խñ� ����	            postStatus

����ȭ��ȣ ��������	                telCertiId
���̸��� ��������	                emailCertiId
�ȷο쿩��(�����ڰ� ������ ����)	followId
*/
select *
from same_gender;
-- ���� ȸ�����Խ� �� �����α׿� '����'
-- ���� �̷����� ������ �� �������̺��� Ƚ�� �˻� �� ���� �α� ������Ʈ

-- �����α׿� Ȱ�������� ����. �װ� �ϰ����� �ְ� �츮�� �ٷ�⵵ ���ҵ�
-- ȸ�� �����Ҷ� �ڵ������� ���� �ְ�
-- ���� ���̺� �������� Ȱ�� ��ȸ���� Ȯ���ؼ� ���� Ƚ�� �Ǹ� ���� Ȱ�� ���� �ְ�

-- ���� ���� ��. �̰� ������� 
-- 1. ������ �������� �̹� ������ WHERE ���� �ĳ��ߵ�
-- 2. ��ȸ�� ����� �����Ŀ� ���� �ȷο� ���ΰ� �޶���
-- 3. ��ȸ�� ����� ������, �����ϰ� �����ϰ��� ���� � ���� �Խñ� ���°� �޶���
CREATE OR REPLACE VIEW POST_VIEW
AS
SELECT P.POSTID, P.USERID, UE.NICKNAME, P.TITLE, P.CONTENTS                                                   -- ������ ID, �г���, �������� ����, ����, ������ �г���
     , (SELECT ROUND(AVG(GRADE), 1) FROM REVIEW WHERE TAKEUSERID=P.USERID) GRADE                    --������ ����
     , (SELECT ID FROM USER_CERTIFICATION WHERE USERID=P.USERID AND CERTIID='CT00001') TELCERTIID   -- �޴��� ��������
     , (SELECT ID FROM USER_CERTIFICATION WHERE USERID=P.USERID AND CERTIID='CT00002') EMAILCERTIID -- �̸��� ��������
     , PO.URL            -- ���Խ�, Ȱ���� Ȱ�� ������ ������Ʈ �ǰ� �α��ν� ���� ���Ḧ Ȯ���ϴ°� �ϰ� �׳� url�� ����
     , FN_PROFILE_BAD_BADGE(P.USERID) AS URLBAD -- �������� ���� ������ ���� 1���� URL, ������ null
     , G.ADDRSIID, S.ADDRSINAME, P.ADDRGUID, G.ADDRGUNAME, P.ADDRDETAIL                     -- ���� ���(��) ID, �̸� / �������(��) ID, �̸� / ������� ������
     , "IS".INTERMAINID, IM.INTERMAINNAME, P.INTERSUBID, "IS".INTERSUBNAME, P.INTERDETAIL   -- ���ɻ�(��) ID, �̸� / ���ɻ�(��) ID, �̸� / ���ɻ� ������
     , P.MINNUM, P.MAXNUM                                                                   -- �ּ��ο�, �ִ��ο�
     , P.POSTDATE, P.MEETDATE                                                               -- �Խ���, ������
     , P.SAMEGENDERID SAMEGENDER, P.DRINKID DRINK, P.LIMITGRADE LIMITGRADE, P.MOODID MOOD   -- ��������, ���ֿ���, ������������, ������
FROM POST P JOIN ADDR_GU G ON P.ADDRGUID=G.ADDRGUID
            JOIN ADDR_SI S ON G.ADDRSIID=S.ADDRSIID
            JOIN INTEREST_SUB "IS" ON P.INTERSUBID="IS".INTERSUBID
            JOIN INTEREST_MAIN IM ON "IS".INTERMAINID=IM.INTERMAINID
            JOIN USER_ESSENTIAL UE ON P.USERID=UE.USERID
            JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
            JOIN POINT PO ON BL.BADGEPOINTID = PO.BADGEPOINTID;
 
-- ���� �̰͸� �����, �¿��̵� �̰Ÿ� ������ �ɵ�?
SELECT FN_USER_POST_STATUS('adalleif', POSTID) , PV.*
     , (SELECT ID FROM FOLLOW WHERE GIVEUSERID='arthisef' AND TAKEUSERID=PV.USERID) AS FOLLOWID -- ��ȸ�� ����� ���� �ٲ�
FROM POST_VIEW2 PV
WHERE MEETDATE >= SYSDATE;


-- ���Ϳ� � ���� ������ ó�� ������ ���� ������
/*
    �������GU ID 1
    �������GU ID 2
    �������GU ID 3
    
    ���ɻ� �� ID 1
    ���ɻ� �� ID 2
    ���ɻ� �� ID 3
    
    �ο��� �ּ�
    �ο��� �ִ�
    
    ������ �ּ�
    ������ �ִ�
    
    ������
    ��������
    ���ְ���
    ������
*/
select *
from mood;
SELECT URL
FROM POINT;
----------------------------------------------------FN_BAD_BADGE----------------------------------------------------------------
-----------------------------------------------USER_BADGE_VIEW �� ���� ��������� ��---------------------------------------------
----------------------------------------------------FN_BAD_BADGE----------------------------------------------------------------
-- ������ ���� ������ �����ϰ� �ϳ��� �̾���
CREATE OR REPLACE FUNCTION FN_PROFILE_BAD_BADGE(V_USERID VARCHAR2)
RETURN VARCHAR2
IS
    V_URLBAD    POINT.URL%TYPE;
BEGIN
    SELECT max(URL) INTO V_URLBAD
    FROM
    (
        SELECT USERID, URL
        FROM USER_BADGE_VIEW
        WHERE BADGEPOINTCATEID='BC00002'
        ORDER BY DBMS_RANDOM.VALUE
    )
    WHERE USERID=V_USERID
      AND ROWNUM=1;
      
    RETURN V_URLBAD;
END;

SELECT USERID, FN_PROFILE_BAD_BADGE(USERID)
FROM USER_ESSENTIAL;
-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------
-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------
-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------
-- ���հ˻�, �α��� ����
SELECT *
FROM
(
SELECT FN_CAL_RANK(POSTID, '��ȸ����', '|Ű����|Ű����2|') AS POSTGRADE 
     , RANK() OVER(ORDER BY FN_CAL_RANK(POSTID, '��ȸ����', '|Ű����|Ű����2|') DESC , MEETDATE DESC) AS POSTNUM
     , POSTID, USERID, NICKNAME, URL, URLBAD
     , TITLE, MINNUM, MAXNUM, CONTENTS
     , ADDRSINAME, ADDRGUNAME, TO_CHAR(MEETDATE, 'YYYY/MM/DD HH24:MI') AS MEETDATE
FROM POST_VIEW
WHERE MEETDATE >= SYSDATE
  AND FN_POST_IS_ACCEPTED(POSTID)=0
  AND (ADDRGUID LIKE '%'||'' OR ADDRGUID IN ('' ,''))
  AND (INTERSUBID LIKE '%'||'' OR INTERSUBID IN ('' ,''))
  AND (2<=MINNUM AND MAXNUM<=20)
  AND (SYSDATE<=MEETDATE AND MEETDATE<=SYSDATE+2)
  AND MOOD LIKE '%'||'""'||'%'
  AND LIMITGRADE>=1
  AND DRINK LIKE '%'||''||'%'
  AND SAMEGENDER LIKE '%'||''||'%'
)
WHERE (6*1-5) <= POSTNUM AND POSTNUM < (6*1+1);


-- ���հ˻�, ��α��� ����
SELECT *
FROM
(
SELECT FN_CAL_RANK_GUEST(POSTID, '�Խ�Ʈ�������', '|Ű����|Ű����2|') AS POSTGRADE 
     , RANK() OVER(ORDER BY FN_CAL_RANK_GUEST(POSTID, '�Խ�Ʈ�������', '|Ű����|Ű����2|') DESC , MEETDATE DESC) AS POSTNUM
     , POSTID, USERID, NICKNAME, URL, URLBAD
     , TITLE, MINNUM, MAXNUM, CONTENTS
     , ADDRSINAME, ADDRGUNAME, TO_CHAR(MEETDATE, 'YYYY/MM/DD HH24:MI') AS MEETDATE
FROM POST_VIEW
WHERE MEETDATE >= SYSDATE
  AND FN_POST_IS_ACCEPTED(POSTID)=0
  AND (ADDRGUID LIKE '%'||'' OR ADDRGUID IN ('' ,''))
  AND (INTERSUBID LIKE '%'||'' OR INTERSUBID IN ('' ,''))
  AND (2<=MINNUM AND MAXNUM<=20)
  AND (SYSDATE<=MEETDATE AND MEETDATE<=SYSDATE+2)
  AND MOOD LIKE '%'||'""'||'%'
  AND LIMITGRADE>=1
  AND DRINK LIKE '%'||''||'%'
  AND SAMEGENDER LIKE '%'||''||'%'
)
WHERE (6*1-5) <= POSTNUM AND POSTNUM < (6*1+1);

-- ī�װ� �˻�, �α��� ����
SELECT *
FROM
(
SELECT FN_CAL_RANK(POSTID, 'adiard', '|Ű����|') AS POSTGRADE 
     , RANK() OVER(ORDER BY FN_CAL_RANK(POSTID, 'adiard', '|Ű����|'), MEETDATE DESC) AS POSTNUM
     , POSTID, USERID, NICKNAME, URL, URLBAD
     , TITLE, MINNUM, MAXNUM, CONTENTS
     , ADDRSINAME, ADDRGUNAME, TO_CHAR(MEETDATE, 'YYYY/MM/DD HH24:MI') AS MEETDATE
FROM POST_VIEW
WHERE MEETDATE >= SYSDATE
  AND INTERMAINID='IM00001'
  AND INTERSUBID LIKE '%'||'IS00005'
  AND (ADDRGUID LIKE '%'||'' OR ADDRGUID IN ('' ,''))
  AND (INTERSUBID LIKE '%'||'' OR INTERSUBID IN ('' ,''))
  AND (2<=MINNUM AND MAXNUM<=20)
  AND (TO_DATE('2019-06-05', 'YYYY-MM-DD')<=MEETDATE AND MEETDATE<=TO_DATE('2019-07-20', 'YYYY-MM-DD'))
  AND MOOD LIKE '%'||''||'%'
  AND LIMITGRADE>=1
  AND DRINK LIKE '%'||''||'%'
  AND SAMEGENDER LIKE '%'||''||'%'
)
WHERE (6*1-5) <= POSTNUM AND POSTNUM < (6*1+1);
-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------
-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------
-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------
SELECT *
FROM POST_VIEW;
-----------------------------------------------�Խñ۰� ����, �˻�Ű���� �� ���� �� �Լ�-----------------------------------------------------
-----------------------------------------------�Խñ۰� ����, �˻�Ű���� �� ���� �� �Լ�-------------------------------------------------------
-----------------------------------------------�Խñ۰� ����, �˻�Ű���� �� ���� �� �Լ�-------------------------------------------------------
/*
�Խ�������	:   �� 10
���̴��ּ�	:   �� 40

����		:       �� 25
���ɻ� �󼼱���: �� 15
����		:       �� 10
*/
-- �� Ű����� |Ű����1|Ű����2|Ű����3| �̷������� �̸� ó���ż� �Ѿ�;� ��
CREATE OR REPLACE FUNCTION FN_CAL_RANK(V_POSTID VARCHAR2, V_USERID VARCHAR2, V_KEYWORD VARCHAR2)
RETURN NUMBER
IS
    V_ADDRGUID          ADDR_GU.ADDRGUID%TYPE;          -- ���������� ���� ���(��)
    V_HOSTID            USER_ESSENTIAL.USERID%TYPE;     -- ������
    V_TITLE             POST.TITLE%TYPE;                -- ���� ����
    V_INTERDETAIL       POST.INTERDETAIL%TYPE;          -- ���� ���ɻ� ��
    V_CONTENTS          POST.CONTENTS%TYPE;             -- ���� ����
    V_GRADE_USER        NUMBER;
    V_GRADE_ADDR        NUMBER;
    V_GRADE_TITLE       NUMBER;
    V_GRADE_INTER       NUMBER;
    V_GRADE_CONTENTS    NUMBER;
BEGIN    
    -- ������ ����
    SELECT USERID INTO V_HOSTID
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_USER:=FN_USER_GRADE(V_HOSTID);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_USER);
    -- ���� ��ġ
    SELECT ADDRGUID INTO V_ADDRGUID
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_ADDR:=FN_SEARCH_ADDR(V_USERID, V_ADDRGUID);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_ADDR);
    -- Ű����-���� ��ġ
    SELECT TITLE INTO V_TITLE
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_TITLE:=FN_SEARCH_KEYWORD(V_KEYWORD, V_TITLE, 25);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_TITLE);
    -- Ű����-���ɻ� �󼼱��� ��ġ
    SELECT INTERDETAIL INTO V_INTERDETAIL
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_INTER:=FN_SEARCH_KEYWORD(V_KEYWORD, V_INTERDETAIL, 15); 
    DBMS_OUTPUT.PUT_LINE(V_GRADE_INTER);
    -- Ű����-���� ��ġ
    SELECT CONTENTS INTO V_CONTENTS
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_CONTENTS:=FN_SEARCH_KEYWORD(V_KEYWORD, V_CONTENTS, 10);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_CONTENTS);
    
    RETURN (V_GRADE_USER + V_GRADE_ADDR + V_GRADE_TITLE + V_GRADE_INTER + V_GRADE_CONTENTS);
END;


-- �Խ�Ʈ ���� �˻���
CREATE OR REPLACE FUNCTION FN_CAL_RANK_GUEST(V_POSTID VARCHAR2, V_GUESTADDRGUID VARCHAR2, V_KEYWORD VARCHAR2)
RETURN NUMBER
IS
    V_ADDRGUID          ADDR_GU.ADDRGUID%TYPE;          -- ���������� ���� ���(��)
    V_HOSTID            USER_ESSENTIAL.USERID%TYPE;     -- ������
    V_TITLE             POST.TITLE%TYPE;                -- ���� ����
    V_INTERDETAIL       POST.INTERDETAIL%TYPE;          -- ���� ���ɻ� ��
    V_CONTENTS          POST.CONTENTS%TYPE;             -- ���� ����
    V_GRADE_USER        NUMBER;
    V_GRADE_ADDR        NUMBER;
    V_GRADE_TITLE       NUMBER;
    V_GRADE_INTER       NUMBER;
    V_GRADE_CONTENTS    NUMBER;
BEGIN    
    -- ������ ����
    SELECT USERID INTO V_HOSTID
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_USER:=FN_USER_GRADE(V_HOSTID);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_USER);
    
    -- ���� ��ġ
    SELECT ADDRGUID INTO V_ADDRGUID
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_ADDR:=FN_SEARCH_ADDR_GUEST(V_GUESTADDRGUID, V_ADDRGUID);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_ADDR);
    
    -- Ű����-���� ��ġ
    SELECT TITLE INTO V_TITLE
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_TITLE:=FN_SEARCH_KEYWORD(V_KEYWORD, V_TITLE, 25);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_TITLE);
    -- Ű����-���ɻ� �󼼱��� ��ġ
    SELECT INTERDETAIL INTO V_INTERDETAIL
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_INTER:=FN_SEARCH_KEYWORD(V_KEYWORD, V_INTERDETAIL, 15); 
    DBMS_OUTPUT.PUT_LINE(V_GRADE_INTER);
    -- Ű����-���� ��ġ
    SELECT CONTENTS INTO V_CONTENTS
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_CONTENTS:=FN_SEARCH_KEYWORD(V_KEYWORD, V_CONTENTS, 10);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_CONTENTS);
    
    RETURN (V_GRADE_USER + V_GRADE_ADDR + V_GRADE_TITLE + V_GRADE_INTER + V_GRADE_CONTENTS);
END;


-- ������ ���� �̱�
-- SUB FUNCTION1 : FN_USER_GRADE(V_USERID)
CREATE OR REPLACE FUNCTION FN_USER_GRADE(V_USERID VARCHAR2)
RETURN NUMBER
IS
    V_NUM   NUMBER;
BEGIN
    SELECT ROUND(AVG(GRADE),1) INTO V_NUM
    FROM REVIEW
    WHERE TAKEUSERID='chrigh'
    GROUP BY TAKEUSERID;
    
    RETURN NVL(V_NUM,0);
END;

--
SELECT FN_USER_GRADE('chrigh')*(10/5)
FROM DUAL;
-- �� ����id�� �ָ� ������ �̴� �Լ�*(����/��������)


-- Ű���� ���� �ű�� : ����
-- Ű���� ���� �ű�� : ���ɻ�󼼱���
-- Ű���� ���� �ű�� : ����
-- �� Ű����� ��ġ �˻� ��� �ؽ�Ʈ, ������ ������ �ָ� ��ġ���� ���� ������ �����
-- SUB FUNCTION2 : FN_SEARCH_KEYWORD(V_KEYWORD, V_TEXT, V_ALLOT_GRADE)
-- INPUT : KEYWORD (EX- '|����|��|����|����|') | ó���� �ڹٿ��� ����
CREATE OR REPLACE FUNCTION FN_SEARCH_KEYWORD(V_KEYWORD VARCHAR2, V_TEXT VARCHAR2, V_ALLOT_GRADE NUMBER)
RETURN NUMBER
IS
    V_ALLNUM     NUMBER;
    V_FOUNDNUM   NUMBER;
BEGIN
    V_ALLNUM := LENGTH(V_KEYWORD)-LENGTH(REPLACE(V_KEYWORD,'|'))-1;
    
    SELECT COUNT(*) INTO V_FOUNDNUM
    FROM
    (
        SELECT SUBSTR(KEYWORD, INSTR(KEYWORD, '|', 1, LEVEL)+1, INSTR(KEYWORD, '|', 1, LEVEL+1)-INSTR(KEYWORD, '|', 1, LEVEL)-1) AS KEYWORD
             , INSTR(V_TEXT , SUBSTR(KEYWORD, INSTR(KEYWORD, '|', 1, LEVEL)+1, INSTR(KEYWORD, '|', 1, LEVEL+1)-INSTR(KEYWORD, '|', 1, LEVEL)-1)) AS FOUND
        FROM
        (
            SELECT V_KEYWORD AS KEYWORD
            FROM DUAL
        )
        CONNECT BY LEVEL <= LENGTH(KEYWORD)-LENGTH(REPLACE(KEYWORD,'|'))-1
    )
    WHERE FOUND>0;
    
    RETURN (NVL(V_FOUNDNUM,0)/NVL(V_ALLNUM,1))*V_ALLOT_GRADE;
END;

SELECT *
FROM ADDR_GU;




-- ���� ���� �ű��
-- �� ���� id�� ����id�� �ָ� ���� ���� ������ �����
-- SUB FUNTION3 : FN_SEARCH_ADDR(V_USERID VARCHAR2, V_ADDRGUID VARCHAR2)
-- �ϴ� ��������� �ʿ���
CREATE TABLE MATTRIX_ADDR_GU
(
    ADDRGUID  VARCHAR2(10),
    GU00001   CHAR(1) ,
    GU00002   CHAR(1) ,
    GU00003   CHAR(1) ,
    GU00004   CHAR(1) ,
    GU00005   CHAR(1) ,
    GU00006   CHAR(1) ,
    GU00007   CHAR(1) ,
    GU00008   CHAR(1) ,
    GU00009   CHAR(1) ,
    GU00010   CHAR(1) ,
    GU00011   CHAR(1) ,
    GU00012   CHAR(1) ,
    GU00013   CHAR(1) ,
    GU00014   CHAR(1) ,
    GU00015   CHAR(1) ,
    GU00016   CHAR(1) ,
    GU00017   CHAR(1) ,
    GU00018   CHAR(1) ,
    GU00019   CHAR(1) ,
    GU00020   CHAR(1) ,
    GU00021   CHAR(1) ,
    GU00022   CHAR(1) ,
    GU00023   CHAR(1) ,
    GU00024   CHAR(1) ,
    GU00025   CHAR(1)
);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00001',0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,1,0,1,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00002',0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00003',0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00004',0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00005',0,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00006',1,1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,1);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00007',0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00008',0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00009',0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00010',0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00011',0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00012',0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00013',0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,1,0,1,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00014',0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00015',1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00016',0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00017',1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00018',1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00019',0,0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00020',1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,0,1,0,0,0,0,1,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00021',0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00022',0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00023',0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00024',0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,0,0,0,0,1,0,0,1,0,0);
INSERT INTO MATTRIX_ADDR_GU VALUES('GU00025',0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

SELECT FN_SEARCH_ADDR('BROGAN', 'GU00005')
FROM DUAL;

SELECT *
FROM POST_VIEW
WHERE POSTID='PT00683';
SELECT *
FROM POST_VIEW
WHERE POSTID='PT00372';
--------------------------------------------------------���� ������� �Լ�-------------------------------------------------------
--------------------------------------------------------���� ������� �Լ�-------------------------------------------------------
--------------------------------------------------------���� ������� �Լ�-------------------------------------------------------
CREATE OR REPLACE FUNCTION FN_SEARCH_ADDR(V_USERID VARCHAR2, V_ADDRGUID VARCHAR2)
RETURN NUMBER
IS 
    V_ADDR      NUMBER;
    V_NEAR_ADDR NUMBER;
BEGIN
    -- �Է¹��� ADDRGUID�� ������ ��� ADDRGUID�� �ֳ� ã�ƺ�
    SELECT COUNT(*) INTO V_ADDR
    FROM USER_ADDR
    WHERE USERID=V_USERID
      AND ADDRGUID=V_ADDRGUID;
      
    -- �Է¹��� ADDRGUID�� ������ ��� ADDRGUID�� ���� ADDRGUIID�� �ֳ� ã�ƺ�
    SELECT COUNT(*) INTO V_NEAR_ADDR
    FROM USER_ADDR UA JOIN 
    (
        SELECT ADDRGUID, NEAR_ADDRGUID
        FROM
        (
            SELECT *
            FROM MATTRIX_ADDR_GU
        )
        UNPIVOT( NEAR FOR NEAR_ADDRGUID IN(GU00001,GU00002,GU00003,GU00004,GU00005,GU00006,GU00007,GU00008,GU00009,GU00010,GU00011,GU00012,GU00013,GU00014,GU00015,GU00016,GU00017,GU00018,GU00019,GU00020,GU00021,GU00022,GU00023,GU00024,GU00025) )
        WHERE NEAR=1
    ) M ON UA.ADDRGUID=M.ADDRGUID
    WHERE USERID=V_USERID
      AND NEAR_ADDRGUID=V_ADDRGUID;
    
    IF V_ADDR>0
        THEN RETURN 40;
    ELSIF V_NEAR_ADDR>0
        THEN RETURN 25;
    ELSE
        RETURN 0;
    END IF;
END;



-- �Խ�Ʈ ���հ˻���
-- EX) �Խñ� ���� ���: GU00003
-- EX) ���� �Է� ���� ���: GU00013
-- �Խñ��� ���� ��ҿ� ������ �Է��� ������Ұ� ��ġ�ϴ����Ǵ�
-- GU00003 = GU00013 ? ��ġ�ϸ� 40��
-- �Խñ��� ���� ����� ���� ���� ������ �Է��� ������Ұ� ��ġ�ϴ��� ����
-- 
SELECT COUNT(*) -- ����� ������ 25��
FROM
(
    SELECT *
    FROM MATTRIX_ADDR_GU
)
UNPIVOT( NEAR FOR NEAR_ADDRGUID IN(GU00001,GU00002,GU00003,GU00004,GU00005,GU00006,GU00007,GU00008,GU00009,GU00010,GU00011,GU00012,GU00013,GU00014,GU00015,GU00016,GU00017,GU00018,GU00019,GU00020,GU00021,GU00022,GU00023,GU00024,GU00025) )
WHERE NEAR=1
  AND ADDRGUID='GU00003'       -- �Խñ� �������
  AND NEAR_ADDRGUID='GU00013'; -- �����Է� �������


CREATE OR REPLACE FUNCTION FN_SEARCH_ADDR_GUEST(V_GUESTADDRGUID VARCHAR2, V_ADDRGUID VARCHAR2)
RETURN NUMBER
IS
    V_ADDR      NUMBER;
    V_NEAR_ADDR NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_NEAR_ADDR -- ����� ������ 25��
    FROM
    (
        SELECT *
        FROM MATTRIX_ADDR_GU
    )
    UNPIVOT( NEAR FOR NEAR_ADDRGUID IN(GU00001,GU00002,GU00003,GU00004,GU00005,GU00006,GU00007,GU00008,GU00009,GU00010,GU00011,GU00012,GU00013,GU00014,GU00015,GU00016,GU00017,GU00018,GU00019,GU00020,GU00021,GU00022,GU00023,GU00024,GU00025) )
    WHERE NEAR=1
      AND ADDRGUID=V_ADDRGUID       -- �Խñ� �������
      AND NEAR_ADDRGUID=V_GUESTADDRGUID; -- �����Է� �������
    
    IF (V_GUESTADDRGUID=V_ADDRGUID)
        THEN RETURN 40;
    ELSIF V_NEAR_ADDR >0
        THEN RETURN 25;
    ELSE
        RETURN 0;
    END IF;
END;

-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------
-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------
-----------------------------------------------������ ���� + ����Ʈ ������-------------------------------------------------------











-----------------------------------------------���������� �� ���� �Խñ� ���� �Լ�------------------------------------------------
-----------------------------------------------���������� �� ���� �Խñ� ���� �Լ�------------------------------------------------
-----------------------------------------------���������� �� ���� �Խñ� ���� �Լ�------------------------------------------------
-- �Խñ� ���� �� �Խñ� ���¸� �� ������Ʈ �Ѵٴ� ����
-- ������       �� MEETDATE>=SYSDATE  AND  ��û�ڵ��� ST00003�� ������

-- ����Ȯ��     �� MEETDATE>=SYSDATE  AND  ��ȸ�ѻ���� ��ȸ�Խñ� ���°� ST00003�϶� 
-- �ıⳲ���   �� MEETDATE<=SYSDATE  AND  ��ȸ�ѻ���� ��ȸ�Խñ� ���°� ST00003   AND   REVIEW���̺� GIVEUSERID�� ��ȸ�� ����� ������
-- �ı���ȸ     �� MEETDATE<=SYSDATE  AND  ��ȸ�ѻ���� ��ȸ�Խñ� ���°� ST00003   AND   REVIEW���̺� GIVEUSERID�� ��ȸ�� ����� ������   

-- ��������     �� ��ȸ�� ����� ��ȸ�Խñ� ���°� ST00004�϶� OR (MEETDATE<=SYSDATE  AND  ��û�ڵ��� ST00003�� ������)
-- �� �̿�. ���������忡���� ��������

-- FUNCTION1 : FN_USER_POST_STATUS
-- INPUT : ��ȸ�� USERID, ��ȸ�� POSTID
-- OUTPUT : 1(������), 2(����Ȯ��), 3(��������), 4(�ıⳲ���), 5(�ı���ȸ)
-- ���� : �������������� �α��� ������ ���� ��ȸ�Ҷ� ���� ����
CREATE OR REPLACE FUNCTION FN_USER_POST_STATUS(V_USERID VARCHAR2, V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_USER_POST_STATUS  NUMBER;
BEGIN
    -- FN_IS_HOST(V_USERID, V_POSTID)=1     �������ΰ�
    -- FN_OVER_SYSDATE(V_POSTID)=1          �������� �����°�
    -- FN_POST_IS_ACCEPTED(V_POSTID)=1      ����Ȯ���� �����ΰ�(�������� ST00003�� �ִ°�)
    -- FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=1                ��ȸ�� ������ ���� Ȯ���ΰ�
    -- FN_IN_REVIEW(V_USERID, V_POSTID)=1   �ı⸦ ����°�
    
    -- OUTPUT : 1(������), 2(����Ȯ��), 3(��������), 4(�ıⳲ���), 5(�ı���ȸ)

    -- �������̸鼭 ������ ����
    IF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=1 )
        THEN V_USER_POST_STATUS:=5;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=4;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_POST_IS_ACCEPTED(V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=3;
    -- �������̸鼭 ������ ������
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=1 )
        THEN V_USER_POST_STATUS:=5;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=4;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=1;
    -- �������̸鼭 ������ ����  
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=1 )
        THEN V_USER_POST_STATUS:=5;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=4;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=3;
    -- �������̸鼭 ������ ������
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=1 )
        THEN V_USER_POST_STATUS:=5;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=4;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=3;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=1;
    END IF;         
    
    RETURN V_USER_POST_STATUS;
END;

-- SUB FUNCTION1 : FN_IS_HOST
-- INPUT : ��ȸ�� USERID, ��ȸ�� POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- ���� : ��ȸ ������ ��ȸ ������ �������ΰ�
CREATE OR REPLACE FUNCTION FN_IS_HOST(V_USERID VARCHAR2, V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_USERID2   USER_ESSENTIAL.USERID%TYPE;
BEGIN
    -- �Է¹��� �Խñ��� ������ID�� �̾ƿ�
    SELECT USERID INTO V_USERID2
    FROM POST
    WHERE POSTID=V_POSTID;
    
    -- �Է¹��� ����ID�� ������1 ����
    IF V_USERID=V_USERID2
        THEN RETURN 1;
    END IF;
    
    -- �ƴϸ� 0����
    RETURN 0;
END;


-- SUB FUNCTION2 : FN_OVER_SYSDATE
-- INPUT : ��ȸ�� POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- ���� : ������<������ �ΰ� ��, �������� �̹� �����°�
CREATE OR REPLACE FUNCTION FN_OVER_SYSDATE(V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_MEETDATE   POST.MEETDATE%TYPE;
BEGIN
    -- �Է¹��� �Խñ��� �������� �̾ƿ�
    SELECT MEETDATE INTO V_MEETDATE
    FROM POST
    WHERE POSTID=V_POSTID;
    
    -- ������ < �������̸� 1 ����
    IF V_MEETDATE <= SYSDATE
        THEN RETURN 1;
    END IF;
    
    -- �ƴϸ� 0����
    RETURN 0;
END;


-- SUB FUNCTION3 : FN_POST_IS_ACCEPTED
-- INPUT : ��ȸ�� POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- ���� : ������û���߿� ������û ���� ST00003�� �ִ°�
CREATE OR REPLACE FUNCTION FN_POST_IS_ACCEPTED(V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_NUM   NUMBER;
BEGIN
    -- �Խñ��� ���� ��û ��� ���¿��� ST00003�� ������ �̾ƺ�
    SELECT COUNT(*) INTO V_NUM
    FROM POST P JOIN JOIN J ON P.POSTID=J.POSTID
    WHERE P.POSTID=V_POSTID
      AND J.STATUSID='ST00003';
    
    -- ST00003�� 0�ʰ���� ��, �����Ѵٸ� 1����
    IF V_NUM > 0
        THEN RETURN 1;
    END IF;
    
    -- �ƴϸ� 0����
    RETURN 0;
END;

-- SUB FUNCTION4 : FN_USER_IS_ACCEPTED
-- INPUT : ��ȸ�� USERID, ��ȸ�� POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- ���� : ��ȸ�� ����� ��ȸ ���ӿ� ���� ������û ���°� ST00003�ΰ�
CREATE OR REPLACE FUNCTION FN_USER_IS_ACCEPTED(V_USERID VARCHAR2, V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_NUM   NUMBER;
BEGIN
    -- ��� �Խñۿ�, ��� ������ ���¿��� 'ST00003'�� ������ ���
    SELECT COUNT(*) INTO V_NUM
    FROM POST P JOIN JOIN J ON P.POSTID=J.POSTID
    WHERE P.POSTID=V_POSTID
      AND J.USERID=V_USERID
      AND J.STATUSID='ST00003';
    
    -- �����ϸ� 1����
    IF V_NUM > 0
        THEN RETURN 1;
    END IF;
    
    -- �ƴϸ� 0����
    RETURN 0;
END;

-- SUB FUNCTION5 : FN_IN_REVIEW
-- INPUT : ��ȸ�� USERID, ��ȸ�� POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- ���� : ��ȸ�� ����� ��ȸ ���ӿ� ���� �ıⰡ �ִ°�
CREATE OR REPLACE FUNCTION FN_IN_REVIEW(V_USERID VARCHAR2, V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_NUM   NUMBER;
BEGIN
    -- ��� �Խñۿ�, �Է¹��� ������ ���� �ıⰡ �ִ���
    SELECT COUNT(*) INTO V_NUM
    FROM REVIEW
    WHERE POSTID=V_POSTID
      AND GIVEUSERID=V_USERID;
    
    -- �����ϸ� 1����
    IF V_NUM > 0
        THEN RETURN 1;
    END IF;
    
    -- �ƴϸ� 0����
    RETURN 0;
END;
-----------------------------------------------���������� �� ���� �Խñ� ���� �Լ�------------------------------------------------
-----------------------------------------------���������� �� ���� �Խñ� ���� �Լ�------------------------------------------------
-----------------------------------------------���������� �� ���� �Խñ� ���� �Լ�------------------------------------------------






 
 
 

-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------
-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------
-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------
-- ���� �������� ������ �ִ� ����
CREATE OR REPLACE VIEW USER_BADGE_VIEW
AS
SELECT BL.USERID, MAX(BL.BADGELOGID) AS BADGELOGID, P.BADGEPOINTNAME, PC.BADGEPOINTCATEID, P.URL
FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.EXPIRATIONREVIEWID=RV.REVIEWID
                            JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
                            JOIN POINT_CATE PC ON P.BADGEPOINTCATEID=PC.BADGEPOINTCATEID
WHERE (ADD_MONTHS(RV.REVIEWDATE,12) >= SYSDATE OR PC.BADGEPOINTCATEID='BC00004')
GROUP BY BL.BADGEPOINTID, BL.USERID, P.BADGEPOINTNAME, PC.BADGEPOINTCATEID, P.URL
ORDER BY USERID;
-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------
-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------
-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------

--
select *
from admin;

INSERT INTO ADMIN(USERID) VALUES('TEST');

SELECT *
FROM LOGIN;

INSERT INTO 
LOGIN(USERID, PWD, ROLEID) 
VALUES('TEST1', 'TEST1', 'RL00001');

ROLLBACK;

select *
from user_interest;

select *
from user_addr;

select *
from user_certification;


-- ���� �����⿡ ����
SELECT 'PT'||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(POSTID, 3))), 0) + 1), 5, '0') AS POSTID
FROM POST;

select *
from join;

SELECT 'JN'||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(JOINID, 3))), 0) + 1), 5, '0') AS JOINID FROM JOIN;

SELECT 'RV'||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(REVIEWID, 3))), 0) + 1), 5, '0') AS REVIEWID FROM REVIEW;

SELECT *
FROM REVIEW_SUB;

SELECT USERID FROM USER_ESSENTIAL
;

SELECT INTERSUBID FROM INTEREST_SUB
;
SELECT ADDRGUID FROM ADDR_GU
;

SELECT * FROM MOOD
;

select *
from same_gender;


SELECT USERID, MAX(ADDRGUID1) AS ADDRGUID1,  MAX(ADDRGUID2) AS ADDRGUID2, MAX(ADDRGUID3) AS ADDRGUID3
FROM 
(
SELECT USERID
     , DECODE(NUM, 1, ADDRGUID) AS ADDRGUID1
     , DECODE(NUM, 2, ADDRGUID) AS ADDRGUID2
     , DECODE(NUM, 3, ADDRGUID) AS ADDRGUID3
FROM
(
SELECT UE.USERID, UA.ADDRGUID, RANK() OVER(PARTITION BY UE.USERID ORDER BY UA.ADDRGUID) AS NUM
FROM USER_ESSENTIAL UE JOIN USER_ADDR UA ON UE.USERID=UA.USERID
ORDER BY USERID, ADDRGUID
)
) GROUP BY USERID;



SELECT *
FROM USER_ADDR;

select *
from status;

select *
from point;



INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, ADDRDETAIL, INTERSUBID, INTERDETAIL, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES('PT00026', 'admin001', 'test', 'GU00001', 'TEST', 'IS00001', 'TEST', TO_DATE('2019-07-10', 'yyyy-mm-dd'), TO_DATE('2019-07-10', 'yyyy-mm-dd'), 'test', 'MI00002', 2, 3, 5, 'DR00002', 'SG00002')
;

ROLLBACK;


select to_date('2019-05-04 14:11:00', 'yyyy-mm-dd hh24:mi:ss')
from dual;



INSERT INTO JOIN(JOINID, POSTID, USERID, STATUSID, CONTENTS, JOINDATE)
VALUES('JN00025', 'PT00009', 'B001', 'ST00003', 'TEST', TO_DATE('2019-07-07 12:12:12','YYYY-MM-DD HH24:MI:SS'))
;


ROLLBACK;


INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES('RV00019', 'PT00008', 'BERMEDA', 'EDROSINK', 4, TO_DATE('2019-07-07 12:12:12','YYYY-MM-DD HH24:MI:SS'))
;




INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS)
VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'RV00018', 'BP00002', 'TEST')
;



select *
from join;

select *
from review;

select *
from review_sub;

select *
from point;

select rs.badgepointid, p.badgepointname, count(*)
from review r join review_sub rs on r.reviewid=rs.reviewid
              join point p on rs.badgepointid = p.badgepointid
where takeuserid='cirdan'
group by rs.badgepointid, p.badgepointname
order by rs.badgepointid;


select *
from review r join review_sub rs on r.reviewid=rs.reviewid
              join point p on rs.badgepointid = p.badgepointid
where takeuserid='cirdan'
order by r.reviewdate, p.badgepointid;
  
  
select *
from post;

SELECT *
FROM REVIEW_SUB;

-- �ı� �� �����ְ� ��������Ʈ�� �޴´ٸ� üũ�غ� �� Ʈ���Ÿ� �شٸ� REVIEW_SUB ���̺� ����
-- ����, ���������Ʈ��, ���� ������, ��ȿ�Ⱓ �� ���� ���� ������ ã�ƺ�
-- �� ���� 3�̻��̸�, ���� �α׿��� �߰�����

-- REVIEW_SUB�� ���� �ԷµǴ°� REVIEWID, BADGEPOINTID, CONTENTS
-- �ٷ궧 �ʿ��Ѱ� �� TAKEUSERID, BADGEPOINTID, REVIEWDATE A �� Ʈ���� ���ٸ� TAKEUSERID�� REVIEWDATE�� REVIEWID Ÿ�� �����;� ��

-- ���� �̷� ����ε�
SELECT ROWNUM, RV.TAKEUSERID, RS.BADGEPOINTID, RV.REVIEWDATE, RS.ID
FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
WHERE RV.TAKEUSERID = 'BAHEELA'
  AND RS.BADGEPOINTID = 'BP00001'
  AND ADD_MONTHS(RV.REVIEWDATE,12) > TO_DATE('2017-01-04 14:11:00', 'YYYY-MM-DD HH24:MI:SS')
ORDER BY RV.REVIEWDATE DESC;

-- �߿��Ѱ� COUNT(*) ����
SELECT COUNT(*)
FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
WHERE RV.TAKEUSERID = 'BAHEELA'
  AND RS.BADGEPOINTID = 'BP00001'
  AND ADD_MONTHS(RV.REVIEWDATE,12) > TO_DATE('2017-01-04 14:11:00', 'YYYY-MM-DD HH24:MI:SS');

-- ���� ������ �������� ������
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BADGEPOINTID', 'GETREVIEWID', 'EXPIRATIONREVIEWID');

-- GETREVIEWID ��� ������
SELECT REVIEWID AS EXPIRATIONREVIEWID
FROM
(
SELECT ROWNUM AS NUM, RV.REVIEWID -- ,RV.TAKEUSERID, RS.BADGEPOINTID, RV.REVIEWDATE, RS.ID
FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
WHERE RV.TAKEUSERID = 'BAHEELA'
  AND RS.BADGEPOINTID = 'BP00001'
  AND ADD_MONTHS(RV.REVIEWDATE,12) > TO_DATE('2017-01-04 14:11:00', 'YYYY-MM-DD HH24:MI:SS')
ORDER BY RV.REVIEWDATE DESC
)
WHERE NUM=1;

-- EXPIRATIONREVIEWID ��� ������
SELECT REVIEWID AS EXPIRATIONREVIEWID
FROM
(
SELECT ROWNUM AS NUM, RV.REVIEWID -- ,RV.TAKEUSERID, RS.BADGEPOINTID, RV.REVIEWDATE, RS.ID
FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
WHERE RV.TAKEUSERID = 'BAHEELA'
  AND RS.BADGEPOINTID = 'BP00001'
  AND ADD_MONTHS(RV.REVIEWDATE,12) > TO_DATE('2017-01-04 14:11:00', 'YYYY-MM-DD HH24:MI:SS')
ORDER BY RV.REVIEWDATE DESC
)
WHERE NUM=3;


------------------
SELECT *
FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID = RV.REVIEWID
WHERE RV.REVIEWID = 'RV00001';

SELECT *
FROM REVIEW_SUB;
SELECT *
FROM USER_BADGE_LOG;

SELECT *
FROM REVIEW
WHERE REVIEWID='RV000018';

INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS)
VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'RV06436', 'BP00002', 'TRIGGER TEST');


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


set serveroutput on;


-- Ȱ������ ������Ʈ�� �� REVIEW ���̺��� Ʈ����? �� ���� ���涧 ���� �ߵ��Ǹ� �ȵǴµ� �� JOIN ���̺��� ���°� 3���� �ٲ� �ɾ�� �ǳ� �� �̷��� ���� ���鶧 �ָ����� �� ���� ������Ʈ ������ ������ �ڳ�
-- �ٷ궧 �ʿ��� �� �� TAKEUSERID, GETREVIEWID
-- �ؿ� ������ ����� 5, 15, 30, 50�� �ɶ� ���� ������ ������ ��
SELECT COUNT(*)
FROM
(
    SELECT POSTID, MIN(REVIEWDATE), MIN(REVIEWID)
    FROM REVIEW
    WHERE TAKEUSERID = 'BLISSET'
    GROUP BY POSTID
);
-- ����
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BP00011', null, null);
-- �Ϲ�������
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BP00012', 'GETREVIEWID', null);
-- ���������
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BP00013', 'GETREVIEWID', null);
-- ����������
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BP00014', 'GETREVIEWID', null);

SELECT *
FROM POINT;
rollback;
----------------------------------------------------------------------------------------------------------------

SELECT COUNT(*)
FROM
(
    SELECT POSTID,TAKEUSERID
    FROM REVIEW
    GROUP BY POSTID, TAKEUSERID
    ORDER BY POSTID
)
WHERE TAKEUSERID='ELRONE';

SELECT *
FROM USER_ESSENTIAL;
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

-- �������� Ȱ�������� ä���ִ� ���� ���ν���
-- �� ���ν����� REVIEW ���̺� TAKEUSERID - POSTID �� �ϳ��� ���� ������ ���� ������
-- POST���̺�� REVIEW ���̺��� �� �־�� ��
-- ���� ������ ������ ���� ���ν�����, ���� �ý��ۿ��� �����ϸ� �ȵ�(�ȿ� �ִ� �������� ���� ����)
CREATE OR REPLACE PROCEDURE PRC_USER_BADGE_LOG_SAMPLE
IS
    CURSOR CUR_USER
    IS     
    SELECT USERID
    FROM   USER_ESSENTIAL;
    
    V_USERID        USER_ESSENTIAL.USERID%TYPE;
    V_COUNT         NUMBER;
    V_GETREVIEWID   REVIEW.REVIEWID%TYPE;
BEGIN
    OPEN CUR_USER;
    LOOP
        FETCH CUR_USER INTO V_USERID;
        EXIT WHEN CUR_USER%NOTFOUND; -- EXIT ��ġ�� �߿���. �� �Ʒ� ������ ������ �ϳ��� �ݺ���
        
        DBMS_OUTPUT.PUT_LINE(V_USERID);
        
        SELECT COUNT(*) INTO V_COUNT
        FROM
        (
            SELECT POSTID,TAKEUSERID
            FROM REVIEW
            GROUP BY POSTID, TAKEUSERID
            ORDER BY POSTID
        )
        WHERE TAKEUSERID=V_USERID;

        DBMS_OUTPUT.PUT_LINE(V_COUNT);
        
        -- ���� ����� �ο�
        DBMS_OUTPUT.PUT_LINE('���� ���� �ο�!');
        INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
        VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_USERID, 'BP00011', null, null);        
                
        -- 15ȸ ������ �Ϲ������� �ο�
        IF V_COUNT>=15
            THEN DBMS_OUTPUT.PUT_LINE('�Ϲ������� ���� �ο�!');
                 SELECT POSTID INTO V_GETREVIEWID
                 FROM
                 (
                     SELECT POSTID,TAKEUSERID, RANK() OVER(PARTITION BY TAKEUSERID ORDER BY POSTID) AS NUM
                     FROM REVIEW
                     GROUP BY POSTID, TAKEUSERID
                     ORDER BY POSTID
                 )
                 WHERE TAKEUSERID=V_USERID
                   AND NUM=15;
                 DBMS_OUTPUT.PUT_LINE(V_GETREVIEWID);
                 INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
                 VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_USERID, 'BP00012', V_GETREVIEWID, null);
        END IF;
                
        -- 30ȸ ������ ��������� �ο�
        IF V_COUNT>=30
            THEN DBMS_OUTPUT.PUT_LINE('��������� ���� �ο�!');
                 SELECT POSTID INTO V_GETREVIEWID
                 FROM
                 (
                     SELECT POSTID,TAKEUSERID, RANK() OVER(PARTITION BY TAKEUSERID ORDER BY POSTID) AS NUM
                     FROM REVIEW
                     GROUP BY POSTID, TAKEUSERID
                     ORDER BY POSTID
                 )
                 WHERE TAKEUSERID=V_USERID
                   AND NUM=30;
                 DBMS_OUTPUT.PUT_LINE(V_GETREVIEWID);      
                 INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
                 VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_USERID, 'BP00013', V_GETREVIEWID, null);                 
        END IF;
        
        -- 50ȸ ������ ���������� �ο�
        IF V_COUNT>=50
            THEN DBMS_OUTPUT.PUT_LINE('���������� ���� �ο�!');
                 SELECT POSTID INTO V_GETREVIEWID
                 FROM
                 (
                     SELECT POSTID,TAKEUSERID, RANK() OVER(PARTITION BY TAKEUSERID ORDER BY POSTID) AS NUM
                     FROM REVIEW
                     GROUP BY POSTID, TAKEUSERID
                     ORDER BY POSTID
                 )
                 WHERE TAKEUSERID=V_USERID
                   AND NUM=50;
                 DBMS_OUTPUT.PUT_LINE(V_GETREVIEWID);
                 INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
                 VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_USERID, 'BP00014', V_GETREVIEWID, null);                 
        END IF;
    END LOOP;
    CLOSE CUR_USER;
END;

EXEC PRC_USER_BADGE_LOG_SAMPLE;


---------------------------------------------PROCEDURE PRC_UPDATE_USER_BADGE_SAMPLE---------------------------------------------
---------------------------------------------PROCEDURE PRC_UPDATE_USER_BADGE_SAMPLE---------------------------------------------
---------------------------------------------PROCEDURE PRC_UPDATE_USER_BADGE_SAMPLE---------------------------------------------
-- �������� ��ǥ ������ �����ϰ� ä���ִ� ���ν���
-- �켱 ������ Ȱ�������� ����Ⱓ�� ������ �ʰ�
-- Ȱ�� ������ �ƴϸ� ����Ⱓ�� ����.
-- ��, ��� ������ Ȱ�� ������ ���� ������ �Ϲ� ������ ����Ʈ�� �̾���

SELECT MAX(BL.BADGELOGID) AS BADGELOGID, BL.BADGEPOINTID
FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.EXPIRATIONREVIEWID=RV.REVIEWID
                       JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
                       JOIN POINT_CATE PC ON P.BADGEPOINTCATEID=PC.BADGEPOINTCATEID
WHERE BL.USERID = 'arthisef'
  AND (ADD_MONTHS(RV.REVIEWDATE,12) >= SYSDATE OR PC.BADGEPOINTCATEID='BC00004')
GROUP BY BL.BADGEPOINTID;

-- ����Ʈ�� �����ϰ� �ϳ� �̱�
SELECT BADGELOGID
FROM 
(
SELECT MAX(BL.BADGELOGID) AS BADGELOGID, BL.BADGEPOINTID
FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.EXPIRATIONREVIEWID=RV.REVIEWID
                       JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
                       JOIN POINT_CATE PC ON P.BADGEPOINTCATEID=PC.BADGEPOINTCATEID
WHERE BL.USERID = 'arthisef'
  AND (ADD_MONTHS(RV.REVIEWDATE,12) >= SYSDATE OR PC.BADGEPOINTCATEID='BC00004')
GROUP BY BL.BADGEPOINTID
ORDER BY DBMS_RANDOM.VALUE
)
WHERE ROWNUM=1;

-- ��¥ ���ν���
CREATE OR REPLACE PROCEDURE PRC_UPDATE_USER_BADGE_SAMPLE
IS
    CURSOR CUR_USERID
    IS
    SELECT USERID
    FROM USER_ESSENTIAL;
    
    V_USERID        USER_ESSENTIAL.USERID%TYPE;
    V_BADGELOGID    USER_BADGE_LOG.BADGELOGID%TYPE;
BEGIN
    OPEN CUR_USERID;
    LOOP
        FETCH CUR_USERID INTO V_USERID;
        EXIT WHEN CUR_USERID%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_USERID);
        
        SELECT BADGELOGID INTO V_BADGELOGID
        FROM 
        (
            SELECT MAX(BL.BADGELOGID) AS BADGELOGID, BL.BADGEPOINTID
            FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.EXPIRATIONREVIEWID=RV.REVIEWID
                                   JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
                                   JOIN POINT_CATE PC ON P.BADGEPOINTCATEID=PC.BADGEPOINTCATEID
            WHERE BL.USERID = V_USERID
              AND (ADD_MONTHS(RV.REVIEWDATE,12) >= SYSDATE OR PC.BADGEPOINTCATEID='BC00004')
            GROUP BY BL.BADGEPOINTID
            ORDER BY DBMS_RANDOM.VALUE
        )
        WHERE ROWNUM=1;        
        DBMS_OUTPUT.PUT_LINE(V_BADGELOGID);
        
        UPDATE USER_ESSENTIAL
        SET BADGELOGID=V_BADGELOGID
        WHERE USERID=V_USERID;

    END LOOP;
    CLOSE CUR_USERID;
END;

EXEC PRC_UPDATE_USER_BADGE_SAMPLE;

select count(*)
from post
where meetdate >= to_date('2019-01-01', 'yyyy-mm-dd');


-- ���� �������� ��ǥ����
SELECT UE.USERID, UE.BADGELOGID, BL.BADGEPOINTID ,P.BADGEPOINTNAME
FROM USER_ESSENTIAL UE JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
                       JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID;

-- ������ ���� �������� ���� �ȷο� �ϵ���
SELECT *
FROM FOLLOW;

SELECT USERID
FROM USER_ESSENTIAL;

INSERT INTO FOLLOW(ID, GIVEUSERID, TAKEUSERID, FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL, 'GIVEUSER', 'TAKEUSER', SYSDATE);




---------------------------------------------- ���ݳ��� ���� �� �ȷο� ��--------------------------------------------------------
---------------------------------------------- ���ݳ��� ���� �� �ȷο� ��--------------------------------------------------------
---------------------------------------------- ���ݳ��� ���� �� �ȷο� ��--------------------------------------------------------
TRUNCATE TABLE FOLLOW;

DECLARE
    V_GIVEUSERID USER_ESSENTIAL.USERID%TYPE;
    V_TAKEUSERID USER_ESSENTIAL.USERID%TYPE;
    CURSOR GIVEUSER_CURSOR 
    IS 
    (SELECT USERID FROM USER_ESSENTIAL);
    CURSOR TAKEUSER_CURSOR
    IS
    (SELECT USERID
    FROM
    (
        SELECT USERID
        FROM USER_ESSENTIAL
        ORDER BY DBMS_RANDOM.VALUE
    )
    WHERE ROWNUM<=(SELECT COUNT(*)/2 FROM USER_ESSENTIAL));
BEGIN
    DBMS_OUTPUT.PUT_LINE('���� �ȷο� �� ����');

    
    OPEN GIVEUSER_CURSOR;
    LOOP
        FETCH GIVEUSER_CURSOR INTO V_GIVEUSERID;
        EXIT WHEN GIVEUSER_CURSOR%NOTFOUND;
        
            OPEN TAKEUSER_CURSOR;
            LOOP
                FETCH TAKEUSER_CURSOR INTO V_TAKEUSERID;
                EXIT WHEN TAKEUSER_CURSOR%NOTFOUND;
                
                IF(V_GIVEUSERID=V_TAKEUSERID)
                    THEN DBMS_OUTPUT.PUT_LINE('�̰� �н�');
                ELSE
                    INSERT INTO FOLLOW(ID, GIVEUSERID, TAKEUSERID, FOLLOWDATE)
                    VALUES(FOLLOW_SEQ.NEXTVAL, V_GIVEUSERID, V_TAKEUSERID, SYSDATE);
                END IF;
                
            END LOOP;
            CLOSE TAKEUSER_CURSOR;

    END LOOP;
    CLOSE GIVEUSER_CURSOR;
    
    COMMIT;
END;
---------------------------------------------- ���ݳ��� ���� �� �ȷο� ��--------------------------------------------------------
---------------------------------------------- ���ݳ��� ���� �� �ȷο� ��--------------------------------------------------------
---------------------------------------------- ���ݳ��� ���� �� �ȷο� ��--------------------------------------------------------



