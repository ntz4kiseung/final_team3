<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">

    <style>
        .MyMessage>div{
            width: 100%;
        }
        .MyMessage>div:first-child{
            flex-basis: 50px;
        }
        .MyMessage>div:last-child{
            flex-basis: 70px;
        }
        .MyMessage .accordion{
            width: 855px;
            font-size: 15px;
        }
        .MyMessage-accordion-right{
            width: 100px;
            text-align: center;
        }
        .MyMessage-accordion-checkbox{
            width: 50px;
        }
        .MyMessage-accordion-checkbox>input{
            width: 15px;
            height: 15px;
        }
        .MyMessage-date{
            font-size: 13px;
            color: rgb(120,120,120);
        }
        .MyMessage-title{
            width: 350px;
            overflow:hidden; 
            text-overflow:ellipsis; 
            white-space:nowrap;

            /* 출처: https://jos39.tistory.com/211 [JOS39 블로그] */
        }

        /* 부트스트랩 아코디언 덮어쓰기 */
        .accordion>.card:first-child>.card-header{
            /* 아코디언의 첫번째 카드는 위에 라벨?로 쓰기 위해 card-body는 지우고 card-header만 높이 따로 줌 */
            height: 38px;
        }
        .card{
            border: 1px solid rgb(100,100,100);
            border-left: 0px;
            border-right: 0px;
            border-radius: 0px;
            background-color: rgba(255, 255, 255, 0);
        }
        .card-header{
            padding: 2px 0px 2px 0px;
            border-bottom: 1px solid rgb(100,100,100);
            background-color: rgba(255, 255, 255, 0);
        }
        .card-body{
            background-color: rgba(0, 0, 0, 0.02);
        }
        
        .card-body>div{
            width: 100%;
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
		
		.modal {
		  text-align: center;
		}
		
		@media screen and (min-width: 768px) { 
		  .modal:before {
		    display: inline-block;
		    vertical-align: middle;
		    content: " ";
		    height: 100%;
		  }
		}
		
		.modal-dialog {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}	

        
    </style>
      <script type="text/javascript">
    
 	$(document).ready(function()
	{
 		
 	   function allCheckFunc( obj ) {
 			$("[name=checkOne]").prop("checked", $(obj).prop("checked") );
	 	}
	
	 	function oneCheckFunc( obj )
	 	{
	 		var allObj = $("[name=checkAll]");
	 		var objName = $(obj).attr("name");
	
	 		if( $(obj).prop("checked") )
	 		{
	 			checkBoxLength = $("[name="+ objName +"]").length;
	 			checkedLength = $("[name="+ objName +"]:checked").length;
	
	 			if( checkBoxLength == checkedLength ) {
	 				allObj.prop("checked", true);
	 			} else {
	 				allObj.prop("checked", false);
	 			}
	 		}
	 		else
	 		{
	 			allObj.prop("checked", false);
	 		}
	 	}
	
	 	$(function(){
	 		$("[name=checkAll]").click(function(){
	 			allCheckFunc( this );
	 		});
	 		$("[name=checkOne]").each(function(){
	 			$(this).click(function(){
	 				oneCheckFunc( $(this) );
	 			});
	 		});
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
            <div class="body flex-item-grow flex-col-center-center">
                
                <div class="MyPage flex-item-grow flex-col-center-up">

                    <div class="MyPage-header flex-row-left-center">
                        <div class="MyPage-header-left flex-col-center-center">
                            <div class="MyPage-header-badge">
                                <img src="img/badge150pixel_0001_뉴비.png" alt="">
                            </div>
                            <div class="MyPage-header-grade-star">
                                ★★★★★
                            </div>
                            <div class="MyPage-header-grade">
                                3.5/5.0
                            </div>
                        </div>
                        <div class="MyPage-header-right flex-item-grow">
                            <div class="MyPage-header-nickname">
                                Nickname
                            </div>
                            <div class="MyPage-header-detail">
                                <div>#서울특별시 송파구  #서울특별시 관악구</div>
                                <div>#영상편집 #필라테스</div>
                                <div>휴대전화 인증 완료</div>
                                <div>Email 인증 완료</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="flex-item-grow flex-row-left-up">
                        <div class="MyPage-nav flex-col-center-up">
                            <div><a class="navnonclick" href="myProfile.action">프로필</a></div>
                            <div><a class="navclick" href="myMessageRecevie.action">쪽지함</a></div>
                            <div><a class="navnonclick" href="myBadge.action">뱃지</a></div>
                            <div><a class="navnonclick" href="myFollowing.action">팔로우</a></div>
                            <div><a class="navnonclick" href="#">내모임</a></div>
                        </div>
                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                <a class="navnonclick" href="myMessageRecevie.action">받은 쪽지</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="navclick" href="myMessageSend.action">보낸 쪽지</a>
                            </div>

                            
                            <div class="MyPage-body-body">
                                <div class="MyMessage flex-col-center-center">

                                
                                    <!-- 전체선택, 쪽지쓰기 버튼 -->
                                    <div class="MyMessage-header flex-row-left-center">
                                        <button class="btn btn-orange btn-85-25">
                                         	   선택 삭제
                                        </button>
                                        &nbsp;&nbsp;
                                          <button class="btn btn-orange btn-85-25"  data-toggle="modal" data-target="#exampleModal">
                                         		   쪽지 쓰기
                                        </button>
                                    </div>

                                    <!-- 쪽지함 -->
                                    <div class="MyMessage-body flex-item-grow">

                                        <!-- 아코디언 -->
                                        
                                        <div class="accordion" id="NoticeAccordion">

                                            <!-- accordion header -->
                                            <div class="card">
                                                <div class="card-header flex-row-left-center">
                                                    <div class="MyMessage-accordion-checkbox flex-col-center-center">
                                                        <input type="checkbox" name="checkAll">
                                                    </div>
                                                    <div class="flex-item-grow flex-col-center-center">
                                                	        쪽지
                                                    </div>
                                                    <div class="MyMessage-accordion-right">
                                                    	    받은사람
                                                    </div>
                                                    <div class="MyMessage-accordion-right">
                                                      	  보낸날짜
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- header -->
    

											   <c:forEach  var="message" items="${messageSendList }">
			    						
			    						   <div class="card">
                                                <!-- card header -->
                                             
                                                <div class="card-header flex-row-left-center" id="headingOne">
                                                    <div class="MyMessage-accordion-checkbox flex-col-center-center">
                                                        <input type="checkbox" class=""  name="checkOne" >
                                                    </div>
                                                    <div class="flex-item-grow">
                                                        <button class="btn btn-link MyMessage-title" type="button" data-toggle="collapse" data-target="#collapse${message.messageId }" aria-expanded="true" aria-controls="collapseOne">
                                                        	${message.contents }
                                                        </button>
                                                    </div>
                                                    <div class="MyMessage-accordion-right">
                                                         ${message.takeUserId }
                                                    </div>
                                                    <div class="MyMessage-accordion-right">
                                                        ${message.sendDate }
                                                    </div>
                                                    
                                                </div>
                                               
                                                
                                                <!-- card body -->
                                        
                                                <div id="collapse${message.messageId }" class="collapse" aria-labelledby="headingOne" data-parent="#NoticeAccordion">
                                                    <div class="card-body flex-col-left-up">
                                                        <div>
                                                        	${message.contents }
                                                        </div>
                                                        <br>
                                                        <div class="flex-row-left-center">
                                                            <div class="MyMessage-date">보낸날짜: ${message.sendDate }</div>
                                                        </div>
                                                    </div>
                                                </div>
                                           
                                            </div>
			    							 
   										 </c:forEach> 
                                        </div> <!--end accordion -->
							  
                                    </div> <!-- end MyMessage Body -->
                                 
                                    <!-- MyMessage Footer 쪽지함 페이징 -->
                                    <div class="MyMessage-footer flex-col-center-center">
                                        <div class="MyMessage-pagination">
                                            이전글 6 7 8 9 10 다음글
                                        </div>  
                                    </div>


                                </div> <!-- end MyMessage -->
                            </div> <!-- end MyPage-body-body -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
      <!-- 모달 -->
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">쪽지쓰기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <form role="form" action="MessageSend2.action" method="post">
      <div class="modal-body">
       	<div class="control-group flex-row-center-center">
            <div for="destinataire" style="padding-right: 15px;">받는 사람</div>
            <div><input type="text" class="form-control" name="takeUserId" id="takeUserId" ></div>
          </div>
          <br />
          <!-- TextArea Message -->
          <div class="control-group">
            <label for="destinataire" >내용</label>
            <textarea id="contents" name="contents" class="form-control" rows="5"></textarea>
          </div>
          <br />
        </div>
        
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-orange submit">전송하기</button>
      </div>
     </form>
    </div>
  </div>
</div>
</body>
</html>