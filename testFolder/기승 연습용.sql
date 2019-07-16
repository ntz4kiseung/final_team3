
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
-- 유저 관심사 뽑기
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

-- 게스트용 통합검색 쿼리문


-- 1. 비로그인시 뿌려주는 핫한 모임
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


-- 2. 로그인시 뿌려주는 누구님에게 추천하는 모임
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

-- 3. 마감 임박 모임
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

-- 4-1. 랜덤 뱃지 소개 2개
SELECT *
FROM
(
SELECT BADGEPOINTNAME, BADGEPOINTDESC1, URL, BADGEPOINTID
FROM POINT
ORDER BY DBMS_RANDOM.VALUE
)
WHERE ROWNUM<=2;
-- 4-2. 그 뱃지 최근 획득 유저 셋
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
가져올거
◎ 개설자id        userId
개설자 평점
◎ 제목            title
◎ 만남장소(시)	   addrSiId
◎               addrSiName
◎ 만남장소(구)	   addrGuId
◎               addrGuName
◎만남장소 상세	   addrDetail
◎               interMainId
◎카테고리 대분류  interMainName
◎               interSubId
◎카테고리 소분류  interSubName
◎카테고리 상세내용 interDetail
◎최소인원	        minNum
◎최대인원	        maxNum
◎게시일	        postDate
◎만남일	        meetDate
◎동성여부	        samegender
◎음주여부	        drink
◎참가제한	        grade
◎분위기	        mood
◎내용	            contents


◎개설자 꾸중뱃지 url	            urlBad
◎개설자 대표뱃지 url	            url

◎개설자 닉네임	                    nickname

조회한사람x게시글 상태	            postStatus

◎전화번호 인증여부	                telCertiId
◎이메일 인증여부	                emailCertiId
팔로우여부(참여자가 개설자 볼때)	followId
*/
select *
from same_gender;
-- 최초 회원가입시 → 뱃지로그에 '뉴비'
-- 만남 이뤄졌을 때마다 → 리뷰테이블에서 횟수 검사 → 뱃지 로그 업데이트

-- 뱃지로그에 활동뱃지도 넣자. 그게 일관성도 있고 우리가 다루기도 편할듯
-- 회원 가입할때 자동적으로 뉴비 주고
-- 리뷰 테이블에 들어갈때마다 활동 몇회인지 확인해서 일정 횟수 되면 다음 활동 뱃지 주고

-- 개설 모임 뷰. 이걸 기반으로 
-- 1. 만남일 기준으로 이미 지난건 WHERE 절로 쳐내야됨
-- 2. 조회한 사람이 누구냐에 따라 팔로우 여부가 달라짐
-- 3. 조회한 사람이 누구냐, 현재일과 만남일과의 관계 등에 따라 게시글 상태가 달라짐
CREATE OR REPLACE VIEW POST_VIEW
AS
SELECT P.POSTID, P.USERID, UE.NICKNAME, P.TITLE, P.CONTENTS                                                   -- 개설자 ID, 닉네임, 개설모임 제목, 내용, 개설자 닉네임
     , (SELECT ROUND(AVG(GRADE), 1) FROM REVIEW WHERE TAKEUSERID=P.USERID) GRADE                    --개설자 평점
     , (SELECT ID FROM USER_CERTIFICATION WHERE USERID=P.USERID AND CERTIID='CT00001') TELCERTIID   -- 휴대폰 인증여부
     , (SELECT ID FROM USER_CERTIFICATION WHERE USERID=P.USERID AND CERTIID='CT00002') EMAILCERTIID -- 이메일 인증여부
     , PO.URL            -- 가입시, 활동시 활동 뱃지가 업데이트 되고 로그인시 뱃지 만료를 확인하는걸 믿고 그냥 url만 써줌
     , FN_PROFILE_BAD_BADGE(P.USERID) AS URLBAD -- 개설자의 나쁜 뱃지중 랜덤 1개의 URL, 없으면 null
     , G.ADDRSIID, S.ADDRSINAME, P.ADDRGUID, G.ADDRGUNAME, P.ADDRDETAIL                     -- 만남 장소(시) ID, 이름 / 만남장소(구) ID, 이름 / 만남장소 디테일
     , "IS".INTERMAINID, IM.INTERMAINNAME, P.INTERSUBID, "IS".INTERSUBNAME, P.INTERDETAIL   -- 관심사(대) ID, 이름 / 관심사(소) ID, 이름 / 관심사 디테일
     , P.MINNUM, P.MAXNUM                                                                   -- 최소인원, 최대인원
     , P.POSTDATE, P.MEETDATE                                                               -- 게시일, 만남일
     , P.SAMEGENDERID SAMEGENDER, P.DRINKID DRINK, P.LIMITGRADE LIMITGRADE, P.MOODID MOOD   -- 동성여부, 음주여부, 입장제한평점, 분위기
