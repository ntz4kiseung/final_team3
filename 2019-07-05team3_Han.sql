SELECT USER 
FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DDHH24:MI:SS';

SELECT POSTID, USERID, NICKNAME, TITLE, CONTENTS, GRADE, TELCERTIID, EMAILCERTIID, URL, BADURL, ADDRSIID, ADDRSINAME, ADDRSINAME, ADDRGUID, ADDRGUNAME, ADDRDETAIL, INTERMAINID, INTERMAINNAME, INTERSUBID, INTERSUBNAME, INTERDETAIL, MINNUM, MAXNUM, POSTDATE, MEETDATE, SAMEGENDER, DRINK, LIMITGRADE, MOOD
     	, NVL((SELECT ID FROM FOLLOW WHERE GIVEUSERID= 'anlant' AND TAKEUSERID=PV.USERID), 0) AS FOLLOWID
		FROM POST_VIEW2 PV
		WHERE POSTID = 'PT00002';
SELECT *
FROM POST;
SELECT *
FROM POST_VIEW;
SELECT POSTID, USERID, NICKNAME, TITLE, CONTENTS, GRADE, TELCERTIID, EMAILCERTIID, URL, BADURL, ADDRSIID, ADDRSINAME, ADDRSINAME, ADDRGUID, ADDRGUNAME, ADDRDETAIL, INTERMAINID, INTERMAINNAME, INTERSUBID, INTERSUBNAME, INTERDETAIL, MINNUM, MAXNUM, POSTDATE, MEETDATE SAMEGENDER, DRINK, LIMITGRADE, MOOD
FROM POST_VIEW
WHERE POSTID = 'PT00002';
SELECT *
FROM FOLLOW;
SELECT ID FOLLOWID
FROM FOLLOW
WHERE GIVEUSERID = 'anlant' AND TAKEUSERID = 'BLUMBALD';
SELECT USERID, URL, TITLE, NICKNAME, MEETDATE, ADDRSINAME, ADDRGUNAME, POSTDATE, ADDRDETAIL, INTERMAINNAME, INTERSUBNAME, INTERDETAIL, DRINK, MOODNAME, SAMEGENDER, CONTENTS, MINNUM, MAXNUM, LIMITGRADE
,NVL((SELECT C.CERTINAME FROM USER_CERTIFICATION U JOIN CERTIFICATION_CATE C
ON U.CERTIID = C.CERTIID WHERE U.USERID= POST_VIEW.USERID AND C.CERTIID = 'CT00001'), '없음') TELCERTIID
, NVL((SELECT C.CERTINAME FROM USER_CERTIFICATION U JOIN CERTIFICATION_CATE C
ON U.CERTIID = C.CERTIID WHERE U.USERID= POST_VIEW.USERID AND C.CERTIID = 'CT00002'), '없음') EMAILCERTIID
, NVL((SELECT ID FROM FOLLOW WHERE GIVEUSERID = 'anlant' AND TAKEUSERID = POST_VIEW.USERID), 0) FOLLOWID
FROM POST_VIEW
WHERE POSTID = 'PT00002';

-- 팔로우인지 조회
SELECT *
FROM FOLLOW;

select *
from USER_ESSENTIAL
where userid ='anlant';
-- 팔로우 
INSERT INTO FOLLOW(ID, GIVEUSERID, TAKEUSERID, FOLLOWDATE) VALUES(FOLLOW_SEQ.NEXTVAL, 'B001', 'BAHEELA', SYSDATE);

-- 팔로우 해제
DELETE
FROM FOLLOW
WHERE GIVEUSERID = 'anlant' AND TAKEUSERID = 'BLUMBALD';

--○ 평점 평균
SELECT NVL(ROUND(AVG(GRADE)),1) TOTALGRADE
FROM REVIEW
WHERE TAKEUSERID = 'BLUMBALD';

--휴대폰 인증 조회
SELECT CERTINAME
FROM TEL_CERTIFICATION_CATE_VIEW
WHERE USERID = 'BLUMBALD';

-- 메일 인증 조회
SELECT CERTINAME
FROM MAIL_CERTIFICATION_CATE_VIEW
WHERE USERID = 'BLUMBALD';
-- 인증 여부 확인 뷰
SELECT *
FROM CERTI_VIEW
WHERE USERID = 'BLUMBALD';

SELECT *
FROM POST
WHERE USERID = 'BLUMBALD';
-- 댓글 조회 뷰 생성
CREATE OR REPLACE VIEW JOIN_VIEW
AS
SELECT P.POSTID POSTID, J.JOINID JOINID, U.USERID USERID, P.URL URL, U.NICKNAME NICKNAME, J.JOINDATE JOINDATE, J.CONTENTS CONTENTS, D.JOINID DELJOIN, J.STATUSID STATUSID
FROM POST P JOIN JOIN J
ON P.POSTID = J.POSTID
LEFT JOIN USER_ESSENTIAL U 
ON J.USERID = U.USERID
LEFT JOIN USER_BADGE_LOG L
ON U.BADGELOGID = L.BADGELOGID
LEFT JOIN POINT P
ON L.BADGEPOINTID = P.BADGEPOINTID
LEFT JOIN DEL_JOIN D
ON J.JOINID = D.JOINID;


