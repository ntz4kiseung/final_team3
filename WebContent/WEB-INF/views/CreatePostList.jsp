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
    
    <!-- 부트스트랩(bootstrap css, jquery, popper.js, bootstrap js 필요) -->
    <link href="css/bootstrap-4.3.1.min.css" rel="stylesheet">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper-1.14.7.min.js"></script>
   	<script src="js/bootstrap-4.3.1.min.js"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="css/sagyo-font.css" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">
    
<!-- 추가한거 -->
<script type="text/javascript">
$(document).ready(function()
{
   $('#myModal').on('shown.bs.modal', function (){
      $('#myInput').trigger('focus')
   });
   
   /*          
   $("[data-toggle=popover]").popover({
        html : true,
        content: function() {
          var content = $(this).attr("data-popover-content");
          return $(content).children(".popover-body").html();
        }
    });
	 */
	$(".on").on("onclick", "a.this()", function (){
	    alert($(this).text());
	    alert("경고");
	});
	 
	 jQuery.ajaxSettings.traditional = true;
	 // 후기 남기기
	 $(".btn-review").click(function(){
		 //console.log($(this).val());
		 var postId = $(this).val();
		 //debugger;
		 $("#postId").val($(this).val())
		 debugger;
		 $.ajax({
	         url : "<%=cp %>/hostReview.action",
	         type : "get",
	         data : {'postId': postId},
	         success: function(result)
			 {
				$("#reviewList").empty();
                $("#reviewList").append(result);
			 }
	     });
	 });

	$("#review-submit").click(function() {
		var postId = $("#postId").val();		// 방 번호
		
		grade = new Array();
		userId = new Array();
		badgeId = new Array();
		contents = new Array();
		
		var reviewList = document.getElementById("reviewList");
		
		var count = reviewList.childElementCount;
		
		for (var i = 0; i < count; i++)
		{
			grade += $('#grade'+i).children('.hidden').val();	// 등급 (1~5)
			userId += $('#list'+i).find('input.hidden').val();	// 받는 유저 ID
			badgeId += $("#badgePointId"+i).val();				// 뱃지 ID
			contents += $("#contents"+i).val();					// 내용
		}
		
		var form = document.getElementById("sendReview");
		
		form.submit();

	});
	
	 $(document).on("click",".select",function(){
		
		$("[data-toggle=popover]").popover({
	    html : true,
	    sanitize : false,
	    content: function() {
	    var content = $(this).attr("data-popover-content");
	    return $(content).children(".popover-body").html();
	    }
	 })
		
	 });
	  
	  
	 $(document).on("click",".pointSelect",function(){
			
		//console.log('1');	
		
		selectPoint = 'selectPoint'+$(this).val();	// img 태그 id
		
		
		console.log(selectPoint);
		
			
	 }); 
	 
	 
	$(document).on("click",".star-rating>img", function(){
			var num = $(this).attr('id');
	 	   
	 	   	$(this).parent().children('img').each(function(index, item){
					$(item).addClass("grayscale");
	 	   	});
	 	   
	 	   	for (var i = 0; i < num; i++)
		   	{
				$(this).parent().children("#"+(i+1)).removeClass("grayscale");
		   	}
	 	   
	 	   	$(this).parent().children("input").val(num);
	} )
	
	
	$(document).on("click",".badgePoint", function(){
		
		var src = $(this).attr('src');
		badgePointId = $(this).parent().val();
		$('#'+selectPoint).attr('src', src);
		$('#'+selectPoint).next().attr('value', badgePointId);
		
	} )	
});

</script>
<style type="text/css">
        .review-post{
          width: 100%;
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
         flex-wrap: wrap;
      }
      
		.flex-review-first {
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    display: flex;
		    flex-basis: 15%;
		}
      .flex-review-second{
         flex: auto;
         flex-grow: 0;
         flex-basis: 15%;
         margin: auto;
      }
		.flex-review-third {
		    flex-basis: 15%;
		    margin: auto;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
      
		.flex-review-fourth {
		    flex-basis: 55%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		.flex-review-fourth>textarea{
			height: 70%;
		}
      .flex-badge-list{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
         align-items: center;
      }
      
      .modal-content{
         width: 1000px;
          height: 700px;
      }
      
      .popover{
            min-width: 900px !important;
            
      }
      .box-75-75{
          width: 75px;
          height: 75px;
      }
      #sendReview .modal-content{
      	  padding: 0px 30px 0px 30px;
      }
      #sendReview .modal-content>div:FIRST-CHILD{
      	 height: 70px;
      }
      #sendReview .modal-content>div:LAST-CHILD{
      	 height: 80px;
      }
      #sendReview .modal-content>div:NTH-CHILD(2){
      	 height: 550px;
      }
      #exampleModalLabel{
    	  font-size: 24px;
      }
      #reviewModal{
      	  top: 10%;
      }
 	  #reviewModal>div:FIRST-CHILD{
		    display: flex;
		    margin: none;
		    width: 1000px;
		    max-width: none;
		    justify-content: center;
		    align-items: center; 	  
 	  }
      .badge-cate-box{
      	  width: 950px;
      	  min-height: 180px;
      }
      .badge-cate-box>div:FIRST-CHILD {
      	  display: flex;
      	  align-items: center;
		  height: 60px;
		  font-size: 20px;
		  padding-left: 15px;
	  }
	  .badgePoint-box{
	  	width: 75px;
	  	height: 75px;
	  }
	  .flex-badge-item{
	  	display: flex;
	  	justify-content: flex-start;
	  	align-items: center;
	  	width: 300px;
	  	height: 120px;
	  }
	  .flex-badge-item>div:FIRST-CHILD {
		width: 95px;
		height: 100%;
		}
		.flex-badge-item>div:LAST-CHILD{
			width: 205px;
			height: 100%;
			display:flex;
			align-items: center;
			padding-left: 10px;
		}