FROM POST P JOIN ADDR_GU G ON P.ADDRGUID=G.ADDRGUID
            JOIN ADDR_SI S ON G.ADDRSIID=S.ADDRSIID
            JOIN INTEREST_SUB "IS" ON P.INTERSUBID="IS".INTERSUBID
            JOIN INTEREST_MAIN IM ON "IS".INTERMAINID=IM.INTERMAINID
            JOIN USER_ESSENTIAL UE ON P.USERID=UE.USERID
            JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
            JOIN POINT PO ON BL.BADGEPOINTID = PO.BADGEPOINTID;
 
-- 나는 이것만 쓰면됨, 승원이도 이거만 있으면 될듯?
SELECT FN_USER_POST_STATUS('adalleif', POSTID) , PV.*
     , (SELECT ID FROM FOLLOW WHERE GIVEUSERID='arthisef' AND TAKEUSERID=PV.USERID) AS FOLLOWID -- 조회한 사람에 따라 바뀜
FROM POST_VIEW2 PV
WHERE MEETDATE >= SYSDATE;


-- 필터에 어떤 값이 오든지 처리 가능한 만능 쿼리문
/*
    만남장소GU ID 1
    만남장소GU ID 2
    만남장소GU ID 3
    
    관심사 소 ID 1
    관심사 소 ID 2
    관심사 소 ID 3
    
    인원수 최소
    인원수 최대
    
    만남일 최소
    만남일 최대
    
    분위기
    참가제한
    음주가능
    동성만
*/
select *
from mood;
SELECT URL
FROM POINT;
----------------------------------------------------FN_BAD_BADGE----------------------------------------------------------------
-----------------------------------------------USER_BADGE_VIEW 가 먼저 만들어져야 함---------------------------------------------
----------------------------------------------------FN_BAD_BADGE----------------------------------------------------------------
-- 유저의 나쁜 뱃지중 랜덤하게 하나를 뽑아줌
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
-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------
-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------
-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------
-- 통합검색, 로그인 유저
SELECT *
FROM
(
SELECT FN_CAL_RANK(POSTID, '조회유저', '|키워드|키워드2|') AS POSTGRADE 
     , RANK() OVER(ORDER BY FN_CAL_RANK(POSTID, '조회유저', '|키워드|키워드2|') DESC , MEETDATE DESC) AS POSTNUM
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


-- 통합검색, 비로그인 유저
SELECT *
FROM
(
SELECT FN_CAL_RANK_GUEST(POSTID, '게스트만남장소', '|키워드|키워드2|') AS POSTGRADE 
     , RANK() OVER(ORDER BY FN_CAL_RANK_GUEST(POSTID, '게스트만남장소', '|키워드|키워드2|') DESC , MEETDATE DESC) AS POSTNUM
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

-- 카테고리 검색, 로그인 유저
SELECT *
FROM
(
SELECT FN_CAL_RANK(POSTID, 'adiard', '|키워드|') AS POSTGRADE 
     , RANK() OVER(ORDER BY FN_CAL_RANK(POSTID, 'adiard', '|키워드|'), MEETDATE DESC) AS POSTNUM
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
-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------
-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------
-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------
SELECT *
FROM POST_VIEW;
-----------------------------------------------게시글과 유저, 검색키워드 간 점수 평가 함수-----------------------------------------------------
-----------------------------------------------게시글과 유저, 검색키워드 간 점수 평가 함수-------------------------------------------------------
-----------------------------------------------게시글과 유저, 검색키워드 간 점수 평가 함수-------------------------------------------------------
/*
게시자평점	:   ⇒ 10
다이닝주소	:   ⇒ 40

제목		:       ⇒ 25
관심사 상세기입: ⇒ 15
본문		:       ⇒ 10
*/
-- ※ 키워드는 |키워드1|키워드2|키워드3| 이런식으로 미리 처리돼서 넘어와야 됨
CREATE OR REPLACE FUNCTION FN_CAL_RANK(V_POSTID VARCHAR2, V_USERID VARCHAR2, V_KEYWORD VARCHAR2)
RETURN NUMBER
IS
    V_ADDRGUID          ADDR_GU.ADDRGUID%TYPE;          -- 개설모임의 만남 장소(구)
    V_HOSTID            USER_ESSENTIAL.USERID%TYPE;     -- 개설자
    V_TITLE             POST.TITLE%TYPE;                -- 모임 제목
    V_INTERDETAIL       POST.INTERDETAIL%TYPE;          -- 모임 관심사 상세
    V_CONTENTS          POST.CONTENTS%TYPE;             -- 모임 본문
    V_GRADE_USER        NUMBER;
    V_GRADE_ADDR        NUMBER;
    V_GRADE_TITLE       NUMBER;
    V_GRADE_INTER       NUMBER;
    V_GRADE_CONTENTS    NUMBER;
BEGIN    
    -- 개설자 평점
    SELECT USERID INTO V_HOSTID
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_USER:=FN_USER_GRADE(V_HOSTID);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_USER);
    -- 지역 매치
    SELECT ADDRGUID INTO V_ADDRGUID
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_ADDR:=FN_SEARCH_ADDR(V_USERID, V_ADDRGUID);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_ADDR);
    -- 키워드-제목 매치
    SELECT TITLE INTO V_TITLE
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_TITLE:=FN_SEARCH_KEYWORD(V_KEYWORD, V_TITLE, 25);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_TITLE);
    -- 키워드-관심사 상세기입 매치
    SELECT INTERDETAIL INTO V_INTERDETAIL
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_INTER:=FN_SEARCH_KEYWORD(V_KEYWORD, V_INTERDETAIL, 15); 
    DBMS_OUTPUT.PUT_LINE(V_GRADE_INTER);
    -- 키워드-본문 매치
    SELECT CONTENTS INTO V_CONTENTS
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_CONTENTS:=FN_SEARCH_KEYWORD(V_KEYWORD, V_CONTENTS, 10);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_CONTENTS);
    
    RETURN (V_GRADE_USER + V_GRADE_ADDR + V_GRADE_TITLE + V_GRADE_INTER + V_GRADE_CONTENTS);
