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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				var useridCheck = $("#btn-check-id").val();
				
				
				var pwd1 = $("#pwd").val();
				var pwd2 = $("#pwd2").val();
				var pwdCheck = $("#pwdCheck").val();
				
				var nickname = $("#nickname").val();
				var nicknameCheck = $("#btn-check-nick").val(); /* 이게 0이면 중복 */
				
				var name = $("#name").val();
				
				var birth = $("#birth").val();
				
				var genderid = $("#genderId").val();
				
				var tel = $("#tel").val();
				var telCheck = $("#telCheck").val();
				
				var email = $("#email").val();
				var emailCheck = $("#emailCheck").val();
				
				var sns = $("#sns").val();
				
				var addrsi1 = $("#addrSiId1").val();
				var addrgu1 = $("#addrGuId1").val();
				
				var intermain1 = $("#interMainId1").val();
				var intersub1 = $("#interSubId1").val();
				
				
				
				
				
				console.log("유저 아이디 : " + userid);
				console.log("유저 아이디 중복 체크 : " + useridCheck);
				
				console.log("비밀번호 1 : " + pwd1);
				console.log("비밀번호 2 : " + pwd2);
				console.log("비밀번호 확인 : " + pwdCheck);
				
				console.log("닉네임 : " + nickname);
				console.log("닉네임 체크 : " + nicknameCheck);
				
				console.log("이름 : " + name);
				
				console.log("생년월일 : " + birth);
				
				console.log("성별 : " + genderid);
				
				console.log("휴대전화 : " + tel);
				console.log("휴대전화 체크 : " + telCheck);
				
				console.log("이메일 : " + email);
				console.log("이메일 체크 : " + emailCheck);
				
				console.log("SNS : " + sns);

				console.log("시 주소 ID : " + addrsi1);
				console.log("구 주소 ID : " + addrgu1);

				console.log("대 분류 ID : " + intermain1);
				console.log("소 분류 ID : " + intersub1);				
				console.log("===============================================================");	
				
				if (userid == "" || pwd1 == "" || pwd2 =="" || nickname == "" || name == "" || birth == "" || tel == "" || email == ""
						|| addrgu1 == "" || intersub1 == "")
				{
					alert("필수정보가 누락되었습니다.");
					return false;
				}
				else if(useridCheck == "0")
				{
					alert("아이디 중복 확인을 완료해주세요.");
					return false;
				}
				else if(pwdCheck == "0")
				{
					alert("비밀번호 입력 확인을 완료해주세요.");
					return false;
				}
				else if(useridCheck == "0")
				{
					alert("닉네임 입력 확인을 완료해주세요.");
					return false;
				}
				else if(telCheck == "")
				{
					alert("휴대전화 인증을 완료해주세요.");
					return false;
				}
				else if(emailCheck == "")
				{
					alert("이메일 인증을 완료해주세요.");
					return false;
				}
				else
				{
					alert("회원가입 완료 접근");
					var form = document.getElementById("signUp-submit-form");
					form.submit();
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
					document.getElementById("span-pwd-check").style.display = 'inline-block';
					document.getElementById("span-pwd-check").style.color = '#DF0101';
					$("#span-pwd-check").text("비밀번호를 입력해주세요.");		
				}
				
				if ($("#pwd2").val() != "")
				{
					if ($("#pwd2").val() == $("#pwd").val()) {
						document.getElementById("span-pwd-check").style.display = 'inline-block';
						document.getElementById("span-pwd-check").style.color = '#31B404';
						$("#pwdCheck").val("1");
						$("#span-pwd-check").text("사용하실수 있습니다.");
					} else {
						document.getElementById("span-pwd-check").style.display = 'inline-block';
						document.getElementById("span-pwd-check").style.color = '#DF0101';
						$("#pwdCheck").val("0");
						$("#span-pwd-check").text("비밀번호가 일치하지 않습니다.");
					}
				}
			})
			
			
			$("#pwd2").keyup(function() {

				if ($("#pwd2").val() == $("#pwd").val()) {
					document.getElementById("span-pwd-check").style.display = 'inline-block';
					document.getElementById("span-pwd-check").style.color = '#31B404';
					$("#pwdCheck").val("1");
					$("#span-pwd-check").text("사용하실수 있습니다.");
				} else {
					document.getElementById("span-pwd-check").style.display = 'inline-block';
					document.getElementById("span-pwd-check").style.color = '#DF0101';
					$("#pwdCheck").val("0");
					$("#span-pwd-check").text("비밀번호가 일치하지 않습니다.");
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
			
			
			$("input:radio[name=radio-check-gender]").change(function()
			{
				var test =  $('input:radio[name="radio-check-gender"]:checked').val();
				$("#genderId").val(test);
			})
			
			var a;
			$(".btn-check-cate1").click(function() {
				a = $(this).val();
				console.log("a = " + a);
				$(".btn-pop-sido").click(function() {
					
					$("#addrSiName"+a).text($(this).text());
					
					var siid = $(this).val();
					var str = "";
					 $.ajax({
		                   url: '<%=cp %>/addrguajax.action',
		                   type: 'GET',
		                   dataType: 'html',
		                   data : {'siid': siid}
		                }).done(function(result){
		                  
							console.log('성공');
							$("#inbodyB"+a).empty();
							$("#inbodyB"+a).append(result);
		                }); 
				})
				
			})
			
			
			
			
			var c;
			$(".btn-check-cate2").click(function()
			{
				c = $(this).val();
				$(".btn-pop-gu").click(function()
				{
					$("#btn-check-gugun"+c).text($(this).text());
					 
					$("#addrGuId"+c).val($(this).val());
					$("#addrGuName"+c).val($(this).text());
					
					console.log("구 아이디 = " + $("#addrGuId"+c).val());
					console.log("구 이름 = " + $("#addrGuName"+c).val());
				})
			})
			
			
			
			/* interSubName1 */
			var d;
			$(".btn-check-cate3").click(function() {
				d = $(this).val();
				
				$(".btn-pop-main").click(function() {
					$("#interMainName"+d).text($(this).text());
					
					var mainid = $(this).val();
					
					$.ajax({
							url: '<%=cp %>/intersubajax.action',
							type: 'GET',
							dataType: 'html',
							data: {'mainid': mainid}
						}).done(function(result) {
							console.log('성공')
							
							$("#inbodyD"+d).empty();
							$("#inbodyD"+d).append(result);
						})
				})
			})
			
			var e;
			$(".btn-check-cate4").click(function()
			{
				e = $(this).val();
				console.log(e);
				$(".btn-pop-sub").click(function()
				{
					$("#btn-check-sub"+e).text($(this).text());
					 
					$("#interSubId"+e).val($(this).val());
					$("#interSubName"+e).val($(this).text());
					
					console.log("서브 아이디 = " + $("#interSubId"+e).val());
					console.log("서브 이름 = " + $("#interSubName"+e).val());
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
    
                        <form role="form" id="signUp-submit-form" name="signUp-submit-form" action="insertuser.action" method="post" class="SignUp-body flex-col-left-up">

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
                                	<span class="span-check" id="span-pwd-check"></span>
                                	<input type="hidden" id="pwdCheck" name="pwdCheck" value="0">
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
                                        <input type="radio" name="radio-check-gender" value="GD00001" />
                                        <label for="">남성</label>
                                    </div>
                                    &nbsp;&nbsp;
                                    <div class="radio-group">
                                        <input type="radio" name="radio-check-gender" value="GD00002" />
                                        <label for="">여성</label>
                                        <input type="hidden" id="genderId" name="genderId" value="">
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
									 data-trigger="focus" data-popover-content="#b1" data-placement="bottom">구·군</button>
									 <input type= "hidden" id="addrGuId1" name="addrGuId1" value="">
									 <input type= "hidden" id="addrGuName1" name="addrGuName1" value="">
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    만남장소2
                                </div>
                                <div class="box-245-40">
                                    <button type="button" class="btn btn-check-cate1" id="addrSiName2" name="addrSiName2" value="2"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a2" data-placement="bottom">시·도</button>
                                    
									<button type="button" class="btn btn-check-cate2" id="btn-check-gugun2" value="2"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b2" data-placement="bottom">구·군</button>
									 <input type= "hidden" id="addrGuId2" name="addrGuId2" value="">
									 <input type= "hidden" id="addrGuName2" name="addrGuName2" value="">
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    만남장소3
                                </div>
                                <div class="box-245-40">
                                   <button type="button" class="btn btn-check-cate1" id="addrSiName3" name="addrSiName3" value="3"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a3" data-placement="bottom">시·도</button>
                                    
                                    <button type="button" class="btn btn-check-cate2" id="btn-check-gugun3" value="3"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b3" data-placement="bottom">구·군</button>
									 <input type= "hidden" id="addrGuId3" name="addrGuId3" value="">
									 <input type= "hidden" id="addrGuName3" name="addrGuName3" value="">
                                </div>
                            </div>


                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    관심사1
                                </div>
                                <div class="box-245-40 div-inter">
                                    <button type="button" class="btn btn-check-cate3" id="interMainName1" name="interMainName1" value="1"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#c1" data-placement="bottom">대분류</button>
									 
                                	<button type="button" class="btn btn-check-cate4" id="btn-check-sub1" name="btn-check-sub1" value="1"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#d1" data-placement="bottom">소분류</button>
									 <input type= "hidden" id="interSubId1" name="interSubId1" value="">
									 <input type= "hidden" id="interSubName1" name="interSubName1" value="">
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    관심사2
                                </div>
                                <div class="box-245-40">
                                    <div class="box-245-40">
                                    <button type="button" class="btn btn-check-cate3" id="interMainName2" name="interMainName2" value="2"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#c2" data-placement="bottom">대분류</button>
									 
                                	<button type="button" class="btn btn-check-cate4" id="btn-check-sub2" name="btn-check-sub2" value="2"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#d2" data-placement="bottom">소분류</button>
									 <input type= "hidden" id="interSubId2" name="interSubId2" value="">
									 <input type= "hidden" id="interSubName2" name="interSubName2" value="">
                                </div>
                                </div>
                            </div>

                            <div class="SignUp-input-group">
                                <div class="SignUp-input-group-label">
                                    관심사3
                                </div>
                                <div class="box-245-40">
                                    <div class="box-245-40">
                                    <button type="button" class="btn btn-check-cate3" id="interMainName3" name="interMainName3" value="3"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#c3" data-placement="bottom">대분류</button>
									 
                                	<button type="button" class="btn btn-check-cate4" id="btn-check-sub3" name="btn-check-sub3" value="3"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#d3" data-placement="bottom">소분류</button>
									 <input type= "hidden" id="interSubId3" name="interSubId3" value="">
									 <input type= "hidden" id="interSubName3" name="interSubName3" value="">
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
                            


                        <div class="SignUp-footer flex-col-center-center">
                            <button type="button" id="signup-submit" class="btn btn-orange btn-160-45">회원가입</button>
                        </div>
                    </div>




                </div>
            </div>
        </div>
    </div>
                        
                        
                        
                        
                        
<!-- Content for Popover #1 -->
<c:forEach var="i" begin="1" end="3">
	<div id="a${i}" class="hidden">
	    <div class="popover-heading">
	       시·도 선택
	    </div>
	    <div class="popover-body" >
	       <div id="inbodyA${i}">
			    <c:forEach var="addrsi" items="${addrsilist }" varStatus="status">
					<button type="button" id="si${status.index}" name="si${status.index}" class="btn btn-120-35 btn-pop-sido" value="${addrsi.addrSiId1 }">${addrsi.addrSiName1 }</button>
				</c:forEach>
	       </div> 
	
	    </div>
	</div>
</c:forEach>




<c:forEach var="j" begin="1" end="3">
<div id="b${j}" class="hidden">
    <div class="popover-heading">
       구·군 선택
    </div>
    
    <div class="popover-body" >
       <div id="inbodyB${j}">
       </div> 
    </div>
</div>   
</c:forEach>


<c:forEach var="k" begin="1" end="3">
	<div id="c${k}" class="hidden">
	    <div class="popover-heading">
	       대 분류 선택
	    </div>
	    <div class="popover-body" >
	       <div id="inbodyC${k}">
			    <c:forEach var="intermain" items="${intermainlist }" varStatus="status">
					<button type="button" id="main${status.index}" name="main${status.index}" class="btn btn-120-35 btn-pop-main" value="${intermain.interMainId1 }">${intermain.interMainName1 }</button>
				</c:forEach>
	       </div>
	
	    </div>
	</div>
</c:forEach>


<c:forEach var="l" begin="1" end="3">
<div id="d${l}" class="hidden">
    <div class="popover-heading">
       소 분류 선택
    </div>
    
    <div class="popover-body" >
       <div id="inbodyD${l}">
       </div> 
    </div>
</div>   
</c:forEach>




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
    














    
</body>
</html>