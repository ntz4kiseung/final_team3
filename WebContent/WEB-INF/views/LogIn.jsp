<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link href="css/sagyo.css" rel="stylesheet">
   <style>
       .LogIn-box{
           width: 630px;
           height: 540px;
           box-shadow: 0px 0px 5px 5px rgba(241,123,0, 0.05);
       }
       .LogIn-box>div{
           width: 100%;
       }
       .LogIn-box>div:first-child{
           flex-basis: 185px;
       }
       .LogIn-box>div:nth-child(2){
           padding: 0px 70px 0px 70px;
       }
       .LogIn-box>div:last-child{
           flex-basis: 90px;
       }
       .LogIn-form{
           height: 100%;
           justify-content: space-around;
       }
       .LogIn-form .input-underline{
           width: 60%;
       }
       .LogIn-form>div{
           width: 60%;
       }
   </style>
<script type="text/javascript">
   
$(document).ready(function()
{
	$("#btn-login").click(function name()
	{
		var userid = $("#userId").val();
		var pwd = $("#pwd").val();
		console.log("유저 아이디 : " + userid);
		console.log("유저 비밀번호 : " + pwd);
		jQuery.ajaxSettings.traditional = true;
		var logindata = [userid, pwd];
		$.ajax({
			url : "<%=cp %>/checklogin.action",
			type : "post",
			data : {'logindata': logindata},
			success : function(count)
			{
				if (count == 0)
				{
					alert("아이디 혹은 비밀번호가 틀렷습니다.");
				}
				else if(count == 1)
				{
					/* $("#loginForm").submit(); */
					alert("로그인 성공");
					$("#loginForm").submit();
				}
			}
		})
	})
})
   
   
</script>
</head>
<body>
    <div class="browser flex-col-center-center">
        <c:import url="/WEB-INF/views/Navbar.jsp"></c:import>

        <div class="body-box flex-item-grow flex-col-center-up">
            <div class="body flex-item-grow flex-col-center-center">
                <div class="LogIn flex-col-center-center">

                    <div class="LogIn-box flex-col-center-center">
                        <!-- 로고 -->
                        <div class="FindIdComplete-logo flex-row-center-center">
                            <div class="FindIdComplete-logo-img">
                                <img src="img/Logo.png" alt="">
                            </div>
                            <div class="FindIdComplete-logo-text">
                                Sagyo
                            </div>
                        </div>
                        
                        <!-- 로그인 입력창 -->
                        <div class="flex-item-grow">
                            <form id="loginForm" name="loginForm" action="loginsuccess.action" class="LogIn-form flex-col-center-center" method="POST">
                                <input type="text" class="input-underline" id="userId" name="userId" placeholder="아이디">
                                <input type="password" class="input-underline" id="pwd" name="pwd" placeholder="비밀번호">
                            
                            <div class="flex-row-center-center">
                                <button type="button" id="btn-login" class="btn btn-orange flex-item-grow">로그인</button>&nbsp;&nbsp;
                                <button type="button" id="btn-signUp" class="btn btn-outline-orange flex-item-grow">회원가입</button>
                            </div>
                            </form>
                        </div>
                        <!-- 아디, 비번 찾기 -->
                        <div class="flex-row-center-center">
                            <a href="#">아이디찾기</a>
                            &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="#">비밀번호찾기</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</body>
</html>