END;


-- 게스트 통합 검색용
CREATE OR REPLACE FUNCTION FN_CAL_RANK_GUEST(V_POSTID VARCHAR2, V_GUESTADDRGUID VARCHAR2, V_KEYWORD VARCHAR2)
RETURN NUMBER
IS
    V_ADDRGUID          ADDR_GU.ADDRGUID%TYPE;          -- 개설모임의 만남 장소(구)
    V_HOSTID            USER_ESSENTIAL.USERID%TYPE;     -- 개설자
    V_TITLE             POST.TITLE%TYPE;                -- 모임 제목
    V_INTERDETAIL       POST.INTERDETAIL%TYPE;          -- 모임 관심사 상세
    V_CONTENTS          POST.CONTENTS%TYPE;             -- 모임 본문
    V_GRADE_USER        NUMBER;
    V_GRADE_ADDR        NUMBER;
    V_GRADE_TITLE       NUMBER;
    V_GRADE_INTER       NUMBER;
    V_GRADE_CONTENTS    NUMBER;
BEGIN    
    -- 개설자 평점
    SELECT USERID INTO V_HOSTID
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_USER:=FN_USER_GRADE(V_HOSTID);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_USER);
    
    -- 지역 매치
    SELECT ADDRGUID INTO V_ADDRGUID
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_ADDR:=FN_SEARCH_ADDR_GUEST(V_GUESTADDRGUID, V_ADDRGUID);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_ADDR);
    
    -- 키워드-제목 매치
    SELECT TITLE INTO V_TITLE
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_TITLE:=FN_SEARCH_KEYWORD(V_KEYWORD, V_TITLE, 25);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_TITLE);
    -- 키워드-관심사 상세기입 매치
    SELECT INTERDETAIL INTO V_INTERDETAIL
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_INTER:=FN_SEARCH_KEYWORD(V_KEYWORD, V_INTERDETAIL, 15); 
    DBMS_OUTPUT.PUT_LINE(V_GRADE_INTER);
    -- 키워드-본문 매치
    SELECT CONTENTS INTO V_CONTENTS
    FROM POST
    WHERE POSTID=V_POSTID;
    
    V_GRADE_CONTENTS:=FN_SEARCH_KEYWORD(V_KEYWORD, V_CONTENTS, 10);
    DBMS_OUTPUT.PUT_LINE(V_GRADE_CONTENTS);
    
    RETURN (V_GRADE_USER + V_GRADE_ADDR + V_GRADE_TITLE + V_GRADE_INTER + V_GRADE_CONTENTS);
