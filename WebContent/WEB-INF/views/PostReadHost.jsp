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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/sagyo.css" rel="stylesheet">
<style type="text/css">
.allmessage
{
	display: none;
}
</style>
<script type="text/javascript">
	$(document).ready(function()
	{
		$(".star-show>div:nth-child(2)").css("width", $(".star-show>input").val()*20+"%"); // 스타 뷰
		$('#myModal').on('shown.bs.modal', function () {
			$('#myInput').trigger('focus')
		});
		
// 신고 기능 ------------------------------------------------------------------------------------------------------------
		$('.joinreport').click(function()
		{
			var joinId = $(this).attr('name');
			$('#reportBtn').click(function()
			{
				location.href="hostreportjoininsert.action?reportCateName="+$('#reportType').val()+"&reportDetail="+$('#reportArea').val()+"&reportId="+joinId;
			});
			
		});
		
		$('.replyreport').click(function()
		{
			var joinId = $(this).attr('name');
			$('#reportBtn').click(function()
			{
				location.href="hostreportreplyinsert.action?reportCateName="+$('#reportType').val()+"&reportDetail="+$('#reportArea').val()+"&reportId="+joinId;
			});
		});
		
// 댓글 추가 -----------------------------------------------------------------------------------------		
		$('.reply-insert').click(function()
		{
			var reply = $(this).attr('name');
			$('#reply-insert-Btn').click(function()
			{
				location.href="hostreplyinsert.action?joinId="+reply+"&contents="+$('#replyArea').val();
			});	
		});
		
		$('.reply-r-insert').click(function()
		{
			var reply = $(this).attr('name');
			$('#reply-insert-Btn').click(function()
			{
				location.href="hostreplyinsert.action?joinId="+reply+"&contents="+$('#replyArea').val()+"&userTypeId="+"RU00001";
			});	
		});
// 삭제 기능 -----------------------------------------------------------------------------------------
		$('.post-d').click(function()
		{
			$('#delete-post-Btn').click(function()
			{
				location.href="hostpostDelete.action";
			});
		});
// 쪽지 기능 -------------------------------------------------------------------------------------------
		$('.allmessage').click(function()
		{
			var userId="";
			$('.nickName').each(function(index)
			{
				if($(this).attr('id') == 'ST00003')
				{
					userId += $(this).attr('name')+ " ";
				}
			});	
			userId = $('#takeUserIds').val(userId);
			
			$('#message-close').click(function()
			{
				$('#takeUserIds').empty();
				$('#contents').empty();
				
			});
		});
// 인원 수락 확인 부분 --------------------------------------------------------------------------------------------------------------------------------------------------		
		$('.nickName').on("click", function()
		{
			if($(this).is(":checked"))
			{
				jQuery.ajaxSettings.traditional = true;
				var joinId = $(this).attr('name');
				arr = [joinId, "ST00002"];
				$.ajax({
					url : 'hostjoinupdate.action',
					data: {joinArr : arr},
					type: 'GET',
					dataType: 'html'
				}).done(function(result){
					console.log($(this).attr('name'));
				});
			}
			else
			{
				jQuery.ajaxSettings.traditional = true;
				var joinId = $(this).attr('name');
				arr = [joinId, "ST00001"];
				$.ajax({
					url : 'hostjoinupdate.action',
					data: {joinArr : arr},
					type: 'GET',
					dataType: 'html'
				}).done(function(result){
					console.log($(this).attr('name'));
				});
			}
		});
// 만남확정 ------------------------------------------------------------------------------------------------
		
		if($('#serchNum').html >= $('#minNum').html && $('#serchNum').html <= $('#maxNum').html)
			{
				$('.check-meeting').on('click', function()
				{
					$('#meeting-contents').html('선택하신 인원으로 만남을 확정하시겠습니까?');
					$('#Confirmed-meeting-check').click(function()
					{
						var joinId = "";
						{
						$('input[class="nickName"]:checked').each(function(index)
						{
							console.log("test3");
							joinId += $(this).attr('name')+ " ";	
						});
						$.ajax({
							url : 'hostalljoinupdate.action',
							data: {joinIds : joinId, statusId : "ST00003"},
							type: 'POST',
							dataType: 'html'
						}).done(function(result)
						{
						});
						}
						joinId = "";
						{
						$('input[class="nickName"]:not(:checked)').each(function(index)
						{
							joinId += $(this).attr('name')+ " ";
						});
						$.ajax({
							url : 'hostalljoinupdate.action',
							data: {joinIds : joinId, statusId : "ST00004"},
							type: 'POST',
							dataType: 'html'
						}).done(function(result)
						{
							console.log($(this).attr('name'));
						});
						}
					});
					$('.check-meeting').css('display', 'none');
				});
			}
			else
			{
				$('#meeting-contents').html('인원이 맞지 않습니다.');
			}	
		
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
                            <div>${postlist.nickname }</div> 
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
                        <button class="btn post-d" data-toggle="modal" data-target="#delete-post">삭제하기</button>
                    </div>
                    <div class="Post-Status">
                        <div class="flex-row-center-center">현재 참가 신청인원 (<div id="serchNum">${serchNum }</div>/<div id="minNum">${postlist.minNum }</div>~<div id="maxNum">${postlist.maxNum })</div></div>
                        <div class="flex-row-right-center">
                            <button class="btn btn-outline-secondary btn-120-35 allmessage" data-toggle="modal" data-target="#messageModal">참가자 전체 쪽지</button>
                            <button class="btn btn-outline-orange btn-120-35 check-meeting" data-toggle="modal" data-target="#meetcheck">만남확정</button>
                        </div>
                    </div>

<!-- 댓글 부분 ------------------------------------------------------------------------------------------------------------------------ -->

                    <div class="Post-joinList">
 						<c:forEach var="join" items="${list}">
                   			<c:if test="${join.statusId eq 'ST00004' }">
                   				<script type="text/javascript">
                   					$('.check-meeting').css('display', 'none');
                   					$('.allmessage').css('display', 'inline');                					
                   				</script>
 							</c:if>
 							<c:choose>
 								<c:when test="${!empty join.delJoin}">
		                        	<div class="comments flex-row-left-center">
		                        		<div>삭제된 댓글입니다.</div>
	                                </div>
	                                
		                        </c:when>
		                        <c:when test="${empty join.delJoin}">
		 							<div class="comments flex-row-left-center">
			                            <div class="comments-user"> <!-- 코멘트 유저 뱃지 + 닉네임 -->
			                                <div> <!-- 뱃지 -->
			                                    <img src="${join.url }" alt="">
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
			                                    <div>
			                                        <button class="btn reply-insert" data-toggle="modal" data-target="#reply-insert-modal" name="${join.joinId }">댓글달기</button>
			                                    </div>
			                                </div>
			                                <div>
			                                    ${join.contents}
			                                </div>
			                            </div>
			                            <div class="PostWrite-row-right">
			                            	<c:choose>
			                            	<c:when test="${join.statusId eq 'ST00001' || join.statusId eq 'ST00002'}">
			                            	<input class="nickName" id="${join.statusId }" name="${join.joinId }" type="checkbox"
			                            	${join.statusId == 'ST00001' || join.statusId == 'ST00004'? "" : "Checked = 'checked'" }>
			                            	참가수락
			                            	</c:when>
			                            	</c:choose>
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
				                                    <div>
				                                        <button class="btn reply-r-insert" data-toggle="modal" data-target="#reply-insert-modal" name="${join.joinId}">댓글달기</button>
				                                    </div>
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

<!-- 끝 --------------------------------------------------------------------------------------------------------------------------------------------------------- -->
                        <div class="Post-footer flex-row-right-center">
                            <button class="btn btn-outline-orange btn-120-35">목록으로</button>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>
<!-- 모달창 신고하기 ---------------------------------------------------------------------------------------- -->
	<div class="modal fade" id="report-post" tabindex="-1" role="dialog"
		aria-labelledby="report-posts" aria-hidden="true">
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
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="reportBtn">확인</button>
				</div>
			</div>
		</div>
	</div>
<!-- 삭제하기 -------------------------------------------------------------------------------------------- -->
	<div class="modal fade" id="delete-post" tabindex="-1" role="dialog" aria-labelledby="delete-posts" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="delete-posts">게시글 삭제</h5>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="flex-col-center-center">
						<div>정말 게시글을 삭제하시겠습니까?</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="delete-post-Btn">확인</button>
				</div>
			</div>
		</div>
	</div>
<!-- 댓글 달기 ------------------------------------------------------------------------------------------- -->
	 <!-- Modal -->
	<div class="modal fade" id="reply-insert-modal" tabindex="-1"
		role="dialog" aria-labelledby="reply-insert" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reply-insert">댓글 달기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="flex-col-center-center">
						<textarea id="replyArea" rows="5" cols="50" placeholder="입력해주세요"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="reply-insert-Btn">확인</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 만남확정 ------------------------------------------------------------------------------------------- -->
	 <!-- Modal -->
	<div class="modal fade" id="meetcheck" tabindex="-1"
		role="dialog" aria-labelledby="Confirmed-meeting" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="Confirmed-meeting">만남 확정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="flex-col-center-center" id="meeting-contents">
						선택하신 인원으로 만남을 확정하시겠습니까?
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="Confirmed-meeting-check">확인</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>	
				</div>
			</div>
		</div>
	</div>
<!-- 쪽지 보내기 --------------------------------------------------------------------------------------------- -->
	 <!-- 모달 1 - 쪽지 쓰기-->
	 <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">쪽지쓰기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true" id="message-close">×</span>
	        </button>
	      </div>
	       <form role="form" action="hostmessagesend.action" method="post">
	      <div class="modal-body">
	       	<div class="control-group flex-row-center-center">
	            <div for="destinataire" style="padding-right: 15px;">받는 사람</div>
	            <div><input type="text" class="form-control" name="takeUserIds" id="takeUserIds" ></div>
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
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="message-close">Close</button>
	        <button type="submit" class="btn btn-orange submit">전송하기</button>
	      </div>
	     </form>
	    </div>
	  </div>
	</div>
</body>
</html>