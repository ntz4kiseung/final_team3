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
	    .Withdrawal-body{
    	font-size: 20px;
	    }
	    .CustomerService-body > .box-725-400{
	    	justify-content: space-evenly;
	    }
	</style>
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
                        <span><a href="directquestionwrite.action">1:1문의</a></span>&nbsp;&nbsp;&nbsp;
                        <span class="font-bold"><a href="withdrawal.action">회원탈퇴</a></span>&nbsp;&nbsp;&nbsp;
                    </div>

                    <div class="CustomerService-body flex-item-grow flex-col-center-center">

                        <div class="box-725-400 flex-col-center-center">

                            <div class="Withdrawal-header flex-col-center-center">
                                <div class="logo-box-300-100 flex-item-grow flex-row-center-center">
                                    <div class="logo-img">
                                        <img src="img/Logo.png" alt="이미지 없음">
                                    </div>
                                    <div class="logo-text">
                                        Sagyo
                                    </div>
                                </div>
                            </div>

                            <div class="Withdrawal-body">
                                    지금까지 SAGYO를 이용해주셔서 감사합니다.
                            </div>


                            <div class="box-725-400-footer flex-row-center-center">
                                <button class="btn-160-45 btn" onclick="location.href='main.action'">메인으로</button>
                            </div>

                        </div>

                    </div>                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>