END;


-- 개설자 평점 뽑기
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
-- → 유저id를 주면 평점을 뽑는 함수*(배점/평점만점)


-- 키워드 배점 매기기 : 제목
-- 키워드 배점 매기기 : 관심사상세기입
-- 키워드 배점 매기기 : 본문
-- → 키워드랑 일치 검색 대상 텍스트, 만점시 점수를 주면 일치도에 따른 점수를 뱉어줌
-- SUB FUNCTION2 : FN_SEARCH_KEYWORD(V_KEYWORD, V_TEXT, V_ALLOT_GRADE)
-- INPUT : KEYWORD (EX- '|알파|뷰|용자|보고서|') | 처리는 자바에서 해줌
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




-- 지역 배점 매기기
-- → 유저 id랑 지역id를 주면 둘의 관계 점수를 뱉어줌
-- SUB FUNTION3 : FN_SEARCH_ADDR(V_USERID VARCHAR2, V_ADDRGUID VARCHAR2)
-- 일단 인접행렬이 필요함
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
--------------------------------------------------------최종 만들어진 함수-------------------------------------------------------
--------------------------------------------------------최종 만들어진 함수-------------------------------------------------------
--------------------------------------------------------최종 만들어진 함수-------------------------------------------------------
CREATE OR REPLACE FUNCTION FN_SEARCH_ADDR(V_USERID VARCHAR2, V_ADDRGUID VARCHAR2)
RETURN NUMBER
IS 
    V_ADDR      NUMBER;
    V_NEAR_ADDR NUMBER;
BEGIN
    -- 입력받은 ADDRGUID가 유저의 등록 ADDRGUID에 있나 찾아봄
    SELECT COUNT(*) INTO V_ADDR
    FROM USER_ADDR
    WHERE USERID=V_USERID
      AND ADDRGUID=V_ADDRGUID;
      
    -- 입력받은 ADDRGUID가 유저의 등록 ADDRGUID의 인접 ADDRGUIID에 있나 찾아봄
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



-- 게스트 통합검색용
-- EX) 게시그 만남 장소: GU00003
-- EX) 유저 입력 만남 장소: GU00013
-- 게시글의 만남 장소와 유저가 입력한 만남장소가 일치하는지판단
-- GU00003 = GU00013 ? 일치하면 40점
-- 게시글의 만남 장소의 인접 구와 유저가 입력한 만남장소가 일치하는지 판한
-- 
SELECT COUNT(*) -- 결과가 있으면 25점
FROM
(
    SELECT *
    FROM MATTRIX_ADDR_GU
)
UNPIVOT( NEAR FOR NEAR_ADDRGUID IN(GU00001,GU00002,GU00003,GU00004,GU00005,GU00006,GU00007,GU00008,GU00009,GU00010,GU00011,GU00012,GU00013,GU00014,GU00015,GU00016,GU00017,GU00018,GU00019,GU00020,GU00021,GU00022,GU00023,GU00024,GU00025) )
WHERE NEAR=1
  AND ADDRGUID='GU00003'       -- 게시글 만남장소
  AND NEAR_ADDRGUID='GU00013'; -- 유저입력 만남장소


