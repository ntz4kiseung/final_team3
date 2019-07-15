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
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">

    <style>
        .Notice{
            padding: 0px 80px 0px 80px;
        }
        .Notice>div{
            width: 100%;
        }
        .Notice-search{
            flex-basis: 90px;
        }
        .Notice-search>.input-group{
            width: 380px;
        }
        .Notice-body{
            min-height: 645px;
        }
        .Notice-body .card-header>div:first-child{
            flex-basis: 75px;
        }
        .Notice-body .card-header>div:last-child{
            flex-basis: 150px;
        }
        .Notice-footer{
            flex-basis: 120px;
        }
        .CustomerService-label{
            padding: 4px 10px 4px 10px;
            background-color: rgb(241,123,0);
            border-radius: 5px;
            color: white;
        }

        /* 부트스트랩 아코디언 덮어쓰기 */
        .accordion>.card:first-child>.card-header{
            /* 아코디언의 첫번째 카드는 위에 라벨?로 쓰기 위해 card-body는 지우고 card-header만 높이 따로 줌 */
            height: 38px;
        }
        .card{
            border: 1px solid rgb(100,100,100);
            border-left: 0px;
            border-right: 0px;
            border-radius: 0px;
            background-color: rgba(255, 255, 255, 0);
        }
        .card-header{
            padding: 2px 0px 2px 0px;
            border-bottom: 1px solid rgb(100,100,100);
            background-color: rgba(255, 255, 255, 0);
        }
        .card-body{
            background-color: rgba(0, 0, 0, 0.02);
        }
        .card-body>div{
            width: 100%;
        }
        .CustomerService .card-body>div:first-child{
            padding-bottom: 10px;
            margin-bottom: 10px;
            border-bottom: 1px solid rgba(0,0,0,.125);
        }
        .CustomerService .card-body>div:first-child>div:first-child{
            font-size: 16px;
            font-weight: bold;
        }
        
    </style>
    
    
    <!-- ajax test1 끝  -->
 

</head>
<body>
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
                <div class="CustomerService flex-item-grow flex-col-center-up">


                    <div class="CustomerService-header flex-col-left-center">
                        고객센터
                    </div>

                    <div class="CustomerService-category flex-row-left-center">
                        <span><a href="notice.action">공지사항</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="faq.action">자주묻는질문</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="directquestionwrite.action">1:1문의</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="withdrawal.action">회원탈퇴</a></span>&nbsp;&nbsp;&nbsp;
                    </div>

                    <div class="CustomerService-body flex-item-grow">
                        
                        <div class="Withdrawal-body flex-col-center-start container"> <!--  게시판 영역 시작  -->
                        	
                        	<div class="Notice-search flex-row-left-center">
                        	<!-- <form action="searchnotice.action" method="post"> -->
                        	<form action="notice.action" method="post">
                        		<div class="input-group">
                        		<input type="text" class="form-control" name="keyword" id="keyword"> <!-- 입력 창 -->
                        		
                        		<!-- <input type="submit"   class="btn btn-success btn-default" value="검색" id="search"/> -->
                        		<div class="input-group-append">
                        			<button class="btn btn-outline-secondary" type="submit" id="search">검색</button>
                        		</div>
                        		</div>
                        	</form>	
                        	<!-- </form> -->
                        	</div>
                        	
                            
                            
                            <!-- <div class="Withdrawal-desc">
                                <div>
                                	<a>[공지]</a><span>공지사항입니다.</span><span>2019-07-03</span>
                                </div>
                            </div> -->
                            
                            <!-- 아코디언 소스코드 시작  -->
                            <div class="accordion" id="NoticeAccordion"> 
                            
                            	 <!-- header -->
                                        <div class="card">
                                            <div class="card-header flex-row-left-center" id="headingOne">
                                                <div class="flex-col-center-center">
                                                    
                                                </div>
                                                <div class="flex-item-grow flex-col-center-center">
                                                    제목
                                                </div>
                                                <div class="flex-col-center-center">
                                                    작성일
                                                </div>
                                            </div>
                                        </div>
                            
                            <!-- 본래의 게시물 리스트 (시작) -->
                            <div id="boardList">
	                            <c:forEach var="notice" items="${list }">
								    <div class="card"> 
								      <div class="card-header"> 
								        <a class="card-link" data-toggle="collapse" data-parent="#accordion"  href="#collapse${notice.id }"> 
								          <span style="border:1px;">공지</span> ${notice.title }  <span>${notice.csDate }</span>
								        </a> 
								      </div> 
								      <div id="collapse${notice.id }" class="collapse"> 
								        <div class="card-body"> 
								          ${notice.contents} 
								        </div> 
								      </div> 
								    </div> 
								 </c:forEach>  
								 
								  <!-- 페이징 처리 ~ 시작  -->
			                           <div class="flex-row-center-center;">
			                            <form action="notice.action" method="post" id="formId">
			                            <div class="flex-row-center-center;" id="numbering">
			                              <script type="text/javascript">
			                              
											var max = ${pages };
											var print = "";
											for (var i = 1; i <= max; i++)
											{
												
												print = i;
												document.write("<button type='submit' id='pagesu' name='pagesu' value="+ print +">"+print+"</button>");
											}
											//alert(document.getElementById("keyword").value);
											//document.write("<button type='submit' id='pagesu' name='pagesu' value="+ print +">"+print+"</button>");
											
										  </script>
										    <input type=hidden id="keyword" name = "keyword" value="${keyword }">
										 </div>
			                           </form>
			                           </div>
                               <!-- 페이징 처리 ~ 끝~  -->
							 </div>
							
							
							 
							 </div>
							  
							  <!--참고자료 시작  -->
							  <%-- <c:forEach var="student" items="${list }">
									<tr>
										<td>${student.sid }</td>
										<td>${student.name }</td>
										<td>${student.tel }</td>
										
										<c:if test="${student.sub == 0  }">
										<td>X</td>
										</c:if>
										
										<c:if test="${student.sub == 1 }">
										<td>O</td>
										</c:if>
									</tr>
								</c:forEach> --%>
							  <!--참고자료 끝  -->
							  
                            <!-- 아코디언 소스코드 종료  -->
                            
                            
                            
                           <!--  <form action="noticelist.action" method="get">
	                            <div class="flex-row-center-center;">
	                               <a href="noticelist.action" id="pagesu" >1</a>
	                               <a href="noticelist.action">2</a>
	                               <a href="noticelist.action">3</a>
									<button type="submit" id="pagesu" name="pagesu" value="1">1</button>
									<button type="submit" id="pagesu" name="pagesu" value="2">2</button>
									<button type="submit" id="pagesu" name="pagesu" value="3">3</button>
	                            </div>
                            </form> -->
                            
                        </div><!-- 게시판 영역 끝  -->

                       <br />
                       <br />
                       <br />
                       <br />
                       <br />
                       <br />

                    </div>                    
                </div>
            </div>
        </div>
    </div>
</body>
</body>
</html>