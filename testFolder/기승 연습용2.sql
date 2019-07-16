






















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
    WHERE TITLE LIKE '%'||'绊按'||'%'
      OR CONTENTS LIKE '%'||'绊按'||'%'
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
    WHERE TITLE LIKE '%'||'绊按'||'%'
      OR CONTENTS LIKE '%'||'绊按'||'%'
    ORDER BY FAQDATE DESC
)
WHERE PAGENUM=1;

-- TotalPage, TotalLargePage甫 惶酒淋
SELECT CEIL(COUNT(*)/15) AS TOTALPAGE
FROM NOTICE
WHERE TITLE LIKE '%'||'绊按'||'%'
   OR CONTENTS LIKE '%'||'绊按'||'%';

SELECT CEIL(CEIL(COUNT(*)/15)/5) AS TOTALLARGEPAGE
FROM NOTICE
WHERE TITLE LIKE '%'||'绊按'||'%'
   OR CONTENTS LIKE '%'||'绊按'||'%';
