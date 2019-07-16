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
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(window).on('load', function ()
	{
		$($('#test99')).each(function(index)
		{
			console.log($(this).attr('name'));
		});
		$(".star-show>div:nth-child(2)").css("width", $(".star-show>input").val()*20+"%"); // 스타 뷰
		$('#myModal').on('shown.bs.modal', function () {
			$('#myInput').trigger('focus')
		});
		
		$('#followBtn').click(function()
		{
			$.post("followinsert.action",{followId : $("#followBtn").val(), postHostId : $('#postId').attr('name')}, function(data){
				
				followId = data;
				if(parseInt(followId) == 0)
				{
					$("#followBtn").html("♡");	
				}
				else if(parseInt(followId) != 0)
				{
					$("#followBtn").html("❤");	
				}
			});
		});
		
		$('#post-join-btn').click(function()
		{
			location.href="joininsert.action?contents="+$('#contents').val()+"&postHostId="+$('#postId').attr('name');
		});
		
// 신고 구간 ------------------------------------------------------------------------------------------------------		
		$('.report-post').click(function()
		{
			$('#reportBtn').click(function()
			{
				location.href="reportinsert.action?reportCateName="+$('#reportType').val()+"&reportDetail="+$('#reportArea').val()+"&postHostId="+$('#postId').attr('name');
			});
		});
		
		$('.joinreport').click(function()
		{
			var joinId = $(this).attr('name');
			$('#reportBtn').click(function()
			{
				location.href="reportjoininsert.action?reportCateName="+$('#reportType').val()+"&reportDetail="+$('#reportArea').val()+"&reportId="+joinId;
			});
			
		});
		
		$('.replyreport').click(function()
		{
			var joinId = $(this).attr('name');
			$('#reportBtn').click(function()
			{
				location.href="reportreplyinsert.action?reportCateName="+$('#reportType').val()+"&reportDetail="+$('#reportArea').val()+"&reportId="+joinId;
			});
		});
// ------------------------------------------------------------------------------------------------------ 신고 구간

// 댓글 추가 구간 -------------------------------------------------------------------------------------------------
		$('.reply-insert').click(function()
		{
			var reply = $(this).attr('name');
			$('#reply-insert-Btn').click(function()
			{
				location.href="replyinsert.action?joinId="+reply+"&contents="+$('#replyArea').val();
			});	
		});
		
		$('.reply-r-insert').click(function()
		{
			var reply = $(this).attr('name');
			$('#reply-insert-Btn').click(function()
			{
				location.href="replyinsert.action?joinId="+reply+"&contents="+$('#replyArea').val()+"&userTypeId="+"RU00002";
			});	
		});
// ------------------------------------------------------------------------------------------------- 댓글 추가 구간
		
		$(".request-join").click(function()
		{
			var join = $(this).attr('name');
			$('#join-reset-Btn').click(function()
			{
				alert(join);
				location.href="joindelcheckinsert.action?reportId="+join;
			});
		});
	});

</script>

