<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <!-- 부트스트랩 -->

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
     <!-- 폰트 (Noto Snas KR + Handlee) -->
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
      
      
    
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">
    
    
<style type="text/css">
 .popover{
   min-width: 400px !important;
   
}
 .popover-content{
    height: 100% !important;
 }
 
 #inbody
 {
    height: 100%;
 }
 .MyFollow-user
 {
    height: 100%;
    margin-bottom: 0px;
 }
 
.img2
{
   width: 120px;
   height: 120px;
   -webkit-filter: grayscale(100%);
}

.img
{
	width: 120px;
   height: 120px;
}

.MyBadge-header-nickname{
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 15px;
}

.MyBadge-header-detail{
    font-size: 16px;
    margin-bottom: 15px;
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
<script type="text/javascript">
	$(function(){
		
	    $("[data-toggle=popover]").popover( {
	        html : true,
	        content: function() {
	          var content = $(this).attr("data-popover-content");
	          return $(content).children(".popover-body").html();
	        },
	        title: function() {
	          var title = $(this).attr("data-popover-content");
	          return $(title).children(".popover-heading").html();
	          
	        }
	        
	    });
	   
	    
	  
	    
	});

</script>
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

                          
                   <c:forEach var="List" items="${ myPageList }" varStatus="status">
                    <div class="MyPage-header flex-row-left-center">
                        <div class="MyPage-header-left flex-col-center-center">
                            <div class="MyPage-header-badge">
                                <img src="<%=cp %>/${List.url } " onerror="this.src='img/뉴비.png'">
                            </div>
                              <div class="MyPage-header-grade-star">
                                <c:forEach var="i" begin="1" end="${List.reviewGrade }">
                                   <label style="color: #ffd700;">★</label>
                                </c:forEach>
                                <c:forEach var="i" begin="${List.reviewGrade }" end="4">
                                   <label style="color: #e9e9e9;">★</label>
                                </c:forEach>
                            </div>
                            <div class="MyPage-header-grade">
                              ${List.reviewGrade } / 5.0
                              <input type="hidden" id="hidden" value="${List.reviewGrade }" />
                            </div>
                        </div>
                        <div class="MyPage-header-right flex-item-grow">
                            <div class="MyPage-header-nickname">
                                ${List.nickname }
                            </div>
                            <div class="MyPage-header-detail">
                                <div>${myPageAddrList[status.index].addrSiName1 }   ${myPageAddrList[status.index].addrGuName1 }  ${myPageAddrList[status.index].addrSiName2 } ${myPageAddrList[status.index].addrGuName2 } 
                                ${myPageAddrList[status.index].addrSiName3 }   ${myPageAddrList[status.index].addrGuName3 }</div> 
                                <div>${myPageInterList[status.index].interSubName1 }  ${myPageInterList[status.index].interSubName2 }</div> 
                                <div>${myPageInterList[status.index].interSubName3 }</div> 
                                		
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
                            <div><a class="navclick" href="mybadge.action">뱃지</a></div>
                            <div><a class="navnonclick" href="myfollowing.action">팔로우</a></div>
                            <div><a class="navnonclick" href="#">내모임</a></div>
                        </div>
                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                뱃지
                            </div>

                            <div class="MyPage-body-body">

                                <div class="MyBadge flex-col-left-up">
                                
                                    <div class="MyBadge-box flex-col-left-up">
                                        <div class="MyBadge-box-label flex-col-left-center">
                                          	  활동 뱃지
                                        </div>
                                        <div class="MyBadge-box-badges flex-row-left-center">
                                        <c:forEach var="List" items="${BadgeList1 }" varStatus="status">
                                            <div class="MyBadge-box-badge">
                                               <button type="button" class="btn" data-toggle="popover" data-trigger="focus" data-popover-content="#badge2" data-placement="bottom">
                                                    <img  ${List.badgeCk==0 ? "class='img2'" : "class='img'" }
                                                    src="<%=cp %>/${List.url }" >
                                                </button>
 
                                            </div>
                                          </c:forEach>
                                        </div>
                                    </div>  


                                   
                                    <div class="MyBadge-box flex-col-left-up">
                                        <div class="MyBadge-box-label flex-col-left-center">
                                          	  칭찬 뱃지
                                        </div>
                                        <div class="MyBadge-box-badges flex-row-left-center">
                                        <c:forEach var="List" items="${BadgeList2 }" varStatus="status">
                                            <div class="MyBadge-box-badge">
                                               <button type="button" class="btn"  data-trigger="focus"  data-toggle="popover" data-popover-content="#badge1" data-placement="bottom">
                                                    <img  ${List.badgeCk==0 ? "class='img2'" : "class='img'" }
                                                    src="<%=cp %>/${List.url }" >
                                                </button>
 
                                            </div>
                                          </c:forEach>
                                        </div>
                                    </div>  

                                    <div class="MyBadge-box flex-col-left-up">
                                        <div class="MyBadge-box-label flex-col-left-center">
                                         	   꾸중 뱃지
                                        </div>
                                        <div class="MyBadge-box-badges flex-row-left-center">
                                         <c:forEach var="List" items="${BadgeList3 }" varStatus="status">
                                            <div class="MyBadge-box-badge">
                                               <button type="button" class="btn" data-toggle="popover" data-trigger="focus" data-popover-content="#badge1" data-placement="bottom">
                                                    <img  ${List.badgeCk==0 ? "class='img2'" : "class='img'" }
                                                    src="<%=cp %>/${List.url }" >
                                                </button>
 
                                            </div>
                                          </c:forEach>
                                        </div>
                                    </div>  



                                    <div class="MyBadge-box flex-col-left-up">
                                        <div class="MyBadge-box-label flex-col-left-center">
                                        	    개설자 뱃지
                                        </div>
                                        <div class="MyBadge-box-badges flex-row-left-center">
                                            <c:forEach var="List" items="${BadgeList4 }" varStatus="status">
                                            <div class="MyBadge-box-badge">
                                               <button type="button" class="btn" data-toggle="popover" data-trigger="focus" data-popover-content="#badge1" data-placement="bottom">
                                                     <img  ${List.badgeCk==0 ? "class='img2'" : "class='img'" }
                                                    src="<%=cp %>/${List.url }" >
                                                </button> 
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
        </div>
    </div>
    
    
    
<!-- -------------------------------------------------------------------------------------------------- -->
<div id="badge1" class="hidden ">
   <div class="popover-body" >
      <div id="inbody"  >
      
                                      
          <div class="MyFollow-user flex-row-left-center">   
              <div class="flex-col-center-center">
              
                    <div class="MyFollow-user-badge" >
                        <img src="" alt="">
                    </div>
                   
                    <div>
                  <button type="button" class="btn btn-orange">대표뱃지 설정</button>
                    </div>
               </div>
      
               <div class="flex-col-left-center" style="padding-left: 20px;">
                   <div class="MyBadge-header-nickname">뱃지이름</div>
                    <div class="MyBadge-header-detail">뱃지 포인트 </div>
                    <div class="MyBadge-header-detail">sagyo 이용 15회 달성!</div>
                   <div class="MyBadge-header-detail flex-row-center-center">뱃지획득일<div>sadsads </div></div>
               </div>
          </div>

   
      </div>
   </div>                     
</div>   
     
     
<!--  -->

<div id="badge2" class="hidden" >
   <div class="popover-body">
      <div id="inbody"  >
          

             <div class="MyFollow-user flex-row-left-center">
              <div class="flex-col-left-center">
                    <div class="MyFollow-user-badge" >
                        <img src="" alt="">
                    </div>
                    <div>   
                   <button type="button" class="btn btn-orange">대표뱃지 설정</button>
                    </div>
               </div>
               <div class="flex-col-left-center">
                   <div class="MyBadge-header-nickname">뉴비뱃지</div>
                    <div class="MyBadge-header-detail">뱃지 포인트 </div>
                    <div class="MyBadge-header-detail">sagyo 이용 15회 달성!</div>
                   <div class="MyBadge-header-detail flex-row-center-center">뱃지획득일<div>sadsads </div>
               </div>
            </div>

          

            
          
      </div>
   </div>                     
</div>   


         
            





</body>
</html>