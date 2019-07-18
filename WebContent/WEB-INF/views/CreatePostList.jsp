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
    
<script type="text/javascript">
$(document).ready(function()
{
   $('#myModal').on('shown.bs.modal', function (){
      $('#myInput').trigger('focus')
   });
   
	 
	$(".on").on("onclick", "a.this()", function (){
	    alert($(this).text());
	    alert("경고");
	});
	 
	 jQuery.ajaxSettings.traditional = true;
	 
	 // 후기 남기기
	 $(".btn-review").click(function(){
			
		 var postId = $(this).val();
		 $("#postId").val($(this).val())

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
	 
	 // 후기 조회
	 $(".btn-inquiry").click(function()
	 {
		 var inquiry = $(this).val();
		 console.log(inquiry);
		 
		
		 $.ajax({
	         url : "<%=cp %>/hostInquiry.action",
	         type : "get",
	         data : {'postId': inquiry},
	     }).done(function(result)
		 {
	    	 $("#A").empty();
             $("#A").append(result);
             $(".star-show>div:nth-child(2)").each(function(index,item){
 	    		$(item).css("width", $(item).next().val()*20+"%")
 	    	});
		 });
		 
	 });
	
    // 별점 평가시 쓰이는 jQuery
    // 평가용 별 누를때 마다 발동됨
    $(document).on('click','.star-rating>img',function(){
 	   var num = $(this).attr('id');
 	   
 	   $(this).parent().children('img').each(function(index, item){
				$(item).addClass("grayscale");
 	   });
 	   
 	   for (var i = 0; i < num; i++)
	   {
		   $(this).parent().children("#"+(i+1)).removeClass("grayscale");
	   }
 	   
 	   // 색 칠해진 별의 갯수를 hidden input 태그에 넣어줌
 	   $(this).parent().children("input").val(num);
    });
    
    

    
    $(document).on('click','.selectPoint', function(){
    	
    	$("[data-toggle=popover]").popover({
		    html : true,
		    sanitize : false,
		    content: function() {
		    temp=$(this);
		    var content = $(this).attr("data-popover-content");
		    return $(content).children(".popover-body").html();
		    }		    
		 });
    	
    	$(document).on('click', '.badgePoint', function(){
			$(temp).attr("src", $(this).attr("src"));
			$(temp).next().val($(this).next().val());
		}); 
    });

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
      .modal-content{
      	  padding: 0px 30px 0px 30px;
      }
      .modal-content>div:FIRST-CHILD{
      	 height: 70px;
      }
      .modal-content>div:LAST-CHILD{
      	 height: 80px;
      }
      .modal-content>div:NTH-CHILD(2){
      	 height: 550px;
      }
      #exampleModalLabel{
    	  font-size: 24px;
      }
      #reviewModal, #inquiryModal{
      	  top: 10%;
      }
 	  #reviewModal>div:FIRST-CHILD, #inquiryModal>div:FIRST-CHILD{
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
			 .navclick {
	display: block;
	color: orange;
	font-weight: bold;
	}
	.navnonclick {
		display: block;
		color: inherit;
		font-weight: normal;
	}	
		
</style>

</head>
<body>
    <div class="browser flex-col-center-center">
    
		<c:import url="/WEB-INF/views/Navbar.jsp"></c:import>

		<div class="body-box flex-item-grow flex-col-center-up">
		<div class="body flex-item-grow flex-col-center-center">
                
			<div class="MyPage flex-item-grow flex-col-center-up">

                 
                    <c:forEach var="List" items="${ myPageList }" varStatus="status">
                    <div class="MyPage-header flex-row-left-center">
                        <div class="MyPage-header-left flex-col-center-center">
                        <div class="MyPage-header-badge">
                               <div class="user-badge-box">
                                        <img class="user-bad-badge" src="${MyPageBad[status.index].urlBad }" alt="">
                                         <img id="user_main" src="<%=cp %>/${List.url } ">
                                 </div>
                            </div>
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
								<input class="hidden" type="text" id="grade2" name="grade2" value="${List.reviewGrade }"/>
								<div class="MyPage-header-grade" style="padding-left: 40px;">${List.reviewGrade } / 5.0</div>
							</div>
                        </div>
                        <div class="MyPage-header-right flex-item-grow">
                            <div class="MyPage-header-nickname">
                                ${List.nickname }
                            </div>
                            <div class="MyPage-header-detail">
                             <div>
								<c:if test="${myPageAddrList[status.index].addrSiName1 != null  }">
								    # ${myPageAddrList[status.index].addrSiName1 } ${myPageAddrList[status.index].addrGuName1 }
								</c:if>
								<c:if test="${myPageAddrList[status.index].addrSiName2 != null  }">
								    # ${myPageAddrList[status.index].addrSiName2 } ${myPageAddrList[status.index].addrGuName2 }
								</c:if>
                                <c:if test="${myPageAddrList[status.index].addrSiName3 != null }">
								   # ${myPageAddrList[status.index].addrSiName3 } ${myPageAddrList[status.index].addrGuName3 }
								</c:if> 
							</div>	
							<div>	
                                <c:if test="${myPageInterList[status.index].interSubName1 != null}">
								   # ${myPageInterList[status.index].interSubName1 }
								</c:if> 
                                
                                 <c:if test="${myPageInterList[status.index].interSubName2 != null}">
								   # ${myPageInterList[status.index].interSubName2 }
								</c:if> 
								 <c:if test="${myPageInterList[status.index].interSubName3 != null}">
								   # ${myPageInterList[status.index].interSubName3 }
								</c:if> 
                             </div>    
                                      
                                <div style="color: orange;">${List.telCheck }</div>
                                
                                <div style="color: orange;">${List.emailCheck }</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                    
                    <div class="flex-item-grow flex-row-left-up">
                        <div class="MyPage-nav flex-col-center-up">
                            <div><a class="navnonclick" href="myprofile.action">프로필</a></div>
                            <div><a class="navnonclick" href="mymessagerecevie.action">쪽지함</a></div>
                            <div><a class="navnonclick" href="mybadge.action">뱃지</a></div>
                            <div><a class="navnonclick" href="myfollowing.action">팔로우</a></div>
                            <div><a class="navclick" href="createpostlist.action">내모임</a></div> 
                        </div>
                        
                        
                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                <span ><a  class="navclick" href="createpostlist.action">개설모임</a></span>&nbsp;&nbsp;&nbsp;
                                <span><a class="navnonclick" href="joinpostlist.action">참여모임</a></span>
                            </div>
							
                            <div class="MyPage-body-body">
                                <div class="PostList flex-col-left-center">
                                    
                                    <c:forEach var="list" items="${myReviewList }" varStatus="status">
                                    <div class="PostList-post flex-row-left-center">
                                        <div class="PostList-post-left flex-col-center-center" onclick="location.href='profile.action?userId=${list.userId}'">
                                            <div class="PostList-post-badge">
                                               <img src="${list.url }" onerror="this.src='img/뉴비.png'">
                                            </div>
                                            <div>
                                                ${list.nickname }
                                            </div>
                                        </div>
                                        <div class="PostList-post-center flex-col-left-center" onclick="location.href='post.action?postId=${list.postId}'">
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
		        <button type="submit" id="review-submit" class="btn btn-orange flex-col-center-center btn-160-45">작성 완료</button>
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
					<div id="pleaseReview" class="hidden flex-col-center-center">
						<p>해당 모임에 후기를 남기지 않아 결과를 조회할 수 없습니다.</p>
						<p>다음 모임에선 꼭 후기를 남겨주세요.</p>
					</div>
					<div id="A" style="overflow:auto; height: 495px;" class="please-review">
						
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