<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
  	<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">

    <style>
        .MyProfile-input-group{
            display: flex;

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
    
	$(document).ready(function()
	{

			$(".modify").click(function()
			{
				  $(location).attr("href","myprofilemodify.action");
					  
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
                            <div><a class="navclick" href="opprofile.action">프로필</a></div>
                            <div><a class="navnonclick" href="opbadge.action">뱃지</a></div>
                            <div><a class="navnonclick" href="opcreatepostlist.action">개설모임</a></div>
                        </div>

                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                프로필
                            </div>

                            <div class="MyPage-body-body">
                                <c:forEach var="List" items="${ myPageList }" varStatus="status">
                                    <form action="myprofilemodify.action" class="MyProfile-body flex-col-left-up">
									
                                            
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    닉네임*
                                                </div>  
                                                <input type="text" id="nickname" name="nickname"  class="form-control input-245-40" value="${List.nickname }" readonly>
                                            </div>                        
                                           
                
                
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    휴대전화
                                                </div>
                                                <span style="color: orange; padding-left: 10px; padding-top: 10px;">${List.telCheck }</span>
                                            </div>
                
                
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    Email
                                                </div>  
                                                      <span style="color: orange; padding-left: 10px; padding-top: 10px;">${List.emailCheck }</span>
                                            </div>
                
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    대표SNS
                                                </div>  
                                                <input type="text" class="form-control input-245-40" value="${List.sns }" readonly>
                                            </div>
                                            
                							
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    만남장소1
                                                </div>
                                                <div class="box-245-40">
                                                    <input type="text" class="form-control input-150-40" value="${myPageAddrList[status.index].addrSiName1 } " readonly>
                                                    <input type="text" class="form-control input-90-40" value="${myPageAddrList[status.index].addrGuName1 }" readonly>
                                                </div>
                                            </div>
                                            

											

                                            
                                            
                						<c:if test="${not empty myPageAddrList[status.index].addrGuName2}">
                							<div class="MyProfile-input-group">
                                            	<div class="MyProfile-input-group-label">
                                                    만남장소2
                                                </div>
                                                <div class="box-245-40">
                                                    <input type="text" class="form-control input-150-40" value="${myPageAddrList[status.index].addrSiName2 }" readonly>
                                                    <input type="text" class="form-control input-90-40" value="${myPageAddrList[status.index].addrGuName2 }" readonly>
                                                </div>
                                            </div>
                							</c:if>
                							
                							
                							<c:if test="${not empty myPageAddrList[status.index].addrGuName3}">
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    만남장소3
                                                </div>
                                                <div class="box-245-40">
                                                    <input type="text" class="form-control input-150-40" value="${myPageAddrList[status.index].addrSiName3 }" readonly>
                                                    <input type="text" class="form-control input-90-40" value="${myPageAddrList[status.index].addrGuName3 }" readonly>
                                                </div>
                                            </div>
                							</c:if>
                							
                							
                							<c:if test="${not empty myPageInterList[status.index].interMainName2}">
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    관심사1
                                                </div>
                                                <div class="box-245-40">
                                                    <input type="text" class="form-control input-120-40" value="${myPageInterList[status.index].interMainName1 } " readonly>
                                                    <input type="text" class="form-control input-120-40" value="${myPageInterList[status.index].interSubName1 } " readonly>
                                                </div>
                                            </div>
                							</c:if>
                							
                							
                							<c:if test="${not empty myPageInterList[status.index].interMainName2}">
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    관심사2
                                                </div>
                                                <div class="box-245-40">
                                                    <input type="text" class="form-control input-120-40" value="${myPageInterList[status.index].interMainName2 }" readonly>
                                                    <input type="text" class="form-control input-120-40" value="${myPageInterList[status.index].interSubName2 }" readonly>
                                                </div>
                                            </div>
                							</c:if>
                							
                							
                							
                							
                							
                							<c:if test="${not empty myPageInterList[status.index].interMainName3}">
                                                <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    관심사3
                                                </div>
                                                <div class="box-245-40">
                                                    <input type="text" class="form-control input-120-40" value="${myPageInterList[status.index].interMainName3 }" readonly>
                                                    <input type="text" class="form-control input-120-40" value="${myPageInterList[status.index].interSubName3 }" readonly>
                                                </div>
                                            </div>
                							</c:if>
                							
                                        
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    자기소개
                                                </div>  
                                                <textarea class="form-control" name="" id="" cols="30" rows="10"  readonly>${List.introduce }</textarea>
                                            </div>
                                            <br>
                                            <br>
                                        </form>
                                        </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>