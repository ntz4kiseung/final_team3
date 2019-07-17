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
   	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">

    <style>
      .modal-backdrop {
		z-index: 1020;
   	 	display : none;
		}
    
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
			text-align: left;
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
		

        .MyMessage-pagination{
        	font-size: 16px;
        	display: flex;
        	jutify-content: center;
        	align-items: center;
        }
        .MyMessage-pagination>div:FIRST-CHILD, .Notice-pagination>div:LAST-CHILD{
        	width: 60px;
        }
    </style>
      <script type="text/javascript">
  	pageNum = '${pageNum}';
	totalPage = '${totalPage}';
 	$(document).ready(function()
	{
 		
 		$(document).on('click', 'a[href="#"]', function(e){
	        e.preventDefault();
	    });
		 
		$(".paging").click(function(){
			location.href="mymessagesend.action?pageNum="+$(this).text();
		});
		
		$(".paging-next").click(function(){
			pageNum = Number(pageNum) + 5;
			if(pageNum>Number(totalPage)){
				pageNum=totalPage
			};
			location.href="mymessagesend.action?pageNum="+pageNum;
		});
		
		$(".paging-prev").click(function(){
			pageNum = Number(pageNum) - 5;
			if(pageNum>Number(totalPage)){
				pageNum=totalPage
			};
			location.href="mymessagesend.action?pageNum="+pageNum;
		});
 		
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
	 	
		$("#btn-check-id").click(function()
				{
					var inputid = $("#takeUserId").val();
					
					console.log(inputid);
					if (inputid == "") {
						document.getElementById("span-check-id").style.display = 'block';
						document.getElementById("span-check-id").style.color = '#DF0101';
						$("#span-check-id").text("아이디를 입력해주세요.");
						return false;
					}
					
					$.ajax({
						url : "<%=cp %>/messageidcheck.action",
						type : "post",
						data : {'id': inputid},
						success : function(count)
						{
							console.log(count);
							
							if (count == 0) {
								document.getElementById("span-check-id").style.display = 'block';
								document.getElementById("span-check-id").style.color = '#DF0101';
								$("#btn-check-id").val("1");
								$("#span-check-id").text("아이디가 존재하지 않습니다.");
							}
							else {
								document.getElementById("span-check-id").style.display = 'block';
								document.getElementById("span-check-id").style.color = '#31B404';
								$("#span-check-id").text("존재하는 아이디 입니다.");
							}
						}
					})
				});
	 	
		   $(".delete").click(function(){
	    	   
	    	   var checkArr = new Array();
	    	  jQuery.ajaxSettings.traditional = true;
	           var confirm_val = confirm("정말 삭제하시겠습니까?");
	           
	           $("input[class='checkOne']:checked").each(function(){
	        	    checkArr.push($(this).val());
	        	 });
	           
	           //alert(checkArr);
	          
	           
	           if(confirm_val) {
	     	
	            $.ajax({
	            url : 'messagedelete.action',
	            type : 'post',
	            data : { checkArr : checkArr },
	            }).done(function(result){
	            	location.href = "<%=cp%>/mymessagesend.action";
				})
				
	           }  
	           
	          });
		   
		   $(".star-show>div:nth-child(2)").css("width", $(".star-show>input").val()*20+"%");
			

	     		
		
	 	
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
                            <div><a class="navnonclick" href="myprofile.action">프로필</a></div>
                            <div><a class="navclick" href="mymessagerecevie.action">쪽지함</a></div>
                            <div><a class="navnonclick" href="mybadge.action">뱃지</a></div>
                            <div><a class="navnonclick" href="myfollowing.action">팔로우</a></div>
                            <div><a class="navnonclick" href="#">내모임</a></div>
                        </div>
                        <div class="MyPage-body flex-item-grow flex-col-center-center">

                            <div class="MyPage-body-header flex-row-left-center">
                                <a class="navnonclick" href="mymessagerecevie.action">받은 쪽지</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="navclick" href="mymessagesend.action">보낸 쪽지</a>
                            </div>

                            
                            <div class="MyPage-body-body">
                                <div class="MyMessage flex-col-center-center">

                                
                                    <!-- 전체선택, 쪽지쓰기 버튼 -->
                                    <div class="MyMessage-header flex-row-left-center">
                                        <button class="btn btn-orange btn-85-25 delete">
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
                                                        <input type="checkbox" name="checkOne" class="checkOne" value="${message.messageId }">
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
                                            

											<c:choose>
												<c:when test="${(largePage eq 1) && (largePage eq totalLargePage)}">
													<div></div>
													<div>
														<c:forEach var="index" begin="1" end="${totalPage }">
															&nbsp;<a href="#" class="paging ${ (index==pageNum) ? 'font-bold font-orange' : '' } ">${index }</a>&nbsp;
														</c:forEach>
													</div>
													<div></div>
												</c:when>
												
												<c:when test="${(largePage eq 1) && !(largePage eq totalLargePage)}">
													<div></div>
													<div>
													<c:forEach var="index" begin="1" end="5">
														&nbsp;<a href="#" class="paging ${ (index==pageNum) ? 'font-bold font-orange' : '' } ">${index }</a>&nbsp;
													</c:forEach>
													</div>
													<div>
														&nbsp;<a href="#" class="paging-next">다음글</a>&nbsp;
													</div>
												</c:when>
												
												<c:when test="${largePage eq totalLargePage }">
													<div>
														&nbsp;<a href="#" class="paging-prev">이전글</a>&nbsp;
													</div>
													<div>
														<c:forEach var="index" begin="${5*(totalLargePage-1)+1 }" end="${totalPage }" >
															&nbsp;<a href="#" class="paging ${ (index==pageNum) ? 'font-bold font-orange' : '' } ">${index }</a>&nbsp;
														</c:forEach>
													</div>
													<div></div>
												</c:when>
			
												<c:otherwise>
													<div>
														&nbsp;<a href="#" class="paging-prev">이전글</a>&nbsp;
													</div>
													<div>
														<c:forEach var="index" begin="${5*(largePage-1)+1 }" end="${5*largePage }" >
															&nbsp;<a href="#" class="paging ${ (index==pageNum) ? 'font-bold font-orange' : '' } ">${index }</a>&nbsp;
														</c:forEach>										
													</div>
													<div>
														&nbsp;<a href="#" class="paging-next">다음글</a>&nbsp;
													</div>
												</c:otherwise>
											</c:choose>



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
      <form role="form" action="messagesend2.action" method="post">
      <div class="modal-body">
       	<div class="control-group flex-row-center-center">
            <div for="destinataire" style="padding-right: 15px;">받는 사람</div>
            <div><input type="text" class="form-control" name="takeUserId" id="takeUserId" ></div>
            <button type="button" class="btn" id="btn-check-id" value="0">아이디 중복확인</button>
			
          </div>
           <br>   
         <div class="control-group">
             <div class="div-check">
                <span class="span-check" id="span-check-id" style="text-align: center;"></span>
             </div>
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