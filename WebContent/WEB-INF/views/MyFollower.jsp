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

 	 <!-- 부트스트랩(bootstrap css, jquery, popper.js, bootstrap js 필요) -->
    <link href="css/bootstrap-4.3.1.min.css" rel="stylesheet">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper-1.14.7.min.js"></script>
    <script src="js/bootstrap-4.3.1.min.js"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="css/sagyo-font.css" rel="stylesheet">
    <!-- sagyo.css, sagyo.js -->
    <link href="css/sagyo.css" rel="stylesheet">

    
   <style type="text/css">
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
    .followbadge{
	width: 120px;
	height: 120px;
}
   
   </style> 
   <script type="text/javascript">
   
   $(document).ready(function()
   {
		$(".star-show>div:nth-child(2)").each(function(index,item){
		    $(item).css("width", $(item).next().val()*20+"%");
		});
	    
		
	    $('.followBtn').click(function()
		{			
	    	 var followId = $(this).val(); // 테이크유저아이디
	    	 var fck = $("#followckId"+followId).val(); // 1 , 0
			 
	 		   $.ajax({
	            url : 'followingajax.action',
	            type : 'GET',
	            data : { followId : followId , fck : fck},
	            }).done(function(result){
	            	if(result == 0)
					{
	            		$("#followBtn").html("♡");	
	            		
					}
					else 
					{
						$("#followBtn").html("❤");	
					}
	            	
	            	location.href = "<%=cp%>/myfollower.action";
	            	
	            	})     
	    }) 
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
                                         <img class="" src="<%=cp %>/${List.url } " onerror="this.src='img/뉴비.png'">
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
                            <div><a class="navnonclick" href="mybadge.action">뱃지</a></div>
                            <div><a class="navclick" href="myfollowing.action">팔로우</a></div>
                            <div><a class="navnonclick" href="createpostlist.action">내모임</a></div>
                           
                        </div>
                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                              <a class="navnonclick" href="myfollowing.action">팔로잉</a>&nbsp;&nbsp;&nbsp;
                                <a class="navclick" href="myfollower.action">팔로워</a>
                                 
                            </div>

                           <div class="MyPage-body-body">
                                <div class="MyFollow flex-row-left-up">

                                   	<c:forEach var="fList" items="${followerList }" varStatus="status">
                                    <div class="MyFollow-user flex-row-left-center">
                                       <div class="user-badge-box">
                                                <img class="user-bad-badge" src="${followerBad[status.index].urlBad }" alt="">
                    							 <img class="followbadge" src="<%=cp %>/${fList.url } " alt="">
                                        </div>
                                          <div class="MyFollow-user-detail">
                                        
                                        		<div>${fList.nickname }
                                        	<c:choose>
				                           	<c:when test="${fList.followId != 0}">
				                           		<button class="btn followBtn" id="followBtn${status.index}" value="${fList.userId }">❤</button>
				                           		<input type="hidden" class="followckId"  id="followckId${fList.userId }" value="${fList.followId}">
				                           	</c:when>
				                           	<c:when test="${fList.followId == 0}">
				                           		<button class="btn followBtn"  id="followckId${status.index}" value="${fList.userId }">♡</button>
				                           		<input type="hidden" class="followckId" id="followckId${fList.userId }" value="${fList.followId}">
				                           	</c:when>
				                           	</c:choose>
				                           	</div>
	                                           <div class="flex-row-left-center"> 
					                              <div class="star-show star-20-box">
														
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
														<input class="hidden" type="text" id="grade2" name="grade2" value=" ${fList.reviewGrade }"/>
														
													</div>
					                             	<div style="margin-left: 10px;">${fList.reviewGrade } / 5.0</div>
					                            </div>
                                            	
                                           <div>${followerAddrList[status.index].addrSiName1 }  ${followerAddrList[status.index].addrGuName1 } 
                                             ${followerAddrList[status.index].addrSiName2 }  ${followerAddrList[status.index].addrGuName2 } 
                                             ${followerAddrList[status.index].addrSiName3 }   ${followerAddrList[status.index].addrGuName3 } </div>
                                            <div>${followerInterList[status.index].interSubName1 }
                                           	 	${followerInterList[status.index].interSubName2 }
                                            	${followerInterList[status.index].interSubName3 }</div> 	
                                            	
                                            	
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
</body>
</html>