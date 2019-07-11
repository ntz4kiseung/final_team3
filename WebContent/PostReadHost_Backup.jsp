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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=cp%>/css/post.css">
<style type="text/css">
.mask 
{
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 10;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
}

.modalLayers
{
	display: none;
	position: relative;
}

.modalLayers .modalContents 
{
	width: 440px;
	height: 200px;
	padding: 20px;
	border: 1px solid #ccc;
	position: fixed;
	left: 50%;
	top: 50%;
	z-index: 11;
	background: #fff;
}

.modalLayers .modalContents exit 
{
	position: absolute;
	right: 0;
	top: 0;
	cursor: pointer;
}
.margin-top-plus
{
	margin-top: 50px;
}
.margin-bottom-plus
{
	margin-bottom: 50px;
}
.margin-right-plus
{
	margin-right: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var modalLayer = $("#modalLayer");
	var modalLink = $("#post-message");
	var modalCont = $(".modalContent");
	var marginLeft = modalCont.outerWidth() / 2;
	var marginTop = modalCont.outerHeight() / 2;
	modalLink.click(function() {
		modalLayer.fadeIn("slow");
		modalCont.css({
			"margin-top" : -marginTop,
			"margin-left" : -marginLeft
		});
	});
	$(".modalContent > .sub-modalcontent > .exit").click(function() {
		modalLayer.fadeOut("slow");
	});
});
</script>
</head>
<body>
	<div class="navbar-box">
		<div class="navbar-left">
			<div class="logo">
				<div class="logo-img">
					<img
						src="C:\Users\Kiseung\Desktop\programming\SIST\Final\view\Logo-Sagyo.png"
						alt="파일 없으면 이 텍스트뜸">
				</div>
				<div class="logo-text">Sagyo</div>
			</div>
		</div>
		<div class="navbar-center">
			<div class="search-box">
				<form action="" id="searchForm" name="searchForm">
					<input type="text" class="search-input">
					<button type="submit" class="search-btn">검색</button>
				</form>
			</div>
		</div>
		<div class="navbar-right">
			<div>알람아이콘</div>
			<div>
				<button type="button">모임개설</button>
			</div>
			<div>
				<button type="button">로그인</button>
			</div>
			<div>
				<button type="button">고객센터</button>
			</div>
		</div>
	</div>
	<div class="body-background">
		<div class="body">
<!-- 제목 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
			<div class="search-result">
				<div class="post-result">
					<div class="post-title">파이썬을 이용한 서브프로젝트 관심 있으신분</div>
					<div class="posting-date">게시일<div class="posting-date">2019-04-01</div></div>
				</div>
				<div class="hr-size">
					<div id="hr">
						<hr>
					</div>
				</div>
<!-- 닉네임 및 세부정 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
				<div class="post-result">
					<div class="post-subhead">
						<div class="post-inline-block"><img src="img/img4.PNG" class="img"></div>
						<div class="post-inline-block">
							<div>nickname</div>
							<div>별점자리</div>
							<div>휴대전화 인증 자리</div>
						</div>
					</div>
					<div class="posting-details">
						<div class="posting-meeting-date">만남일 : <div class="post-inline-block">2019-06-17 오후5:50</div></div>
						<div class="posting-meeting-place">만남장소 : <div class="post-inline-block">서울특별시 > 송파구 > 가락시장근처</div></div>
						<div class="posting-meeting-interests">관 심 사 : <div class="post-inline-block">IT태그 > 컴퓨터 > 파이썬 서브프로젝트</div></div>
						<div class="posting-meeting-limit">참가제한 : <div class="post-inline-block">QA</div>, <div class="post-inline-block">동성</div>, <div class="post-inline-block">별점자리</div></div>
					</div>
				</div>
				<div class="hr-size">
					<div id="hr">
						<hr>
					</div>
				</div>
<!-- 글쓴부분 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
				<div class="post-result">
						<div class="post-info"><textarea rows="30" cols="142"></textarea></div>
				</div>
				<div class="hr-size">
					<div id="hr">
						<hr>
					</div>
				</div>
<!-- 참가 확정 공간 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
				<div class="post-result">
					<div class="post-inline-block">현재 참가 신청 인원(3/4~6)</div>
					<div class="post-margin-left post-inline-block">
						<div class="post-inline-block"><input type="button" id="post-message" value="참가자 전체 쪽지" class="btn"></div>
						<div class="post-inline-block"><input type="button" value="만남확정" class="btn"></div>
					</div>
				</div>
				<div class="hr-size">
					<div id="hr">
						<hr>
					</div>
				</div>
<!-- 댓글 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
				<div class="post-comments">
					<div class="post-result">
						<div class="post-comments-user">
							<div class=""><img src="img/img4.PNG" class="img"></div>
							<div class="">nickname</div>
						</div>
						<div class="post-comments-date">
							<div class="post-inline-block"><div class="post-comments-dateing post-inline-block">2019-06-29</div> <div class="post-comments-date-time post-inline-block">15:54</div></div>
							<div class="post-inline-block"><input type="button" class="post-comments-commetns" value="댓글달기"></div>
							<div class="post-inline-block"><input type="button" class="post-comments-report" value="신고하기"></div>
							<div class="post-comments-info">
								<div class="post-comments-user-info"><textarea  rows="3" cols="90"></textarea></div>
							</div>
						</div>
						<div class="post-margin-left post-inline-block post-checkbox"><input type="checkbox">참가수락</div>
					</div>
					<div class="hr-size">
						<div id="hr">
							<hr>
						</div>
					</div>
					<div class="post-result">
						<div class="post-comments-comments-arrow">
							<img src="img/img6.png" class="img">
						</div>
						<div class="post-comments-comments-user">
							<div class=""><img src="img/img4.PNG" class="img"></div>
							<div class="">nickname</div>
						</div>
						<div class="post-comments-date">
							<div class="post-inline-block"><div class="post-comments-dateing post-inline-block">2019-06-29</div> <div class="post-comments-date-time post-inline-block">15:54</div></div>
							<div class="post-inline-block"><input type="button" class="post-comments-commetns" value="댓글달기"></div>
							<div class="post-inline-block"><input type="button" class="post-comments-report" value="신고하기"></div>
							<div class="post-comments-info">
								<div class="post-comments-user-info"><textarea  rows="3" cols="90"></textarea></div>
							</div>
						</div>
					</div>
					<div class="hr-size">
						<div id="hr">
							<hr>
						</div>
					</div>
				</div>
<!-- 목록으로--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->		
				<div class="post-result">
					<div class="post-margin-left"><input type="button" value="목록으로" class="btn"></div>
				</div>
<!-- 쪽지모달--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
				<div id="modalLayer" class="modalLayer modalLayers">
					<div id="modalContent" class="modalContent modalContents">
						<div>
							쪽지 보내기
						</div>
						<div id="hr">
							<hr>
						</div>
						<div class="post-inline-block">
							받는 사람
						</div>
						<div class="post-inline-block">
							<textarea rows="1" cols="50"></textarea>
						</div>
						<div>
							<textarea rows="7" cols="65"></textarea>
						</div>
						<div class="flex-center sub-modalcontent">
							<button type="button" class="exit">신고접수</button>
						</div>
					</div>
				</div>
<!-- .bodyEnd --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
			</div>
<!-- .body-background end ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
		</div>
<!-- bodyEnd---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	</div>
</body>
</html>