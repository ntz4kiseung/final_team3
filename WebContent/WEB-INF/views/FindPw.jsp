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
    
	<style type="text/css">
	.modal-backdrop {
	z-index: 1020;
    display : none;
	}
	</style>
    <link href="css/sagyo.css" rel="stylesheet">

   
    <script type="text/javascript">
    
    $(document).ready( function() {
    	$("#find-pw-email").hide();

		var key = 'tel';
        
        $("input:radio[name=tel-email]").click(function()
        { 
        	
            var radioCheck = $("input:radio[name=tel-email]:checked").val();
            
            if(radioCheck=="tel")
            {
                $("#find-pw-tel").show();
                $("#find-pw-email").hide(); 
                $("#name").val("");
                $("#email").val("");
                $("#name").attr('id','name2');
                $("#name1").attr('id','name');
                
                $("#name2").attr('name','name2');
                $("#name").attr('name','name');
                
                
                $("#userId").attr('id','userId2');
            	$("#userId1").attr('id','userId');
            	
            	$("#userId2").attr('name','userId2');
             	$("#userId").attr('name','userId');
             	
            	$("#find-pw-form").attr('action','findpwtelinsert.action');
            }
            else if(radioCheck=="email")
            { 
                $("#find-pw-tel").hide();
                $("#find-pw-email").show(); 
                $("#name").val("");
                $("#tel").val("");
                $("#name").attr('id','name1');
                $("#name2").attr('id','name');
                
                $("#name1").attr('name','name1');
                $("#name").attr('name','name');
                
                $("#userId").attr('id','userId1');
                $("#userId2").attr('id','userId');
                
                $("#userId1").attr('name','userId1')
                $("#userId").attr('name','userId');
                
                $("#find-pw-form").attr('action','findpwemailinsert.action');
                
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
        
        /* 임시비밀번호 제작 */
        function makepw()
		{
		    var text = "";
		    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

		    for( var i=0; i < 4; i++ )
		        text += possible.charAt(Math.floor(Math.random() * possible.length));
		    return text;
		}
        
        

		$("#tel-Check-btn").click(function()
		{
			var inputid = $("#userId").val();
			var inputname = $("#name").val();
			var inputtel = $("#tel").val();
			
			var findpwtel = [inputid ,inputname, inputtel];
			
			
			jQuery.ajaxSettings.traditional = true;
			
			if (inputid == "")
			{
				document.getElementById("find-pw-tel-span").style.display = 'block';
				document.getElementById("find-pw-tel-span").style.color = '#DF0101';
				$("#find-pw-tel-span").text("아이디를 입력해주세요.");
				return false;
				
			}
			else if (inputname == "") {
				document.getElementById("find-pw-tel-span").style.display = 'block';
				document.getElementById("find-pw-tel-span").style.color = '#DF0101';
				$("#find-pw-tel-span").text("이름을 입력해주세요.");
				return false;
			}
			else if (inputtel == ""){
				document.getElementById("find-pw-tel-span").style.display = 'block';
				document.getElementById("find-pw-tel-span").style.color = '#DF0101';
				$("#find-pw-tel-span").text("전화번호를 입력해주세요.");
				return false;
			}
			
			 
			$.ajax({
				
				url : "<%=cp %>/findpwtelcheck.action",
				type : "post",
				data : {'findpwtel': findpwtel},
				
				success : function(count)
				{

					console.log(count);
					if (count == 0) {
						document.getElementById("find-pw-tel-span").style.display = 'block';
						document.getElementById("find-pw-tel-span").style.color = '#DF0101';
						/* $("#btn-check-id").val("1"); */
						$("#find-pw-tel-span").text("아이디와 이름, 전화번호를 확인해주세요");

					}
					else
					{
						console.log("성공");
						var certi = makeid();
						$("#tel-certi-test").text(certi);
						
						document.getElementById("find-pw-tel-span").style.display = 'none';
						$('#telmodal').modal();
						$('#telCheck').val(certi);

					}
				}
			})
		})
		
		$("#tel-re").click(function() {
			
			var certi = makeid();
			$("#tel-certi-test").text(certi);
		    $('#telCheck').val(certi);
		})
		
		$("#tel-su").click(function() {
			
			var telInput = $("#tel_certi_input").val();
			var telC = $("#telCheck").val();
			if (telC == telInput) 
			{
				
				$("#telmodal").modal('hide');
				$("telCheck").val(telC);
				
				document.getElementById("find-pw-tel-span").style.display = 'block';
				document.getElementById("find-pw-tel-span").style.color = '#31B404';
				$("#tel-Check-btn").val(1);
				$("#find-pw-tel-span").text("인증이 성공하였습니다. 다음버튼을 눌러주세요.");
			}
			else
			{
				var certi = makeid();
				$("#tel-context1").text("인증번호가 틀렸습니다. 다시 전송합니다.");
				
				$('#telCheck').val(certi);
				
				$("#tel-certi-test").text(certi);
			}
		})
		
		
		/* 이메일 인증  --------------------------------------------------------------------------------------*/
		$("#email-Check-btn").click(function()
		{
			var inputid = $("#userId").val();
			var inputname = $("#name").val();
			var inputemail = $("#email").val();
			
				console.log(inputid + inputname + inputemail);
			
			var findpwemail = [inputid ,inputname, inputemail];
			if (inputid == "")
			{
				document.getElementById("find-pw-tel-span").style.display = 'block';
				document.getElementById("find-pw-tel-span").style.color = '#DF0101';
				$("#find-pw-tel-span").text("아이디를 입력해주세요.");
				return false;
			}
			else if (inputname == "") {
				document.getElementById("find-pw-email-span").style.display = 'block';
				document.getElementById("find-pw-email-span").style.color = '#DF0101';
				$("#find-pw-tel-span").text("이름을 입력해주세요.");
				return false;
			}
			else if (inputemail == ""){
				document.getElementById("find-pw-email-span").style.display = 'block';
				document.getElementById("find-pw-email-span").style.color = '#DF0101';
				$("#find-pw-tel-span").text("이메일을 입력해주세요.");
				return false;
			}
			
			jQuery.ajaxSettings.traditional = true;
			
			$.ajax({
				url : "<%=cp %>/findpwemailcheck.action",
				type : "post",
				data : {'findpwemail': findpwemail},
				success : function(count)
				{
					if (count == 0) {
						document.getElementById("find-pw-email-span").style.display = 'block';
						document.getElementById("find-pw-email-span").style.color = '#DF0101';
						$("#find-pw-email-span").text("이름과 이메일를 확인해주세요");
					}
					else
					{
						var certi = makeid();
						$("#email-certi-test").text(certi);
					    
						document.getElementById("find-pw-email-span").style.display = 'none';
						$('#emailmodal').modal();
						$('#emailCheck').val(certi);
					}
				}
			})
		})
		
		
		$("#email-re").click(function() {
			
			var certi = makeid();
			$("#email-certi-test").text(certi);
		    $('#emailCheck').val(certi);
		})
		
		$("#email-su").click(function() {
			var emailInput = $("#email_certi_input").val();
			var emailC=$("#emailCheck").val();
			console.log(emailInput+emailC);
			
			if (emailC == emailInput) 
			{
				$("#emailCheck").val(emailC);
				$("#emailmodal").modal('hide');
				
				document.getElementById("find-pw-email-span").style.display = 'block';
				document.getElementById("find-pw-email-span").style.color = '#31B404';
				$("#email-Check-btn").val(1);
				$("#find-pw-email-span").text("인증이 성공하였습니다. 다음버튼을 눌러주세요.");
			}
			else
			{
				$("#email-context1").text("인증번호가 틀렸습니다. 다시 전송합니다.");
				var certi = makeid();
				$("#email-certi-test").text(certi);
			    $('#emailCheck').val(certi);
			}
		})
		
		/*--------------------------------------------------------------------------------- 이메일 인증*/
		/* 제출  --------------------------------------------------------------------------------------*/
		
		$("#find-pw-btn").click(function(){
			
			if($("#email-Check-btn").val() != 1 && $("#tel-Check-btn").val() != 1)
			{
				alert("인증을 완료해주세요.");
				return false;
			}
			
			var temp = makepw();
			$("#pwd").val(temp);
			
			document.getElementById("find-pw-form").submit();
				
		})
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
            <div class="body flex-item-grow  flex-col-center-center">
                <div class="FindId flex-row-center-center">

                    <div class="box-725-400 flex-col-center-center">


                        <div class="box-725-400-header flex-row-left-center">
                            <div class="font-20">
                                비밀번호 찾기
                            </div>
                            <div>
                                &nbsp;&nbsp;휴대전화 혹은 이메일을 인증하시면 다음으로 진행할 수 있습니다.
                            </div>
                        </div>
                        <div class="box-725-400-body flex-col-left-center">
                        
                        
                        
                        
                        
                        
						<form action="findpwtelinsert.action" id="find-pw-form" name="find-pw-form" method="POST">
                            <div class="radio-box flex-row-left-center" id="find-pw-content">
                                <input type="radio" name="tel-email" value="tel" checked="checked">
                                <span>&nbsp;&nbsp;등록된 휴대전화로 찾기</span>
                            </div>
                            <div class="flex-item-grow flex-col-left-center FindId-input-box" id="find-pw-tel">
                                <div class="flex-row-left-center">
                                    <div>
                                        아이디
                                    </div>
                                    <input type="text" class="input-underline" id="userId" name="userId" value="">
                                </div>
                                <div class="flex-row-left-center">
                                    <div>
                                        이름
                                    </div>
                                    <input type="text" class="input-underline" id="name" name="name" value="">
                                </div>
                                <div class="flex-row-left-center">
                                    <div>
                                        전화번호
                                    </div>
                                    <input type="text" class="input-underline" id="tel" name="tel">
                                    <button type="button" class="btn" id="tel-Check-btn" name="tel-Check-btn" value="0">인증하기</button>
                               		<input type="hidden" id="telCheck" name="telCheck" value="" />
                                </div>
                                <div class="div-check">
                                	<span class="span-check" id="find-pw-tel-span"></span>
                                </div>
                            </div>










                            <div class="radio-box flex-row-left-center">
                                <input type="radio" name="tel-email" value="email">
                                <span>&nbsp;&nbsp;등록된 이메일로 찾기</span>
                            </div>
                            <div class="flex-item-grow flex-col-left-center FindId-input-box" id="find-pw-email">
                            	<div class="flex-row-left-center">
                                    <div>
                                        아이디
                                    </div>
                                    <input type="text" class="input-underline" id="userId2" name="userId2" value="">
                                </div>
                                <div class="flex-row-left-center">
                                    <div>
                                        이름
                                    </div>
                                    <input type="text" class="input-underline" id="name2" name="name2" value="">
                                </div>
                                <div class="flex-row-left-center">
                                    <div>
                                        이메일
                                    </div>
                                    <input type="text" class="input-underline" id="email" name="email" value="">
                                    <button type="button" class="btn" id="email-Check-btn" name="email-Check-btn" value="0">인증하기</button>
                                    <input type="hidden" id="emailCheck" name="emailCheck" value="">
                                </div>
                                <div class="div-check">
                                	<span class="span-check" id="find-pw-email-span"></span>
                                </div>
                            </div>
                            <input type="hidden" id="pwd" name="pwd" value="">
						</form>
						
						
						
						
						
						
						
						
                        </div>
                        <div class="box-725-400-footer flex-row-center-center">
                            <button type="button" id="find-pw-btn" name="find-pw-btn" class="btn btn-orange btn-160-45">다음</button>
                        </div>
                    </div>
                </div>
            </div>


      



			<div class="modal fade" id="telmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">휴대폰 인증</h5>
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
			
			
			
			
			<div class="modal fade" id="emailmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">E-mail 인증</h5>
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
        </div>
    </div>
</body>
</html>