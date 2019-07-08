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
    <link href="css/sagyo.css" rel="stylesheet">

   
    <script type="text/javascript">
        var sampleId = 'wing4465';
        var sampleNick = 'sist';
        var sampleCerti = '123';
        $(document).ready( function() {
            $("#email_search").hide();
            $("input:radio[name=idpw_search]").click(function() 
            { 
                var radioCheck = $("input:radio[name=idpw_search]:checked").val();
                if(radioCheck==0)
                {
                    $("#tel_search").show();
                    $("#email_search").hide();
                }
                else if(radioCheck==1)
                {
                    $("#tel_search").hide();
                    $("#email_search").show();
                }
            }) 
            
            $("#tel_check").click(function() {
                $('#tel_modal').modal();
            })
            
            $("#email_check").click(function() {
                $('#email_modal').modal();
            })
            
            $("#tel_submit").click(function() {
                var a = $("#tel_certi_input").val();
                
                if (a==sampleCerti) 
                {
                    $('#tel_modal').modal('hide');
                    
                    $("#tel_check").remove();
                    document.getElementById("certi_suc1").style.display = 'inline-block';
                    document.getElementById("certi_suc1").style.color = '#31B404';
                    $("#certi_suc1").text("인증에 성공하셧습니다.");	
                }
                else
                {
                    alert("인증번호를 다시 입력하세요.");
                }
            })
            
            $("#email_submit").click(function() {
                var a= $("#email_certi_input").val();
                if (a==sampleCerti) 
                {
                    $('#email_modal').modal('hide');
                    $("#email_check").remove();
                    document.getElementById("certi_suc2").style.display = 'inline-block';
                    document.getElementById("certi_suc2").style.color = '#31B404';
                    $("#certi_suc2").text("인증에 성공하셧습니다.");	
                }
                else
                {
                    alert("인증번호를 다시 입력하세요.");
                }
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

                            <div class="radio-box flex-row-left-center">
                                <input type="radio">
                                <span>&nbsp;&nbsp;등록된 휴대전화로 찾기</span>
                            </div>
                            <div class="flex-item-grow flex-col-left-center FindId-input-box">
                                <div class="flex-row-left-center">
                                    <div>
                                        아이디
                                    </div>
                                    <input type="text" class="input-underline">
                                </div>
                                <div class="flex-row-left-center">
                                    <div>
                                        이름
                                    </div>
                                    <input type="text" class="input-underline">
                                </div>
                                <div class="flex-row-left-center">
                                    <div>
                                        전화번호
                                    </div>
                                    <input type="text" class="input-underline">
                                    <button class="btn" id="tel_check">인증하기</button>
                                </div>
                            </div>

                            <div class="radio-box flex-row-left-center">
                                <input type="radio">
                                <span>&nbsp;&nbsp;등록된 이메일로 찾기</span>
                            </div>
                            <div>
                                <!-- 여기에 위에 있는거(휴대폰 찾기에서 FindId-input-box) 그대로 쓰면 됨.. -->
                            </div>

                        </div>


                        <div class="box-725-400-footer flex-row-center-center">
                            <button class="btn btn-orange btn-160-45">다음</button>
                        </div>
                    </div>
                </div>
            </div>


            
            <div id="tel_modal" class="modal fade" >
                <div class="modal-dialog">
                    <div class="modal-content">
                         <!-- header -->
                        <div class="modal-header">
                            <h6 class="modal-title">휴대폰 인증</h6>
                        </div>
                        <!-- body -->
                        <div class="certi_text"><br>
                            <span>인증코드가 발송되었습니다.</span><br>
                            <span>전송된 코드를 입력해주세요.</span>
                        </div>
                        <div class="certi_input">
                        <br>
                            <input type="text" class="input_certi" id="tel_certi_input">
                        </div>
                        <br>
                        <div class="certi_rc">
                            <button type="button" class="certi_close">다시전송</button>&nbsp;<span>|</span>
                            <button type="button" class="certi_close" id="tel_submit">확인</button>
                        </div>
                        
                    </div>
                    </div>
                </div>
                
                <div id="email_modal" class="modal fade" >
                <div class="modal-dialog">
                    <div class="modal-content">
                    <!-- header -->
                        <div class="modal-header">
                            <h6 class="modal-title">E-mail 인증</h6>
                        </div>
                    <!-- body -->
                            <div class="certi_text"><br>
                                <span>인증코드가 발송되었습니다.</span><br>
                                <span>전송된 코드를 입력해주세요.</span>
                            <br>
                            </div>
                        <div class="certi_input">
                        <br>
                                <input type="text" class="input_certi" id="email_certi_input">
                        </div>
                        <br>
                            <div class="certi_rc">
                            
                                <button type="button" class="certi_close">다시전송</button>&nbsp;<span>|</span>
                                <button type="button" class="certi_close" id="email_submit">확인</button>
                            </div>
                    </div>
                    </div>
                </div>
      
        </div>
    </div>
</body>
</html>