-- 댓글 조회 구문
SELECT POSTID, JOINID, USERID, NVL(URL,'없음'), NICKNAME, JOINDATE, CONTENTS, NVL(DELJOIN,'없음'), STATUSID
FROM JOIN_VIEW
WHERE POSTID = 'PT00002';

select *
from del_join;
-- 댓글 삽입
INSERT INTO JOIN(JOINID, POSTID, USERID, STATUSID, CONTENTS, JOINDATE) VALUES(ADD_ID('JOIN','JOINID','JN'),'PT00002','anlant', 'ST00001','안녕하세요',SYSDATE);

-- 대댓글 뷰 생성
CREATE OR REPLACE VIEW REPLY_VIEW
AS
SELECT P.POSTID POSTID, J.JOINID JOINID,R.REPLYID REPLYID
, CASE WHEN R.USERTYPEID = 'RU00001' THEN P.USERID WHEN R.USERTYPEID = 'RU00002' THEN J.USERID ELSE '없음' END USERID
,P.URL URL, U.NICKNAME NICKNAME, R.REPLYDATE JOINDATE, R.CONTENTS CONTENTS,D.ID DELJOIN,R.USERTYPEID USERTYPEID
FROM POST P JOIN JOIN J
ON P.POSTID = J.POSTID
LEFT JOIN USER_ESSENTIAL U 
ON J.USERID = U.USERID
LEFT JOIN USER_BADGE_LOG L
ON U.BADGELOGID = L.BADGELOGID
LEFT JOIN POINT P
ON L.BADGEPOINTID = P.BADGEPOINTID
JOIN REPLY R
ON J.JOINID = R.JOINID
LEFT JOIN DEL_REPLY D
ON R.REPLYID = D.REPLYID;

-- 대댓글 조회
SELECT JOINID, REPLYID, USERID, URL, NICKNAME, JOINDATE, CONTENTS, DELJOIN, USERTYPEID
FROM REPLY_VIEW
WHERE POSTID = 'PT00002';

SELECT *
FROM reply_User_Type;

INSERT INTO REPLY(REPLYID, JOINID, CONTENTS, REPLYDATE, USERTYPEID) VALUES(ADD_ID('REPLY', 'REPLYID', 'RV'), 'JN00001', 'test', SYSDATE, 'RU00002');

SELECT JOINID, NVL(REPLYID, '없음'), USERID, URL, NICKNAME, JOINDATE, CONTENTS, DELJOIN, NVL(USERTYPEID,'없음')
		FROM REPLY_VIEW;
-- 신고유형 서치
SELECT REPORTCATEID
FROM REPORT_CATE
WHERE REPORTCATENAME = '욕설';

-- 신고유형 조회
SELECT REPORTCATENAME
FROM REPORT_CATE;
-- 댓글 신고
SELECT ID, JOINID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE
FROM REPORT_JOIN;

-- 댓글 신고 삽입
INSERT INTO REPORT_JOIN(ID, JOINID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE) VALUES(REPORT_JOIN_SEQ.NEXTVAL, 'JN00001','BLUMBALD', 'RC00001', '욕설',  SYSDATE);

--○ 대댓글 신고 조회
SELECT ID, REPLYID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE
FROM REPORT_REPLY;

--○ 대댓글 신고 삽입
INSERT INTO REPORT_REPLY(ID, REPLYID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE) VALUES(REPORT_REPLY_SEQ.NEXTVAL, 'RV00002', 'BLUMBALD', RC00001, '들어가', SYSDATE);

SELECT ID, POSTID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE
FROM REPORT_POST;

SELECT REPORTCATEID
FROM REPORT_CATE;

-- 게시글 신고
INSERT INTO REPORT_POST(ID, POSTID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE) VALUES(REPORT_POST_SEQ.NEXTVAL, 'PT00002', 'anlant', 'RC00001', '욕설', SYSDATE);
------------------------------------
SELECT JOINID, POSTID, USERID, STATUSID, CONTENTS, JOINDATE
FROM JOIN;

-- 인증 여부확인 
SELECT USERID USERID
, NVL((SELECT C.CERTINAME FROM USER_CERTIFICATION U JOIN CERTIFICATION_CATE C
ON U.CERTIID = C.CERTIID WHERE U.USERID='BLUMBALD' AND C.CERTIID = 'CT00001'), '없음') TELCERTIID
, NVL((SELECT C.CERTINAME FROM USER_CERTIFICATION U JOIN CERTIFICATION_CATE C
ON U.CERTIID = C.CERTIID WHERE U.USERID='BLUMBALD' AND C.CERTIID = 'CT00002'), '없음') EMAILCERTIID
FROM USER_CERTIFICATION
WHERE USERID = 'BLUMBALD';

