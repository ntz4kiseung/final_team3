<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
<mapper namespace="com.test.mybatis.IAddrDAO">

	<select id="addrSiList" resultType="com.test.mybatis.AddrDTO">
 		SELECT ADDRSIID AS ADDRSIID1, ADDRSINAME  AS ADDRSINAME1
		FROM ADDR_SI
 	</select>
 	
 	<select id="addrGuList" resultType="com.test.mybatis.AddrDTO">
		SELECT ADDRGUID AS ADDRGUID1, ADDRGUNAME AS ADDRGUNAME1
		FROM ADDR_GU
        where ADDRSIID=#{siid }
 	</select>
 	
 	<insert id = "userAddrInsert1">
 		INSERT INTO USER_ADDR(ID, USERID, ADDRGUID)
		VALUES(USER_ADDR_SEQ.NEXTVAL, #{userId }, #{addrGuId1 })
 	</insert>
 	
 	<insert id = "userAddrInsert2">
 		INSERT INTO USER_ADDR(ID, USERID, ADDRGUID)
		VALUES(USER_ADDR_SEQ.NEXTVAL, #{userId }, #{addrGuId2 })
 	</insert>

 	<insert id = "userAddrInsert3">
 		INSERT INTO USER_ADDR(ID, USERID, ADDRGUID)
		VALUES(USER_ADDR_SEQ.NEXTVAL, #{userId }, #{addrGuId3 })
 	</insert>
 	
 	
 	
 	
 	
 	
 	
 	<update id="updateAddr1">
 		UPDATE USER_ADDR
		SET ADDRGUID = #{addr.addrGuId1}
		WHERE UPPER(USERID) = UPPER(#{userId}) AND  ADDRGUID = #{addr2.addrGuId1}
 	</update>
 	
 	
 	<update id="updateAddr2">
 		UPDATE USER_ADDR
		SET ADDRGUID = #{addr.addrGuId2}
		WHERE UPPER(USERID) = UPPER(#{userId}) AND  ADDRGUID = #{addr2.addrGuId2}
 	</update>
 	
 	<update id="updateAddr3">
 		UPDATE USER_ADDR
		SET ADDRGUID = #{addr.addrGuId3}
		WHERE UPPER(USERID) = UPPER(#{userId}) AND  ADDRGUID = #{addr2.addrGuId3}
 	</update>
 	


</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
<mapper namespace="com.test.mybatis.IBadgeDAO">  <!-- 인터페이스 지정  -->
     <select id="BadgeList1" resultType="com.test.mybatis.BadgeDTO"> 
	      SELECT  BADGEPOINTID,BADGEPOINTNAME
	                , (SELECT COUNT(*)FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGECK
	                , (SELECT BADGELOGID FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGELOGID
	                , P.URL ,BADGEPOINTDESC1 , BADGEPOINTDESC2 
	      FROM POINT P 
	      WHERE P.BADGEPOINTCATEID ='BC00004'
	      ORDER BY BADGEPOINTID 
	</select> 
	
	<select id="BadgeList1_count" resultType="java.lang.Integer">
		SELECT COUNT(*) AS COUNT 
		FROM
		(
	    SELECT POSTID, MIN(REVIEWDATE), MIN(REVIEWID) 
	    FROM REVIEW
	    WHERE TAKEUSERID = #{userId}
	    GROUP BY POSTID
		)	 
	</select>  
	
	
	<select id="BadgeList1_date" resultType="com.test.mybatis.BadgeDTO"> 
	<![CDATA[
		SELECT Y.BADGEDATE AS BADGEDATE
		FROM
		(
		SELECT ROWNUM AS NUM,X.*
		FROM 
		(
		SELECT POSTID, MIN(REVIEWDATE) AS BADGEDATE, MIN(REVIEWID) 
		FROM REVIEW
		WHERE TAKEUSERID = #{userId}
		GROUP BY POSTID
		ORDER BY MIN(REVIEWDATE)
		)X
		WHERE ROWNUM <= 50 
		)Y
		WHERE NUM = 1 OR NUM = 15 OR NUM = 30 OR NUM = 50
	]]>
	</select> 
	
	
	
	<select id="PointList" resultType="com.test.mybatis.BadgeDTO"> 
	<![CDATA[
	 	SELECT TAKEUSERID, GIVEUSERID ,BADGEPOINTID ,REVIEWDATE ,EXPIRATIONDATE
		FROM
		(
		SELECT *
		FROM POINT_LOG_VIEW
		WHERE TAKEUSERID = #{userId} AND BADGEPOINTID = #{badgeId}
		ORDER BY REVIEWDATE DESC 
		)  
		WHERE ROWNUM <=5
	]]>
	</select> 
<!-- 	
   <select id="BadgeList2" resultType="com.test.mybatis.BadgeDTO"> 
	   SELECT  BADGEPOINTID,BADGEPOINTNAME
	              ,(SELECT COUNT(*) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGECK 
	               , (SELECT BADGELOGID FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGELOGID
	               , (SELECT REVIEWDATE FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS REVIEWDATE
	               ,  (SELECT ADD_MONTHS(REVIEWDATE,12) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS EXPIRATIONDATE
	               ,(SELECT COUNT(*) FROM POINT_LOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND TAKEUSERID=#{userId}) AS POINTNUM
	               , P.URL
	   FROM POINT P 
	   WHERE P.BADGEPOINTCATEID ='BC00001'
	   ORDER BY BADGEPOINTID
   </select> 
   
   <select id="BadgeList3" resultType="com.test.mybatis.BadgeDTO"> 
	     SELECT BADGEPOINTID,BADGEPOINTNAME
	             ,(SELECT COUNT(*) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGECK 
	              ,(SELECT BADGELOGID FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGELOGID
	              ,(SELECT REVIEWDATE FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS REVIEWDATE
	              , (SELECT ADD_MONTHS(REVIEWDATE,12) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS EXPIRATIONDATE
	              ,(SELECT COUNT(*) FROM POINT_LOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND TAKEUSERID=#{userId}) AS POINTNUM
	              , P.URL
	      FROM POINT P 
	      WHERE P.BADGEPOINTCATEID ='BC00002'
	      ORDER BY BADGEPOINTID 
   </select> 
   
   <select id="BadgeList4" resultType="com.test.mybatis.BadgeDTO"> 
	      SELECT BADGEPOINTID,BADGEPOINTNAME
	             ,(SELECT COUNT(*) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGECK 
	              ,(SELECT BADGELOGID FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGELOGID
	              ,(SELECT REVIEWDATE FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS REVIEWDATE
	              , (SELECT ADD_MONTHS(REVIEWDATE,12) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS EXPIRATIONDATE
	              ,(SELECT COUNT(*) FROM POINT_LOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND TAKEUSERID=#{userId}) AS POINTNUM
	              , P.URL
	      FROM POINT P 
	      WHERE P.BADGEPOINTCATEID ='BC00003'
	      ORDER BY BADGEPOINTID 
   </select>  -->
	
 	<select id="BadgeList2" resultType="com.test.mybatis.BadgeDTO"> 

	 SELECT  BADGEPOINTID,BADGEPOINTNAME
	           ,(SELECT COUNT(*) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGECK 
               , (SELECT BADGELOGID FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGELOGID
               , (SELECT REVIEWDATE FROM BADGE_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS REVIEWDATE
               , (SELECT ADD_MONTHS(REVIEWDATE,12) FROM BADGE_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS EXPIRATIONDATE     
               ,(SELECT COUNT(*) FROM POINT_LOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND TAKEUSERID=#{userId}) AS POINTNUM
               , P.URL
	FROM POINT P 
	WHERE P.BADGEPOINTCATEID ='BC00001'
	ORDER BY BADGEPOINTID

	</select> 
	
	
	<select id="BadgeList3" resultType="com.test.mybatis.BadgeDTO"> 
	  SELECT  BADGEPOINTID,BADGEPOINTNAME
	           ,(SELECT COUNT(*) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGECK 
               , (SELECT BADGELOGID FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGELOGID
               , (SELECT REVIEWDATE FROM BADGE_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS REVIEWDATE
               , (SELECT ADD_MONTHS(REVIEWDATE,12) FROM BADGE_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS EXPIRATIONDATE     
               ,(SELECT COUNT(*) FROM POINT_LOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND TAKEUSERID=#{userId}) AS POINTNUM
               , P.URL
	FROM POINT P 
	WHERE P.BADGEPOINTCATEID ='BC00002'
	ORDER BY BADGEPOINTID
	</select> 
	
	<select id="BadgeList4" resultType="com.test.mybatis.BadgeDTO"> 
	   SELECT  BADGEPOINTID,BADGEPOINTNAME
	           ,(SELECT COUNT(*) FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGECK 
               , (SELECT BADGELOGID FROM USERBADGELOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS BADGELOGID
               , (SELECT REVIEWDATE FROM BADGE_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS REVIEWDATE
               , (SELECT ADD_MONTHS(REVIEWDATE,12) FROM BADGE_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND USERID=#{userId}) AS EXPIRATIONDATE     
               ,(SELECT COUNT(*) FROM POINT_LOG_VIEW WHERE BADGEPOINTID = P.BADGEPOINTID AND TAKEUSERID=#{userId}) AS POINTNUM
               , P.URL
	FROM POINT P 
	WHERE P.BADGEPOINTCATEID ='BC00003'
	ORDER BY BADGEPOINTID
	</select>
	
	<select id="positiveBadge" resultType="com.test.mybatis.BadgeDTO"> 
		SELECT BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID,BADGEPOINTDESC2, URL
		FROM POINT
		WHERE BADGEPOINTCATEID='BC00001'
	</select>
	
	<select id="negativeBadge" resultType="com.test.mybatis.BadgeDTO"> 
		SELECT BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID,BADGEPOINTDESC2, URL
		FROM POINT
		WHERE BADGEPOINTCATEID='BC00002'
	</select> 
	
	<select id="hostBadge" resultType="com.test.mybatis.BadgeDTO"> 
		SELECT BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID,BADGEPOINTDESC2, URL
		FROM POINT
		WHERE BADGEPOINTCATEID='BC00003'
	</select>  
	
	<select id="randomMainBadge" resultType="com.test.mybatis.BadgeDTO">
	<![CDATA[
		SELECT *
		FROM
		(
		SELECT BADGEPOINTNAME, BADGEPOINTDESC1, URL, BADGEPOINTID
		FROM POINT
        WHERE BADGEPOINTCATEID IN ('BC00001', 'BC00003')
          AND BADGEPOINTID NOT IN ('BP00010')
		ORDER BY DBMS_RANDOM.VALUE
		)
		WHERE ROWNUM<=2
	]]>
	</select>
  
  	<select id="getUserList" resultType="java.lang.String">
  	<![CDATA[
	  	SELECT NICKNAME
		FROM
		(
		    SELECT NICKNAME
		    FROM USER_BADGE_LOG BL JOIN REVIEW RV ON BL.GETREVIEWID=RV.REVIEWID
		                           JOIN USER_ESSENTIAL UE ON BL.USERID=UE.USERID
		    WHERE BADGEPOINTID = #{badgePointId}
		    GROUP BY UE.NICKNAME, RV.REVIEWDATE
		    ORDER BY REVIEWDATE DESC
		)
		WHERE ROWNUM<=3
  	]]>
  	</select>
  	
  	<update id="mainBadge">
  		UPDATE USER_ESSENTIAL
		SET BADGELOGID=#{badgeLogId}
		WHERE USERID = #{userId}
  	</update>
  	
</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- 출처 : http://www.mybatis.org/mybatis-3/ko/getting-started.html -->

<!-- mapper 엘리먼트의 『namespace="패키지경로가 포함된 인터페이스"』 -->
<!-- 인터페이스 내부에 메소드명 선언이 되어 있어야 한다.  -->
<!-- 메소드명과 『id=식별자』가 되어야 한다.  -->
<mapper namespace="com.test.mybatis.ICsDAO">

	<select id="noticeList" resultType="com.test.mybatis.CsDTO">
		SELECT *
		FROM
		(
		    SELECT ID,TITLE, CONTENTS, TO_CHAR(NOTICEDATE, 'YYYY-MM-DD HH24:MI') AS CSDATE
		         , FLOOR( (ROW_NUMBER() OVER(ORDER BY NOTICEDATE DESC) - 1)/15 )+1 AS PAGENUM
		         , CEIL( (FLOOR( (ROW_NUMBER() OVER(ORDER BY NOTICEDATE DESC) - 1)/15 )+1)/5 ) AS LARGEPAGENUM
		    FROM NOTICE
		    WHERE TITLE LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		      OR CONTENTS LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		    ORDER BY NOTICEDATE DESC
		)
		WHERE PAGENUM=#{pageNum}
	</select>
	
	<select id="noticeTotalPageNum" resultType="java.lang.Integer">
		SELECT CEIL(COUNT(*)/15) AS TOTALPAGE
		FROM NOTICE
		WHERE TITLE LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		   OR CONTENTS LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		ORDER BY NOTICEDATE DESC
	</select>

	<select id="noticeTotalLargePageNum" resultType="java.lang.Integer">
		SELECT CEIL(CEIL(COUNT(*)/15)/5) AS TOTALLARGEPAGE
		FROM NOTICE
		WHERE TITLE LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		   OR CONTENTS LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		ORDER BY NOTICEDATE DESC
	</select>

	<select id="faqList" resultType="com.test.mybatis.CsDTO">
		SELECT *
		FROM
		(
		    SELECT ID,TITLE, CONTENTS, TO_CHAR(FAQDATE, 'YYYY-MM-DD HH24:MI') AS CSDATE
		         , FLOOR( (ROW_NUMBER() OVER(ORDER BY FAQDATE DESC) - 1)/15 )+1 AS PAGENUM
		         , CEIL( (FLOOR( (ROW_NUMBER() OVER(ORDER BY FAQDATE DESC) - 1)/15 )+1)/5 ) AS LARGEPAGENUM
		    FROM FAQ
		    WHERE TITLE LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		      OR CONTENTS LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		    ORDER BY FAQDATE DESC
		)
		WHERE PAGENUM=#{pageNum}
	</select>
	
	<select id="faqTotalPageNum" resultType="java.lang.Integer">
		SELECT CEIL(COUNT(*)/15) AS TOTALPAGE
		FROM FAQ
		WHERE TITLE LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		   OR CONTENTS LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		ORDER BY FAQDATE DESC  
	</select>

	<select id="faqTotalLargePageNum" resultType="java.lang.Integer">
		SELECT CEIL(CEIL(COUNT(*)/15)/5) AS TOTALLARGEPAGE
		FROM FAQ
		WHERE TITLE LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		   OR CONTENTS LIKE '%'||#{keyword, jdbcType=VARCHAR}||'%'
		ORDER BY FAQDATE DESC 
	</select>
		
	<!-- 기존 DirectquestionDAO.xml -->
	
	
	<insert id="drwrite">
		INSERT INTO DIRECT_QUESTION(ID, TITLE, USERID, CONTENTS, DIRECTQUESTIONDATE) 
		VALUES(DIRECT_QUESTION_SEQ.NEXTVAL, #{title}, 'coimhin', #{content}, SYSDATE)
	</insert>
	
	
	
	<!-- 기존 WithdrawalDAO.xml -->

 	<select id="nickname" resultType="String">	
		SELECT NICKNAME
		FROM USER_ESSENTIAL
		WHERE UPPER(USERID) = UPPER(#{userId })
		<!-- WHERE UPPER(USERID) = UPPER(#{userId }) -->
	</select>
	
	<select id="idpwcheck" resultType="int">
		SELECT COUNT(*) AS IDPWCHECK
		FROM LOGIN
		WHERE PWD = CRYPTPACK.ENCRYPT(#{pwd} ,'JAVA006$')
        AND UPPER(USERID)=UPPER(#{userId})
	</select>
	
	<!--del_user  -->
	<insert id="del_user">
		INSERT INTO DEL_USER(ID,USERID,DELETEDATE)
		VALUES(DEL_USER_SEQ.NEXTVAL,#{userId},SYSDATE)
	</insert>

</mapper>



<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- 출처 : http://www.mybatis.org/mybatis-3/ko/getting-started.html -->

<!-- mapper 엘리먼트의 『namespace="패키지경로가 포함된 인터페이스"』 -->
<!-- 인터페이스 내부에 메소드명 선언이 되어 있어야 한다.  -->
<!-- 메소드명과 『id=식별자』가 되어야 한다.  -->
<mapper namespace="com.test.mybatis.IDirectquestioncompleteDAO">

	<!-- ○ id="식별자" 속성 추가 -->
	<!-- - 인터페이스에 선언된 메소드의 이름과 일치해야 하며, -->
	<!-- 호출 메소드명 역할을 수행하게 된다. -->
	<!-- ○ resuyltType="패키지 경로가 포함된 자료형 클래스" -->
	<!-- - string : java.lang.String
		 - byte : java.lang.byte
		 - short : java.lang.short
		 - int : java.lang.int
		 - integer : java.lang.integer
		 - double : java.lang.double
		 - float : java.lang.float
		 - boolean : java.lang.boolean
		 - decimal : java.math.BigDecimal
		 - object : java.lang.Object
		 - map :  java.util.Map
		 - hashmap :  java.util.HashMap
		 - list :  java.util.list
		 - arraylist : java.util.ArrayList
		 - collection  : java.util.Collection
		 - iterator : java.util.Iterator
		-->


	
	<insert id="drwrite">
		INSERT INTO DIRECT_QUESTION(ID, TITLE, USERID, CONTENTS, DIRECTQUESTIONDATE) 
		VALUES(DIRECT_QUESTION_SEQ.NEXTVAL, #{title}, 'coimhin', #{content}, SYSDATE)
	</insert>
	
	

	


	

</mapper>




<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.test.mybatis.IFollowDAO"> 
	
	<insert id="followinsert">
		INSERT INTO FOLLOW(ID, GIVEUSERID, TAKEUSERID, FOLLOWDATE) VALUES(FOLLOW_SEQ.NEXTVAL, #{userId}, #{followId}, SYSDATE)
	</insert>
	
	<delete id="followdelete">
		DELETE
		FROM FOLLOW
		WHERE GIVEUSERID = #{userId} AND TAKEUSERID = #{followId}
	</delete>

	<insert id="followinsert2">
		INSERT INTO FOLLOW(ID, GIVEUSERID, TAKEUSERID, FOLLOWDATE) VALUES(FOLLOW_SEQ.NEXTVAL, #{userId}, #{followId}, SYSDATE)
	</insert>
	
	<delete id="followdelete2">
		DELETE
		FROM FOLLOW
		WHERE GIVEUSERID = #{userId} AND TAKEUSERID = #{followId}
	</delete>


  	<select id="followingList" resultType="com.test.mybatis.FollowDTO"> 
		SELECT DISTINCT UE.NICKNAME ,UE.USERID, UE.BADGELOGID, BL.BADGEPOINTID ,P.BADGEPOINTNAME,P.URL
                 , NVL2((SELECT ID FROM FOLLOW WHERE GIVEUSERID=#{userId} AND TAKEUSERID=UE.USERID),1,0) AS FOLLOWID
				 ,(SELECT ROUND(AVG(GRADE),1) FROM REVIEW WHERE TAKEUSERID=UE.USERID GROUP BY TAKEUSERID) AS REVIEWGRADE
		FROM FOLLOW F LEFT JOIN USER_ESSENTIAL UE  ON  UE.USERID = F.TAKEUSERID
                        JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
                        JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
		WHERE F.GIVEUSERID=#{userId}  
		ORDER BY USERID
	</select> 
	
	<select id="followingBad" resultType="com.test.mybatis.FollowDTO"> 
		SELECT USERID, FN_PROFILE_BAD_BADGE(USERID) AS URLBAD
		FROM USER_ESSENTIAL UE JOIN FOLLOW F ON UE.USERID = F.TAKEUSERID
		WHERE F.GIVEUSERID=#{userId}
		ORDER BY USERID
	</select> 
	 	
	 	
	<select id="followingAddrList" resultType="com.test.mybatis.FollowDTO"> 
		SELECT USERID , MAX(ADDRSIID1) AS ADDRSINAME1 , MAX(ADDRGUID1) AS ADDRGUNAME1
		              ,MAX(ADDRSIID2) AS ADDRSINAME2 , MAX(ADDRGUID2) AS ADDRGUNAME2
		              ,MAX(ADDRSIID3) AS ADDRSINAME3 , MAX(ADDRGUID3) AS ADDRGUNAME3
		FROM 
		(
		SELECT USERID
		     , DECODE(NUM, 2, ADDRSINAME) AS ADDRSIID2
		     , DECODE(NUM, 2, ADDRGUNAME) AS ADDRGUID2
		     , DECODE(NUM, 3, ADDRGUNAME) AS ADDRGUID3
		      , DECODE(NUM, 3, ADDRSINAME) AS ADDRSIID3
		     , DECODE(NUM, 1, ADDRGUNAME) AS ADDRGUID1
		     , DECODE(NUM, 1, ADDRSINAME) AS ADDRSIID1
		FROM
		(
		SELECT UE.USERID, UA.ADDRGUID , ADDRSINAME, ADDRGUNAME, RANK() OVER(PARTITION BY UE.USERID ORDER BY UA.ADDRGUID) AS NUM 
		FROM USER_ESSENTIAL UE JOIN USER_ADDR UA ON UE.USERID=UA.USERID
		JOIN ADDR_GU AG ON UA.ADDRGUID = AG. ADDRGUID
		JOIN ADDR_SI AD ON AG.ADDRSIID = AD.ADDRSIID
		JOIN FOLLOW F ON UE.USERID = F. TAKEUSERID
		WHERE F.GIVEUSERID=#{userId}
		ORDER BY USERID, ADDRGUID
		)
		) GROUP BY USERID
		ORDER BY USERID
	</select> 
	 	
	
	<select id="followingInterList" resultType="com.test.mybatis.FollowDTO"> 	
		SELECT USERID , MAX(INTERMAINID1) AS INTERMAINNAME1 , MAX(INTERSUBID1) AS INTERSUBNAME1
		              ,MAX(INTERMAINID2) AS INTERMAINNAME2 , MAX(INTERSUBID2) AS INTERSUBNAME2
		              ,MAX(INTERMAINID3) AS INTERMAINNAME3 , MAX(INTERSUBID3) AS INTERSUBNAME3
		FROM 
		(
		SELECT USERID
		     , DECODE(NUM, 2, INTERSUBNAME) AS INTERSUBID3
		     , DECODE(NUM, 2, INTERMAINNAME) AS INTERMAINID3
		     , DECODE(NUM, 3, INTERSUBNAME) AS INTERSUBID2
		     , DECODE(NUM, 3, INTERMAINNAME) AS INTERMAINID2
		     , DECODE(NUM, 1, INTERSUBNAME) AS INTERSUBID1
		     , DECODE(NUM, 1, INTERMAINNAME) AS INTERMAINID1
		FROM
		(
		SELECT UE.USERID, UI.INTERSUBID, INTERSUBNAME, INTERMAINNAME , RANK() OVER(PARTITION BY UE.USERID ORDER BY UI.INTERSUBID) AS NUM 
		FROM USER_ESSENTIAL UE JOIN USER_INTEREST UI ON UE.USERID=UI.USERID
		JOIN INTEREST_SUB I ON UI.INTERSUBID = I.INTERSUBID
		JOIN INTEREST_MAIN IM ON I.INTERMAINID = IM.INTERMAINID
		JOIN FOLLOW F ON UE.USERID = F.TAKEUSERID
		WHERE F.GIVEUSERID=#{userId}
		ORDER BY USERID, INTERSUBID
		)
		) GROUP BY USERID
		ORDER BY USERID
	</select>  	


	
  	<select id="followerList" resultType="com.test.mybatis.FollowDTO"> 
		  SELECT DISTINCT UE.NICKNAME ,UE.USERID, UE.BADGELOGID, BL.BADGEPOINTID ,P.BADGEPOINTNAME,P.URL               
                 , NVL2((SELECT ID FROM FOLLOW WHERE GIVEUSERID=#{userId} AND TAKEUSERID=UE.USERID),1,0) AS FOLLOWID
				 ,(SELECT ROUND(AVG(GRADE),1) FROM REVIEW WHERE TAKEUSERID=UE.USERID GROUP BY TAKEUSERID) AS REVIEWGRADE
		FROM FOLLOW F LEFT JOIN USER_ESSENTIAL UE  ON  UE.USERID = F.GIVEUSERID
                        JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
                        JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID                      
		WHERE F.TAKEUSERID=#{userId}
        ORDER BY USERID
	</select> 
	
	
	<select id="followerBad" resultType="com.test.mybatis.FollowDTO"> 
		SELECT USERID, FN_PROFILE_BAD_BADGE(USERID) AS URLBAD
		FROM USER_ESSENTIAL UE JOIN FOLLOW F ON UE.USERID = F.GIVEUSERID
		WHERE F.TAKEUSERID=#{userId}
		ORDER BY USERID
	</select> 
	 	

	<select id="followerAddrList" resultType="com.test.mybatis.FollowDTO"> 
		SELECT USERID , MAX(ADDRSIID1) AS ADDRSINAME1 , MAX(ADDRGUID1) AS ADDRGUNAME1
              ,MAX(ADDRSIID2) AS ADDRSINAME2 , MAX(ADDRGUID2) AS ADDRGUNAME2
              ,MAX(ADDRSIID3) AS ADDRSINAME3 , MAX(ADDRGUID3) AS ADDRGUNAEM3
		FROM 
		(
		SELECT USERID
		     , DECODE(NUM, 2, ADDRSINAME) AS ADDRSIID2
		     , DECODE(NUM, 2, ADDRGUNAME) AS ADDRGUID2
		     , DECODE(NUM, 3, ADDRGUNAME) AS ADDRGUID3
		      , DECODE(NUM, 3, ADDRSINAME) AS ADDRSIID3
		     , DECODE(NUM, 1, ADDRGUNAME) AS ADDRGUID1
		     , DECODE(NUM, 1, ADDRSINAME) AS ADDRSIID1
		FROM
		(
		SELECT UE.USERID, UA.ADDRGUID , ADDRSINAME, ADDRGUNAME, RANK() OVER(PARTITION BY UE.USERID ORDER BY UA.ADDRGUID) AS NUM 
		FROM USER_ESSENTIAL UE JOIN USER_ADDR UA ON UE.USERID=UA.USERID
		JOIN ADDR_GU AG ON UA.ADDRGUID = AG. ADDRGUID
		JOIN ADDR_SI AD ON AG.ADDRSIID = AD.ADDRSIID
		JOIN FOLLOW F ON UE.USERID = F. GIVEUSERID
		WHERE F.TAKEUSERID=#{userId}
		ORDER BY USERID, ADDRGUID
		)
		) GROUP BY USERID
		ORDER BY USERID
	</select> 
	 	
	
	<select id="followerInterList" resultType="com.test.mybatis.FollowDTO"> 	
		SELECT USERID , MAX(INTERMAINID1) AS INTERMAINNAME1 , MAX(INTERSUBID1) AS INTERSUBNAME1
              ,MAX(INTERMAINID2) AS INTERMAINNAME2 , MAX(INTERSUBID2) AS INTERSUBNAME2
		              ,MAX(INTERMAINID3) AS INTERMAINNAME3 , MAX(INTERSUBID3) AS INTERSUBNAME3
		FROM 
		(
		SELECT USERID
		     , DECODE(NUM, 2, INTERSUBNAME) AS INTERSUBID3
		     , DECODE(NUM, 2, INTERMAINNAME) AS INTERMAINID3
		     , DECODE(NUM, 3, INTERSUBNAME) AS INTERSUBID2
		     , DECODE(NUM, 3, INTERMAINNAME) AS INTERMAINID2
		     , DECODE(NUM, 1, INTERSUBNAME) AS INTERSUBID1
		     , DECODE(NUM, 1, INTERMAINNAME) AS INTERMAINID1
		FROM
		(
		SELECT UE.USERID, UI.INTERSUBID, INTERSUBNAME, INTERMAINNAME , RANK() OVER(PARTITION BY UE.USERID ORDER BY UI.INTERSUBID) AS NUM 
		FROM USER_ESSENTIAL UE JOIN USER_INTEREST UI ON UE.USERID=UI.USERID
		JOIN INTEREST_SUB I ON UI.INTERSUBID = I.INTERSUBID
		JOIN INTEREST_MAIN IM ON I.INTERMAINID = IM.INTERMAINID
		JOIN FOLLOW F ON UE.USERID = F.GIVEUSERID
		WHERE F.TAKEUSERID=#{userId}
		ORDER BY USERID, INTERSUBID
		)
		) GROUP BY USERID
		ORDER BY USERID
	</select>  	
  
</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
<mapper namespace="com.test.mybatis.IInterDAO">

 	<select id="interMainList" resultType="com.test.mybatis.InterDTO">
 		SELECT INTERMAINID AS INTERMAINID1, INTERMAINNAME AS INTERMAINNAME1
		FROM INTEREST_MAIN
 	</select>
 	
 	<select id="interSubList" resultType="com.test.mybatis.InterDTO">
 		SELECT INTERSUBID AS INTERSUBID1, INTERSUBNAME AS INTERSUBNAME1
		FROM INTEREST_SUB
        WHERE INTERMAINID = #{mainid}
 	</select>
 	
 	<insert id = "userInterInsert1">
 		INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID)
		VALUES (USER_INTEREST_SEQ.NEXTVAL, #{userId }, #{interSubId1 })
 	</insert>
 	
 	<insert id = "userInterInsert2">
 		INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID)
		VALUES (USER_INTEREST_SEQ.NEXTVAL, #{userId }, #{interSubId2 })
 	</insert>
 	
 	<insert id = "userInterInsert3">
 		INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID)
		VALUES (USER_INTEREST_SEQ.NEXTVAL, #{userId }, #{interSubId3 })
 	</insert>
 	
 	<update id = "updateInter1">
 		UPDATE  USER_INTEREST
		SET INTERSUBID = #{inter.interSubId1}
		WHERE UPPER(USERID) = UPPER(#{userId}) AND INTERSUBID = #{inter2.interSubId1}
 	</update>
 	
 	<update id = "updateInter2">
 		UPDATE  USER_INTEREST
		SET INTERSUBID = #{inter.interSubId2}
		WHERE UPPER(USERID) = UPPER(#{userId}) AND INTERSUBID = #{inter2.interSubId2}
 	</update>
 	
 	<update id = "updateInter3">
 		UPDATE  USER_INTEREST
		SET INTERSUBID = #{inter.interSubId3}
		WHERE UPPER(USERID) = UPPER(#{userId}) AND INTERSUBID = #{inter2.interSubId3}
 	</update>
 	

  	<select id="userInterest" resultType="com.test.mybatis.InterDTO">
		SELECT USERID, INTERSUBID AS INTERSUBID1, INTERMAINID AS INTERMAINID1, INTERSUBNAME AS INTERSUBNAME1, INTERMAINNAME AS INTERMAINNAME1
		FROM
		(
		    SELECT UI.ID, UI.USERID, UI.INTERSUBID, "IS".INTERMAINID, "IS".INTERSUBNAME, IM.INTERMAINNAME
		    FROM USER_INTEREST UI JOIN INTEREST_SUB "IS" ON UI.INTERSUBID="IS".INTERSUBID
		                          JOIN INTEREST_MAIN IM ON "IS".INTERMAINID=IM.INTERMAINID
		    WHERE USERID=#{userId}
		    ORDER BY UI.ID
		)
		WHERE ROWNUM=1
  	</select>

</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.test.mybatis.IJoinDAO">  <!-- 인터페이스 지정  -->
	<select id="joinlist" resultType="com.test.mybatis.JoinDTO"> 
		SELECT JOINID, USERID, URL, NICKNAME, JOINDATE, CONTENTS, DELJOIN, STATUSID
		FROM JOIN_VIEW
		WHERE POSTID = #{postHostId}
	</select>
	<select id="replylist" resultType="com.test.mybatis.JoinDTO">
		SELECT JOINID, REPLYID, USERID, URL, NICKNAME, JOINDATE, CONTENTS, DELJOIN, USERTYPEID
		FROM REPLY_VIEW
		WHERE POSTID = #{postHostId}
	</select>
	<select id="postmeettype" resultType="int">
		SELECT COUNT(STATUSID)
		FROM JOIN
		WHERE POSTID = #{postId} AND 
		STATUSID = 'ST00003'
	</select>
	<insert id="joininsert">
		INSERT INTO JOIN(JOINID, POSTID, USERID, STATUSID, CONTENTS, JOINDATE) VALUES(ADD_ID('JOIN','JOINID','JN'),#{postHostId},#{joinDTO.userId}, 'ST00001',#{joinDTO.contents},SYSDATE)
	</insert>
	<insert id="replyinsert">
		INSERT INTO REPLY(REPLYID, JOINID, CONTENTS, REPLYDATE, USERTYPEID) VALUES(ADD_ID('REPLY', 'REPLYID', 'RV'), #{joinId}, #{contents}, SYSDATE, #{userTypeId})
	</insert>
	<update id="joinupdate">
		UPDATE JOIN
		SET STATUSID = #{statusId}
		WHERE JOINID = #{joinId}
	</update>
	<select id="serchjoin" resultType="int">
	<![CDATA[
		SELECT COUNT(STATUSID)
		FROM JOIN
		WHERE POSTID = #{hostPostId} AND 
		STATUSID = CASE WHEN 1<=(SELECT COUNT(STATUSID) FROM JOIN WHERE POSTID = #{hostPostId} AND STATUSID = 'ST00003') THEN 'ST00003' ELSE 'ST00002' END
		]]>
	</select>
	<select id="serchjoinid" resultType="java.lang.String">
		SELECT JOINID
		FROM JOIN
		WHERE POSTID= #{postHostId} AND USERID = #{userId}
	</select>
</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
<mapper namespace="com.test.mybatis.IMessageDAO">  
  
	<select id="messageRecevieList" resultType="com.test.mybatis.MessageDTO"> 
		SELECT *
		FROM
		(
		    SELECT M.MESSAGEID,M.CONTENTS,M.GIVEUSERID,M.TAKEUSERID,M.SENDDATE,M.CHECKDATE
		             , FLOOR( (ROW_NUMBER() OVER(ORDER BY M.SENDDATE DESC) - 1)/10 )+1 AS PAGENUM
		         , CEIL( (FLOOR( (ROW_NUMBER() OVER(ORDER BY M.SENDDATE DESC) - 1)/10 )+1)/5 ) AS LARGEPAGENUM
		    FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.TAKEUSERID=DM.USERID)
		    WHERE DM.MESSAGEID IS NULL AND UPPER(TAKEUSERID)=UPPER(#{userId})
		    ORDER BY M.SENDDATE DESC
		)
		WHERE PAGENUM=#{pageNum}
	</select>  	
	
	<select id="messageRecevieTotalPageNum" resultType="java.lang.Integer">
		SELECT CEIL(COUNT(*)/10) AS TOTALPAGE
		FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.TAKEUSERID=DM.USERID)
		WHERE DM.MESSAGEID IS NULL AND UPPER(TAKEUSERID)=UPPER(#{userId})
		ORDER BY M.SENDDATE DESC
	</select>

	<select id="messageRecevieTotalLargePageNum" resultType="java.lang.Integer">
		SELECT CEIL(CEIL(COUNT(*)/10)/5) AS TOTALLARGEPAGE
		FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.TAKEUSERID=DM.USERID)
		WHERE DM.MESSAGEID IS NULL AND UPPER(TAKEUSERID)=UPPER(#{userId})
		ORDER BY M.SENDDATE DESC
	</select>

	<select id="messageSendList" resultType="com.test.mybatis.MessageDTO"> 
		SELECT *
		FROM
		(
		    SELECT M.MESSAGEID,M.CONTENTS,M.GIVEUSERID,M.TAKEUSERID,M.SENDDATE,M.CHECKDATE
		             , FLOOR( (ROW_NUMBER() OVER(ORDER BY M.SENDDATE DESC) - 1)/10 )+1 AS PAGENUM
		         , CEIL( (FLOOR( (ROW_NUMBER() OVER(ORDER BY M.SENDDATE DESC) - 1)/10 )+1)/5 ) AS LARGEPAGENUM
		    FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.GIVEUSERID=DM.USERID)
		    WHERE DM.MESSAGEID IS NULL AND UPPER(GIVEUSERID)=UPPER(#{userId})
		    ORDER BY M.SENDDATE
		)
		WHERE PAGENUM=#{pageNum}
	</select>  	
	
	<select id="messageSendTotalPageNum" resultType="java.lang.Integer">
		SELECT CEIL(COUNT(*)/10) AS TOTALPAGE
		FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.GIVEUSERID=DM.USERID)
		WHERE DM.MESSAGEID IS NULL AND UPPER(GIVEUSERID)=UPPER(#{userId})
		ORDER BY M.SENDDATE
	</select>

	<select id="messageSendTotalLargePageNum" resultType="java.lang.Integer">
		SELECT CEIL(CEIL(COUNT(*)/10)/5) AS TOTALLARGEPAGE
		FROM MESSAGE M LEFT JOIN DEL_MESSAGE DM  ON (M.MESSAGEID = DM.MESSAGEID AND M.GIVEUSERID=DM.USERID)
		WHERE DM.MESSAGEID IS NULL AND UPPER(GIVEUSERID)=UPPER(#{userId})
		ORDER BY M.SENDDATE
	</select>
	
	<insert id="messageAdd">
		INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE)
		VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), #{userId}, #{message.takeUserId},#{message.contents },SYSDATE)
	</insert>
	
	<delete id="messageDelete">
		INSERT INTO DEL_MESSAGE(ID,MESSAGEID,DELETEDATE,USERID)
		VALUES (DEL_MESSAGE_SEQ.NEXTVAL ,#{messageId },SYSDATE, #{userId})
	</delete>

 	<select id="checkId" resultType="java.lang.Integer">
 		SELECT COUNT(*)
		FROM LOGIN
		WHERE USERID = #{takeUserId }
 	</select> 
 	
 	<update id="messageCheckDate">
	 	UPDATE MESSAGE
		SET CHECKDATE = SYSDATE
		WHERE MESSAGEID = #{messageId }
 	</update>
 	
	<insert id="messageinsert">
		INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'),#{giveUserId}, #{takeUserId}, #{contents}, SYSDATE)
	</insert>
	
</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.test.mybatis.IPostDAO">  <!-- 인터페이스 지정  -->
	<select id="postlist" resultType="com.test.mybatis.PostDTO" parameterType="String">
		SELECT POSTID, USERID, NICKNAME, TITLE, CONTENTS, GRADE, TELCERTIID, EMAILCERTIID, URL, BADURL, ADDRSIID, ADDRSINAME, ADDRSINAME, ADDRGUID, ADDRGUNAME, ADDRDETAIL, INTERMAINID, INTERMAINNAME, INTERSUBID, INTERSUBNAME, INTERDETAIL, MINNUM, MAXNUM, POSTDATE, MEETDATE, SAMEGENDER, DRINK, LIMITGRADE, MOOD MOODNAME
     	, NVL((SELECT ID FROM FOLLOW WHERE GIVEUSERID= #{followIds} AND TAKEUSERID=PV.USERID), 0) AS FOLLOWID
		FROM POST_VIEW2 PV
		WHERE POSTID = #{postHostId}
	</select>
	
	<insert id="postinsert">
		INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, ADDRDETAIL, INTERSUBID, INTERDETAIL, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
		VALUES(ADD_ID('POST', 'POSTID', 'PT'), #{userId, jdbcType=VARCHAR}, #{title, jdbcType=VARCHAR}, #{addrGuId, jdbcType=VARCHAR}, #{addrDetail, jdbcType=VARCHAR}, #{interSubId, jdbcType=VARCHAR}, #{interDetail, jdbcType=VARCHAR}, TO_DATE(#{meetDate, jdbcType=VARCHAR}, 'YYYY-MM-DD HH24:MI:SS'), SYSDATE, #{contents, jdbcType=VARCHAR}, #{moodName, jdbcType=VARCHAR}, #{grade}, #{minNum}, #{maxNum}, #{drink, jdbcType=VARCHAR}, #{samegender, jdbcType=VARCHAR})
	</insert>
	
	<select id="serchpost" resultType="java.lang.String">
		SELECT MAX(POSTID) POSTID
		FROM POST
		WHERE USERID = #{userId}
	</select>
	
	<select id="searchList" resultType="com.test.mybatis.PostDTO">
	<![CDATA[
		SELECT *
		FROM
		(
		SELECT FN_CAL_RANK(POSTID, #{userId}, #{keyword}) AS GRADETOTAL
			 , FN_USER_GRADE(USERID) AS GRADEHOST
			 , FN_SEARCH_ADDR(#{userId}, ADDRGUID) AS GRADEADDR
			 , FN_SEARCH_KEYWORD(#{keyword}, TITLE, 25) AS GRADETITLE
			 , FN_SEARCH_KEYWORD(#{keyword}, INTERDETAIL, 15) AS GRADEINTERDETAIL
			 , FN_SEARCH_KEYWORD(#{keyword}, CONTENTS, 10) AS GRADECONTENTS
		     , RANK() OVER(ORDER BY FN_CAL_RANK(POSTID, #{userId}, #{keyword}) DESC, MEETDATE DESC) AS POSTNUM
		     , POSTID, USERID, NICKNAME, URL, URLBAD
		     , TITLE, MINNUM, MAXNUM, CONTENTS
		     , ADDRSINAME, ADDRGUNAME, TO_CHAR(MEETDATE, 'YYYY/MM/DD HH24:MI') AS MEETDATE
		FROM POST_VIEW
		WHERE MEETDATE >= SYSDATE
		  AND (ADDRGUID LIKE '%'||#{addrGuId1} OR ADDRGUID IN (#{addrGuId2} ,#{addrGuId3}))
		  AND (INTERSUBID LIKE '%'||#{interSubId1} OR INTERSUBID IN (#{interSubId2} ,#{interSubId3}))
		  AND (#{minNum}<=MINNUM AND MAXNUM<=#{maxNum})
		  AND (TO_DATE(#{minMeetDate}, 'YYYY-MM-DD')<=MEETDATE AND MEETDATE<=TO_DATE(#{maxMeetDate}, 'YYYY-MM-DD'))
		  AND MOOD LIKE '%'||#{moodId}||'%'
		  AND LIMITGRADE>=#{limitGrade}
		  AND DRINK LIKE '%'||#{drinkId}||'%'
		  AND SAMEGENDER LIKE '%'||#{sameGenderId}||'%'
		)
		WHERE (6*#{pageNum}-5) <= POSTNUM AND POSTNUM < (6*#{pageNum}+1)
	]]>
	</select>
	
	<select id="searchListGuest" resultType="com.test.mybatis.PostDTO">
	<![CDATA[
		SELECT *
		FROM
		(
		SELECT FN_CAL_RANK_GUEST(POSTID, #{guestAddrGuId, jdbcType=VARCHAR}, #{keyword}) AS GRADETOTAL
			 , FN_USER_GRADE(USERID) AS GRADEHOST
			 , FN_SEARCH_ADDR_GUEST(#{guestAddrGuId}, ADDRGUID) AS GRADEADDR
			 , FN_SEARCH_KEYWORD(#{keyword}, TITLE, 25) AS GRADETITLE
			 , FN_SEARCH_KEYWORD(#{keyword}, INTERDETAIL, 15) AS GRADEINTERDETAIL
			 , FN_SEARCH_KEYWORD(#{keyword}, CONTENTS, 10) AS GRADECONTENTS 
		     , RANK() OVER(ORDER BY FN_CAL_RANK_GUEST(POSTID, #{guestAddrGuId}, #{keyword}) DESC, MEETDATE DESC) AS POSTNUM
		     , POSTID, USERID, NICKNAME, URL, URLBAD
		     , TITLE, MINNUM, MAXNUM, CONTENTS
		     , ADDRSINAME, ADDRGUNAME, TO_CHAR(MEETDATE, 'YYYY/MM/DD HH24:MI') AS MEETDATE
		FROM POST_VIEW
		WHERE MEETDATE >= SYSDATE
		  AND (ADDRGUID LIKE '%'||#{addrGuId1} OR ADDRGUID IN (#{addrGuId2} ,#{addrGuId3}))
		  AND (INTERSUBID LIKE '%'||#{interSubId1} OR INTERSUBID IN (#{interSubId2} ,#{interSubId3}))
		  AND (#{minNum}<=MINNUM AND MAXNUM<=#{maxNum})
		  AND (TO_DATE(#{minMeetDate}, 'YYYY-MM-DD')<=MEETDATE AND MEETDATE<=TO_DATE(#{maxMeetDate}, 'YYYY-MM-DD'))
		  AND MOOD LIKE '%'||#{moodId}||'%'
		  AND LIMITGRADE>=#{limitGrade}
		  AND DRINK LIKE '%'||#{drinkId}||'%'
		  AND SAMEGENDER LIKE '%'||#{sameGenderId}||'%'
		)
		WHERE (6*#{pageNum}-5) <= POSTNUM AND POSTNUM < (6*#{pageNum}+1)
	]]>
	</select>
	
	<select id="searchCateList" resultType="com.test.mybatis.PostDTO">
	<![CDATA[
		SELECT *
		FROM
		(
		SELECT FN_CAL_RANK(POSTID, #{userId}, #{keyword}) AS GRADETOTAL
			 , FN_USER_GRADE(USERID) AS GRADEHOST
			 , FN_SEARCH_ADDR(#{userId}, ADDRGUID) AS GRADEADDR
			 , FN_SEARCH_KEYWORD(#{keyword}, TITLE, 25) AS GRADETITLE
			 , FN_SEARCH_KEYWORD(#{keyword}, INTERDETAIL, 15) AS GRADEINTERDETAIL
			 , FN_SEARCH_KEYWORD(#{keyword}, CONTENTS, 10) AS GRADECONTENTS 
		     , RANK() OVER(ORDER BY FN_CAL_RANK(POSTID, #{userId}, #{keyword}) DESC, MEETDATE DESC) AS POSTNUM
		     , POSTID, USERID, NICKNAME, URL, URLBAD
		     , TITLE, MINNUM, MAXNUM, CONTENTS
		     , ADDRSINAME, ADDRGUNAME, TO_CHAR(MEETDATE, 'YYYY/MM/DD HH24:MI') AS MEETDATE
		FROM POST_VIEW
		WHERE MEETDATE >= SYSDATE
		  AND INTERMAINID=#{userInterMainId}
		  AND INTERSUBID LIKE '%'||#{userInterSubId}
		  AND (ADDRGUID LIKE '%'||#{addrGuId1} OR ADDRGUID IN (#{addrGuId2} ,#{addrGuId3}))
		  AND (INTERSUBID LIKE '%'||#{interSubId1} OR INTERSUBID IN (#{interSubId2} ,#{interSubId3}))
		  AND (#{minNum}<=MINNUM AND MAXNUM<=#{maxNum})
		  AND (TO_DATE(#{minMeetDate}, 'YYYY-MM-DD')<=MEETDATE AND MEETDATE<=TO_DATE(#{maxMeetDate}, 'YYYY-MM-DD'))
		  AND MOOD LIKE '%'||#{moodId}||'%'
		  AND LIMITGRADE>=#{limitGrade}
		  AND DRINK LIKE '%'||#{drinkId}||'%'
		  AND SAMEGENDER LIKE '%'||#{sameGenderId}||'%'
		)
		WHERE (6*#{pageNum}-5) <= POSTNUM AND POSTNUM < (6*#{pageNum}+1)
	]]>
	</select>
	
	<select id="mainHotList" resultType="com.test.mybatis.PostDTO">
	<![CDATA[
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
		WHERE ROWNUM <=5
	]]>
	</select>
	
	<select id="mainRecommendList" resultType="com.test.mybatis.PostDTO">
	<![CDATA[
		SELECT POSTID, USERID, NICKNAME, TITLE, CONTENTS, MEETDATE, ADDRSINAME, ADDRGUNAME, URL, URLBAD
		FROM
		(
		    SELECT *
		    FROM POST_VIEW 
		    WHERE MEETDATE>=SYSDATE
		      AND FN_POST_IS_ACCEPTED(POSTID)=0
		    ORDER BY FN_CAL_RANK(POSTID, #{userId}, '||') DESC, MEETDATE DESC
		)
		WHERE ROWNUM <=5
	]]>
	</select>

	<select id="mainApproachingList" resultType="com.test.mybatis.PostDTO">
	<![CDATA[
		SELECT *
		FROM
		(
		    SELECT POSTID, USERID, NICKNAME, TITLE, CONTENTS, MEETDATE, ADDRSINAME, ADDRGUNAME, URL, URLBAD
		    FROM POST_VIEW PV
		    WHERE FN_POST_IS_ACCEPTED(POSTID)=0
		      AND MEETDATE>=SYSDATE
		    ORDER BY MEETDATE DESC
		)
		WHERE ROWNUM<=5
	]]>
	</select>
	
	<select id="myReviewList" resultType="com.test.mybatis.PostDTO">
		SELECT POSTID, URL, NICKNAME, TITLE, CONTENTS, MEETDATE, ADDRSINAME, ADDRGUNAME, FN_USER_POST_STATUS(#{userId}, POSTID) AS POSTSTATUS
		FROM 
		(
			SELECT  P.POSTID AS POSTID, PT.URL AS URL, E.NICKNAME AS NICKNAME, P.TITLE AS TITLE, P.CONTENTS AS CONTENTS, P.MEETDATE AS MEETDATE, S.ADDRSINAME AS ADDRSINAME, G.ADDRGUNAME AS ADDRGUNAME, RANK() OVER(ORDER BY MEETDATE DESC) AS NUM
			FROM USER_ESSENTIAL E JOIN POST P
					ON E.USERID =P.USERID
					JOIN ADDR_GU G
					ON P.ADDRGUID= G.ADDRGUID
					JOIN ADDR_SI S
					ON G.ADDRSIID = S.ADDRSIID
			        JOIN USER_BADGE_LOG UBL
			        ON E.BADGELOGID = UBL.BADGELOGID
			        JOIN POINT PT
			        ON UBL.BADGEPOINTID = PT.BADGEPOINTID
					WHERE E.USERID = #{userId}
			        ORDER BY MEETDATE DESC
		)
		<!-- <![CDATA[ WHERE NUM>=1 AND NUM <=6 ]]> -->
	</select>
	
	<select id="reviewList" resultType="com.test.mybatis.PostDTO">
		SELECT POSTID,USERID, URL, NICKNAME, TITLE, CONTENTS, MEETDATE, ADDRSINAME,ADDRGUNAME,FN_USER_POST_STATUS(#{userId}, POSTID) AS POSTSTATUS
		FROM
		(
			SELECT J.USERID AS USERID, E.NICKNAME AS NICKNAME, PT.URL AS URL, P.TITLE AS TITLE, P.CONTENTS AS CONTENTS, P.MEETDATE AS MEETDATE, SI.ADDRSINAME AS ADDRSINAME, G.ADDRGUNAME AS ADDRGUNAME,P.POSTID AS POSTID, RANK() OVER(ORDER BY MEETDATE DESC) AS NUM
			FROM POST P 
			JOIN JOIN J
			ON P.POSTID = J.POSTID
			JOIN STATUS S
			ON J.STATUSID = S.STATUSID
			JOIN USER_ESSENTIAL E
			ON P.USERID = E.USERID
			JOIN ADDR_GU G
			ON P.ADDRGUID = G.ADDRGUID
			JOIN ADDR_SI SI
			ON G.ADDRSIID = SI.ADDRSIID
	        JOIN USER_BADGE_LOG UBL
	        ON E.BADGELOGID = UBL.BADGELOGID
	        JOIN POINT PT
	        ON UBL.BADGEPOINTID = PT.BADGEPOINTID
			WHERE J.USERID = #{userId} AND E.USERID NOT IN(#{userId})
			ORDER BY P.MEETDATE DESC
		)
		<!-- <![CDATA[ WHERE NUM>=1 AND NUM <=6 ]]> -->
	</select>
	
	<select id="hostReview" resultType="com.test.mybatis.PostDTO">
		SELECT J.USERID AS USERID,E.NICKNAME AS NICKNAME,PT.URL AS URL, RANK() OVER(ORDER BY J.USERID) AS NUM
		FROM JOIN J
		JOIN USER_ESSENTIAL E
		ON J.USERID = E.USERID
		JOIN USER_BADGE_LOG UBL
		ON E.BADGELOGID = UBL.BADGELOGID
		JOIN POINT PT
		ON UBL.BADGEPOINTID = PT.BADGEPOINTID
		WHERE J.POSTID=#{postId}
		ORDER BY NUM
	</select>
	
	<select id="guestReview" resultType="com.test.mybatis.PostDTO">
		SELECT P.USERID, UE.NICKNAME, PT.URL, 0 AS NUM
		FROM POST P JOIN USER_ESSENTIAL UE ON P.USERID=UE.USERID
		            JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
		            JOIN POINT PT ON BL.BADGEPOINTID=PT.BADGEPOINTID
		WHERE P.POSTID=#{postId}
		UNION
		SELECT J.USERID, UE.NICKNAME, PT.URL, ROW_NUMBER() OVER(ORDER BY J.USERID DESC) AS NUM
		FROM POST P JOIN JOIN J ON J.POSTID=P.POSTID
		            JOIN USER_ESSENTIAL UE ON J.USERID=UE.USERID
		            JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID
		            JOIN POINT PT ON BL.BADGEPOINTID=PT.BADGEPOINTID
		WHERE P.POSTID=#{postId}
		  AND J.USERID NOT IN (#{userId})
	</select>
	
	
	
	<!-- 조현우 제작 -->
	<select id="searchPostIdList" resultType="com.test.mybatis.PostDTO">
		SELECT POSTID
		FROM POST
		WHERE USERID = #{userId}
	</select>
	
	<select id="postlistCheck" resultType="java.lang.Integer">
		SELECT FN_USER_POST_STATUS(#{userId}, #{postId}) AS POSTSTATUS
		FROM DUAL
	</select>
	
	<select id="getHost" resultType="java.lang.String">
		SELECT USERID
		FROM POST
		WHERE POSTID=#{postId}	
	</select>
</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.test.mybatis.IReportDAO">  <!-- 인터페이스 지정  -->
	<select id="reportlist" resultType="com.test.mybatis.ReportDTO">
		SELECT REPORTCATEID REPORTID, REPORTCATENAME
		FROM REPORT_CATE
	</select>
	<insert id="reportpostinsert">
		INSERT INTO REPORT_POST(ID, POSTID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE) VALUES(REPORT_POST_SEQ.NEXTVAL, #{postHostId}, #{reportDTO.userId}, #{reportDTO.reportCateName}, #{reportDTO.reportDetail}, SYSDATE)
	</insert>
	<insert id="reportjoininsert">
		INSERT INTO REPORT_JOIN(ID, JOINID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE) VALUES(REPORT_JOIN_SEQ.NEXTVAL, #{reportId}, #{userId}, #{reportCateName}, #{reportDetail},  SYSDATE)
	</insert>
	<insert id="reportreplyinsert">
		INSERT INTO REPORT_REPLY(ID, REPLYID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE) VALUES(REPORT_REPLY_SEQ.NEXTVAL, #{reportId}, #{userId}, #{reportCateName}, #{reportDetail}, SYSDATE)
	</insert>
	<insert id="joindelcheckinsert">
		INSERT INTO DEL_JOIN(ID, JOINID, DELETEDATE) VALUES(DEL_JOIN_SEQ.NEXTVAL, #{reportId}, SYSDATE)
	</insert>
	<insert id="postdelte">
		INSERT INTO DEL_POST(ID, POSTID, DELETEDATE) VALUES(DEL_POST_SEQ.NEXTVAL, #{reportId}, SYSDATE)
	</insert>
	<select id="serchreportjoin" resultType="int">
		SELECT COUNT(ID)
		FROM REPORT_JOIN
		WHERE JOINID = #{joinId}
	</select>
	<select id="serchreportreply" resultType="int">
		SELECT COUNT(ID)
		FROM REPORT_REPLY
		WHERE REPLYID = #{reply}
	</select>
</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.test.mybatis.IReviewDAO">
	<select id="pleaseReview" resultType="java.lang.String">
		SELECT COUNT(*)
		FROM REVIEW
		WHERE POSTID=#{postId, jdbcType=VARCHAR}
		  AND GIVEUSERID=#{userId, jdbcType=VARCHAR}
	</select>

	<insert id="reviewInsertMain">
		INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
		VALUES(ADD_ID('REVIEW','REVIEWID', 'RV'), #{postId}, #{giveUserId}, #{takeUserId}, #{grade}, SYSDATE)
	</insert>

	<insert id="reviewInsertSub" statementType="CALLABLE">
		{call INSERT_REVIEW_SUB(#{reviewId, jdbcType=VARCHAR}, #{badgePointId, jdbcType=VARCHAR}, #{contents, jdbcType=VARCHAR})}
	</insert>
	
	<select id="getNextReviewId" resultType="java.lang.String">
		SELECT ADD_ID('REVIEW','REVIEWID', 'RV')
		FROM DUAL
	</select>
	
	<select id="inquryView" resultType="com.test.mybatis.ReviewDTO">
		SELECT T1.TAKEUSERID as USERID, T2.GIVEUSERID, UE.NICKNAME as GIVEUSERNAME, PT.URL as GIVEUSERURL
		    , NVL(FN_GET_REVIEW_GRADE(T2.GIVEUSERID, T1.TAKEUSERID, #{postId}),3) AS GRADE
		    , NVL(FN_GET_REVIEW_SUB_URL(T2.GIVEUSERID, T1.TAKEUSERID, #{postId}),'img/Logo.png') AS TAKEURL
		    , NVL(FN_GET_REVIEW_SUB_CONTENTS(T2.GIVEUSERID, T1.TAKEUSERID, #{postId}), '해당참여자가 아직 후기를 남기지 않았습니다.') AS CONTENTS
		FROM
		(
		    SELECT USERID AS TAKEUSERID
		    FROM POST
		    WHERE POSTID=#{postId}
		    UNION
		    SELECT USERID
		    FROM JOIN
		    WHERE POSTID=#{postId}
		) T1 CROSS JOIN (
		    SELECT USERID AS GIVEUSERID
		    FROM POST
		    WHERE POSTID=#{postId}
		    UNION
		    SELECT USERID
		    FROM JOIN
		    WHERE POSTID=#{postId}
		) T2 JOIN USER_ESSENTIAL UE ON T2.GIVEUSERID=UE.USERID 
		     JOIN USER_BADGE_LOG UBL ON UE.BADGELOGID=UBL.BADGELOGID
		     JOIN POINT PT ON UBL.BADGEPOINTID=PT.BADGEPOINTID
		WHERE T1.TAKEUSERID!=T2.GIVEUSERID
		  AND T1.TAKEUSERID=#{userId}
	</select>
</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
<mapper namespace="com.test.mybatis.IUserDAO"> 

  	<insert id = "userTelInsert">
		INSERT INTO USER_CERTIFICATION(ID, USERID, CODE, CERTIDATE, CERTIID)
		VALUES(USER_CERTIFICATION_SEQ.NEXTVAL, #{userId },  #{telCheck}, SYSDATE, 'CT00001')
 	</insert>
 	
 	<insert id = "userEmailInsert"> 	
 		INSERT INTO USER_CERTIFICATION(ID, USERID, CODE, CERTIDATE, CERTIID)
		VALUES(USER_CERTIFICATION_SEQ.NEXTVAL, #{userId },  #{emailCheck}, SYSDATE, 'CT00002')
 	</insert>
 	
 	<insert id = "userNewBadgeInsert">
 		INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID) 
		VALUES(ADD_ID('USER_BADGE_LOG', 'BADGELOGID', 'BL'), #{userId}, 'BP00011')
 	</insert>
 	
 	<select id = "userNewBadgeSelect" resultType = "java.lang.String">
 		SELECT BADGELOGID
		FROM USER_BADGE_LOG
		WHERE USERID = #{userId}
 	</select>
 	
 	<insert id = "userEssentialInsert">
 		INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE, BADGELOGID)
		VALUES(#{user.userId }, #{user.nickname }, #{user.name } , TO_DATE(#{user.birth },'YYMMDD'), #{user.genderId }, #{user.tel }, #{user.email }, SYSDATE, #{badgelogid})
 	</insert>
 	
	<select id="checkId" resultType="java.lang.Integer">
		SELECT COUNT(USERID) AS COUNT
		FROM LOGIN
		WHERE UPPER(USERID) = UPPER(#{userId })
 	</select>
 	
 	<select id="checkNick" resultType="java.lang.Integer">
 		SELECT COUNT(NICKNAME) AS COUNT
		FROM USER_ESSENTIAL
		WHERE UPPER(NICKNAME) = UPPER(#{nickname })
 	</select>
 	
 	<insert id = "userLoginInsert">
 		INSERT INTO LOGIN(USERID, PWD, ROLEID)
		VALUES(#{userId }, CRYPTPACK.ENCRYPT(#{pwd }, 'JAVA006$'), 'RL00002')
 	</insert>
 	
 	 	<insert id = "userSubInsert">
 		INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
		VALUES(USER_SUB_SEQ.NEXTVAL, #{userId }, #{sns }, #{introduce })
 	</insert>
 	
 	<!-- 회원가입 -->
 	
 	<select id="findIdTelCheck" resultType="java.lang.Integer">
	 	SELECT COUNT(*) AS COUNT
		FROM USER_ESSENTIAL
		WHERE NAME = #{name} AND TEL = #{tel}
 	</select>
 	
 	<select id="findIdEmailCheck" resultType="java.lang.Integer">
 		SELECT COUNT(*) AS COUNT
		FROM USER_ESSENTIAL
		WHERE NAME = #{name} AND EMAIL = #{email}
 	</select>
 	
 	<select id="findPwTelCheck" resultType="java.lang.Integer">
 		SELECT COUNT(*) AS COUNT
		FROM USER_ESSENTIAL
		WHERE UPPER(USERID) = UPPER(#{userId}) AND NAME = #{name} AND TEL = #{tel}
 	</select>
 	
 	<select id="findPwEmailCheck" resultType="java.lang.Integer">
 		SELECT COUNT(*) AS COUNT
		FROM USER_ESSENTIAL
		WHERE UPPER(USERID) = UPPER(#{userId}) AND NAME = #{name} AND EMAIL = #{email}
 	</select>
 	
 	<select id = "findIdTel" resultType="java.lang.String">
 		SELECT USERID
 		FROM USER_ESSENTIAL
 		WHERE NAME = #{name} AND TEL = #{tel}
 	</select>
 	
 	<select id = "findIdEmail" resultType="java.lang.String">
 		SELECT USERID
 		FROM USER_ESSENTIAL
 		WHERE NAME = #{name} AND EMAIL = #{email}
 	</select>		
 	
 	<update id = "findPwTemp">
		UPDATE LOGIN
		SET PWD = CRYPTPACK.ENCRYPT(#{pwd}, 'JAVA006$')
		WHERE UPPER(USERID) = UPPER(#{userId})
		
 	</update>
 	
 	<select id="findPwdString" resultType="java.lang.String">
 		SELECT CRYPTPACK.DECRYPT(#{pwdtemp}, 'JAVA006$')
		FROM LOGIN
		WHERE UPPER(USERID) = UPPER(#{userId})
 	</select>
 	
 	<insert id="findIdTelInsert">
	 	INSERT INTO USER_CERTIFICATION(ID, USERID, CODE, CERTIDATE, CERTIID)
		VALUES(USER_CERTIFICATION_SEQ.NEXTVAL, #{userId },  #{telCheck}, SYSDATE, 'CT00003')
	 </insert>
	 
	 <insert id="findIdEmailInsert">
	 	INSERT INTO USER_CERTIFICATION(ID, USERID, CODE, CERTIDATE, CERTIID)
		VALUES(USER_CERTIFICATION_SEQ.NEXTVAL, #{userId },  #{emailCheck}, SYSDATE, 'CT00004')
	 </insert>
	 
	 <insert id="findPwTelInsert">
	 	INSERT INTO USER_CERTIFICATION(ID, USERID, CODE, CERTIDATE, CERTIID)
		VALUES(USER_CERTIFICATION_SEQ.NEXTVAL, #{userId },  #{telCheck}, SYSDATE, 'CT00005')
	 </insert>
	 
	 <insert id="findPwEmailInsert">
	 	INSERT INTO USER_CERTIFICATION(ID, USERID, CODE, CERTIDATE, CERTIID)
		VALUES(USER_CERTIFICATION_SEQ.NEXTVAL, #{userId },  #{emailCheck}, SYSDATE, 'CT00006')
	 </insert>
	 
 	<!-- 아이디/비밀번호 확인 -->
 	
 	<select id ="checkIdPw" resultType="java.lang.Integer">
	 	SELECT COUNT(*) AS COUNT
		FROM LOGIN
		WHERE USERID = #{userId} AND CRYPTPACK.DECRYPT(PWD, 'JAVA006$') = UPPER(#{pwd})
	 </select>






<!-- 내 프로필 -->

	<select id="MyPageBad" resultType="com.test.mybatis.UserDTO"> 
		SELECT USERID, FN_PROFILE_BAD_BADGE(USERID) AS URLBAD
		FROM USER_ESSENTIAL
		WHERE USERID=#{userId}
	</select> 

	<select id="myPageAddrList" resultType="com.test.mybatis.AddrDTO"> 
		SELECT *
		FROM
		(
		    SELECT USERID ,ID ,ADDRSINAME AS ADDRSINAME1 , ADDRGUNAME AS ADDRGUNAME1
		                ,LEAD(ADDRSINAME,1) OVER (ORDER BY ID) AS ADDRSINAME2,LEAD(ADDRGUNAME,1) OVER (ORDER BY ID) AS ADDRGUNAME2
		                , LEAD(ADDRSINAME,2) OVER (ORDER BY ID) AS ADDRSINAME3,LEAD(ADDRGUNAME,2) OVER (ORDER BY ID) AS ADDRGUNAME3
                        ,ADDRSIID AS ADDRSIID1 , ADDRGUID AS ADDRGUID1
		                ,LEAD(ADDRSIID,1) OVER (ORDER BY ID) AS ADDRSIID2,LEAD(ADDRGUID,1) OVER (ORDER BY ID) AS ADDRGUID2
		                , LEAD(ADDRSIID,2) OVER (ORDER BY ID) AS ADDRSIID3,LEAD(ADDRGUID,2) OVER (ORDER BY ID) AS ADDRGUID3
		    FROM USERADDR_VIEW
		    WHERE USERID= #{userId}
		)
		WHERE ID=(SELECT MIN(ID) FROM USERADDR_VIEW WHERE USERID=#{userId})
	</select> 
	
	<select id="myPageInterList" resultType="com.test.mybatis.InterDTO"> 
		SELECT *
		FROM
		(
		    SELECT USERID ,ID ,INTERSUBNAME AS INTERSUBNAME1 , INTERMAINNAME AS INTERMAINNAME1
		                ,LEAD(INTERSUBNAME,1) OVER (ORDER BY ID) AS INTERSUBNAME2,LEAD(INTERMAINNAME,1) OVER (ORDER BY ID) AS INTERMAINNAME2
		                , LEAD(INTERSUBNAME,2) OVER (ORDER BY ID) AS INTERSUBNAME3,LEAD(INTERMAINNAME,2) OVER (ORDER BY ID) AS INTERMAINNAME3
                        ,INTERMAINID AS INTERMAINID1 , INTERSUBID AS INTERSUBID1
		                ,LEAD(INTERMAINID,1) OVER (ORDER BY ID) AS INTERMAINID2,LEAD(INTERSUBID,1) OVER (ORDER BY ID) AS INTERSUBID2
		                , LEAD(INTERMAINID,2) OVER (ORDER BY ID) AS INTERMAINID3,LEAD(INTERSUBID,2) OVER (ORDER BY ID) AS INTERSUBID3
		    FROM USERINTER_VIEW
		    WHERE USERID=#{userId}
		)
		WHERE ID=(SELECT MIN(ID) FROM USERINTER_VIEW WHERE USERID=#{userId})
	</select>  	
	
	<select id="myPageList" resultType="com.test.mybatis.UserDTO"> 
	SELECT DISTINCT UE.USERID, UE.NICKNAME,UE.NAME,UE.BIRTH,G.GENDER AS GENDERID,UE.TEL,US.SNS, US.INTRODUCE
                ,UE.EMAIL,UE.BADGELOGID, BL.BADGEPOINTID ,P.BADGEPOINTNAME,P.URL, UE.REGISTERDATE
                ,NVL2((SELECT COUNT(C.CERTINAME)
                    FROM USER_CERTIFICATION U JOIN CERTIFICATION_CATE C
                    ON U.CERTIID = C.CERTIID 
                    WHERE U.USERID=  UE.USERID AND C.CERTIID = 'CT00001'),'휴대폰 인증 완료 ?','') AS TELCHECK
                 , NVL2((SELECT COUNT(C.CERTINAME)
                 FROM USER_CERTIFICATION U JOIN CERTIFICATION_CATE C
                  ON U.CERTIID = C.CERTIID
                  WHERE U.USERID= UE.USERID AND C.CERTIID = 'CT00002'),'이메일 인증 완료 ?' ,'') AS EMAILCHECK
                  ,ROUND(AVG(R.GRADE)OVER(),1) AS REVIEWGRADE 
	FROM USER_ESSENTIAL UE  JOIN USER_SUB US ON UE.USERID = US.USERID 
                        JOIN USER_BADGE_LOG BL ON UE.BADGELOGID=BL.BADGELOGID	                     
                        JOIN POINT P ON BL.BADGEPOINTID=P.BADGEPOINTID
                        JOIN REVIEW R ON UE.USERID = R.TAKEUSERID
                        JOIN GENDER G ON G.GENDERID = UE.GENDERID                      
	WHERE UPPER(UE.USERID)=UPPER(#{userId})
	</select>
	
	
	<select id="userList" resultType="com.test.mybatis.UserDTO">
		SELECT USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL
		FROM USER_ESSENTIAL
		WHERE UPPER(USERID) = UPPER(#{userId})
	</select>
	
	
	<!-- 프로필 변경 사용 -->
	
	
	<select id="checkGuPwd" resultType="java.lang.Integer">
		SELECT COUNT(*) AS COUNT
		FROM LOGIN
		WHERE UPPER(USERID) = UPPER(#{userId}) AND PWD = CRYPTPACK.ENCRYPT(#{pwd}, 'JAVA006$')
	</select>
	
	<select id="checkGuNick" resultType="java.lang.Integer">
		SELECT COUNT(*) AS COUNT
		FROM USER_ESSENTIAL
		WHERE UPPER(USERID) = UPPER(#{userId}) AND NICKNAME = UPPER(#{gunick})
	</select>
	
	<update id = "updateLogin">
		UPDATE LOGIN
		SET PWD = CRYPTPACK.ENCRYPT(#{user.pwd}, 'JAVA006$')
		WHERE UPPER(USERID) = UPPER(#{userId})
	</update>
	
	<update id="updateEssential">
		UPDATE USER_ESSENTIAL
		SET NAME = #{user.name}, NICKNAME = #{user.nickname}, TEL = #{user.tel}, GENDERID = #{user.genderId}, EMAIL = #{user.email}, BIRTH = TO_DATE('20010928','YYMMDD')
		WHERE UPPER(USERID) = UPPER(#{userId})
	</update>
	
	<update id="updateSub">
		UPDATE USER_SUB
		SET SNS = '${user.sns}', INTRODUCE = #{user.introduce}
		WHERE UPPER(USERID) = UPPER(#{userId})
	</update>
</mapper>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- 출처 : http://www.mybatis.org/mybatis-3/ko/getting-started.html -->

<!-- mapper 엘리먼트의 『namespace="패키지경로가 포함된 인터페이스"』 -->
<!-- 인터페이스 내부에 메소드명 선언이 되어 있어야 한다.  -->
<!-- 메소드명과 『id=식별자』가 되어야 한다.  -->
<mapper namespace="com.test.mybatis.IWithdrawalDAO">

	<!-- ○ id="식별자" 속성 추가 -->
	<!-- - 인터페이스에 선언된 메소드의 이름과 일치해야 하며, -->
	<!-- 호출 메소드명 역할을 수행하게 된다. -->
	<!-- ○ resuyltType="패키지 경로가 포함된 자료형 클래스" -->
	<!-- - string : java.lang.String
		 - byte : java.lang.byte
		 - short : java.lang.short
		 - int : java.lang.int
		 - integer : java.lang.integer
		 - double : java.lang.double
		 - float : java.lang.float
		 - boolean : java.lang.boolean
		 - decimal : java.math.BigDecimal
		 - object : java.lang.Object
		 - map :  java.util.Map
		 - hashmap :  java.util.HashMap
		 - list :  java.util.list
		 - arraylist : java.util.ArrayList
		 - collection  : java.util.Collection
		 - iterator : java.util.Iterator
		-->

 	<select id="nickname" resultType="com.test.mybatis.WithdrawalDTO">	
		SELECT NICKNAME
		FROM USER_ESSENTIAL
		WHERE UPPER(USERID) =UPPER(#{userid })
	</select>
	
	<select id="idpwcheck" resultType="int">
		SELECT COUNT(*) AS IDPWCHECK
		FROM LOGIN
		WHERE PWD = CRYPTPACK.ENCRYPT(#{pwd} ,#{pwd})
        AND UPPER(USERID)=UPPER(#{userid})
	</select>
	
	<!--del_user  -->
	
	<insert id="del_user">
		INSERT INTO DEL_USER(ID,USERID,DELETEDATE)
		VALUES(DEL_USER_SEQ.NEXTVAL,#{userid},SYSDATE)
	</insert>
	

	

</mapper>






















































