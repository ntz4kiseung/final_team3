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
            <div class="body flex-item-grow flex-col-center-up">
                <div class="Post flex-item-grow flex-col-center-up">
                    <div class="Post-title">
                        <div>${postlist.title}</div>
                        <div>${postlist.postDate }</div>
                    </div>

                    <div class="Post-host flex-row-left-center">
                        <div>
                            <img src="${postlist.url }" alt="이미지 없음">
                        </div>
                        <div>
                            <div>${postlist.nickname }</div> 
                            <div>☆☆☆☆☆</div>
                            <c:if test="${not empty postlist.telCertiId}">
                            	<div>휴대폰인증 완료</div>
                            </c:if>
                            <c:if test="${not empty postlist.emailCertiId != '없음'}">
                            <div>이메일 인증완료</div>
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
                        <button class="btn">신고하기</button>
                    </div>

                    <div class="Post-Status">
                        <div>현재 참가 신청인원 (3/${postlist.minNum }~${postlist.maxNum })</div>
                        <div class="flex-row-right-center">
                            <button class="btn btn-outline-secondary btn-120-35">참가자 전체 쪽지</button>
                            <button class="btn btn-outline-orange btn-120-35">만남확정</button>
                        </div>
                    </div>

<!-- 댓글 부분 ------------------------------------------------------------------------------------------------------------------------ -->

                    <div class="Post-joinList">
 						<c:forEach var="join" items="${list}">
 							<div class="comments flex-row-left-center">
	
	                            <div class="comments-user"> <!-- 코멘트 유저 뱃지 + 닉네임 -->
	                                <div> <!-- 뱃지 -->
	                                    <img src="${join.url }" alt="">
	                                </div>
	                                <div  id="${join.joinId }"> <!-- 닉네임 -->
	                                    ${join.nickname}
	                                </div>
	                            </div>
	                            <div class="comments-else flex-item-grow">
	                                <div class="comments-buttons flex-row-left-center">
	                                    <div>${join.joinDate}</div>
	                                    <div>
	                                        <button class="btn">신고하기</button>
	                                    </div>
	                                    <div>
	                                        <button class="btn btn-border-right">댓글달기</button>
	                                        <button class="btn">신청취소</button>
	                                    </div>
	                                </div>
	                                <div>
	                                    ${join.contents}
	                                </div>
	                            </div>
	                        </div>
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
				                                        <button class="btn">신고하기</button>
				                                    </div>
				                                    <div>
				                                        <button class="btn btn-border-right">댓글달기</button>
				                                        <button class="btn">신청취소</button>
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
</body>
</html>