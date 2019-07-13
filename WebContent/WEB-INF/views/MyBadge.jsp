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

.modalimg
{
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
.selectBadge{
  margin-top: 10px;
  
}
.modalbutton{
	color:gray;
}


</style>
<script type="text/javascript">
   $(document).ready(function()
   {
	   
      
       $("[data-toggle=popover]").popover({
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
       
       
       $(".popoverclick").click(function()
	   {
    	   $(".selectBadge").click(function(){
    		  
    		   alert("test");
    		   
    	   });
    	   
	   });
       
       $(".star-show>div:nth-child(2)").css("width", $(".star-show>input").val()*20+"%");
		

    	   
       
      

     
       
     
       
   });

</script>
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
                                         <img src="<%=cp %>/${List.url } " onerror="this.src='img/뉴비.png'">
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
                                               <button type="button" class="btn popoverclick" data-toggle="popover" data-trigger="focus"  data-popover-content="#badge${List.badgePointId }" data-placement="bottom">
                                                    <img id="imgbadge1"  ${List.badgeCk==0 ? "class='img2'" : "class='img'" }
                                                    src="<%=cp %>/${List.url }" >
                                                 </button >
                                     </div>
                               <!-- 모달 -->      
                               <div id="badge${List.badgePointId }" class="hidden" >
                                 <div class="popover-body">
                                    <div id="inbody"  >
                                           <div class="MyFollow-user flex-row-left-center">
                                            <div class="flex-col-left-center">
                                                  <div class="MyFollow-user-badge" >
                                                      <img id="modal1badge" ${List.badgeCk==0 ? "class='modalimg'" : "" }  src="<%=cp %>/${List.url }" alt="">
                                                  </div>
                                                  <div>   
                                                 <button type="button"  ${List.badgeCk==0 ? "class='modalbutton'" : "class='btn btn-orange selectBadge'" }
                                                       				    ${List.badgeCk==1 ? "" : "disabled='disabled'" } >대표뱃지 설정</button>
                                                  </div>
                                             </div>
                                             <div class="flex-col-left-center" style="padding-left: 20px;">
                                                 <div class="MyBadge-header-nickname">${List.badgePointName }</div>
                                                  <div class="MyBadge-header-detail">뱃지 포인트 : <progress value="5" max="10"></progress></div>
                                                  <div class="MyBadge-header-detail">${List.badgePointDesc1 }</div>
                                                 <div class="MyBadge-header-detail flex-row-center-center">뱃지획득일<div>sadsads </div>
                                             </div>
                                          </div>
                                           </div>     
                                    </div>
                                 </div>                     
                              </div>   
                               <!-- 모달 -->
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
                                               <button type="button" class="btn popoverclick" id="btn-popover-open"  data-trigger="focus"  data-toggle="popover" data-popover-content="#badge${List.badgePointId }" data-placement="bottom">
                                                    <img  ${List.badgeCk==0 ? "class='img2'" : "class='img'" }
                                                    src="<%=cp %>/${List.url }" >
                                                </button>
                                            </div>
                                               <!-- 모달 -->      
                                     <div id="badge${List.badgePointId }" class="hidden" >
                                       <div class="popover-body">
                                          <div id="inbody"  >
                                                 <div class="MyFollow-user flex-row-left-center">
                                                  <div class="flex-col-left-center">
                                                        <div class="MyFollow-user-badge" >
                                                            <img id="modal1badge" ${List.badgeCk==0 ? "class='modalimg'" : "" }  src="<%=cp %>/${List.url }" >
                                                        </div>
                                                        <div>   
                                                        <button type="button"  ${List.badgeCk==0 ? "class='modalbutton'" : "class='btn btn-orange selectBadge'" }
                                                       						  ${List.badgeCk==1 ? "" : "disabled='disabled'" } >대표뱃지 설정</button>
                                                        </div>
                                                   </div>
                                                   <div class="flex-col-left-center" style="padding-left: 20px;">
                                                       <div class="MyBadge-header-nickname">${List.badgePointName }</div>
                                                        <div class="MyBadge-header-detail">뱃지 포인트 </div>
                                                        <div class="MyBadge-header-detail">${List.badgePointDesc1 }</div>
                                                       <div class="MyBadge-header-detail flex-row-center-center">뱃지획득일<div>sadsads </div>
                                                   </div>
                                                </div>
                                                 </div>     
                                          </div>
                                       </div>                     
                                    </div>   
                                        <!-- 모달 -->   
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
                                               <button type="button" class="btn popoverclick"  data-toggle="popover" data-trigger="focus" data-popover-content="#badge${List.badgePointId }" data-placement="bottom">
                                                    <img  ${List.badgeCk==0 ? "class='img2'" : "class='img'" }
                                                    src="<%=cp %>/${List.url }" >
                                                </button>
                                            </div>
                                            <!-- 모달 -->      
                                     <div id="badge${List.badgePointId }" class="hidden" >
                                       <div class="popover-body">
                                          <div id="inbody"  >
                                                 <div class="MyFollow-user flex-row-left-center">
                                                  <div class="flex-col-left-center">
                                                        <div class="MyFollow-user-badge" >
                                                            <img id="modal1badge" ${List.badgeCk==0 ? "class='modalimg'" : "" }  src="<%=cp %>/${List.url }" alt="">
                                                        </div>
                                                        <div>   
                                                        <button type="button"  ${List.badgeCk==0 ? "class='modalbutton'" : "class='btn btn-orange selectBadge'" }
                                                       						  ${List.badgeCk==1 ? "" : "disabled='disabled'" } >대표뱃지 설정</button>
                                                        </div>
                                                   </div>
                                                   <div class="flex-col-left-center" style="padding-left: 20px;">
                                                       <div class="MyBadge-header-nickname">${List.badgePointName }</div>
                                                        <div class="MyBadge-header-detail">뱃지 포인트 </div>
                                                        <div class="MyBadge-header-detail">${List.badgePointDesc1 }</div>
                                                       <div class="MyBadge-header-detail flex-row-center-center">뱃지획득일<div>sadsads </div>
                                                   </div>
                                                </div>
                                                 </div>     
                                          </div>
                                       </div>                     
                                    </div>   
                                        <!-- 모달 -->   
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
                                               <button type="button" class="btn popoverclick" data-toggle="popover" data-trigger="focus" data-popover-content="#badge${List.badgePointId }" data-placement="bottom">
                                                     <img  ${List.badgeCk==0 ? "class='img2'" : "class='img'" }
                                                    src="<%=cp %>/${List.url }" >
                                                </button> 
                                            </div>
                                            <!-- 모달 -->      
		                                     <div id="badge${List.badgePointId }" class="hidden" >
		                                       <div class="popover-body">
		                                          <div id="inbody"  >
		                                                 <div class="MyFollow-user flex-row-left-center">
		                                                  <div class="flex-col-left-center">
		                                                        <div class="MyFollow-user-badge" >
		                                                            <img id="modal1badge"  ${List.badgeCk==0 ? "class='modalimg'" : "" }  src="<%=cp %>/${List.url }" alt="">
		                                                        </div>
		                                                        <div>   
		                                                       <button type="button"  ${List.badgeCk==0 ? "class='modalbutton'" : "class='btn btn-orange selectBadge'" }
		                                                       						  ${List.badgeCk==1 ? "" : "disabled='disabled'" } >대표뱃지 설정</button>
		                                                        </div>
		                                                   </div>
		                                                   <div class="flex-col-left-center" style="padding-left: 20px;">
		                                                       <div class="MyBadge-header-nickname">${List.badgePointName }</div>
		                                                        <div class="MyBadge-header-detail">뱃지 포인트 </div>
		                                                        <div class="MyBadge-header-detail">${List.badgePointDesc1 }</div>
		                                                       <div class="MyBadge-header-detail flex-row-center-center">뱃지획득일<div>sadsads </div>
		                                                   </div>
		                                                </div>
		                                                 </div>     
		                                          </div>
		                                       </div>                     
		                                    </div>   
                                        <!-- 모달 -->   
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



</body>
</html>