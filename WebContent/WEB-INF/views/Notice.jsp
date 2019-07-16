<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <!-- 부트스트랩(bootstrap css, jquery, popper.js, bootstrap js 필요) -->
    <link href="css/bootstrap-4.3.1.min.css" rel="stylesheet">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper-1.14.7.min.js"></script>
   	<script src="js/bootstrap-4.3.1.min.js"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="css/sagyo-font.css" rel="stylesheet">
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
        .Notice-pagination{
        	font-size: 16px;
        }
        .Notice-pagination>div:FIRST-CHILD, .Notice-pagination>div:LAST-CHILD{
        	width: 60px;
        }
    </style>
	
	<script>
		pageNum = '${pageNum}';
		keyword = '${keyword}';
		totalPage = '${totalPage}';
		$(document).ready(function(){
			$(document).on('click', 'a[href="#"]', function(e){
		        e.preventDefault();
		    });
			 
			$(".paging").click(function(){
				location.href="notice.action?pageNum="+$(this).text()+"&keyword="+keyword;
			});
			
			$(".paging-next").click(function(){
				pageNum = Number(pageNum) + 5;
				if(pageNum>Number(totalPage)){
					pageNum=totalPage
				};
				location.href="notice.action?pageNum="+pageNum+"&keyword="+keyword;
			});
			
			$(".paging-prev").click(function(){
				pageNum = Number(pageNum) - 5;
				if(pageNum>Number(totalPage)){
					pageNum=totalPage
				};
				location.href="notice.action?pageNum="+pageNum+"&keyword="+keyword;
			});
		});
	</script>
</head>
<body>
    <div class="browser flex-col-center-center">
    
        <c:import url="/WEB-INF/views/Navbar.jsp"></c:import>

        <div class="body-box flex-item-grow flex-col-center-up">
            <div class="body flex-item-grow flex-col-center-center">
                <div class="CustomerService flex-item-grow flex-col-center-up">


                    <div class="CustomerService-header flex-col-left-center">
                        고객센터
                    </div>

                    <div class="CustomerService-category flex-row-left-center">
                       <span class="font-bold"><a href="notice.action">공지사항</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="faq.action">자주묻는질문</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="directquestionwrite.action">1:1문의</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="withdrawal.action">회원탈퇴</a></span>&nbsp;&nbsp;&nbsp;
                    </div>

                    <div class="CustomerService-body flex-item-grow">

                        
                        <div class="Notice flex-col-center-center">

                            <!-- 검색창 -->
                            
                            <div class="Notice-search flex-row-left-center">
                                <form class="input-group" action="notice.action" method="post">
                                    <input type="text" class="form-control flex-item-grow" placeholder="검색키워드를 입력하세요" name="keyword" id="keyword navbar-search-input" value="${keyword }">
                                    <input type="text" class="hidden" name="pageNum" value="1">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="submit" id="noticeSearch">검색</button>
                                    </div>
                                </form>
                            </div>
                           

                            <!-- NoticeBody -->
                            <div class="Notice-body flex-item-grow">
                                    <!-- 아코디언 -->
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
                                        <!-- header -->

                                        <!-- card card card card card card card card card card card card card card card  -->
                                        <div class="card">
                                        
                                        	<!-- 게시글 반복 시작 -->
                                        	<c:forEach var="notice" items="${list }">
                                            <div class="card-header flex-row-left-center" id="headingOne">
                                                <div class="flex-col-center-center">
                                                    <span class="CustomerService-label">공지</span>
                                                </div>
                                                <div class="flex-item-grow flex-col-left-center">
                                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${notice.id }" aria-expanded="true" aria-controls="collapse${notice.id }">
                                                        ${notice.title }
                                                    </button>
                                                </div>
                                                <div class="flex-col-center-center">
                                                    ${notice.csDate }
                                                </div>
                                            </div>
                                        
                                            <div id="collapse${notice.id }" class="collapse" aria-labelledby="headingOne" data-parent="#NoticeAccordion">
                                                <div class="card-body flex-col-left-up">
                                                    <div class="flex-row-left-center">
                                                        <div class="flex-item-grow">
                                                            ${notice.title }
                                                        </div>
                                                        <div>
                                                            ${notice.csDate }
                                                        </div>
                                                    </div>
                                                    <div>${notice.contents} </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            
                                            <!-- 게시글 반복 끝 -->
                                            
                                            
                                            
                                            
                                            
                                        </div>
                                        <!-- card card card card card card card card card card card card card card card  -->


                                        


                            </div> <!--end accordion -->

                        </div><!-- end Notice-body -->

                        <!-- 페이징 -->
                        <div class="Notice-footer flex-col-center-center">
                            <div class="Notice-pagination flex-row-center-center">
                            	
								<c:choose>
									<c:when test="${(largePage eq 1) && (largePage eq totalLargePage)}">
										<div></div>
										<div>
											<c:forEach var="index" begin="1" end="${totalPage }">
												&nbsp;<a href="#" class="paging ${ (index==pageNum) ? 'font-bold font-orange' : '' } ">${index }</a>&nbsp;
											</c:forEach>
										</div>
										<div></div>
									</c:when>
									
									<c:when test="${(largePage eq 1) && !(largePage eq totalLargePage)}">
										<div></div>
										<div>
										<c:forEach var="index" begin="1" end="5">
											&nbsp;<a href="#" class="paging ${ (index==pageNum) ? 'font-bold font-orange' : '' } ">${index }</a>&nbsp;
										</c:forEach>
										</div>
										<div>
											&nbsp;<a href="#" class="paging-next">다음글</a>&nbsp;
										</div>
									</c:when>
									
									<c:when test="${largePage eq totalLargePage }">
										<div>
											&nbsp;<a href="#" class="paging-prev">이전글</a>&nbsp;
										</div>
										<div>
											<c:forEach var="index" begin="${5*(totalLargePage-1)+1 }" end="${totalPage }" >
												&nbsp;<a href="#" class="paging ${ (index==pageNum) ? 'font-bold font-orange' : '' } ">${index }</a>&nbsp;
											</c:forEach>
										</div>
										<div></div>
									</c:when>

									<c:otherwise>
										<div>
											&nbsp;<a href="#" class="paging-prev">이전글</a>&nbsp;
										</div>
										<div>
											<c:forEach var="index" begin="${5*(largePage-1)+1 }" end="${5*largePage }" >
												&nbsp;<a href="#" class="paging ${ (index==pageNum) ? 'font-bold font-orange' : '' } ">${index }</a>&nbsp;
											</c:forEach>										
										</div>
										<div>
											&nbsp;<a href="#" class="paging-next">다음글</a>&nbsp;
										</div>
									</c:otherwise>
								</c:choose>
								
                            </div>
                        </div>
                        <div class="Notice-footer flex-col-center-center">
                   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	</div>
</body>
</html>