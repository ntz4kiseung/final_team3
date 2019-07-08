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
	<style type="text/css">
	
    
	.div-check{
	display: flex;
	align-items: center;
	}
	.popover{
    min-width: 400px !important;
    
	}
	.btn-120-35{
    width: 120px;
    height: 35px;
    font-size: 14px;
    padding: 6px 3px 6px 3px;
	}
	
	.modal-backdrop {
	z-index: 1020;
    display : none;
	}
		
	</style>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
			$("#signup-submit").click(function() {
				
				var userid = $("#userId").val();
				var pwd1 = $("#pwd").val();
				var pwd2 = $("#pwd2").val();
				var nickname = $("#nickname").val();
				var name = $("#name").val();
				var birth = $("#birth").val();
				var tel = $("#tel").val();
				var email = $("#email").val();
				var useridC = $("#btn-check-id").val();
				var pwdC = $("#span-check-pw").val();
				var nicknameC = $("#btn-check-nick").val();
				var telC = $("#telcerti").val();
				var emailC = $("#emailcerti").val();
				
				
				
				if (userid == "" || pwd1 == "" || pwd2 == "" || nickname == "" || name =="" || birth =="" || tel =="" || email == "")
				{
					alert("필수정보가 누락되었습니다.");
					return;
				}
				else if(useridC == "0")
				{
					console.log("아이디 밸류 : " + useridC);
					alert("아이디 중복 확인을 완료해주세요.");
					return;
				}
				else if(pwdC=="0")
				{
					console.log("비밀번호 밸류 : " + pwdC);
					alert("비밀번호 입력 확인을 해주세요.");
					return;
				}
				else if(nicknameC=="0")
				{
					console.log("닉네임 밸류 : " + nicknameC)
					alert("닉네임 중복 확인을 완료해주세요.");
					return;
				}
				else if(telC=="0")
				{
					console.log("전화인증 밸류 : " + telC)
					alert("휴대전화 인증을 완료해주세요.");
					return;
				}
				else if(emailC=="0")
				{
					console.log("이메일 인증 밸류 : " + emailC);
					alert("이메일 인증을 완료해주세요.");
					return;
				}
				else
				{
					var form = document.getElementById("signUp-submit-form");
					form.submit;
				}
			})
			

			
			$("#btn-check-id").click(function()
			{

				var inputid = $("#userId").val();
				
				if (inputid == "") {
					document.getElementById("span-check-id").style.display = 'block';
					document.getElementById("span-check-id").style.color = '#DF0101';
					$("#span-check-id").text("아이디를 입력해주세요.");
					return false;
				}
				
				$.ajax({
					url : "<%=cp %>/idcheck.action",
					type : "post",
					data : {'id': inputid},
					success : function(count)
					{
						console.log(count);
						
						if (count == 0) {
							document.getElementById("span-check-id").style.display = 'block';
							document.getElementById("span-check-id").style.color = '#31B404';
							$("#btn-check-id").val("1");
							$("#span-check-id").text("아이디를 사용하실수 있습니다.");
						}
						else {
							document.getElementById("span-check-id").style.display = 'block';
							document.getElementById("span-check-id").style.color = '#DF0101';
							$("#span-check-id").text("중복되는 아이디가 존재합니다.");
						}
					}
				})
				
			})
			
			$("#pwd").keyup(function() {
				
				if($("#pwd").val() == "" && $("#pwd2").val() == "")
				{
					document.getElementById("span-check-pw").style.display = 'inline-block';
					document.getElementById("span-check-pw").style.color = '#DF0101';
					$("#span-check-pw").text("비밀번호를 입력해주세요.");		
				}
				
				if ($("#pwd2").val() != "")
				{
					if ($("#pwd2").val() == $("#pwd").val()) {
						document.getElementById("span-check-pw").style.display = 'inline-block';
						document.getElementById("span-check-pw").style.color = '#31B404';
						$("#span-check-pw").val("1");
						$("#span-check-pw").text("사용하실수 있습니다.");
					} else {
						document.getElementById("span-check-pw").style.display = 'inline-block';
						document.getElementById("span-check-pw").style.color = '#DF0101';
						$("#span-check-pw").val("0");
						$("#span-check-pw").text("비밀번호가 일치하지 않습니다.");
					}
				}
			})
			
			
			$("#pwd2").keyup(function() {

				if ($("#pwd2").val() == $("#pwd").val()) {
					document.getElementById("span-check-pw").style.display = 'inline-block';
					document.getElementById("span-check-pw").style.color = '#31B404';
					$("#span-check-pw").val("1");
					$("#span-check-pw").text("사용하실수 있습니다.");
				} else {
					document.getElementById("span-check-pw").style.display = 'inline-block';
					document.getElementById("span-check-pw").style.color = '#DF0101';
					$("#span-check-pw").val("0");
					$("#span-check-pw").text("비밀번호가 일치하지 않습니다.");
				}
			})
			
			
			
			
			
			$("#btn-check-nick").click(function()
			{
				var inputnick = $("#nickname").val();
				
				if (inputnick == "") 
				{
					document.getElementById("span-check-nick").style.display = 'inline-block';
					document.getElementById("span-check-nick").style.color = '#DF0101';
					$("#span-check-nick").text("닉네임을 입력해주세요.");
				}

				$.ajax({
					url : "<%=cp %>/nickcheck.action",
					type : "post",
					data : {'nickname': inputnick},
					success : function(count)
					{
						if (count == 0) 
						{
							document.getElementById("span-check-nick").style.display = 'inline-block';
							document.getElementById("span-check-nick").style.color = '#31B404';
							$("#btn-check-nick").val("1");
							$("#span-check-nick").text("닉네임을 사용하실수 있습니다.");
							
						} 
						else 
						{
							document.getElementById("span-check-nick").style.display = 'inline-block';
							document.getElementById("span-check-nick").style.color = '#DF0101';
							$("#span-check-nick").text("중복되는 닉네임이 존재합니다.");
						} 
						
					}
				})
			})
			
			$("#select-check-m").change(function()
			{
				var check = 0;
				arrM = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

				var year = parseInt($("#input-check-y").val());
				
				if (year % 400 == 0) 
				{
					check = 1;
				} 
				else if (year % 4 == 0)
				{
					if (year % 100 == 0) 
					{
						check = 0;
					} else 
					{
						check = 1;
					}
				}

				if (check == 1) {
					arrM[1] = 29;
				}

				if (check == 0) {
					arrM[1] = 28;
				}
				$("#select-check-d").empty();
				
				for (var count = 1; count <= 9; count++) {
					
					var option = $("<option value = \"" + 0 + count + "\">" +count + ' 일'
							+ "</option>");
					$("#select-check-d").append(option);
				}
				
				
				for (var count = 10; count <= arrM[$("#select-check-m").val() - 1]; count++) {
					
					var option = $("<option value = \"" + count + "\">" + count + ' 일'
							+ "</option>");
					$("#select-check-d").append(option);
				}
				
			})
			
			$("#tel1, #tel2, #tel3").keyup(function()
			{
				var tel = $("#tel1").val() + $("#tel2").val() + $("#tel3").val();
				
				var test = $("#tel").val(tel);
				
			})
			
			
			
			$("#select-check-y").keyup(function()
			{
				var year = $("#input-check-y").val();
				var month = $("#select-check-m").val();
				var day = $("#select-check-d").val();
				var birth = year + month + day;
				console.log(year + "+" + month + "+" + day + "=" + birth);
				$("#birth").val(birth);
				
			})
			
			$("#select-check-d, #select-check-m").change(function()
			{
				var year = $("#input-check-y").val();
				var month = $("#select-check-m").val();
				var day = $("#select-check-d").val();
				var sum = year + month + day;
				var birth = sum.substring(2, 8);
				console.log(year + "+" + month + "+" + day + "=" + birth);
				$("#birth").val(birth);
			})
			
			
			$("input:radio[name=radio-check-gender]").click(function()
			{
				var genderId = $("input:radio[name=radio-check-gender]").val();
				
				$("#genderId").val(genderId);
				
				console.log($("#genderId").val());
			})
			
			
			
			var a;
			$(".btn-check-cate1").click(function() {
				a = $(this).val();
				b = a.replace(/[0-9]/g,"");
				
				$(".btn-pop-sido"+b).click(function() {
					$("#addrSiName" + a).html($(this).text());
					var siid = $(this).val();
					
					$("#addrSiName"+a).val(siid);
					
					
					$.ajax({
						url : "<%=cp %>/addrgu.action",
						type : "post",
						data : {'siid': siid},
						dataType : "json",
						success : function(addrguname0)
						{
							alert(addrguname0);
						}
						
					})
				})
			})
			
			function makeid()
			{
			    var text = "";
			    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

			    for( var i=0; i < 5; i++ )
			        text += possible.charAt(Math.floor(Math.random() * possible.length));

			    return text;
			}
			
			
			
			$('#myModal').on('shown.bs.modal', function () {
		        $('#myInput').trigger('focus')
		    });
			
			
			
			
			$("#emailcerti, #email-re").click(function() {
				
				var certi = makeid();
				$("#email-certi-test").text(certi);
			    $('#email-su').val(certi);
			})
			
			$("#email-su").click(function() {
				var emailC=$("#email-su").val();
				
				var emailInput = $("#email_certi_input").val();
				
				if (emailC == emailInput) 
				{
					$("#emailCheck").val(emailC);
					
					$("#emailmodal").modal('hide');
					$("#emailcerti").val("1");
					
					document.getElementById("emailCheckresult").style.display = 'inline-block';
					document.getElementById("emailCheckresult").style.color = '#31B404';
					$("#emailCheckresult").text("E-mail 인증 완료");
					
				}
				else
				{
					
					$("#email-context1").text("인증번호가 틀렸습니다. 다시 전송합니다.");
					var certi = makeid();
					$("#email-certi-test").text(certi);
				    $('#email-su').val(certi);
				}
				
			})
			
			
			
			$("#telcerti, #tel-re").click(function() {
				
				var certi = makeid();
				$("#tel-certi-test").text(certi);
			    $('#tel-su').val(certi);
			})
			
			$("#tel-su").click(function() {
				var telC=$("#tel-su").val();
				
				var telInput = $("#tel_certi_input").val();
				
				if (telC == telInput) 
				{
					$("#telCheck").val(telC);
					$("#telcerti").val("1");
					
					$("#telmodal").modal('hide');
					
					document.getElementById("telCheckresult").style.display = 'inline-block';
					document.getElementById("telCheckresult").style.color = '#31B404';
					$("#telCheckresult").text("휴대전화 인증 완료");
				}
				else
				{
					
					$("#tel-context1").text("인증번호가 틀렸습니다. 다시 전송합니다.");
					var certi = makeid();
					$("#tel-certi-test").text(certi);
				    $('#tel-su').val(certi);
				}
			})
	})
	
	$(function(){
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
            <div class="body flex-item-grow">

                <div class="SignUp flex-col-center-up">

                    <div class="SignUp-box flex-col-center-up">
                        <div class="SignUp-header flex-col-center-center">
                            <div class="logo-box flex-item-grow flex-row-center-center">
                                <div class="logo-img">
                                    <img src="img/Logo.png" alt="이미지 없음">
                                </div>
                                <div class="logo-text">
                                    Sagyo
                                </div>
                            </div>
                        </div>
    
                        <form role="form" id="signUp-submit-form" action="insertuser.action" method="post" class="SignUp-body flex-col-left-up">

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    아이디*
                                </div>  
                                <input type="text" id="userId" name="userId" class="form-control input-245-40" placeholder="아이디를 입력해주세요">
                                <button type="button" class="btn" id="btn-check-id" value="0">아이디 중복확인</button>
                                <div class="div-check">
                                	<span class="span-check" id="span-check-id"></span>
                                </div>
                            </div>
                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    비밀번호*
                                </div>  
                                <input type="password" id="pwd" name="pwd" class="form-control input-245-40" placeholder="비밀번호를 입력해주세요">
                            </div>
                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    비밀번호 확인*
                                </div>
                                <input type="password" id="pwd2" name="pwd2" class="form-control input-245-40" placeholder="비밀번호를 다시 입력해주세요">
                                <div class="div-check">
                                	<span class="span-check" id="span-check-pw" value="0"></span>
                                </div>
                                
                                
                            </div>
                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    닉네임*
                                </div>
                                <input type="text" id="nickname" name="nickname" class="form-control input-245-40" placeholder="닉네임을 입력해주세요">
                                <button type="button" id="btn-check-nick" class="btn" value="0">닉네임 중복확인</button>
								<div class="div-check">
                                	<span class="span-check" id="span-check-nick"></span>
                                </div>
                            </div>                        
                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    이름*
                                </div>  
                                <input type="text" id ="name" name="name" class="form-control input-245-40" placeholder="이름을 입력해주세요">
                            </div>
                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    생년월일*
                                </div>
                                
                                <input type="text" id = "input-check-y" class="form-control input-75-40" placeholder="년도" style="width: 80px;"> &nbsp;
                                <select id="select-check-m" id = "select-check-m" class="form-control input-75-40" style="width: 80px">
                                	<option value="0" selected="selected">월</option>
                                	<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
                                </select> &nbsp;
                                <select id="select-check-d" class="form-control input-75-40" style="width: 80px">
                                <option> 일</option>
								</select>
									<input type="text" id="birth" name="birth" value="" style="display : none">
                            </div>
					<div class="sign_text"></div>


                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    성별
                                </div>
                                <div class="flex-row-left-center">
                                    <div class="radio-group">
                                        <input type="radio" value="GD00001" name="radio-check-gender"/>
                                        <label for="">남성</label>
                                    </div>
                                    &nbsp;&nbsp;
                                    <div class="radio-group">
                                        <input type="radio" value="GD00002" name="radio-check-gender"/>
                                        <label for="">여성</label>
                                        <input type="text" id="genderId" name="genderId" value="" style="display : none">
                                        
                                    </div>
                                </div>
                            </div>
                            

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    휴대전화
                                </div>
                                <div class="flex-row-left-center">
                                    <input type="text" id="tel1" class="form-control input-tel-010">&nbsp;-&nbsp;
                                    <input type="text" id="tel2" class="form-control input-tel">&nbsp;-&nbsp;
                                    <input type="text" id="tel3" class="form-control input-tel">
                                    <button type="button" id="telcerti" class="btn" data-toggle="modal" data-target="#telmodal" value="0">휴대전화 인증</button>
	                                <div class="tel-check">
	                                	<span id="telCheckresult"></span>
	                                	<input type="text" id="telCheck" name="telCheck" value="" style="display : none">
	                                	<input type="text" id="tel" name="tel" value="" style="display : none">
	                                	
	                                </div>
                                    
                                    
                                </div>
                            </div>


                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                     Email
                                </div>  
                                <input type="text" id="email" name="email" class="form-control input-245-40" placeholder="E-mail을 입력해주세요">
                                <button type="button" id="emailcerti" value="0" class="btn" data-toggle="modal" data-target="#emailmodal">Email인증</button>
                                 <div class="div-check">
                                 	<span id="emailCheckresult"></span>
	                                <input type="text" id="emailCheck" name="emailCheck" value="" style="display : none">
                                </div>
                                
                               
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    대표SNS
                                </div>  
                                <input type="text" id="sns" name="sns" class="form-control input-245-40" placeholder="대표SNS 주소를 입력해주세요">
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    만남장소1
                                </div>
                                <div class="box-245-40 div-addr">
									<button type="button" class="btn btn-check-cate1" id="addrSiName1" name="addrSiName1" value="1"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a1" data-placement="bottom">시·도</button>
									 
                                	<button type="button" class="btn btn-check-cate2" id="btn-check-gugun1" value="1"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a2" data-placement="bottom">구·군</button>
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    만남장소2
                                </div>
                                <div class="box-245-40">
                                    <button type="button" class="btn btn-check-cate1" id="addrSiName2" name="addrSiName2" value="2"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a1" data-placement="bottom">시·도</button>
                                    
									<button type="button" class="btn btn-check-cate2" id="btn-check-gugun2" value="2"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a2" data-placement="bottom">구·군</button>
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    만남장소3
                                </div>
                                <div class="box-245-40">
                                   <button type="button" class="btn btn-check-cate1" id="addrSiName3" name="addrSiName3" value="3"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a1" data-placement="bottom">시·도</button>
                                    
                                    <button type="button" class="btn btn-check-cate2" id="btn-check-gugun3" value="3"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a2" data-placement="bottom">구·군</button>
                                    
                                    
                                </div>
                            </div>


                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    관심사1
                                </div>
                                <div class="box-245-40 div-inter">
                                    <button type="button" class="btn btn-check-cate3" id="btn-check-intermain1" value="intermain1"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b1" data-placement="bottom">대분류</button>
									 
                                	<button type="button" class="btn btn-check-cate4" id="btn-check-intersub1" value="intersub1"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b2" data-placement="bottom">소분류</button>
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    관심사2
                                </div>
                                <div class="box-245-40">
                                    <div class="box-245-40">
                                    <button type="button" class="btn btn-check-cate3" id="btn-check-intermain2" value="intermain2"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b1" data-placement="bottom">대분류</button>
									 
                                	<button type="button" class="btn btn-check-cate4" id="btn-check-intersub2" value="intersub2"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b2" data-placement="bottom">소분류</button>
                                </div>
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    관심사3
                                </div>
                                <div class="box-245-40">
                                    <div class="box-245-40">
                                    <button type="button" class="btn btn-check-cate3" id="btn-check-intermain3" value="intermain3"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b1" data-placement="bottom">대분류</button>
									 
                                	<button type="button" class="btn btn-check-cate4" id="btn-check-intersub3" value="intersub3"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b2" data-placement="bottom">소분류</button>
                                </div>
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    자기소개
                                </div>  
                                <textarea class="form-control" name="introduce" id="introduce" cols="30" rows="10"></textarea>
                            </div>
                        </form>
    
    
    

<!-- Content for Popover #1 -->    
<div id="a1" class="hidden">

    <div class="popover-heading">
       시·도 선택
    </div>
    
    
    <div class="popover-body" >
       <div id="inbody1">
		    <c:forEach var="addrsi" items="${addrsilist }">
				<button type="button" class="btn btn-120-35 btn-pop-sido" value="${addrsi.addrSiId1 }">${addrsi.addrSiName1 }</button>
			</c:forEach>
       </div> 

    </div>
</div>   


<div id="a2" class="hidden">
    <div class="popover-heading">
       구·군 선택
    </div>
    
    <div class="popover-body" >
       <div id="inbody1">
       		<button type="button" class="btn btn-120-35 btn-pop-gugun" value="서교동">서교동</button>
       		<button type="button" class="btn btn-120-35 btn-pop-gugun" value="서교동">서교동</button>
       		<button type="button" class="btn btn-120-35 btn-pop-gugun" value="서교동">서교동</button>
       		<button type="button" class="btn btn-120-35 btn-pop-gugun" value="삼산동">삼산동</button>
       		<button type="button" class="btn btn-120-35 btn-pop-gugun" value="삼산동">삼산동</button>
       		<button type="button" class="btn btn-120-35 btn-pop-gugun" value="삼산동">삼산동</button>
       </div> 

    </div>
</div>   

<div id="b1" class="hidden">
    <div class="popover-heading">
       구·군 선택
    </div>
 
    
    <div class="popover-body" >
       <div id="inbody">
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="스포츠">스포츠</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="음악&예술">음악&예술</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="공예&DIY">공예&DIY</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="사진&영상">사진&영상</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="요리&음료">요리&음료</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="학습">학습</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="스포츠">취업&재테크</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="음악&예술">미디어</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="공예&DIY">IT&테크</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="사진&영상">사진&영상</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="요리&음료">건강&애견</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intermain" value="학습">여행</button>
       </div> 
    </div>
</div>   

<div id="b2" class="hidden">
    <div class="popover-heading">
       구·군 선택
    </div>
    
    <div class="popover-body" >
       <div id="inbody">                                       
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="패러글라이딩">패러글라이딩</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="구기스포츠">구기스포츠</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="무도&댄스">무도&댄스</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="수영">수영</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="요가&발레">요가&발레</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="필라테스">필라테스</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="레저스포츠">레저스포츠</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="골프">골프</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="피아노">피아노</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="기타(악기)">기타(악기)</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="보컬">보컬</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="뮤지컬&연극">뮤지컬&연극</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="동양화">동양화</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="서양화 ">서양화</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="캘리그라피&드로잉">캘리그라피&드로잉</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="도예">도예</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="가죽공예">가죽공예</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="향수">향수</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="목공">목공</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="원예">원예</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="인테리어">인테리어</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="사진">사진</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="사진편집">사진편집</button>
       		<button type="button" class="btn btn-120-35 btn-pop-intersub" value="영상">영상</button>
       </div>                                                                             
                                                                                            
    </div>                                                                                  
</div>                                                                                  
                                                                                          


<!-- 인증모달 -->



<!-- Modal -->
<div class="modal fade" id="emailmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="emailmodal">이메일 인증</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      			  <span id="email-certi-test"></span>
      			  <br>
			      <span id ="email-context1">인증코드가 발송되었습니다.</span>
			      <br>
			      <span id ="email-context2">전송된 코드를 입력해주세요.</span>
				<div>
					<input type="text" class="form-control input-245-40" id="email_certi_input">
				</div>
      </div>
      <div class="modal-footer">
        <button type="button" id ="email-re" class="btn btn-secondary">다시전송</button>
        <button type="button" id ="email-su" class="btn btn-primary" value="">확인</button>
      </div>
    </div>
  </div>
</div>




<div class="modal fade" id="telmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="telmodal">휴대폰 인증</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      			  <span id="tel-certi-test"></span>
      			  <br>
			      <span id ="tel-context1">인증코드가 발송되었습니다.</span>
			      <br>
			      <span id ="tel-context2">전송된 코드를 입력해주세요.</span>
				<div>
					<input type="text" class="form-control input-245-40" id="tel_certi_input">
				</div>
      </div>
      <div class="modal-footer">
        <button type="button" id ="tel-re" class="btn btn-secondary">다시전송</button>
        <button type="button" id ="tel-su" class="btn btn-primary" value="">확인</button>
      </div>
    </div>
  </div>
</div>
    
    


                        <div class="SignUp-footer flex-col-center-center">
                            <button type="button" id="signup-submit" class="btn btn-orange btn-160-45">회원가입</button>
                        </div>
                    </div>




                </div>
            </div>
        </div>
    </div>













    
</body>
</html>