</head>
<body>
    <div class="browser flex-col-center-center">
        <c:import url="/WEB-INF/views/Navbar.jsp"></c:import>
        <div class="body-box flex-item-grow flex-col-center-up">
            <div class="body flex-item-grow flex-col-center-up">
                <div class="Post flex-item-grow flex-col-center-up">
                    <div class="Post-title">
                        <div>${postlist.title}</div>
                        <div>${postlist.postDate }</div>
                    </div>

                    <div class="Post-host flex-row-left-center">
                        <div>
                            <img src="${postlist.url }" alt="이미지 없음" id="postId" name="${postlist.postId }">
                        </div>
                        <div>
                            <div>${postlist.nickname }
                           	<c:choose>
                           	<c:when test="${postlist.followId != 0}">
                           		<button class="btn" id="followBtn" value="${postlist.userId }">❤</button>
                           	</c:when>
                           	<c:when test="${postlist.followId == 0}">
                           		<button class="btn" id="followBtn" value="${postlist.userId }">♡</button>
                           	</c:when>
                           	</c:choose>
                           	</div> 
                            <div>
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
									<input class="hidden" type="text" id="grade2" name="grade2" value="${postlist.grade }"/>
								</div>
                            </div>
                            <c:if test="${not empty postlist.telCertiId}">
                            	<div>휴대폰 인증 완료 ✔</div>
                            </c:if>
                            <c:if test="${not empty postlist.emailCertiId != '없음'}">
                            <div>이메일 인증 완료 ✔</div>
                            </c:if>
                        </div>
                        <div>
                            <div>만 남 일: <span>${postlist.meetDate }</span></div>
                            <div>만남장소: <span>${postlist.addrSiName }> ${postlist.addrGuName } > ${postlist.addrDetail }</span></div>
                            <div>관 심 사: <span>${postlist.interMainName } > ${postlist.interSubName } > ${postlist.interDetail }</span></div>
                            <div>참가제한: <span><c:choose><c:when test="${postlist.drink eq 'DR00001'}">음주가능</c:when><c:when test="${postlist.drink eq 'DR00002'}">음주 불가능</c:when></c:choose>
                            ,<c:choose><c:when test="${postlist.moodName eq 'MI00001'}">무관</c:when><c:when test="${postlist.moodName eq 'MI00002'}">진지한</c:when><c:when test="${postlist.moodName eq 'MI00003'}">가벼운</c:when></c:choose>
                            , <c:choose><c:when test="${postlist.samegender eq 'SG00001'}">동성만</c:when><c:when test="${postlist.samegender eq 'SG00002'}">무관</c:when></c:choose>
                            ,${postlist.limitGrade }점 이상</span></div>
                        </div>
                    </div>

                    <div class="Post-contents">
                        <div>${postlist.contents }</div>
                    </div>

                    <div class="Post-report flex-row-right-center">
                        <button class="btn report-post" data-toggle="modal"  data-target="#report-post">신고하기</button>
                    </div>
                    <div class="Post-join">
                        <div>현재 참가 신청인원 (${serchNum }/${postlist.minNum }~${postlist.maxNum })</div>
                        <div class="flex-row-left-center post-join-secondary">
                            <div><textarea name="contents" id="contents"></textarea></div>
                            <div><button id="post-join-btn"class="btn btn-outline-secondary">참가신청</button></div>
                        </div>
                    </div>
