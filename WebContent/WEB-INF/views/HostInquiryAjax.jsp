<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<c:forEach var="inq" items="${list }" varStatus = "status">

<div class="review-post flex-review" id="list${status.index}">
	<div id="repBadge" class="flex-review-first" style="text-align: center;">
		<div class="inquList-post-badge">
		<button type="button" class="opProfile" id="opBadge${status.index}" name="opBadge${status.index}" value="${inq.giveuserId}">
			<img src="${inq.giveuserUrl }" alt="">
		</button>
		</div>
		
		<input class="hidden" value="" name="userId"/>
	</div>
	
	<div class="flex-review-second" style="text-align: center;">
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
	
	<div class="flex-review-third" style="text-align: center;" >
		<div class="PostList-post-badge">
			<button type="button" class="pointSelect" value="${status.index }" data-trigger="focus" tabindex="0" data-toggle="popover"  data-popover-content="$badgeList" data-placement="bottom" data-container="body" disabled="disabled">
			<img class="select" name="select" id="selectPoint${status.index}" name="image" src="${inq.takeurl}" alt="포인트선택">';
			<span>
				${inq.giveuserName}
			</span>
			</button>
		</div>
	</div>
	<div class="flex-review-fourth">
		<textarea class="form-control" id="contests${status.index }" name="contents${status.index }">${inq.contents }</textarea>
	</div>
</div>

<%-- <div>
${inq.userId}
${inq.giveuserId}
${inq.giveuserName}
${inq.giveuserUrl}
${inq.grade}
${inq.takeurl}
${inq.contents}

</div> --%>

</c:forEach>

