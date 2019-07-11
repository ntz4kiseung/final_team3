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
            <div class="body flex-item-grow flex-col-center-center">
                <div class="CustomerService flex-item-grow flex-col-center-up">


                    <div class="CustomerService-header flex-col-left-center">
                        고객센터
                    </div>

                    <div class="CustomerService-category flex-row-left-center">
                        <span><a href="">공지사항</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="">자주묻는질문</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="">1:1문의</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="">회원탈퇴</a></span>&nbsp;&nbsp;&nbsp;
                    </div>

                    <div class="CustomerService-body flex-item-grow flex-col-center-center">

                        <div class="box-725-400 flex-col-center-up">
							<form action="withdrawalcomplete.action" method="post">
                            <div class="Withdrawal-header flex-col-center-center">
                                <div class="logo-box flex-item-grow flex-row-center-center">
                                    <div class="logo-img">
                                        <img src="img/Logo.png" alt="이미지 없음">
                                    </div>
                                    <div class="logo-text">
                                        Sagyo
                                    </div>
                                </div>
                            </div>

                            <div>
                                비밀번호 입력 후 회원탈퇴를 누르시면 회원탈퇴 처리가 완료됩니다.
                            </div>

                            <div class="Withdrawal-input-box">
                                <div class="Withdrawal-input-group">
                                    <div class="Withdrawal-input-group-label">아이디</div>
                                    <div>${userid }</div>
                                    <input type="hidden" id="userid" name="userid" value=${userid } />
                                </div>
                                <div class="Withdrawal-input-group">
                                    <div class="Withdrawal-input-group-label">닉네임</div>
                                    <div>
                                    <c:forEach var="getnickname" items="${nickname }">
                                    ${getnickname.nickname }
                                    		
                                    </c:forEach>
                                    </div>
                                </div>
                                <div class="Withdrawal-input-group">
                                    <div class="Withdrawal-input-group-label">비밀번호*</div>
                                    <input type="password" class="input-underline" id="pwd" name="pwd">
                                </div>
                            </div>

                            <div class="box-725-400-footer flex-row-center-center">
                                <button class="btn-160-45 btn btn-outline-orange" onclick="location.href='main.action'" >메인으로</button>&nbsp;&nbsp;&nbsp;
                                <button type="submit"class="btn-160-45 btn btn-orange">회원탈퇴</button>
                            </div>
							</form>
                        </div>

                    </div>                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>