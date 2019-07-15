<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        .modal-backdrop {
			z-index: 1020;
		    display : none;
		}
    </style>
    <script type="text/javascript">
    
    $(window).load(function() {
	for (var i = 1; i < 4; i++) {
		console.log("지역" + i +" = " + $("#addrSiId"+i).val());
		console.log("관심" + i +" = " + $("#interMainId"+i).val);
			
			if ($("#addrSiId"+i).val() != "") {
				var a=0;
				a = i-1;
					var siid = $("#addrSiId"+i).val();
					var str = "";
					 $.ajax({
		                   url: '<%=cp %>/addrguajax.action',
		                   type: 'GET',
		                   dataType: 'html',
		                   data : {'siid': siid}
		                }).done(function(result){
		                  
							$("#inbodyB"+a).empty();
							$("#inbodyB"+a).append(result);
		                }); 
			}
			
			if ($("#interMainId"+i).val != "") {
				var d = 0;
				d = i;
					var mainid = $("#interSubId"+i).val();
					$.ajax({
							url: '<%=cp %>/intersubajax.action',
							type: 'GET',
							dataType: 'html',
							data: {'mainid': mainid}
						}).done(function(result) {
							$("#inbodyB"+d).empty();
							$("#inbodyD"+d).append(result);
						})
			
			console.log("----------------------------");
		}
    	
    	
		var hiddenM = $("#hiddenMonth").val().charAt(1);
		var hiddenD = $("#hiddenDay").val();
		$("#select-check-m option:eq("+hiddenM+")").attr("selected", "selected");
		
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
		
		for (var count = 10; count <= arrM[$("#select-check-m").val() - 1]; count++) 
		{
			var option = $("<option value = \"" + count + "\">" + count + ' 일' + "</option>");
			$("#select-check-d").append(option);
		}
		$("#select-check-d option:eq("+hiddenD+")").attr("selected", "selected");
		
		var year = $("#input-check-y").val();
		var month = $("#select-check-m").val();
		var day = $("#select-check-d").val();
		var birth = year + month + day;
		$("#birth").val(birth);
		console.log("생일 : " + $("#birth").val());
		
		var gender = $("#genderId").val();
		
		if (gender == '남자')
		{
			$('input:radio[name="radio-check-gender"][value="GD00001"]').prop('checked', true);
			$('#genderId').val('GD00001');
		}
		else if(gender == '여자')
		{
			$('input:radio[name="radio-check-gender"][value="GD00002"]').prop('checked', true);
			$('#genderId').val('GD00002');
		}
		
		var tel = $("#tel1").val() + "-" + $("#tel2").val() + "-" + $("#tel3").val();
		$("#tel").val(tel);
		console.log("전화번호 : " + $("#tel").val());
		console.log("시 1 ID: " + $("#addrSiId1").val());
		console.log("시 2 ID: " + $("#addrSiId2").val());
		console.log("시 3 ID: " + $("#addrSiId3").val());
		
		console.log("대 1 ID: " + $("#interMainId1").val());
		console.log("대 2 ID: " + $("#interMainId2").val());
		console.log("대 3 ID: " + $("#interMainId3").val());
		
		

		}
	})
	$(document).ready(function(){
		
		
		
		$("#profileM-btn").click(function() {
			
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
			var addrsi2 = $("#addrSiId2").val();
			var addrgu2 = $("#addrGuId2").val();
			var addrsi3 = $("#addrSiId3").val();
			var addrgu3 = $("#addrGuId3").val();
			
			var intermain1 = $("#interMainId1").val();
			var intersub1 = $("#interSubId1").val();
			var intermain2 = $("#interMainId2").val();
			var intersub2 = $("#interSubId2").val();
			var intermain3 = $("#interMainId3").val();
			var intersub3 = $("#interSubId3").val();
			
			
			
			
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
			console.log("시 주소 ID : " + addrsi2);
			console.log("구 주소 ID : " + addrgu2);
			console.log("시 주소 ID : " + addrsi3);
			console.log("구 주소 ID : " + addrgu3);
			
			
			console.log("대 분류 ID : " + intermain1);
			console.log("소 분류 ID : " + intersub1);			
			console.log("대 분류 ID : " + intermain2);
			console.log("소 분류 ID : " + intersub2);	
			console.log("대 분류 ID : " + intermain3);
			console.log("소 분류 ID : " + intersub3);	
			console.log("=============================================");	
			
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
				var form = document.getElementById("update-submit-form");
				alert("회원가입 완료 접근");
				/* form.submit(); */
			}
			
		})
		
		function makeid()
		{
		    var text = "";
		    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

		    for( var i=0; i < 5; i++ )
		        text += possible.charAt(Math.floor(Math.random() * possible.length));

		    return text;
		}
		
		
		
		$("#btn-check-id").click(function()
		{
			var inputid = $("#userId").val();
			
			var guid = "<%=(String)session.getAttribute("userId")%>";
			
			alert(guid)
			
			if (inputid == guid) {
				document.getElementById("span-check-id").style.display = 'block';
				document.getElementById("span-check-id").style.color = '#31B404';
				$("#span-check-id").text("이전 아이디 입니다. 사용하실려면 넘어가세요.");
				$("#btn-check-id").val("1");
				return false;
			}
			
			if (inputid == "") {
				document.getElementById("span-check-id").style.display = 'block';
				document.getElementById("span-check-id").style.color = '#DF0101';
				$("#span-check-id").text("아이디를 입력해주세요.");
				return false;
			}
			
			$.ajax({
				url : "<%=cp %>/profileidcheck.action",
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
		
		$("#btn-check-GuPwd").click(function()
		{
			var gupwd = $("#gupwd").val();
			
			if (gupwd == "") {
				document.getElementById("span-check-id").style.display = 'block';
				document.getElementById("span-check-id").style.color = '#DF0101';
				$("#span-check-GuPwd").text("비밀번호를 입력해주세요.");
				return false;
			}
			
			$.ajax({
				url : "<%=cp %>/profilegupwdcheck.action",
				type : "post",
				data : {'gupwd': gupwd},
				success : function(count)
				{
					console.log(count);
					
					if (count == 0) {
						document.getElementById("span-check-GuPwd").style.display = 'block';
						document.getElementById("span-check-GuPwd").style.color = '#DF0101';
						$("#btn-check-GuPwd").val("1");
						$("#span-check-GuPwd").text("비밀번호가 틀립니다. 대문자 소문자 확인해주세요.");
					}
					else {
						document.getElementById("span-check-GuPwd").style.display = 'block';
						document.getElementById("span-check-GuPwd").style.color = '#31B404';
						$("#span-check-GuPwd").text("비밀번호 확인 성공.");
						
						$("#pwd").removeAttr("readonly");
						$("#pwd2").removeAttr("readonly");
					}
				}
			})
			
		})
		
		
		$("#pwd, #pwd2").keyup(function() {
				
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
		
		
		$("#btn-check-nick").click(function(){
				var inputnick = $("#nickname").val();
				if (inputnick == "") 
				{
					document.getElementById("span-check-nick").style.display = 'inline-block';
					document.getElementById("span-check-nick").style.color = '#DF0101';
					$("#span-check-nick").text("닉네임을 입력해주세요.");
					return false;
				}
				$.ajax({
					url : "<%=cp %>/gunickcheck.action",
					type : "post",
					data : {'nickname': inputnick},
					success : function(count)
					{
						if (count == 1) 
						{
							document.getElementById("span-check-nick").style.display = 'inline-block';
							document.getElementById("span-check-nick").style.color = '#31B404';
							$("#btn-check-nick").val("1");
							$("#span-check-nick").text("이전 닉네임입니다. 사용하실려면 넘어가세요.");
							return false;
						}
					}
				
				})
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
				
				for (var count = 10; count <= arrM[$("#select-check-m").val() - 1]; count++) 
				{
					var option = $("<option value = \"" + count + "\">" + count + ' 일' + "</option>");
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
				$("#birth").val(birth);
			})
			$("#select-check-d, #select-check-m").change(function()
			{
				var year = $("#input-check-y").val();
				var month = $("#select-check-m").val();
				var day = $("#select-check-d").val();
				var birth = year + month + day;
				$("#birth").val(birth);
				console.log($("#birth").val());
			})
			
			$("input:radio[name=radio-check-gender]").click(function()
			{
				$("#genderId").val($(this).val());
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
                            <div><a class="navclick" href="myprofile.action">프로필</a></div>
                            <div><a class="navnonclick" href="mymessagerecevie.action">쪽지함</a></div>
                            <div><a class="navnonclick" href="mybadge.action">뱃지</a></div>
                            <div><a class="navnonclick" href="myfollowing.action">팔로우</a></div>
                            <div><a class="navnonclick" href="#">내모임</a></div>
                        </div>

                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                프로필
                            </div>

                            <div class="MyPage-body-body">
                            <c:forEach var="List" items="${myPageList }" varStatus="status">    
                                   
                                     <form role="form" id="update-submit-form" name="update-submit-form" action="updateprofile.action" method="post" class="MyProfile-body flex-col-left-up">

                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    아이디*
                                                </div>  
                                                <input type="text" id="userId" name="userId" class="form-control input-245-40" value="${List.userId }" placeholder="아이디를 입력해주세요" readonly = "readonly">
                                                
                                            </div>
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    기존 비밀번호*
                                                </div>  
                                                <input type="password" id="gupwd" name="gupwd" class="form-control input-245-40" placeholder="기존 비밀번호를 입력해주세요">
                                                <button type="button" class="btn" id="btn-check-GuPwd" value="0">비밀번호 확인</button>
                                                <div class="div-check">
                                					<span class="span-check" id="span-check-GuPwd"></span>
                                				</div>
                                            </div>
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    수정 비밀번호*
                                                </div>  
                                                <input type="password" id="pwd" name="pwd" class="form-control input-245-40" placeholder="비밀번호를 입력해주세요" readonly="readonly">
                                            </div>
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    수정 비밀번호 확인*
                                                </div>  
                                                <input type="password" id="pwd2" name="pwd2" class="form-control input-245-40" placeholder="비밀번호 확인을 해주세요" readonly="readonly">
                                                
                                                <div class="div-check">
				                                	<span class="span-check" id="span-pwd-check"></span>
				                                	<input type="hidden" id="pwdCheck" name="pwdCheck" value="0">
				                                </div>
                                            </div>
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    닉네임*
                                                </div>  
                                                <input type="text" id="nickname" name="nickname" class="form-control input-245-40" value="${List.nickname }" placeholder="닉네임을 입력해주세요">
                                                <button type="button" id="btn-check-nick" class="btn" value="0">닉네임 중복확인</button>
												<div class="div-check">
				                                	<span class="span-check" id="span-check-nick"></span>
				                                </div>
                                            </div>                        
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    이름*
                                                </div>  
                                                <input type="text" id="name" name="name" class="form-control input-245-40" value="${List.name }" placeholder="이름을 입력해주세요">
                                            </div>
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    생년월일
                                                </div>  
                                                <input type="hidden" id="hiddenMonth" name="hiddenMonth" value="${fn:split(fn:substring(List.birth, 2,10),'-')[1]}">
                                                <input type="hidden" id="hiddenDay" name="hiddenDay" value="${fn:split(fn:substring(List.birth, 2,10),'-')[2]}" >
                                                
                                            <input type="text" id = "input-check-y" class="form-control input-75-40" placeholder="년도" style="width: 80px;" 
                                            value="${fn:split(fn:substring(List.birth, 0,10),'-')[0]}"> &nbsp;
				                                <select id="select-check-m" id = "select-check-m" class="form-control input-75-40" style="width: 80px">
				                                	<option value="0">월</option>
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
                
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    성별
                                                </div>
                                                <div class="flex-row-left-center">
				                                    <div class="radio-group">
				                                        <input type="radio" name="radio-check-gender" value="GD00001" checked=""/>
				                                        <label for="">남성</label>
				                                    </div>
				                                    &nbsp;&nbsp;
				                                    <div class="radio-group">
				                                        <input type="radio" name="radio-check-gender" value="GD00002" checked=""/>
				                                        <label for="">여성</label>
				                                    </div>
				                                    <input type="hidden" id="genderId" name="genderId" value="${List.genderId}">
			                                	</div>
                                            </div>
                
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    휴대전화
                                                </div>
                                                <div class="flex-row-left-center">
                                                    <input type="text" id="tel1" name="tel1" class="form-control input-tel-010" value="${fn:split(List.tel,'-')[0] }">&nbsp;-&nbsp;
                                                    <input type="text" id="tel2" name="tel2" class="form-control input-tel" value="${fn:split(List.tel,'-')[1] }">&nbsp;-&nbsp;
                                                    <input type="text" id="tel3" name="tel3" class="form-control input-tel" value="${fn:split(List.tel,'-')[2] }">
                                                </div>
                                                <button type="button" id="telcerti" class="btn" data-toggle="modal" data-target="#telmodal" value="0">휴대전화 인증</button>
				                                <div class="tel-check">
				                                	<span id="telCheckresult"></span>
				                                	<input type="hidden" id="telCheck" name="telCheck" value="">
				                                	<input type="hidden" id="tel" name="tel" value="">
				                                </div>
                                            </div>
                
                
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    Email
                                                </div>  
                                                <input type="text" id="email" name="email" class="form-control input-245-40" value="${List.email}" placeholder="이메일를 입력해주세요">
                                                <button type="button" id="emailcerti" value="0" class="btn" data-toggle="modal" data-target="#emailmodal">Email인증</button>
					                                <div class="div-check">
					                                 	<span id="emailCheckresult"></span>
						                                <input type="text" id="emailCheck" name="emailCheck" value="" style="display : none">
					                                </div>
                                            </div>
                
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    대표SNS
                                                </div>  
                                                <input type="text" id="sns" name="sns" class="form-control input-245-40" value="${List.sns}" placeholder="SNS를 입력해주세요">
                                            </div>
                
                                             <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    만남장소1
                                                </div>
                                                <div class="box-245-40">
                                                    
												<c:choose>
												    <c:when test="${not empty myPageAddrList[status.index].addrSiName1 }">
												        <button type="button" class="form-control input-150-40 btn-check-cate1" id="addrSiName1" name="addrSiName1" value="1"
												        tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#a1" data-placement="bottom">${myPageAddrList[status.index].addrSiName1 }</button>
	                                                    
	                                                    <button type="button" class="form-control input-90-40 btn-check-cate2" id="btn-check-gugun1" name="btn-check-gugun1" value="1"
	                                                    tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#b1" data-placement="bottom">${myPageAddrList[status.index].addrGuName1 }</button>
												    </c:when>
												    <c:when test="${empty myPageAddrList[status.index].addrSiName1 }">
												         <button type="button" class="form-control input-150-40 btn-check-cate1" id="addrSiName1" name="addrSiName1" value="1"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#a1" data-placement="bottom">시·도</button>
														 
					                                	<button type="button" class="form-control input-90-40 btn-check-cate2" id="btn-check-gugun1" value="1"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#b1" data-placement="bottom">구·군</button>
														 
												    </c:when>
												    <c:otherwise>
												        오류
												    </c:otherwise>
												</c:choose>
												<input type="hidden" id="addrSiId1" name="addrSiId1" value="${myPageAddrList[status.index].addrSiId1 }">
												<input type= "hidden" id="addrGuId1" name="addrGuId1" value="${myPageAddrList[status.index].addrGuId1 }">
												<input type= "hidden" id="addrGuName1" name="addrGuName1" value="${myPageAddrList[status.index].addrGuName1 }">
                                                </div>
                                            </div>
                                            
											

                                            
                                            
                							<div class="MyProfile-input-group">
                                            	<div class="MyProfile-input-group-label">
                                                    만남장소2
                                                </div>
                                                <div class="box-245-40">
                                                
                                                <c:choose>
												    <c:when test="${not empty myPageAddrList[status.index].addrSiName2 }">
												        <button type="button" class="form-control input-150-40 btn-check-cate1" id="addrSiName2" name="addrSiName2" value="2"
												        tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#a2" data-placement="bottom">${myPageAddrList[status.index].addrSiName2 }</button>
	                                                    
	                                                    <button type="button" class="form-control input-90-40 btn-check-cate2" id="btn-check-gugun2" name="btn-check-gugun2" value="2"
	                                                    tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#b2" data-placement="bottom">${myPageAddrList[status.index].addrGuName2 }</button>
												    </c:when>
												    <c:when test="${empty myPageAddrList[status.index].addrSiName2 }">
												         <button type="button" class="form-control input-150-40 btn-check-cate1" id="addrSiName2" name="addrSiName2" value="2"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#a2" data-placement="bottom">시·도</button>
														 
					                                	<button type="button" class="form-control input-90-40 btn-check-cate2" id="btn-check-gugun2" value="2"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#b2" data-placement="bottom">구·군</button>
												    </c:when>
												    <c:otherwise>
												        오류
												    </c:otherwise>
												</c:choose>
												<input type="hidden" id="addrSiId2" name="addrSiId2" value="${myPageAddrList[status.index].addrSiId2 }">
												<input type= "hidden" id="addrGuId2" name="addrGuId2" value="${myPageAddrList[status.index].addrGuId2 }">
												<input type= "hidden" id="addrGuName2" name="addrGuName2" value="${myPageAddrList[status.index].addrGuName2 }">
                                                </div>
                                            </div>
                							
                							
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    만남장소3
                                                </div>
                                                <div class="box-245-40">
                                                 <c:choose>
												    <c:when test="${not empty myPageAddrList[status.index].addrSiName3 }">
												        <button type="button" class="form-control input-150-40 btn-check-cate1" id="addrSiName3" name="addrSiName3" value="3"
												        tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#a3" data-placement="bottom">${myPageAddrList[status.index].addrSiName3 }</button>
	                                                    
	                                                    <button type="button" class="form-control input-90-40 btn-check-cate2" id="btn-check-gugun3" name="btn-check-gugun3" value="3"
	                                                    tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#b3" data-placement="bottom">${myPageAddrList[status.index].addrGuName3 }</button>
												    </c:when>
												    <c:when test="${empty myPageAddrList[status.index].addrSiName3 }">
												         <button type="button" class="form-control input-150-40 btn-check-cate1" id="addrSiName3" name="addrSiName3" value="3"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#a3" data-placement="bottom">시·도</button>
														 
					                                	<button type="button" class="form-control input-90-40 btn-check-cate2" id="btn-check-gugun3" value="3"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#b3" data-placement="bottom">구·군</button>
												    </c:when>
												    <c:otherwise>
												        오류
												    </c:otherwise>
												</c:choose>
												<input type="hidden" id="addrSiId3" name="addrSiId3" value="${myPageAddrList[status.index].addrSiId3 }">
                                                <input type= "hidden" id="addrGuId3" name="addrGuId3" value="${myPageAddrList[status.index].addrGuId3 }">
												<input type= "hidden" id="addrGuName3" name="addrGuName3" value="${myPageAddrList[status.index].addrGuName3 }">  
                                                </div>
                                            </div>
                							
                							
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    관심사1
                                                </div>
                                                <div class="box-245-40">
                                                
                                                <c:choose>
												    <c:when test="${not empty myPageInterList[status.index].interMainName1 }">
												        <button type="button" class="form-control input-120-40 btn-check-cate3" id="interMainName1" name="interMainName1" value="1"
												        tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#c1" data-placement="bottom">${myPageInterList[status.index].interMainName1 }</button>
	                                                    
	                                                    <button type="button" class="form-control input-120-40 btn-check-cate4" id="btn-check-sub1" name="btn-check-gugun1" value="1"
	                                                    tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#d1" data-placement="bottom">${myPageInterList[status.index].interSubName1 }</button>
												    </c:when>
												    <c:when test="${empty myPageInterList[status.index].interMainName1 }">
												         <button type="button" class="form-control input-120-40 btn-check-cate3" id="interMainName1" name="interMainName1" value="1"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#c1" data-placement="bottom">대 주제</button>
														 
					                                	<button type="button" class="form-control input-120-40 btn-check-cate4" id="btn-check-sub1" name="btn-check-gugun1" value="1"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#d1" data-placement="bottom">소 주제</button>
														 
												    </c:when>
												    <c:otherwise>
												        오류
												    </c:otherwise>
												</c:choose>
												<input type="hidden" id="interMainId1" name="interMainId1" value="${myPageInterList[status.index].interMainId1 }">
												<input type= "hidden" id="interSubId1" name="interSubId1" value="${myPageInterList[status.index].interSubId1 }">
												<input type= "hidden" id="interSubName1" name="interSubName1" value="${myPageInterList[status.index].interSubName1 }">
												
												
                                                </div>
                                            </div>
                							
                							
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    관심사2
                                                </div>
                                                <div class="box-245-40">
                                                <c:choose>
												    <c:when test="${not empty myPageInterList[status.index].interMainName2 }">
												        <button type="button" class="form-control input-120-40 btn-check-cate3" id="interMainName2" name="interMainName2" value="2"
												        tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#c2" data-placement="bottom">${myPageInterList[status.index].interMainName2 }</button>
	                                                    
	                                                    <button type="button" class="form-control input-120-40 btn-check-cate4" id="btn-check-sub2" name="btn-check-gugun2" value="2"
	                                                    tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#d2" data-placement="bottom">${myPageInterList[status.index].interSubName2 }</button>
												    </c:when>
												    <c:when test="${empty myPageInterList[status.index].interMainName2 }">
												         <button type="button" class="form-control input-120-40 btn-check-cate3" id="interMainName2" name="interMainName2" value="2"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#c2" data-placement="bottom">대 주제</button>
														 
					                                	<button type="button" class="form-control input-120-40 btn-check-cate4" id="btn-check-sub2" name="btn-check-gugun2" value="2"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#d2" data-placement="bottom">소 주제</button>
														 
												    </c:when>
												    <c:otherwise>
												        오류
												    </c:otherwise>
												</c:choose>
												<input type="hidden" id="interMainId2" name="interMainId2" value="${myPageInterList[status.index].interMainId2 }">
												<input type= "hidden" id="interSubId2" name="interSubId2" value="${myPageInterList[status.index].interSubId2 }">
												<input type= "hidden" id="interSubName2" name="interSubName2" value="${myPageInterList[status.index].interSubName2 }">
												
                                                </div>
                                            </div>
                							
                							
                							
                							
                							
                                                <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    관심사3
                                                </div>
                                                <div class="box-245-40">
                                                <c:choose>
												    <c:when test="${not empty myPageInterList[status.index].interMainName3 }">
												        <button type="button" class="form-control input-120-40 btn-check-cate3" id="interMainName3" name="interMainName3" value="3"
												        tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#c3" data-placement="bottom">${myPageInterList[status.index].interMainName3 }</button>
	                                                    
	                                                    <button type="button" class="form-control input-120-40 btn-check-cate4" id="btn-check-sub3" name="btn-check-gugun3" value="3"
	                                                    tabindex="0" data-toggle="popover"
														data-trigger="focus" data-popover-content="#d3" data-placement="bottom">${myPageInterList[status.index].interSubName3 }</button>
												    </c:when>
												    <c:when test="${empty myPageInterList[status.index].interMainName3 }">
												         <button type="button" class="form-control input-120-40 btn-check-cate3" id="interMainName3" name="interMainName3" value="3"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#c3" data-placement="bottom">대 주제</button>
														 
					                                	<button type="button" class="form-control input-120-40 btn-check-cate4" id="btn-check-sub3" name="btn-check-gugun3" value="3"
														 tabindex="0" data-toggle="popover"
														 data-trigger="focus" data-popover-content="#d3" data-placement="bottom">소 주제</button>
														 
												    </c:when>
												    <c:otherwise>
												        오류
												    </c:otherwise>
												</c:choose>
												<input type="hidden" id="interMainId3" name="interMainId3" value="${myPageInterList[status.index].interMainId3 }">
												<input type= "hidden" id="interSubId3" name="interSubId3" value="${myPageInterList[status.index].interSubId3 }">
												<input type= "hidden" id="interSubName3" name="interSubName3" value="${myPageInterList[status.index].interSubName3 }">
												
                                                </div>
                                            </div>
                
                                            <div class="MyProfile-input-group">
                                                <div class="MyProfile-input-group-label">
                                                    자기소개
                                                </div>  
                                                <textarea class="form-control" name="introduce" id="introduce" cols="30" rows="10">${List.introduce }</textarea>
                                            </div>
                                        </form>
										</c:forEach>
                                        <div class="MyProfileModify-footer flex-row-center-center">
                                            <button type="button" id="profileM-btn" name="profileM-btn" class="btn btn-orange btn-160-45 modifyOk">수정완료</button>
                                        </div>

                            </div>

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