CREATE OR REPLACE FUNCTION FN_SEARCH_ADDR_GUEST(V_GUESTADDRGUID VARCHAR2, V_ADDRGUID VARCHAR2)
RETURN NUMBER
IS
    V_ADDR      NUMBER;
    V_NEAR_ADDR NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_NEAR_ADDR -- 결과가 있으면 25점
    FROM
    (
        SELECT *
        FROM MATTRIX_ADDR_GU
    )
    UNPIVOT( NEAR FOR NEAR_ADDRGUID IN(GU00001,GU00002,GU00003,GU00004,GU00005,GU00006,GU00007,GU00008,GU00009,GU00010,GU00011,GU00012,GU00013,GU00014,GU00015,GU00016,GU00017,GU00018,GU00019,GU00020,GU00021,GU00022,GU00023,GU00024,GU00025) )
    WHERE NEAR=1
      AND ADDRGUID=V_ADDRGUID       -- 게시글 만남장소
      AND NEAR_ADDRGUID=V_GUESTADDRGUID; -- 유저입력 만남장소
    
    IF (V_GUESTADDRGUID=V_ADDRGUID)
        THEN RETURN 40;
    ELSIF V_NEAR_ADDR >0
        THEN RETURN 25;
    ELSE
        RETURN 0;
    END IF;
END;

-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------
-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------
-----------------------------------------------내가쓸 필터 + 리스트 쿼리문-------------------------------------------------------











-----------------------------------------------마이페이지 내 모임 게시글 상태 함수------------------------------------------------
-----------------------------------------------마이페이지 내 모임 게시글 상태 함수------------------------------------------------
-----------------------------------------------마이페이지 내 모임 게시글 상태 함수------------------------------------------------
-- 게시글 상태 → 게시글 상태를 잘 업데이트 한다는 가정
-- 모집중       → MEETDATE>=SYSDATE  AND  신청자들중 ST00003이 없을때

-- 만남확정     → MEETDATE>=SYSDATE  AND  조회한사람의 조회게시글 상태가 ST00003일때 
-- 후기남기기   → MEETDATE<=SYSDATE  AND  조회한사람의 조회게시글 상태가 ST00003   AND   REVIEW테이블 GIVEUSERID에 조회한 사람이 없을때
-- 후기조회     → MEETDATE<=SYSDATE  AND  조회한사람의 조회게시글 상태가 ST00003   AND   REVIEW테이블 GIVEUSERID에 조회한 사람이 있을때   

-- 만남실패     → 조회한 사람의 조회게시글 상태가 ST00004일때 OR (MEETDATE<=SYSDATE  AND  신청자들중 ST00003이 없을때)
-- → 미완. 개설자입장에서가 빠져있음

