<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>개설모임</title>
    <!-- 부트스트랩 -->
	 <!-- 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	 -->    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> 
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">
    
</head>
<body>
	<div class="modal-header">
		        <h3 class="modal-title" id="exampleModalLabel">후기 남기기</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div>
					<div class="flex-review" style="text-align: center; font-weight: bold; font-size: 15px;">
						<div class="flex-review-first" >유저</div>
						<div class="flex-review-second">평점</div>
						<div class="flex-review-third">뱃지 포인트</div>
						<div class="flex-review-fourth">코멘트</div>
					</div>
				</div>
						<div style="overflow:auto; height: 50vh;">
							<c:forEach items="${hostReview }" var="review">
							<div class="review-post flex-review">
								
								<div class="flex-review-first" style="text-align: center;">
									<div class="PostList-post-badge">
                                    	<img src="${review.url }" alt="">
                               	 	</div>
									${review.nickname }
								</div>
								<div class="flex-review-second" style="text-align: center;">
									<div>
	                               		<p class="star_rating">
										    <a href="#" class="on">★</a>
										    <a href="#" class="on">★</a>
										    <a href="#" class="on">★</a>
										    <a href="#">★</a>
										    <a href="#">★</a>
										</p>
	                           		</div>
                           		</div>
							
                           		<div class="flex-review-third" style="text-align: center;" >
                           			<div class="PostList-post-badge">
                           					<a href="#" tabindex="0" data-toggle="popover"  data-popover-content="#badgeList" data-placement="bottom">
                                              <img class="point" src="img/Logo_NoBorder.png" alt="포인트선택" onclick="pointSelect()">
                                            </a>
                               	 	</div>
                               	 	포인트 선택
                           		</div>
									
                           		<div class="flex-review-fourth">
                           			<textarea class="form-control"></textarea>
                           		</div>
							</div>
							</c:forEach>
							
							
						</div>
		      </div>
		      <div class="modal-footer flex-review">
		        <button type="button" class="btn btn-orange flex-col-center-center btn-160-45">작성 완료</button>
		      </div>
</body>
</html>