<!-- 댓글 부분 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->					
                    <div class="Post-joinList">
 						<c:forEach var="join" items="${list}">
 							<c:if test="${join.userId eq 'B001' }">
 							<script type="text/javascript">
 								$('.post-join-secondary').css('display', 'none');
 							</script>
 							</c:if>
 							<c:choose>
 								<c:when test="${!empty join.delJoin}">
		                        	<div class="comments flex-row-left-center">
		                        		삭제된 댓글입니다.
	                                </div>
		                        </c:when>
	 							<c:when test="${empty join.delJoin}">
		 							<div class="comments flex-row-left-center">
			                            <div class="comments-user"> <!-- 코멘트 유저 뱃지 + 닉네임 -->
			                                <div> <!-- 뱃지 -->
			                                    <img src="${join.url }" alt="" id="test99" name="${join.delJoin}">
			                                </div>
			                                <div> <!-- 닉네임 -->
			                                    ${join.nickname}
			                                </div>
			                            </div>
			                            <div class="comments-else flex-item-grow">
			                                <div class="comments-buttons flex-row-left-center">
			                                    <div>${join.joinDate}</div>
			                                    <div>
			                                        <button class="btn joinreport" data-toggle="modal" data-target="#report-post" name="${join.joinId }">신고하기</button>
			                                    </div>
			                                    <c:if test="${join.userId eq 'B001'}">
			                                    <div>
			                                        <button class="btn btn-border-right reply-insert" data-toggle="modal" data-target="#reply-insert-modal" name="${join.joinId }">댓글달기</button>
			                                        <button class="btn request-join" data-toggle="modal" data-target="#join-reset-modal" name="${join.joinId }">신청취소</button>
			                                    </div>
			                                    </c:if>
			                                </div>
			                                <div>
			                                    ${join.contents}
			                                </div>
			                            </div>
			                        </div>
		                        </c:when>
	                        </c:choose>
	                        <c:forEach var="replylist" items="${replylist }">
	                        	<c:if test="${join.joinId eq replylist.joinId }">
	                        		<c:if test="${not empty replylist.userTypeId}">
		                        		<div class="comments flex-row-left-center">
				                            <div class="comments-reply">
				                                <img src="img/대댓글.png" alt="">
				                            </div>
				                            <div class="comments-user">
				                                <div>
				                                    <img src="${replylist.url }" alt="">
				                                </div>
				                                <div>
				                                    ${replylist.nickname }
				                                </div>
				                            </div>
				                            <div class="comments-else flex-item-grow">
				                                <div class="comments-buttons flex-row-left-center">
				                                    <div>${replylist.joinDate }</div>
				                                    <div>
				                                        <button class="btn replyreport" data-toggle="modal" data-target="#report-post" name="${replylist.replyId }">신고하기</button>
				                                    </div>
				                                    <c:if test="${replylist.userId eq 'B001'}">
				                                    <div>
				                                        <button class="btn reply-r-insert" data-toggle="modal" data-target="#reply-insert-modal" name="${join.joinId}">댓글달기</button>
				                                    </div>
				                                    </c:if>
				                                </div>
				                                <div>
				                                    ${replylist.contents }
				                                </div>
				                            </div>
				                        </div>
			                        </c:if>
	                        	</c:if>
	                        </c:forEach>
 						</c:forEach>
<!-- 끝 ------------------------------------------------------------------------------------------------------------------------------------------------------------------ --> 						
                        <div class="Post-footer flex-row-right-center">
                            <button class="btn btn-outline-orange btn-120-35">목록으로</button>
                        </div>
                    </div>
                </div>
            </div>
<!-- 모달창 ---------------------------------------------------------------------------------------------------------------------------------------------------------------- -->            
             <!-- Modal -->
			<div class="modal fade" id="report-post" tabindex="-1" role="dialog" aria-labelledby="report-posts" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="report-posts">신고</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="flex-row-center-center">
			      		<div>유형</div>
			      		<div>
			      			<select id="reportType">
			      				<c:forEach var="reportlist" items="${reportlist }">
			      				<option value="${reportlist.reportId }">${reportlist.reportCateName }</option>
			      				</c:forEach>
			      			</select>
			      		</div>
			      	</div>
			      	<div class="flex-col-center-center">
			      		<textarea id="reportArea" rows="5" cols="50" placeholder="입력해주세요"></textarea>  
				    </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="reportBtn">신고하기</button>
			      </div>
			    </div>
			  </div>
			</div>
<!-- 모달창 대댓글 달기 -------------------------------------------------------------------------------------------------- -->
			 <!-- Modal -->
			<div class="modal fade" id="reply-insert-modal" tabindex="-1" role="dialog" aria-labelledby="reply-insert" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="reply-insert">댓글 달기</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="flex-col-center-center">
			      		<textarea id="replyArea" rows="5" cols="50" placeholder="입력해주세요"></textarea>  
				    </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="reply-insert-Btn">댓글 달기</button>
			      </div>
			    </div>
			  </div>
			</div>
<!-- 모달 신청 취소 ---------------------------------------------------------------------------------------------------- -->
			<div class="modal fade" id="join-reset-modal" tabindex="-1" role="dialog" aria-labelledby="join-reset" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="join-reset">참가신청 취소</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="flex-col-center-center">
			      		<div>정말 취소하시겠습니까?</div> 
			      		<div>취소하시면 참가신청한 글은 삭제됩니다.</div>  
				    </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="join-reset-Btn">신청 취소</button>
			      </div>
			    </div>
			  </div>
			</div>					
        </div>
    </div>
</body>
</html>