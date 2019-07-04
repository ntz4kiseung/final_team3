<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="<%=cp%>/css/postwirte.css">
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<%-- <script type="text/javascript" src="<%=cp%>/js/postWirtejs.js"></script> --%>
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

.modalLayer 
{
	display: none;
	position: relative;
}

.modalLayer .modalContent 
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

.modalLayer .modalContent exit 
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
.price-width-15px
{
	width: 15px;
}
.price-width-50px
{
	width: 50px;
}
.post-width-300px
{
	width: 300px;
}
.margin-right-plus-200px
{
	margin-right: 200px;
}
.margin-left-plus
{
	margin-left: 60px;
}
.margin-left-plus-30px
{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var modalLayer = $("#modalLayer");
	var modalLink = $("#post-write-end");
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
	$( function() {
	    $( "#slider-range" ).slider({
	      range: true,
	      min: 2,
	      max: 20,
	      values: [ 2, 20 ],
	      slide: function( event, ui ) {
	        $( ".price-slider-one" ).val(ui.values[ 0 ]);
	        $( ".price-slider-two" ).val(ui.values[ 1 ] );
	        $( ".post-people-range" ).val(ui.values[ 0 ] + " ~ " + ui.values[ 1 ]+"명");
	      }
	    });
	    $( ".price-slider-one" ).val($( "#slider-range" ).slider( "values", 0 ));
	    $( ".price-slider-two" ).val($( "#slider-range" ).slider( "values", 1 ));
	    $( ".post-people-range" ).val($( "#slider-range" ).slider( "values", 0 ) +
	    	      " ~ " + $( "#slider-range" ).slider( "values", 1 )+"명" );
	  } );
	$( function() {
	    $( "#slider-range-one" ).slider({
	      range: "max",
	      min: 2,
	      max: 10,
	      values: 2,
	      slide: function( event, ui ) {
	        $( ".price-slider-tree" ).val(ui.value);
	      }
	    });
	    $( ".price-slider-tree" ).val($( "#slider-range-one" ).slider("value"));
	  } );
	$( ".star_rating a" ).click(function() {
        $(this).parent().children("a").removeClass("on");
        $(this).addClass("on").prevAll("a").addClass("on");
        return false;
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
			<div class="post-result">
				<div class="title flex-center">
					<div class="nTitle">제목</div> 
					<div>
						<input type="text" name="iTitle" id="iTitle" class="iTitle" placeholder="  제목을 입력하세요" />
					</div>
				</div>
				
			</div>
			<div class="hr-size">
				<div id="hr">
					<hr>
				</div>
			</div>
			<div class="post-result">
				<div class="title flex-center">
					<div class="nMeeting post-inline-block ">만남 장소</div> 
					<div class="post-inline-block flex-center">
						<img src="img/img4.PNG" class="img">
					</div>
					<div class="post-inline-block flex-center">
						<input type="button" value="서울특별시" id="city" class="city btn1" />
						<input type="button" value="송파구" id="cityGu" class="cityGu btn2" /> 
						<input type="text" name="meeting" id="meeting" class="meeting textbox" placeholder="  상세 주소를 입력하세요" />
					</div>
				</div>
			</div>
			<div class="hr-size">
				<div id="hr">
					<hr>
				</div>
			</div>
			<div class="post-result">
				<div class="title flex-center">
					<div class="nInterest post-inline-block">관심사</div> 
					<div class="post-inline-block">
						<img src="img/img4.PNG" class="img">
					</div> 
					<div class="post-inline-block flex-center">
						<input type="button" value="스포츠" id="bCategory" class="bCategory btn1 InterestBtn post-inline-block" /> 
						<input type="button" value="기타" id="sCategory" class="sCategory btn2 post-inline-block" /> 
						<input type="text" name="interest" id="interest" class="interest textbox post-inline-block" placeholder="  관심사를 입력하세요" />
					</div>
				</div>
			</div>
			<div class="hr-size">
				<div id="hr">
					<hr>
				</div>
			</div>
			<div class="post-result">	
				<div class="title flex-center">
					<div class="nInterest post-inline-block flex-center">인원수</div>
					<div class="post-inline-block">
						<div class="post-inline-block margin-left-plus">
							<input type="text" class="price-slider-one price-width-15px margin-right-plus-200px" readonly="readonly">
							<input type="text" class="price-slider-two price-width-15px" readonly="readonly">
						<div>
						<div id="slider-range" class="post-width-300px"></div>
					</div>
						</div>
					</div>
					
					<div class="post-inline-block margin-left-plus-30px">
						인원수 : <input type="text" class="post-people-range price-width-50px" readonly="readonly">
					</div>
					<div class="post-inline-block">
						음주가능 <input type="checkbox" name="drinking" id="drinking" class="drinking">
					</div> 
					<div class="post-inline-block">
						동성만 <input type="checkbox" name="drinking" id="drinking" class="drinking">
					</div>
					<div class="post-inline-block">
						<div class="post-inline-block">
							참가제한
						</div>
						<div class="star_rating">
							<a href="#" class="on">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
						</div>
						<div class="starGrade post-inline-block">
							<div class="grade">
								<span></span>
							</div>
						</div>
						
					</div> 
				</div>
			</div>
			<div class="hr-size">
				<div id="hr">
					<hr>
				</div>
			</div>
			<div class="post-result">
				<div id="title flex-center">
					<div class="nInterest post-inline-block margin-right-plus">만남일</div>
					<div class="post-inline-block margin-left-plus">
						<div id="slider-range-one" class="post-width-300px post-inline-block"></div>
						<div class="post-inline-block"><input type="text" class="price-slider-tree price-width-15px"></div>
					</div>
					<div class="post-inline-block margin-left-plus-30px">
						2019.06.22
					</div>
					<div class="post-inline-block">
						<div class="post-inline-block">
							분위기
						</div>
						<div class="post-inline-block">
							<input type="checkbox" name="drinking" id="drinking" class="drinking">무관 
						</div> 
						<div class="post-inline-block">
						 	<input type="checkbox" name="drinking" id="drinking" class="drinking">진지한 
						</div>
						<div class="post-inline-block">
						 	<input type="checkbox" name="drinking" id="drinking" class="drinking">가벼운
						</div>  
					</div>
					
				</div>
			</div>
			<div class="hr-size">
				<div id="hr">
					<hr>
				</div>
			</div>
			<div class="post-result">
				<div id="title">
					<form name="boardForm" method="post" onsubmit="return submitContents(this);">
						<div style="width: 830px; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
							<div align="left" style="border-bottom: 1px solid #cccccc;">
								<div style="padding: 5px 0px 5px 10px;">
									<textarea name="content" id="content" style="width: 95%; height: 270px;">${dto.content}</textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<script type="text/javascript">
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame(
				{
					oAppRef: oEditors
					, elPlaceHolder: "content"
					, sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html"
					, htParams : 
					  {
						bUseToolbar : true
						, fOnBeforeUnload : function()
						  {
							//alert("아싸!");
						  }
					  }
					, //boolean
					  fOnAppLoad : function()
					  {
						  // 예제 코드
						  // oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text."]);
					  }
					, fCreator : "createSEditor2"
				});
			
				function pasteHTML()
				{
					var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입한다.<\/span>";
					oEditors.getById["content"].exec("PASTE_HTML", [ sHTML ]);
				}
			
				function showHTML()
				{
					var sHTML = oEditors.getById["content"].getIR();
					alert(sHTML);
				}
				
				function submitContents(elClickedObj)
				{
					oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용된다.
					
					// 에디터의 내용에 대한 값 검증은 
					// 이곳에서 document.getElementById("content").value를 이용해서 처리하면 된다.
					
					try
					{
						// elClickedObj.form.submit();
						return check();
					} 
					catch (e)
					{
						
					}
				}
			
				function setDefaultFont()
				{
					var sDefaultFont = '돋움';
					var nFontSize = 24;
					oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
				}
			</script>
			<div class="hr-size">
				<div id="hr">
					<hr>
				</div>
			</div>
			<div class="post-result flex-center">
				<div>
					<input type="button" id="post-write-end" value="글쓰기">
				</div>
			</div>

		</div>
		
		<!-- .body-background end ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	</div>
	<!-- bodyEnd---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<div id="modalLayer" class="modalLayer">
		<div id="modalContent" class="modalContent">
			<div>
				모임개설
			</div>
			<div id="hr">
				<hr>
			</div>
			<div class="margin-top-plus margin-bottom-plus">
				<div>한번 작성된 글은 수정 불가능합니다.</div>
				<div>계속하시려면 모임  개설 버튼을 클릭해주세요.</div>
			</div>
			<div class="flex-center sub-modalcontent">
				<button type="button" class="yes margin-right-plus">모임개설</button>
				<button type="button" class="exit">취소</button>
			</div>
		</div>
	</div>
</body>
</html>