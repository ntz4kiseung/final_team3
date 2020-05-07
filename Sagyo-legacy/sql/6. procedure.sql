create or replace PROCEDURE INSERT_REVIEW_SUB(V_REVIEWID VARCHAR2, V_BADGEPOINTID VARCHAR2, V_CONTETNS VARCHAR2)
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



create or replace PROCEDURE PRC_UPDATE_USER_BADGE_SAMPLE
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



create or replace PROCEDURE PRC_USER_BADGE_LOG_SAMPLE
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