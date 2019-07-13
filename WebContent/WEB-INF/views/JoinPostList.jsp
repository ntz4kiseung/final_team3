<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
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
    
<!-- 추가한거 -->
<script type="text/javascript">
$(document).ready(function()
{
	$('#myModal').on('shown.bs.modal', function (){
		$('#myInput').trigger('focus')
	});
		      
	$("[data-toggle=popover]").popover({
        html : true,
        content: function() {
          var content = $(this).attr("data-popover-content");
          return $(content).children(".popover-body").html();
        }
    });
	
	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("on");
	     $(this).addClass("on").prevAll("a").addClass("on");
	     return false;
	});
	
	/* 
	$( ".badgePoint a" ).click(function() {
		$('point img').attr('src', $(this).src($(this)));
		
		var img_src = $(this).attr
	    
	});
	 */
	 /* 문제점 발견! 같은 구절을 다른 파일로 넣었을때 가능한걸로 보아 금요일에 발생한 문제와 똑같은 문제인듯 하다..;; */
	
	 $( ".badgePoint" ).click(function() {
		 
		 alert("클릭");
		 //$("#img").attr("src", "img/통수.png");
	});

});	

function change()
{
	alert('클릭');
	
		
}
		   

</script>
<style type="text/css">
        .review-post{
		    width: 900px;
		    height: 125px;
		    border-top: 2px solid rgb(220,220,220);
		}	
		
		.badge-post{
		    width: 900px;
		    height: 100px;
		    border-top: 2px solid rgb(220,220,220);
		}	
		
		.flex-review{
			display: flex;
			align-content : space-around;
			justify-content: center;
		}	
		
		.flex-badge{
			display : flex;
			justify-content: flex-start;
			
		}
		
		.flex-review-first{
			flex: auto;
			flex-grow: 0;
			flex-basis: 15%;
			margin: auto;
		}
		.flex-review-second{
			flex: auto;
			flex-grow: 0;
			flex-basis: 15%;
			margin: auto;
		}
		.flex-review-third{
			flex: auto;
			flex-grow: 0;
			flex-basis: 15%;
			margin: auto;
		}
		
		.flex-review-fourth{
			flex: auto;
			flex-grow: 0;
			flex-basis: 55%;
		}
		.flex-badge-list{
			flex:1;
			flex-grow: 1;
			flex-basis: 25%;
		}
		.modal-content{
			width: 1000px;
    		height: 700px;
		}
		
		.popover{
   			min-width: 900px !important;
   			
		}
		.star_rating {
			font-size:0; 
			letter-spacing:-4px;
		}
		.star_rating a {
		    font-size:22px;
		    letter-spacing:0;
		    display:inline-block;
		    margin-left:5px;
		    color:#ccc;
		    text-decoration:none;
		}
		.star_rating a:first-child {
			margin-left:0;
		}
		.star_rating a.on {
			color:#ffd700;
			}
			
		.box-75-75{
		    width: 75px;
		    height: 75px;
		}


		
</style>