-- FUNCTION1 : FN_USER_POST_STATUS
-- INPUT : 조회한 USERID, 조회한 POSTID
-- OUTPUT : 1(모집중), 2(만남확정), 3(만남실패), 4(후기남기기), 5(후기조회)
-- 내용 : 마이페이지에서 로그인 유저가 모임 조회할때 모임 상태
CREATE OR REPLACE FUNCTION FN_USER_POST_STATUS(V_USERID VARCHAR2, V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_USER_POST_STATUS  NUMBER;
BEGIN
    -- FN_IS_HOST(V_USERID, V_POSTID)=1     개설자인가
    -- FN_OVER_SYSDATE(V_POSTID)=1          만남일이 지났는가
    -- FN_POST_IS_ACCEPTED(V_POSTID)=1      만남확정된 모임인가(참가자중 ST00003이 있는가)
    -- FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=1                조회한 유저는 만남 확정인가
    -- FN_IN_REVIEW(V_USERID, V_POSTID)=1   후기를 남겼는가
    
    -- OUTPUT : 1(모집중), 2(만남확정), 3(만남실패), 4(후기남기기), 5(후기조회)

    -- 개설자이면서 만남일 지남
    IF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=1 )
        THEN V_USER_POST_STATUS:=5;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=4;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_POST_IS_ACCEPTED(V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=3;
    -- 개설자이면서 만남일 안지남
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=1 )
        THEN V_USER_POST_STATUS:=5;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=4;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=1 AND FN_OVER_SYSDATE(V_POSTID)=0 AND FN_POST_IS_ACCEPTED(V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=1;
    -- 참가자이면서 만남일 지남  
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=1 )
        THEN V_USER_POST_STATUS:=5;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=1 AND FN_IN_REVIEW(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=4;
    ELSIF ( FN_IS_HOST(V_USERID, V_POSTID)=0 AND FN_OVER_SYSDATE(V_POSTID)=1 AND FN_USER_IS_ACCEPTED(V_USERID, V_POSTID)=0 )
        THEN V_USER_POST_STATUS:=3;
    -- 참가자이면서 만남일 안지남
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
-- INPUT : 조회한 USERID, 조회한 POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- 내용 : 조회 유저가 조회 모임의 개설자인가
CREATE OR REPLACE FUNCTION FN_IS_HOST(V_USERID VARCHAR2, V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_USERID2   USER_ESSENTIAL.USERID%TYPE;
BEGIN
    -- 입력받은 게시글의 개설자ID를 뽑아옴
    SELECT USERID INTO V_USERID2
    FROM POST
    WHERE POSTID=V_POSTID;
    
    -- 입력받은 유저ID와 같으면1 리턴
    IF V_USERID=V_USERID2
        THEN RETURN 1;
    END IF;
    
    -- 아니면 0리턴
    RETURN 0;
END;


-- SUB FUNCTION2 : FN_OVER_SYSDATE
-- INPUT : 조회한 POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- 내용 : 만남일<현재일 인가 즉, 만남일이 이미 지났는가
CREATE OR REPLACE FUNCTION FN_OVER_SYSDATE(V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_MEETDATE   POST.MEETDATE%TYPE;
BEGIN
    -- 입력받은 게시글의 만남일을 뽑아옴
    SELECT MEETDATE INTO V_MEETDATE
    FROM POST
    WHERE POSTID=V_POSTID;
    
    -- 만남일 < 현재일이면 1 리턴
    IF V_MEETDATE <= SYSDATE
        THEN RETURN 1;
    END IF;
    
    -- 아니면 0리턴
    RETURN 0;
END;


-- SUB FUNCTION3 : FN_POST_IS_ACCEPTED
-- INPUT : 조회한 POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- 내용 : 참가신청자중에 참가신청 상태 ST00003이 있는가
CREATE OR REPLACE FUNCTION FN_POST_IS_ACCEPTED(V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_NUM   NUMBER;
BEGIN
    -- 게시글의 참자 신청 댓글 상태에서 ST00003의 갯수를 뽑아봄
    SELECT COUNT(*) INTO V_NUM
    FROM POST P JOIN JOIN J ON P.POSTID=J.POSTID
    WHERE P.POSTID=V_POSTID
      AND J.STATUSID='ST00003';
    
    -- ST00003이 0초과라면 즉, 존재한다면 1리턴
    IF V_NUM > 0
        THEN RETURN 1;
    END IF;
    
    -- 아니면 0리턴
    RETURN 0;
END;

-- SUB FUNCTION4 : FN_USER_IS_ACCEPTED
-- INPUT : 조회한 USERID, 조회한 POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- 내용 : 조회한 사람의 조회 모임에 대한 참가신청 상태가 ST00003인가
CREATE OR REPLACE FUNCTION FN_USER_IS_ACCEPTED(V_USERID VARCHAR2, V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_NUM   NUMBER;
BEGIN
    -- 어느 게시글에, 어느 유저의 상태에서 'ST00003'의 갯수를 세어봄
    SELECT COUNT(*) INTO V_NUM
    FROM POST P JOIN JOIN J ON P.POSTID=J.POSTID
    WHERE P.POSTID=V_POSTID
      AND J.USERID=V_USERID
      AND J.STATUSID='ST00003';
    
    -- 존재하면 1리턴
    IF V_NUM > 0
        THEN RETURN 1;
    END IF;
    
    -- 아니면 0리턴
    RETURN 0;
END;

-- SUB FUNCTION5 : FN_IN_REVIEW
-- INPUT : 조회한 USERID, 조회한 POSTID
-- OUTPUT : 1(TRUE)/0(FALSE)
-- 내용 : 조회한 사람이 조회 모임에 남긴 후기가 있는가
CREATE OR REPLACE FUNCTION FN_IN_REVIEW(V_USERID VARCHAR2, V_POSTID VARCHAR2)
RETURN NUMBER
IS
    V_NUM   NUMBER;
BEGIN
    -- 어느 게시글에, 입력받은 유저가 남긴 후기가 있는지
    SELECT COUNT(*) INTO V_NUM
    FROM REVIEW
    WHERE POSTID=V_POSTID
      AND GIVEUSERID=V_USERID;
    
    -- 존재하면 1리턴
    IF V_NUM > 0
        THEN RETURN 1;
    END IF;
    
    -- 아니면 0리턴
    RETURN 0;
END;
-----------------------------------------------마이페이지 내 모임 게시글 상태 함수------------------------------------------------
-----------------------------------------------마이페이지 내 모임 게시글 상태 함수------------------------------------------------
-----------------------------------------------마이페이지 내 모임 게시글 상태 함수------------------------------------------------






 
 
 

-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------
-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------
-----------------------------------------------------VIEW USER_BADGE_VIEW-------------------------------------------------------
-- 현재 유저들이 가지고 있는 뱃지
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


-- 랜덤 생성기에 쓸거
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

-- 후기 평가 남겨주고 뱃지포인트를 받는다면 체크해봄 → 트리거를 준다면 REVIEW_SUB 테이블에 들어갈때
-- 누가, 어떤뱃지포인트를, 언제 받을때, 유효기간 내 동일 뱃지 갯수를 찾아봄
-- 이 값이 3이상이면, 뱃지 로그에도 추가해줌

-- REVIEW_SUB에 들어갈때 입력되는거 REVIEWID, BADGEPOINTID, CONTENTS
-- 다룰때 필요한거 → TAKEUSERID, BADGEPOINTID, REVIEWDATE A → 트리거 쓴다면 TAKEUSERID랑 REVIEWDATE는 REVIEWID 타고 가져와야 함

-- 대충 이런 결과인데
SELECT ROWNUM, RV.TAKEUSERID, RS.BADGEPOINTID, RV.REVIEWDATE, RS.ID
FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
WHERE RV.TAKEUSERID = 'BAHEELA'
  AND RS.BADGEPOINTID = 'BP00001'
  AND ADD_MONTHS(RV.REVIEWDATE,12) > TO_DATE('2017-01-04 14:11:00', 'YYYY-MM-DD HH24:MI:SS')
ORDER BY RV.REVIEWDATE DESC;

-- 중요한건 COUNT(*) 갯수
SELECT COUNT(*)
FROM REVIEW_SUB RS JOIN REVIEW RV ON RS.REVIEWID=RV.REVIEWID
WHERE RV.TAKEUSERID = 'BAHEELA'
  AND RS.BADGEPOINTID = 'BP00001'
  AND ADD_MONTHS(RV.REVIEWDATE,12) > TO_DATE('2017-01-04 14:11:00', 'YYYY-MM-DD HH24:MI:SS');

-- 조건 만족시 돌려야할 쿼리문
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BADGEPOINTID', 'GETREVIEWID', 'EXPIRATIONREVIEWID');

-- GETREVIEWID 얻는 쿼리문
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

-- EXPIRATIONREVIEWID 얻는 쿼리문
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


set serveroutput on;


-- 활동뱃지 업데이트용 → REVIEW 테이블의 트리거? → 리뷰 남길때 마다 발동되면 안되는데 → JOIN 테이블에서 상태가 3으로 바뀔때 걸어야 되나 → 이러면 샘플 만들때 애매해짐 → 샘플 업데이트 용으로 만들어야 겠네
-- 다룰때 필요한 것 → TAKEUSERID, GETREVIEWID
-- 밑에 쿼리문 결과가 5, 15, 30, 50이 될때 각각 참석러 뱃지를 줌
SELECT COUNT(*)
FROM
(
    SELECT POSTID, MIN(REVIEWDATE), MIN(REVIEWID)
    FROM REVIEW
    WHERE TAKEUSERID = 'BLISSET'
    GROUP BY POSTID
);
-- 뉴비
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BP00011', null, null);
-- 일반참석러
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BP00012', 'GETREVIEWID', null);
-- 우수참석러
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), 'TAKEUSERID', 'BP00013', 'GETREVIEWID', null);
-- 프로참석러
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

-- 유저들의 활동뱃지를 채워주는 샘플 프로시저
-- 이 프로시저는 REVIEW 테이블에 TAKEUSERID - POSTID 를 하나로 보고 갯수를 세기 때문에
-- POST테이블과 REVIEW 테이블이 차 있어야 함
-- 샘플 데이터 생성을 위한 프로시저며, 실제 시스템에선 적용하면 안됨(안에 있는 쿼리문은 재사용 가능)
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
        EXIT WHEN CUR_USER%NOTFOUND; -- EXIT 위치가 중요함. 맨 아래 있으면 마지막 하나를 반복함
        
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
        
        -- 전부 뉴비는 부여
        DBMS_OUTPUT.PUT_LINE('뉴비 뱃지 부여!');
        INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID)
        VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID', 'BL'), V_USERID, 'BP00011', null, null);        
                
        -- 15회 넘으면 일반참석러 부여
        IF V_COUNT>=15
            THEN DBMS_OUTPUT.PUT_LINE('일반참석러 뱃지 부여!');
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
                
        -- 30회 넘으면 우수참석러 부여
        IF V_COUNT>=30
            THEN DBMS_OUTPUT.PUT_LINE('우수참석러 뱃지 부여!');
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
        
        -- 50회 넘으면 프로참석러 부여
        IF V_COUNT>=50
            THEN DBMS_OUTPUT.PUT_LINE('프로참석러 뱃지 부여!');
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
-- 유저들의 대표 뱃지를 랜덤하게 채워주는 프로시저
-- 우선 뱃지가 활동뱃지면 만료기간을 따지지 않고
-- 활동 뱃지가 아니면 만료기간을 따짐.
-- 즉, 어느 유저의 활동 뱃지와 만료 이전의 일반 뱃지의 리스트를 뽑아줌

SELECT MAX(BL.BADGELOGID) AS BADGELOGID, BL.BADGEPOINTID
FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.EXPIRATIONREVIEWID=RV.REVIEWID
                       JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
                       JOIN POINT_CATE PC ON P.BADGEPOINTCATEID=PC.BADGEPOINTCATEID
WHERE BL.USERID = 'arthisef'
  AND (ADD_MONTHS(RV.REVIEWDATE,12) >= SYSDATE OR PC.BADGEPOINTCATEID='BC00004')
GROUP BY BL.BADGEPOINTID;

-- 리스트중 랜덤하게 하나 뽑기
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

-- 진짜 프로시저
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


-- 현재 유저들의 대표뱃지
SELECT UE.USERID, UE.BADGELOGID, BL.BADGEPOINTID ,P.BADGEPOINTNAME
FROM USER_ESSENTIAL UE JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
                       JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID;

-- 유저의 반이 무작위로 서로 팔로우 하도록
SELECT *
FROM FOLLOW;

SELECT USERID
FROM USER_ESSENTIAL;

INSERT INTO FOLLOW(ID, GIVEUSERID, TAKEUSERID, FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL, 'GIVEUSER', 'TAKEUSER', SYSDATE);




---------------------------------------------- 절반끼리 서로 막 팔로우 함--------------------------------------------------------
---------------------------------------------- 절반끼리 서로 막 팔로우 함--------------------------------------------------------
---------------------------------------------- 절반끼리 서로 막 팔로우 함--------------------------------------------------------
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
    DBMS_OUTPUT.PUT_LINE('기존 팔로우 다 날림');

    
    OPEN GIVEUSER_CURSOR;
    LOOP
        FETCH GIVEUSER_CURSOR INTO V_GIVEUSERID;
        EXIT WHEN GIVEUSER_CURSOR%NOTFOUND;
        
            OPEN TAKEUSER_CURSOR;
            LOOP
                FETCH TAKEUSER_CURSOR INTO V_TAKEUSERID;
                EXIT WHEN TAKEUSER_CURSOR%NOTFOUND;
                
                IF(V_GIVEUSERID=V_TAKEUSERID)
                    THEN DBMS_OUTPUT.PUT_LINE('이건 패스');
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
---------------------------------------------- 절반끼리 서로 막 팔로우 함--------------------------------------------------------
---------------------------------------------- 절반끼리 서로 막 팔로우 함--------------------------------------------------------
---------------------------------------------- 절반끼리 서로 막 팔로우 함--------------------------------------------------------



