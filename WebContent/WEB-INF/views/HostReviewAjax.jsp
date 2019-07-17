<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="post" items="${list }" varStatus="status">

	<div class="review-post flex-review" id="list'+i+'">
		<div id="repBadge" class="flex-review-first">
			<div class="PostList-post-badge">
				<img src="${post.url }" alt="">
			</div>
			${post.nickname }
			<input class="hidden" value="${post.userId }" name="userId"/>
		</div>
		<div class="flex-review-second">
			<div>
				<div class="star-rating star-25-box flex-row-left-center" id="grade${status.index }">
					<img class="" id="1" src="img/star.png" alt=""/>
					<img class="" id="2"  src="img/star.png" alt="" />
					<img class="" id="3"  src="img/star.png" alt="" />
					<img class="grayscale" id="4"  src="img/star.png" alt="" />
					<img class="grayscale" id="5"  src="img/star.png" alt="" />
					<input class="hidden" type="text" id="grade" name="grade" value="3" />
				</div>
			</div>
		</div>
		<div class="flex-review-third" >
			<div class="PostList-post-badge">
				<img class="selectPoint" name="select" id="selectPoint${status.index }" name="image" src="img/Logo_NoBorder.png" alt="포인트선택" data-trigger="focus" tabindex="0" data-toggle="popover"  data-popover-content="#badgeList" data-placement="bottom" data-container="body">
				<input type="hidden" value="nonSelect" class="hidden" id="badgePointId${status.index }" name="badgePointId" />
			</div>
	   	</div>
	    <div class="flex-review-fourth">
	    	<textarea class="form-control" id="contents'+i+'" name="contents"></textarea>
	    </div>
	</div>
	
</c:forEach>
                                                                                                                                                                                                                                                                                   