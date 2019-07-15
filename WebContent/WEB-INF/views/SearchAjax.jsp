<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${fn:length(list) == 0 } ">
	조회결과 없음
</c:if>
<c:forEach var="post" items="${list }">
	<div class="PostList-post flex-row-left-center">
        <div class="PostList-post-left flex-col-center-center">
            <div class="PostList-post-badge user-badge-box">
                <img class="user-bad-badge" src="${post.urlBad }" alt="">
	            <img src="${post.url }" alt="">
	        </div>
	        <div>
	            ${post.nickname }
	        </div>
	    </div>
	    <div class="PostList-post-center flex-col-left-center">
	        <div class="PostList-post-title">
	            ${post.title}, ${post.postId },총점: ${post.gradeTotal }, 개설자: ${post.gradeHost }, 주소: ${post.gradeAddr }, 제목: ${post.gradeTitle }, 본문: ${post.gradeContents }, 관심사: ${post.gradeInterDetail }
	        </div>
	        <div class="PostList-post-contents">
	            ${post.contents}
	        </div>
	    </div>
	    <div class="PostList-post-right flex-col-center-center">
	        <div>
	            <!-- 한얼이꺼랑 같이 쓰기 위해 버튼 빈칸을 남겨둠 -->
	        </div>
	        <div class="PostList-post-detail flex-col-left-center">
	            <div>${post.addrSiName} ${post.addrGuName}</div>
	            <div>${post.meetDate}</div>
	        </div>
	    </div>
	</div>
</c:forEach>