</head>
<body>
    <div class="browser flex-col-center-center">
		<div class="navbar-box flex-row-center-center">

			<div class="navbar-left flex-row-left-center">
				<div class="logo-box flex-row-left-center">
					<div class="logo-img">
						<img src="img/Logo.png" alt="이미지없음">
					</div>
					<div class="logo-text">Sagyo</div>
				</div>
			</div>

			<div class="navbar-center flex-item-grow flex-row-center-center">
				<form action="" class="flex-row-center-center">
					<input type="text" placeholder="관심사의 키워드를 입력해주세요"
						class="form-control flex-item-grow" id="navbar-search-input">
					<button class="btn" id="navbar-search-btn">검색</button>
				</form>
			</div>

			<div class="navbar-right flex-row-right-center">
				<div>알람</div>
				<div>
					<button class="btn btn-border-right">모임개설</button>
				</div>
				<div>
					<button class="btn btn-border-right">nickname</button>
				</div>
				<div>
					<button class="btn btn-border-right">고객센터</button>
				</div>
			</div>
		</div>
		<div class="body-box flex-item-grow flex-col-center-up">
			<div class="body flex-item-grow flex-col-center-center">
                
                <div class="MyPage flex-item-grow flex-col-center-up">

                    <div class="MyPage-header flex-row-left-center">
                    	
                    	<c:forEach items="${myPageList }" var="profile">
                        <div class="MyPage-header-left flex-col-center-center">
                            <div class="MyPage-header-badge">
                            	
                            	
                                <!-- <img src="img/badge150pixel_0001_뉴비.png" alt=""> -->
								<img alt="" src="${profile.url }" onerror="this.src='img/badge150pixel_0001_뉴비.png'">                               	
                    		</div>
                            <div class="MyPage-header-grade-star" style="color: #ffd700;">
                                <c:forEach var="i" begin="1" end="${profile.reviewGrade }">
                                	<label style="color: #ffd700;">★</label>
                                </c:forEach>
                                <c:forEach var="i" begin="${profile.reviewGrade }" end="4">
                                	<label style="color: #e9e9e9;">★</label>
                                </c:forEach>
                            </div>
                            <div class="MyPage-header-grade">
                              ${profile.reviewGrade } / 5.0
                            </div>
						</div>
                        <div class="MyPage-header-right flex-item-grow">
                            <div class="MyPage-header-nickname">
                                ${profile.nickname }
                            </div>
                            <div class="MyPage-header-detail">
                            
                                <!-- <div>#서울특별시 송파구  #서울특별시 관악구</div> -->
                                <c:forEach items="${myPageAddrList }" var="addr">
                                	<div>
                                		${addr.addrSiName1} ${addr.addrGuName1 } ${addr.addrSiName2} ${addr.addrGuName2 } ${addr.addrSiName3} ${addr.addrGuName3 }
                                	</div>
                                </c:forEach>
                                <!-- <div>#영상편집 #필라테스</div> -->
                                <c:forEach items="${myPageInterList }" var="inter">
                                	<div>
                                		${inter.interMainName1 } ${inter.interSubName1 } ${inter.interMainName2 } ${inter.interSubName2 } ${inter.interMainName3 } ${inter.interSubName3 }
                                	</div>
                                </c:forEach>
                                <!-- <div>휴대전화 인증 완료</div> -->
                                <!-- <div>Email 인증 완료</div> -->
                                
                                	<div style="color: orange;">
                                		${profile.telCheck }
                                	</div>
                                	<div style="color: orange;">
                                		${profile.emailCheck }
                                	</div>
                                </c:forEach>
                            </div>
                        </div>
					</div>
                    
                    <div class="flex-item-grow flex-row-left-up">
                        <div class="MyPage-nav flex-col-center-up">
                            <div><a href="#">프로필</a></div>
                            <div><a href="#">쪽지함</a></div>
                            <div><a href="#">뱃지</a></div>
                            <div><a href="#">팔로우</a></div>
                            <div><a href="#">내모임</a></div>
                        </div>
                        
                        
                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                <span><a href="createpostlist.action">개설모임</a></span>&nbsp;&nbsp;&nbsp;<span><a href="joinpostlist.action">참여모임</a></span>
                            </div>

                            <div class="MyPage-body-body">
                                <div class="PostList flex-col-left-center">
                                    
                                    <c:forEach var="list" items="${reviewList }">
                                    <div class="PostList-post flex-row-left-center">
                                        <div class="PostList-post-left flex-col-center-center">
                                            <div class="PostList-post-badge">
                                                <!-- <img src="img/badge150pixel_0025_맛잘알.png" alt=""> -->
                                            	<img src="${list.url }" onerror="this.src='img/badge150pixel_0001_뉴비.png'">
                                            	

                                            	
                                            </div>
                                            <div>
                                                <!-- nickname -->
                                                ${list.nickname }
                                            </div>
                                        </div>
                                        <div class="PostList-post-center flex-col-left-center">
                                            <div class="PostList-post-title">
                                                <!-- 이곳은 제목이 옵니다... -->
                                                ${list.title }
                                            </div>
                                            <div class="PostList-post-contents">
                                                <!-- 이곳은 본문이 오는데 중간에 잘려서 점선 처리가 될 겁니다!!!!이곳은 본문이 오는데 중간에 잘려서 점선 처리가 될 겁니다!!!!이곳은 본문이 오는데 중간에 잘려서 점선 처리가 될 겁니다!!!!이곳은 본문이 오는데 중간에 잘려서 점선 처리가 될 겁니다!!!!이곳은 본문이 오는데 중간에 잘려서 점선 처리가 될 겁니다!!!!이곳은 본문이 오는데 중간에 잘려서 점선 처리가 될 겁니다!!!!이곳은 본문이 오는데 중간에 잘려서 점선 처리가 될 겁니다!!!! -->
                                                ${list.contents }
                                            </div>
                                        </div>
                                        <div class="PostList-post-right flex-col-center-center">
                                        
                                            <div>
                                                <button class="btn btn-outline-orange btn-120-35 mybtn" data-toggle="modal" data-target="#reviewModal">후기남기기</button>
                                            </div>
                                            
                                            <div class="PostList-post-detail flex-col-left-center">
                                                <!-- <div>서울특별시 용산구</div> -->
                                                <div>${list.addrSiName } ${list.addrGuName }</div>
                                                <!-- <div>2019/06/04 19:06</div> -->
                                                <div>${list.meetDate }</div>
                                            </div>
                                        </div>
                                    </div>
									</c:forEach>

                                    
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        
        <!-- Modal -->
		<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">후기 남기기</h2>
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
							<div class="review-post flex-review">
								
								<div class="flex-review-first" style="text-align: center;">
									<div class="PostList-post-badge">
                                    	<img src="img/badge150pixel_0025_맛잘알.png" alt="">
                               	 	</div>
									nickname
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
	                           		5점
                           		</div>
							
                           		<div class="flex-review-third" style="text-align: center;" >
                           			<div class="PostList-post-badge">
                           					<a href="#" tabindex="0" data-toggle="popover"  data-popover-content="#badgeList" data-placement="bottom">
                                              <img class="point" src="img/img4.PNG" alt="포인트선택" id="img">
                                            </a>
                               	 	</div>
                               	 	포인트 선택
                           		</div>
									
                           		<div class="flex-review-fourth">
                           			<textarea class="form-control"></textarea>
                           		</div>
							</div>
							<div class="review-post flex-review">
								
								<div class="flex-review-first" style="text-align: center;">
									<div class="PostList-post-badge">
                                    	<img src="img/badge150pixel_0025_맛잘알.png" alt="">
                               	 	</div>
									nickname
								</div>
								<div class="flex-review-second" style="text-align: center;">
									<div style="color: #e9e9e9;">
	                               		<p class="star_rating">
										    <a href="#" class="on">★</a>
										    <a href="#" class="on">★</a>
										    <a href="#" class="on">★</a>
										    <a href="#">★</a>
										    <a href="#">★</a>
										</p>
	                           		</div>
	                           		5점
                           		</div>
                           		<div class="flex-review-third" style="text-align: center;">
                           			<div class="PostList-post-badge">
                                                <img src="img/badge150pixel_0009_매너왕.png" alt="뱃지">
                               	 	</div>
                               	 	포인트 선택
                           		</div>
                           		<div class="flex-review-fourth">
                           			<textarea  class="form-control"></textarea>
                           		</div>
							</div>
							<div class="review-post flex-review">
								
								<div class="flex-review-first" style="text-align: center;">
									<div class="PostList-post-badge">
                                    	<img src="img/badge150pixel_0025_맛잘알.png" alt="">
                               	 	</div>
									nickname
								</div>
								<div class="flex-review-second" style="text-align: center;">
									<div style="color: #e9e9e9;">
	                               		<p class="star_rating">
										    <a href="#" class="on">★</a>
										    <a href="#" class="on">★</a>
										    <a href="#" class="on">★</a>
										    <a href="#">★</a>
										    <a href="#">★</a>
										</p>
	                           		</div>
	                           		5점
                           		</div>
                           		<div class="flex-review-third" style="text-align: center;">
                           			<div class="PostList-post-badge">
                                                <img src="img/badge150pixel_0009_매너왕.png" alt="뱃지">
                               	 	</div>
                               	 	포인트 선택
                           		</div>
                           		<div class="flex-review-fourth">
                           			<textarea  class="form-control"></textarea>
                           		</div>
							</div>
							<div class="review-post flex-review">
								
								<div class="flex-review-first" style="text-align: center;">
									<div class="PostList-post-badge">
                                    	<img src="img/badge150pixel_0025_맛잘알.png" alt="">
                               	 	</div>
									nickname
								</div>
								<div class="flex-review-second" style="text-align: center;">
									<div style="color: #e9e9e9;">
	                               		<p class="star_rating">
										    <a href="#" class="on">★</a>
										    <a href="#" class="on">★</a>
										    <a href="#" class="on">★</a>
										    <a href="#">★</a>
										    <a href="#">★</a>
										</p>
	                           		</div>
	                           		5점
                           		</div>
                           		<div class="flex-review-third" style="text-align: center;">
                           			<div class="PostList-post-badge">
                                                <img src="img/badge150pixel_0009_매너왕.png" alt="뱃지">
                               	 	</div>
                               	 	포인트 선택
                           		</div>
                           		<div class="flex-review-fourth">
                           			<textarea  class="form-control"></textarea>
                           		</div>
							</div>
							
						</div>
		      </div>
		      <div class="modal-footer flex-review">
		        <button type="button" class="btn btn-orange flex-col-center-center btn-160-45">작성 완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		

		<div id="badgeList" class="hidden">
		  	 	<div class="popover-body" class="badge-post flex-col-left-up">
		  	 	
		      		<div>
		      			<div>
		      				<h2>칭찬포인트</h2>
		      			</div>
		      			<div class="flex-badge">
			      			<div>
				      			<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img class="badgePoint" src="img/badge150pixel_0011_핵인싸.png" alt="뱃지">
				      				</a>
				      				<button type="button" class="badgePoint">확인버튼</button>
				      				핵인싸
				      				
				      			</div>
				      		</div>	
				      		
				      		<div>
				      			<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0009_매너왕.png" alt="뱃지">
				      				</a>
				      				매너왕
			      					
			      				</div>
		      				</div>
		      				
		      				<div>
			      				<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0013_지식왕.png" alt="뱃지">
				      				</a>
				      				지식왕
			      					
			      				</div>
		      				</div>
		      				
		      				<div class="flex-badge-list flex-item-grow">
		      					
		      				</div>
		      			</div>	
		      			
		      		</div>
		      		<hr>
		      		
		      		<div>
		      			<div>
		      				<h2>꾸중포인트</h2>
		      			</div>
		      			<div class="flex-badge">
			      			<div>
				      			<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0015_불참러.png" alt="뱃지">
				      				</a>
				      				불참러
				      				
				      			</div>
				      		</div>	
				      		
				      		<div>
				      			<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0017_비매너.png" alt="뱃지">
				      				</a>
				      				비매너
			      					
			      				</div>
		      				</div>
		      				
		      				<div>
			      				<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0019_지각러.png" alt="뱃지">
				      				</a>
				      				지각러
			      					
			      				</div>
		      				</div>
		      				
		      				<div>
			      				<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0021_여기왜왔니.png" alt="뱃지">
				      				</a>
				      				여기왜왔니
			      					
			      				</div>
		      				</div>
		      			</div>	
		      			
		      		</div>
		      		
		      		
		      		<hr>
		      		
		      		<div>
		      			<div>
		      				<h2>칭찬포인트</h2>
		      			</div>
		      			<div class="flex-badge">
			      			<div>
				      			<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0023_슈퍼방장.png" alt="뱃지">
				      				</a>
				      				슈퍼방장
				      				
				      			</div>
				      		</div>	
				      		
				      		<div>
				      			<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0025_맛잘알.png" alt="뱃지">
				      				</a>
				      				맛잘알
			      					
			      				</div>
		      				</div>
		      				
		      				<div>
			      				<div class="flex-badge-list flex-item-grow">
				      				<a href="#">
				      				<img src="img/badge150pixel_0027_뒤통수.png" alt="뱃지">
				      				</a>
				      				뒷통수
			      					
			      				</div>
		      				</div>
		      				
		      				<div class="flex-badge-list flex-item-grow">
		      					
		      				</div>
		      			</div>	
		      			
		      		</div>
		      		
		      		
		      		
		     	</div>
		</div>
        
        
    </div>
</body>
</html>