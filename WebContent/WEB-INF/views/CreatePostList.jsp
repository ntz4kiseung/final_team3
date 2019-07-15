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
    
    $(".btn-review").click(function(){
       var review = $(this).val();
       
       var reviewCheck = $("#review-action"+review).val();
       <!-- 1(모집중), 2(만남확정), 3(만남실패), 4(후기남기기), 5(후기조회) -->
       
       if (reviewCheck==5)
	   {
			alert("후기조회");
			$.ajax({
                   url: '<%=cp %>/hostReviewView.action',
                   type: 'GET',
                   dataType: 'html',
                   data : {'postId': review}
                   }).done(function(result){
				   console.log('성공');
				   
                   }); 
			return false;
	   }
       else if (reviewCheck==4)
	   {
    	   $.ajax({
               url : "<%=cp %>/hostReview.action",
               type : "get",
               data : {'postId': review},
               success: function(data)
            {
               console.log(data);
               
               reviewRes = data;
               
               reviewResult = reviewRes.split(',');
               str = '';
               for (var i = 0; i < Math.floor(reviewResult.length/3); i++)
                   {
                  str += '                     <div class="review-post flex-review" id="list'+i+'">';
                  str += '                        <div id="repBadge" class="flex-review-first" style="text-align: center;">';
                  str += '                           <div class="PostList-post-badge">';
                  str += '                                       <img src="' + reviewResult[1+i*3] + '" alt="">';
                  str += '                                      </div>';
                  str += reviewResult[2+i*3];
                  str += '                        <input class="hidden" value="' + reviewResult[0+i*3] + '" name="userId"/>';
                  str += '                        </div>';
                  str += '                        <div class="flex-review-second" style="text-align: center;">';
                  str += '                           <div>';
                  str += '                              <div class="star-rating star-25-box flex-row-left-center" id="grade'+i+'">';
                  str += '                                 <img class="" id="1" src="img/star.png" alt=""/>';
                  str += '                                 <img class="" id="2"  src="img/star.png" alt="" />';
                  str += '                                 <img class="" id="3"  src="img/star.png" alt="" />';
                  str += '                                 <img class="grayscale" id="4"  src="img/star.png" alt="" />';
                  str += '                                 <img class="grayscale" id="5"  src="img/star.png" alt="" />';
                  str += '                                 <input class="hidden" type="text" id="grade" name="grade" value="3" />';
                  str += '                              </div>';
                  str += '                                    </div>';
                  str += '                                 </div>';
                  str += '                                 <div class="flex-review-third" style="text-align: center;" >';
                  str += '                                    <div class="PostList-post-badge">';
                  str += '                                          <button type="button" class="pointSelect" value="'+i+'" data-trigger="focus" tabindex="0" data-toggle="popover"  data-popover-content="#badgeList" data-placement="bottom" data-container="body">';
                  str += '                                                 <img class="select" name="select" id="selectPoint'+i+'" name="image" src="img/Logo_NoBorder.png" value="badgeSelect" alt="포인트선택">';
                  str += '                                                 <input type="hidden" value="nonSelect" class="hidden" id="badgePointId'+i+'" name="badgeId">';
                  str += '                                            </button>';
                  str += '                                      </div>';
                  str += '                                 </div>';
                  str += '                                 <div class="flex-review-fourth">';
                  str += '                                    <textarea class="form-control" id="contents'+i+'" name="contents"></textarea>';
                  str += '                                 </div>';
                  str += '                     </div>';
                   }
               
               $("#ajaxTest").empty();
               $("#ajaxTest").append(str);
            }
           });
			
	   }
       
       
       
    });

   $("#review-submit").click(function() {
      
      debugger;
      var postId = $("#postId").val();      // 방 번호
      
      var grade = new Array();
      var userId = new Array();
      var badgeId = new Array();
      var contents = new Array();
      
      var ajaxTest = document.getElementById("ajaxTest");
      
      var count = ajaxTest.childElementCount;
      
      for (var i = 0; i < count; i++)
      {
         grade = $('#grade0').children('.hidden').val();      // 등급 (1~5)
         userId = $('#list0').find('input.hidden').val();   // 받는 유저 ID
         badgeId = $("#badgePointId0").val();            // 뱃지 ID
         contents = $("#contents0").val();               // 내용
      }
      
      
      
      
      //var grade = $("#grade").val();      // 등급 여러개의 후기를 받아야 한다.
      /* 
      var grade = $('#grade0').children('.hidden').val();      // 등급 (1~5)
      var userId = $('#list0').find('input.hidden').val();   // 받는 유저 ID
      var badgeId = $("#badgePointId0").val();            // 뱃지 ID
      var contents = $("#contents0").val();               // 내용
       */
      
      /*  
      var ajaxTest = document.getElementById("ajaxTest");
      
      var count = ajaxTest.childElementCount;
      
      var list = "";
      
      for (var i = 0; i < count; i++)
      {
         list += $('#grade'+i).children('.hidden').val();   
         list += ',';
         list += $('#list'+i).find('input.hidden').val();   
         list += ',';
         list += $("#badgePointId"+i).val();      
         list += ',';
         list += $("#contents"+i).val();   
         list += ',';
      }
       */
       
      
      
      /* 
      for (var i = 0; i < reviewList.length(); i++)
      {
         console.log(reviewList[i]);
      }
       */
      
      /*
      var contents = $("#contents").val();
      var grade = new Array();
      
      $("input[name=grade]").each(function(index, item){
         grade.push($(item).val());
         });
       */
      
      
      console.log(postId);
      console.log(grade);
      console.log(userId);
      console.log(badgeId);
      console.log(contents);
      
      //alert(grade);
      //alert(postId);
      
      //alert(contents);
      //console.log(grade);
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
      
      selectPoint = 'selectPoint'+$(this).val();   // img 태그 id
      
      
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
/* 
function selectBadge(url,click_id)
{
   
   console.log(url);      // 이미지 url
   console.log(click_id);   // 이미지 코드번호
   //selectPoint.src = url;
   
    var changeBadge = document.getElementById(selectPoint);
   var badgeId = document.getElementById("hidden");
   changeBadge.src=url;
   badgeId.value=click_id; 
}
 */

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
                    <div class="logo-text">
                        Sagyo
                    </div>
                </div>
            </div>
            <div class="navbar-center flex-item-grow flex-row-center-center">
                <form action="" class="flex-row-center-center">
                    <input type="text" placeholder="관심사의 키워드를 입력해주세요" class="form-control flex-item-grow" id="navbar-search-input">
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
                            <div><a href="createpostlist.action">내모임</a></div>
                        </div>
                        
                        
                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                <span><a href="createpostlist.action">개설모임</a></span>&nbsp;&nbsp;&nbsp;
                                <span><a href="joinpostlist.action">참여모임</a></span>
                            </div>

                            <div class="MyPage-body-body">
                                <div class="PostList flex-col-left-center">
                                    
                                    <c:forEach var="list" items="${myReviewList }" >
                                    <div class="PostList-post flex-row-left-center">
                                        <div class="PostList-post-left flex-col-center-center">
                                            <div class="PostList-post-badge">
                                               <img src="${list.url }" onerror="this.src='img/뉴비.png'">
                                            </div>
                                            <div>
                                                <!-- nickname -->
                                                
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
                                        
                                         
                                             <!-- 1(모집중), 2(만남확정), 3(만남실패), 4(후기남기기), 5(후기조회) -->
                                           <c:choose>
                                            	<c:when test="${list.postStatus eq '1'}">
                                            	<button data-toggle="modal" data-target="#reviewModal" value="${list.userId }" class="btn btn-outline-secondary btn-120-35 mybtn btn-review" disabled="disabled">모집중</button>
                                                <input type="hidden" id="review-action${list.userId }" name="review-action${list.userId }" class="review" value="1">
												</c:when>
												
												<c:when test="${list.postStatus eq '2'}">
												<button data-toggle="modal" data-target="#reviewModal" value="${list.userId }" class="btn btn-outline-secondary btn-120-35 mybtn btn-review" disabled="disabled">만남확정</button>
                                                <input type="hidden" id="review-action${list.userId }" name="review-action${list.userId }" class="review" value="2">
												</c:when>
												
												<c:when test="${list.postStatus eq '3'}">
												<button data-toggle="modal" data-target="#reviewModal" value="${list.userId }" class="btn btn-outline-secondary btn-120-35 mybtn btn-review" disabled="disabled">만남실패</button>
                                                <input type="hidden" id="review-action${list.userId }" name="review-action${list.userId }" class="review" value="3">
												</c:when>
												
												<c:when test="${list.postStatus eq '4'}">
												<button data-toggle="modal" data-target="#reviewModal" value="${list.userId }" class="btn btn-outline-orange btn-120-35 mybtn btn-review">후기남기기</button>
                                                <input type="hidden" id="review-action${list.userId }" name="review-action${list.userId }" class="review" value="4">
												</c:when>
												
												<c:when test="${list.postStatus eq '5'}">
												<button data-toggle="modal" data-target="#reviewModal" value="${list.userId }" class="btn btn-outline-orange btn-120-35 mybtn btn-review">후기조회</button>
                                                <input type="hidden" id="review-action${list.userId }" name="review-action${list.userId }" class="review" value="5">
												</c:when>
												
												<c:otherwise>
												오류
												</c:otherwise>
                                            </c:choose>
                                            
  
                                            
                                            
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
        
        
        
        
        
        
        <!-- Modal -->
        <form action="reviewinsert.action" method="post">
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
               <div class="flex-review" style="text-align: center; font-weight: bold; font-size: 15px;">
                  <div class="flex-review-first" >유저</div>
                  <div class="flex-review-second">평점</div>
                  <div class="flex-review-third">뱃지 포인트</div>
                  <div class="flex-review-fourth">코멘트</div>
               </div>
            </div>
                  
                  <div id="ajaxTest" style="overflow:auto; height: 50vh;">
                     
                  </div>
                  
            </div>
            <div class="modal-footer flex-review">
              <button type="button" id="review-submit" class="btn btn-orange flex-col-center-center btn-160-45">작성 완료</button>
            </div>
          </div>
        </div>
      </div>
      </form>
      <%-- 
      <div id="badgeList" class="hidden">
               <div class="popover-body" class="badge-post flex-col-left-up">
                  <div>
                     <div>
                        <h2>칭찬포인트</h2>
                     </div>
                     
                     <div class="flex-badge" style="width: 500px;">
                     <c:forEach var="positive" items="${positiveBadge }">
                        <div>
                           <div class="flex-badge-list flex-item-grow">
                              <button type="button" id="${positive.url }" value="${positive.url}" onclick="selectBadge(this.id)">
                              <!-- <img class="badgePoint" src="img/핵인싸.png" alt="뱃지"> -->
                              <img class="badgePoint" alt="${positive.badgePointId }" src="${positive.url }">
                              </button>
                              ${positive.badgePointName }
                              
                           </div>
                        </div>
                        ${positive.badgePointDesc2 }
                           
                     </c:forEach>
                     </div>
                     
                  </div>
                  
                  <hr>
                  
                  <div>
                     <div>
                        <h2>꾸중포인트</h2>
                     </div>
                     
                     <div class="flex-badge" style="width: 500px;">
                     <c:forEach var="negative" items="${negativeBadge }">
                        <div>
                           <div class="flex-badge-list flex-item-grow">
                              <button type="button" id="${negative.url }" value="${negative.url}" onclick="selectBadge(this.id)">
                              <!-- <img src="img/불참러.png" alt="뱃지"> -->
                              <img class="badgePoint" src="${negative.url }" alt="${negative.badgePointId }">
                              </button>
                              ${negative.badgePointName }
                           </div>
                           
                        </div>   
                        ${negative.badgePointDesc2 }
                     </c:forEach>
                     </div>   
                     
                  </div>
                  
                  <hr>
                  
                  <div>
                     <div>
                        <h2>호스트포인트</h2>
                     </div>
                     
                     <div class="flex-badge" style="width: 500px;">
                     <c:forEach var="host" items="${hostBadge }">
                        <div>
                           <div class="flex-badge-list flex-item-grow">
                              <button type="button" id="${host.url }" value="${host.url}" onclick="selectBadge(this.id)">
                              <!-- <img src="img/슈퍼방장.png" alt="뱃지"> -->
                              <img class="badgePoint" src="${host.url }" alt="${host.badgePointId }">
                              </button>
                              ${host.badgePointName }
                           </div>
                           
                        </div>   
                        ${host.badgePointDesc2 }
                     </c:forEach>
                     
                     </div>   
                     
                  </div>
                  
                  
              </div>
      </div> 
      --%>
      
      
      <div id="badgeList" class="hidden">
               <div class="popover-body" class="badge-post flex-col-left-up">
                  <div>
                     <div>
                        <h2>칭찬포인트</h2>
                     </div>
                     
                     <div class="flex-badge" style="width: 500px;">
                     <c:forEach var="positive" items="${positiveBadge }" varStatus="status">
                        <div>
                           <div class="flex-badge-list flex-item-grow">
                              <button type="button" id="${positive.url }" value="${positive.badgePointId }">
                              <img class="badgePoint" id="${status.count}" alt="${positive.badgePointId }" src="${positive.url }">
                              </button>
                              ${positive.badgePointName }
                              
                           </div>
                        </div>
                        ${positive.badgePointDesc2 }
                           
                     </c:forEach>
                     </div>
                     
                  </div>
                  
                  <hr>
                  
                  <div>
                     <div>
                        <h2>꾸중포인트</h2>
                     </div>
                     
                     <div class="flex-badge" style="width: 500px;">
                     <c:forEach var="negative" items="${negativeBadge }">
                        <div>
                           <div class="flex-badge-list flex-item-grow">
                              <button type="button" id="${negative.url }" value="${negative.badgePointId }">
                              <img class="badgePoint" id="${status.count}" alt="${negative.badgePointId }" src="${negative.url }">
                              </button>
                              ${negative.badgePointName }
                              
                           </div>
                           
                        </div>   
                        ${negative.badgePointDesc2 }
                     </c:forEach>
                     </div>   
                     
                  </div>
                  
                  <hr>
                  
                  <div>
                     <div>
                        <h2>호스트포인트</h2>
                     </div>
                     
                     <div class="flex-badge" style="width: 500px;">
                     <c:forEach var="host" items="${hostBadge }">
                        <div>
                           <div class="flex-badge-list flex-item-grow">
                              <button type="button" id="${host.url }" value="${host.badgePointId }">
                              <img class="badgePoint" id="${status.count}" alt="${host.badgePointId }" src="${host.url }">
                              </button>
                              ${host.badgePointName }
                              
                           </div>
                           
                        </div>   
                        ${host.badgePointDesc2 }
                     </c:forEach>
                     
                     </div>   
                     
                  </div>
                  
                  
              </div>
      </div>
        
</body>
</html>