</style>

</head>
<body>
    <div class="browser flex-col-center-center">
    
    
    
		<c:import url="/WEB-INF/views/Navbar.jsp"></c:import>




		<div class="body-box flex-item-grow flex-col-center-up">
		<div class="body flex-item-grow flex-col-center-center">
                
			<div class="MyPage flex-item-grow flex-col-center-up">

                    <div class="MyPage-header flex-row-left-center">
                    
                       <c:forEach items="${myPageList }" var="profile">
                        <div class="MyPage-header-left flex-col-center-center">
                            <div class="MyPage-header-badge">
                                <img src="${profile.url }" onerror="this.src='img/뉴비.png'">
                            </div>
                            <div class="MyPage-header-grade-star">
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
                                <c:forEach items="${myPageAddrList }" var="addr">
                                   <div>
                                      ${addr.addrSiName1} ${addr.addrGuName1 } ${addr.addrSiName2} ${addr.addrGuName2 } ${addr.addrSiName3} ${addr.addrGuName3 }
                                   </div>
                                </c:forEach>
                                <c:forEach items="${myPageInterList }" var="inter">
                                   <div>
                                      ${inter.interMainName1 } ${inter.interSubName1 } ${inter.interMainName2 } ${inter.interSubName2 } ${inter.interMainName3 } ${inter.interSubName3 }
                                   </div>
                                </c:forEach>
                                
                                   <div style="color: orange;">
                                      ${profile.telCheck }
                                   </div>
                                   <div style="color: orange;">
                                      ${profile.emailCheck }
                                   </div>
                               </div>
                          </div>
                       </c:forEach>
                    </div>

                    
                    <div class="flex-item-grow flex-row-left-up">
                        <div class="MyPage-nav flex-col-center-up">
                            <div><a href="#">프로필</a></div>
                            <div><a href="#">쪽지함</a></div>
                            <div><a href="#">뱃지</a></div>
                            <div><a href="#">팔로우</a></div>
                            <div><a  class="font-bold font-orange" href="createpostlist.action">내모임</a></div>
                        </div>
                        
                        
                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                <span class="font-bold"><a href="createpostlist.action">개설모임</a></span>&nbsp;&nbsp;&nbsp;
                                <span><a href="joinpostlist.action">참여모임</a></span>
                            </div>

                            <div class="MyPage-body-body">
                                <div class="PostList flex-col-left-center">
                                    
                                    <c:forEach var="list" items="${myReviewList }" varStatus="status">
                                    <div class="PostList-post flex-row-left-center">
                                        <div class="PostList-post-left flex-col-center-center">
                                            <div class="PostList-post-badge">
                                               <img src="${list.url }" onerror="this.src='img/뉴비.png'">
                                            </div>
                                            <div>
                                                ${list.nickname }
                                            </div>
                                        </div>
                                        <div class="PostList-post-center flex-col-left-center">
                                            <div class="PostList-post-title">
                                                ${list.title }
                                            </div>
                                            <div class="PostList-post-contents">
                                                ${list.contents }
                                            </div>
                                        </div>
                                        <div class="PostList-post-right flex-col-center-center">
                                            <div>
                                             <!-- 1(모집중), 2(만남확정), 3(만남실패), 4(후기남기기), 5(후기조회) -->
                                           <c:choose>
                                            	<c:when test="${list.postStatus eq '1'}">
                                            	<button data-toggle="modal" data-target="#reviewModal" value="${list.postId }" class="btn btn-outline-secondary btn-120-35 mybtn btn-review" disabled="disabled">모집중</button>
                                                <input type="hidden" id="review-action${list.postId }" name="review-action${list.postId }" class="review" value="1">
												</c:when>
												
												<c:when test="${list.postStatus eq '2'}">
												<button data-toggle="modal" data-target="#reviewModal" value="${list.postId }" class="btn btn-outline-secondary btn-120-35 mybtn btn-review" disabled="disabled">만남확정</button>
                                                <input type="hidden" id="review-action${list.postId }" name="review-action${list.postId }" class="review" value="2">
												</c:when>
												
												<c:when test="${list.postStatus eq '3'}">
												<button data-toggle="modal" data-target="#reviewModal" value="${list.postId }" class="btn btn-outline-secondary btn-120-35 mybtn btn-review" disabled="disabled">만남실패</button>
                                                <input type="hidden" id="review-action${list.postId }" name="review-action${list.postId }" class="review" value="3">
												</c:when>
												
												<c:when test="${list.postStatus eq '4'}">
												<button data-toggle="modal" data-target="#reviewModal" value="${list.postId }" class="btn btn-outline-orange btn-120-35 mybtn btn-review">후기남기기</button>
                                                <input type="hidden" id="review-action${list.postId }" name="review-action${list.postId }" class="review" value="4">
												</c:when>
												
												<c:when test="${list.postStatus eq '5'}">
												<button data-toggle="modal" data-target="#inquiryModal" value="${list.postId }" class="btn btn-outline-orange btn-120-35 mybtn btn-inquiry">후기조회</button>
                                                <input type="hidden" id="review-action${list.postId }" name="review-action${list.postId }" class="review" value="5">
												</c:when>
												
												<c:otherwise>
												오류
												</c:otherwise>
                                            </c:choose>
                                            </div>
                                            <div class="PostList-post-detail flex-col-left-center">
                                                <div>${list.addrSiName } ${list.addrGuName }</div>
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
	</div>
        
        
        
        
        
        
        <!-- Modal -->
        <form action="myreviewinsert.action" method="post" role="form" id="sendReview">
		<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="popupModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">후기 남기기</h2>
		        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button> -->
		      </div>
		      <div class="modal-body">
		        <div>
					<div class="flex-review" style="text-align: center; font-weight: bold; font-size: 15px; margin-bottom: 15px;">
						<div class="flex-review-first" >유저</div>
						<div class="flex-review-second">평점</div>
						<div class="flex-review-third">뱃지 포인트</div>
						<div class="flex-review-fourth">코멘트</div>
					</div>
				</div>
						
						<div id="reviewList" style="overflow:auto; height: 100%;">
							
						</div>
						<input type="hidden" id="postId" name="postId" value="" />
						
		      </div>
		      <div class="modal-footer flex-review">
		        <button type="button" id="review-submit" class="btn btn-orange flex-col-center-center btn-160-45">작성 완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		</form>
		
		<!-- Modal -->
		<div class="modal fade" id="inquiryModal" tabindex="-1" role="dialog" aria-labelledby="popupModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">후기 조회</h2>
		      </div>
		      <div class="modal-body">
		        <div>
					<div class="flex-review" style="text-align: center; font-weight: bold; font-size: 15px; margin-bottom: 15px;">
						<div class="flex-review-first" >유저</div>
						<div class="flex-review-second">평점</div>
						<div class="flex-review-third">뱃지 포인트</div>
						<div class="flex-review-fourth">코멘트</div>
					</div>
				</div>
						
						<div id="A" style="overflow:auto; height: 100%;">
							
						</div>
						
		      </div>
		      <div class="modal-footer flex-review">
		        <button type="button" data-dismiss="modal" class="btn btn-orange flex-col-center-center btn-160-45">후기 닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		
		
		<div id="badgeList" class="hidden">
		  	 	<div class="popover-body" class="badge-post flex-col-left-up">
		      		<div class="badge-cate-box">
		      			<div class="badge-cate-name">
		      				칭찬포인트
		      			</div>
		      			
		      			<div class="flex-badge">
		      			<c:forEach var="positive" items="${positiveBadge }" varStatus="status">
			      			<div class="flex-badge-item">
				      			<div class="flex-badge-list flex-item-grow">
				      				<div class="badgePoint-box">
					      				<img class="badgePoint" id="${status.count}" alt="${positive.badgePointId }" src="${positive.url }">				      				
										<input class="hidden" type="button" id="${positive.url }" value="${positive.badgePointId }" />
				      				</div>
				      				<div>
					      				${positive.badgePointName }				      				
				      				</div>
				      			</div>
				      			<div>
					      			${positive.badgePointDesc2 }
				      			</div>
				      		</div>
				      		
				      	</c:forEach>
		      			</div>
		      		</div>
		      		
		      		<hr>
		      		
		      		<div class="badge-cate-box">
		      			<div class="badge-cate-name">
		      				꾸중포인트
		      			</div>
		      			<div class="flex-badge">
		      			<c:forEach var="negative" items="${negativeBadge }">
			      			<div class="flex-badge-item">
				      			<div class="flex-badge-list flex-item-grow">
				      				<div class="badgePoint-box">
					      				<img class="badgePoint" id="${status.count}" alt="${negative.badgePointId }" src="${negative.url }" />
					      				<input class="hidden" id="${negative.url }" value="${negative.badgePointId }" />
				      				</div>
				      				<div>
					      				${negative.badgePointName }				      				
				      				</div>
				      			</div>
					      		<div>
					      			${negative.badgePointDesc2 }
					      		</div>
				      		</div>
		      			</c:forEach>
		      			</div>	
		      		</div>
		     	</div>
		</div>
</body>
</html>