select *
from REPLY;
SELECT P.POSTID POSTID, J.JOINID JOINID,R.REPLYID REPLYID, U.USERID USERID, P.URL URL, U.NICKNAME NICKNAME, J.JOINDATE JOINDATE, R.CONTENTS CONTENTS,D.ID DELJOIN,R.USERTYPEID USERTYPEID
FROM POST P JOIN JOIN J
ON P.POSTID = J.POSTID
LEFT JOIN USER_ESSENTIAL U 
ON J.USERID = U.USERID
LEFT JOIN USER_BADGE_LOG L
ON U.BADGELOGID = L.BADGELOGID
LEFT JOIN POINT P
ON L.BADGEPOINTID = P.BADGEPOINTID
LEFT JOIN REPLY R
ON J.JOINID = R.JOINID
LEFT JOIN DEL_REPLY D
ON R.REPLYID = D.REPLYID;



-- 현재 유저들의 대표뱃지
SELECT UE.USERID, UE.BADGELOGID, BL.BADGEPOINTID ,P.BADGEPOINTNAME
FROM USER_ESSENTIAL UE JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
                       JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID;

-- 현재 유저들이 가지고 있는 뱃지
SELECT BL.USERID, MAX(BL.BADGELOGID) AS BADGELOGID, P.BADGEPOINTNAME
FROM USER_BADGE_LOG BL LEFT JOIN REVIEW RV ON BL.EXPIRATIONREVIEWID=RV.REVIEWID
                            JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
WHERE (ADD_MONTHS(RV.REVIEWDATE,12) >= SYSDATE OR SUBSTR(BL.BADGEPOINTID,3) >= 11)
GROUP BY BL.BADGEPOINTID, BL.USERID, P.BADGEPOINTNAME
ORDER BY USERID;



-------
SELECT *
FROM DRINK;

select *
from mood;
select *
from same_gender;

SELECT ID, JOINID, DELETEDATE
FROM DEL_JOIN;

--○ 신청댓글 삭제 넣는 곳
INSERT INTO DEL_JOIN(ID, JOINID, DELETEDATE) VALUES(DEL_JOIN_SEQ.NEXTVAL, JOINID, SYSDATE);

select ID, POSTID, DELETEDATE
from DEL_POST;

INSERT INTO DEL_POST(ID, POSTID, DELETEDATE) VALUES(DEL_POST_SEQ, POSTID, SYSDATE);

INSERT INTO DEL_POST(ID, POSTID, DELETEDATE) VALUES(DEL_POST_SEQ, 'PT00002', SYSDATE);



----------------------------수정중

SELECT P.POSTID, J.JOINID, J.CONTENTS, CASE WHEN R.USERTYPEID = 'RU00001' THEN P.USERID WHEN R.USERTYPEID = 'RU00002' THEN J.USERID ELSE '없음' END USERID 
FROM POST P JOIN JOIN J
ON P.POSTID = J.POSTID
JOIN REPLY R
ON J.JOINID = R.JOINID
WHERE P.POSTID = 'PT00002';

SELECT *
FROM JOIN J LEFT JOIN REPLY R
ON J.JOINID = R.JOINID
WHERE J.POSTID = 'PT00002';
SELECT *
FROM JOIN
WHERE POSTID ='PT00002';
SELECT *
FROM REPLY;
SELECT *
FROM USER_ESSENTIAL;

SELECT P.POSTID POSTID, J.JOINID JOINID,R.REPLYID REPLYID
, CASE WHEN R.USERTYPEID = 'RU00001' THEN P.USERID WHEN R.USERTYPEID = 'RU00002' THEN J.USERID ELSE '없음' END USERID
,P.URL URL, U.NICKNAME NICKNAME, R.REPLYDATE JOINDATE, R.CONTENTS CONTENTS,D.ID DELJOIN,R.USERTYPEID USERTYPEID
FROM POST P JOIN JOIN J
ON P.POSTID = J.POSTID
LEFT JOIN USER_ESSENTIAL U 
ON J.USERID = U.USERID
LEFT JOIN USER_BADGE_LOG L
ON U.BADGELOGID = L.BADGELOGID
LEFT JOIN POINT P
ON L.BADGEPOINTID = P.BADGEPOINTID
JOIN REPLY R
ON J.JOINID = R.JOINID
LEFT JOIN DEL_REPLY D
ON R.REPLYID = D.REPLYID
WHERE P.POSTID = 'PT00002';

SELECT JOINID, REPLYID, USERID, URL, NICKNAME, JOINDATE, CONTENTS, DELJOIN, USERTYPEID
FROM REPLY_VIEW
WHERE POSTID = 'PT00002';

select *
from status;