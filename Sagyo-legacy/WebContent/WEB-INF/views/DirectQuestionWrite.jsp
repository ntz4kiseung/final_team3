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
                        <span><a href="notice.action">공지사항</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="faq.action">자주묻는질문</a></span>&nbsp;&nbsp;&nbsp;
                        <span class="font-bold"><a href="directquestionwrite.action">1:1문의</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="withdrawal.action">회원탈퇴</a></span>&nbsp;&nbsp;&nbsp;
                    </div>

                    <div class="CustomerService-body flex-item-grow flex-col-center-center">
						<form role="form" action="directquestioncomplete.action" method="post">
                        <div class="DirectQuestion flex-item-grow  flex-col-center-center">
                                <div class="DirectQuestion-desc flex-col-left-center">
                                    <div>
                                        1:1 문의 관련 안내사항<br>
                                        1. 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질<br>
                                        2. 이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가<br>
                                        3. 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게<br>
                                        4.  하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈<br>
                                    </div>
                                 </div>
        
                                <div class="DirectQuestion-title flex-row-left-center">
                                    <div>
                                        제목
                                    </div>
                                    <input type="text" class="form-control" id="title" name="title">
                                </div>
        
                                <div class="DirectQuestion-contents">
                                    <textarea name="content" id="content" class="form-control" ></textarea>
                                </div>
        
                                <div class="DirectQuestion-footer flex-row-center-center">
                                	
                                    <button class="btn-160-45 btn btn-orange">1:1문의 보내기</button>
                                    
                                </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>