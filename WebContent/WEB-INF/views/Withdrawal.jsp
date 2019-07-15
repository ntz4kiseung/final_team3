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
                        <span><a href="notice.action">공지사항</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="faq.action">자주묻는질문</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="directquestionwrite.action">1:1문의</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="withdrawal.action">회원탈퇴</a></span>&nbsp;&nbsp;&nbsp;
                    </div>

                    <div class="CustomerService-body flex-item-grow flex-col-center-up">

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

                        <div class="Withdrawal-body flex-col-center-center">
                            <div>
                                회원탈퇴 약관
                            </div>
                            <div class="Withdrawal-desc">
                                <textarea name="" id="" disabled="disabled">
①회원은 언제든지 서면, e-mail, 전화, 기타 당사가 정하는 방법으로 회원탈퇴를 요청할 수 있으며, 
 당사와 제휴사는 다음 제1)호의 경우 또는 본 조 제②항 경우를 제외하고는 회원의 요청에 따라 조속히 회원탈퇴에 
  필요한 제반 절차를 수행합니다. 단, 회원탈퇴 시 이벤트 부정 이용 방지 등을 위하여 탈퇴일로부터 30일  
  이내에 재가입이 불가하나, 동 기간 중 제휴카드를 발급하는 경우에는 회원탈퇴가 자동 취소되며 정상적으로 
   SAGYO 서비스 이용이 가능합니다.  
1) 당사나 제휴사를 통해 구매하거나 예약한 물품/서비스가 배송 중이거나 실현되지 아니한 때 
②포인트 사용 후 사용 된 포인트의 적립 원천이 되는 구매 행위의 취소로 인해 마이너스(-) 포인트가  
발생한 회원은 별도 당사 난 제휴사의 승인이나 해당 포인트에 해당하는 금액을 변제하기 전까지는 탈퇴가 불가합니다. 
③회원이 다음 각 호에 해당하는 경우, 당사는 당해 회원에 대한 통보로써 회원 자격을 상실시킬 수 있 
습니다. 단, 3)호의 경우에는 회원에 대한 통보 없이 자격이 상실됩니다.  
1) 회원 가입 신청 시, 허위 내용을 등록하거나 타인의 명의를 도용한 경우 
2) 회원이 부정적립, 부정사용 등 SAGYO 포인트 및 SAGYO 카드를 부정한 방법 또는 목적으로 이용한 경우 
- 부정적립 : 회원이 실제로 상품이나 서비스를 구매하지 않았음에도 불구하고 당해 회원에게 포인트가  
적립된 경우를 말합니다. 그러나 시스템의 오류 등 회원의 귀책사유에 의하지 않고 포인트가 적립된 경우나 
 당해 제휴영업점에게 상품이나 서비스를 실제로 구매한 당사자의 동의가 있어 구매 당사자 대신 다른  
 회원에게 포인트를 적립하는 경우는 이에 제외됩니다. 단, 제휴영업점주 및 그 피고용인인 회원의 경우에는 
  당해 제휴영업점에서 상품이나 서비스를 실제로 구매한 당사자의 동의가 있는 경우에도 회원이 실제로  
  상품이나 서비스를 구입하지 않는 한, 이에 따른 포인트 적립은 부정 적립에 해당됩니다. 
- 부정적립된 포인트는 회원 자격 상실 통보와 함께 동시 소멸하고 이에 대하여 회원은 어떠한 권리도  
주장할 수 없습니다. 또한 부정적립 포인트로 상품이나 서비스를 구매하는 등의 부당이득이 발생한 경우  
회원 당사자 또는 부정적립 동조자가 당사 또는 제휴사에 대한 민·형사상 책임을 집니다.  
- 부정사용 : 당사나 제휴사 또는 회원의 동의 없이 타 회원의 포인트를 수단과 방법에 관계 없이 임의로 사용한 경우를 말합니다. 
3) 회원이 사망한 경우  
4) 다른 회원의 당사나 제휴사 및 제휴영업점의 서비스홈페이지 이용을 부당하게 방해하거나  
그 정보를 도용하는 등 관련 법령을 위반하여 전자거래질서를 위협하는 경우  
5) 포인트 사용 후 사용 된 포인트의 적립 원천이 되는 구매 행위의 취소를 상습적으로(2회 이상)  
반복해 당사나 해당 제휴사에 피해를 끼치는 경우  
6) 당사나 제휴사 서비스홈페이지를 이용하여 법령 및 이 약관에서 금지하거나 공서양속에 반하는  
행위를 하는 경우  
7) 기타 본 약관이 규정하는 회원의 의무를 위반하는 경우  
8) 기타 SAGYO 서비스 운영을 고의로 방해하는 행위를 하는 경우 
9) 당사 및 제휴사의 합리적인 판단에 기하여 SAGYO 서비스의 제공을 거부할 필요가 있다고 인정할 경우. 
④본 조 제 ③ 항에 의해 회원 자격이 상실된 회원은 당사로부터 해당 사유발생에 대한 통지를 받은 날로부터 
 최대 30일 이내에 본인의 의견을 소명할 수 있으며, 당사는 회원의 소명 내용을 심사하여 회원의  
 주장이 타당하다고 판단하는 경우 회원으로 하여금 계속하여 정상적인 SAGYO 서비스를 이용할 수 있도록 합니다. 
⑤본 조 제①항에 의한 회원탈퇴 또는 제③항에 의한 회원자격상실이 확정되는 시점은 아래와 같습니다. 
1) 회원의 탈퇴요청의 경우에는 당사가 회원탈퇴 처리의 완료 통보하는 시점에서 탈퇴가 완료 됩니다.  
다만, 당사는 완료 통보일로부터 30일의 유예 기간 동안 기 적립된 포인트 정보를 소멸시키지 아니하고  
저장하였다가, 회원이 별도의 절차를 거쳐 재가입 요청을 하고 회사가 이를 허락하여 유예 기간 내  
재가입할 경우, 모든 포인트를 재사용토록 하며, 재가입이 없이 유예기간이 지나면, 모든 포인트가 즉시 소멸됩니다.  
2) 회원자격상실의 경우 통보일에 회원 자격상실이 확정됩니다. 단 사망으로 인한 자격상실의 경우에는  
당사의 통보여부와 상관없이 회원 사망일에 자격상실이 확정되며, 당해 회원에게 제공된 기 SAGYO 서비스와  
관련된 권리나 의무 및 포인트는 당해 회원의 상속인에게 상속되지 않습니다. 
⑥본 조 제①항에 의한 회원탈퇴 또는 제③항에 의한 회원자격상실이 된 경우 회원 정보는 다음과 같이 처리 됩니다. 
1) 탈퇴한 회원의 정보는 본 약관 제15조에 규정하는 바에 따라 일정 기간 보유 후 삭제처리 됩니다.  
2) 회원 자격이 상실 된 회원의 정보는 회원 자격상실 확정 후 SAGYO 서비스 부정 이용 방지 및 타 회원의  
추가적인 피해 방지를 위해 2년간 보유 하며 이 기간 동안 재가입 및 SAGYO 서비스가 불가 할 수도 있습니다. 
                                </textarea>
                            </div>
                            <div>
                                위 약관을 숙지했으며 탈퇴를 계속합니다.
                            </div>
                        </div>

                        <div class="Withdrawal-footer flex-row-center-center">
                            <button class="btn-160-45 btn btn-outline-orange"  onclick="location.href='main.action' ">메인으로</button>
                            <button class="btn-160-45 btn btn-orange"  onclick="location.href='withdrawalcheck.action' ">다음</button>
                        </div>

                    </div>                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>