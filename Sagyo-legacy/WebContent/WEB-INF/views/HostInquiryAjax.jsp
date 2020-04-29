<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	console.log('aaa');
	
	if(${pleaseReview}>0){
		$("#A").removeClass("please-review");
		$("#pleaseReview").addClass("hidden");
	}else{
		$("#A").addClass("please-review");
		$("#pleaseReview").removeClass("hidden");
	};
	
});
</script>
<c:forEach var="inq" items="${list }" varStatus = "status">

	<div class="review-post flex-review" id="list${status.index}">
		<div id="repBadge" class="flex-review-first">
			<div class="PostList-post-badge">
				<img src="${inq.giveuserUrl }" alt="">
			</div>
			${inq.giveuserName }
			<input class="hidden" value="" name="userId"/>
		</div>
		
		<div class="flex-review-second" style="text-align: center;">
			<div>
				<div class="star-show star-25-box">
					<div>
						<img class="grayscale" id="1" src="img/star.png" alt=""/>
						<img class="grayscale" id="2"  src="img/star.png" alt="" />
						<img class="grayscale" id="3"  src="img/star.png" alt="" />
						<img class="grayscale" id="4"  src="img/star.png" alt="" />
						<img class="grayscale" id="5"  src="img/star.png" alt="" />                    		
					</div>
					<div>
				  		<img class="" id="1" src="img/star.png" alt=""/>
						<img class="" id="2"  src="img/star.png" alt="" />
						<img class="" id="3"  src="img/star.png" alt="" />
						<img class="" id="4"  src="img/star.png" alt="" />
						<img class="" id="5"  src="img/star.png" alt="" />
					</div>
					<input class="hidden" type="text" id="grade2" name="grade2"  value="${inq.grade}" >
				</div>
			</div>
		</div>
		
		<div class="flex-review-third">
			<div class="PostList-post-badge">
				<img class="select" name="select" id="selectPoint${status.index}" name="image" src="${inq.takeurl}" alt="포인트선택">
			</div>
		</div>
		<div class="flex-review-fourth">
			<textarea class="form-control" disabled="disabled" id="contests${status.index }" name="contents${status.index }">${inq.contents }</textarea>
		</div>
	</div>


</c:forEach>

