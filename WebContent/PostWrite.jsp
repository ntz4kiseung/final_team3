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
<!-- 글쓰기 -->
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery silder -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    .PostWrite{
        width: 100%;
        padding: 0px 95px 0px 95px;
    }
    .PostWrite>div{
        padding: 0px 40px 0px 40px;
        border-bottom: 2px solid rgb(220,220,220);
    }
    .PostWrite-row1{
        height: 70px;
    }
    .PostWrite-row1-label{
        width: 120px;
    }
    .PostWrite-row1-input-box{
        width: 800px;
    }
    .PostWrite-row1 .input-120-40{
        margin-right: 10px;
    }
    .PostWrite-row2{
        height: 90px;
        
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .PostWrite-row2-left{
        width: 500px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .PostWrite-row2-right{
        width: 350px;
        display: flex;
        align-items: center;
        justify-content: space-around;
    }
    .PostWrite-row3{
        height: 550px;
    }
    .PostWrite-row3 textarea{
        height: 90%;
    }
    .PostWrite-footer{
        height: 90px;
    }
    .PostWrite-row2-left>div:last-child{
        width: 110px;
        text-align: center;
    }

/* 추가적으로 css 추가하는 부분 */
	#input-w-20	 /* 인원수 크기 */
	{
		width: 20px;
		background-color: white;
		border: none;
	}
	#input-w-60	/* 인원수 범위 크기 */
	{
		width: 60px;
		background-color: white;
		border: none;
	}
	.input-w-250	/* range 길이 크기 */
	{
		width: 200px;
	}
	/* 시 구 선택창 */
	.place_pop1{
	z-index: 3;
	position: relative;
 	background-color: white; 
	width: 300px;
	height: 150px;
	border: 1px solid black;
	padding: 10px 10px 10px 10px;
 	display: none;
	}


	.big_place
	{
	z-index: 2;
	height: 30px;
	width: 100px;
	margin-right: 4px;
	position: relative;
	}


	.small_place
	{
	z-index: 2;
	height: 30px;
	width: 85px;
	position: absolute;
	}
</style>
<script type="text/javascript">
	$(document).ready(function()
	{
		$(function() {
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
		  });
		
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
		
		/* 시, 도 / 관심사 대, 소 선택박스 창 */
		$('html').click(function(e) {
			
			if ($("#place_pop" + a).css("display") == "block") {
				if(!$(e.target).hasClass("place_pop1")){
					if (!$(e.target).hasClass("big_place")) { 
						document.getElementById("place_pop" + a).style.display = 'none';
					}
				}
			}
		});
						
							
		$(".big_place").click(function() {
			a = $(this).val();
			document.getElementById("place_pop" + a).style.display = 'block';
			/* 대분류 클릭했을시 place_pop div 나타내기 */
			
		});

		$(".big_place_btn").click(function() {
			$("#big_place" + a).html($(this).val());
			document.getElementById("place_pop" + a).style.display = 'none';
			/* place_pop div 의 버튼을 클릭했을시 대분류 버튼이 변경 */
		});
			
		/* 글쓰기 용 */
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
		
		$('#myModal').on('shown.bs.modal', function () {
			$('#myInput').trigger('focus')
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
                <form class="PostWrite flex-item-grow">
                    
                    <div class="PostWrite-row1 flex-row-left-center">
                        <div class="PostWrite-row1-label">
                            제목*
                        </div>
                        <div class="PostWrite-row1-input-box">
                            <input type="text" class="form-control">
                        </div>
                    </div>

                    <div class="PostWrite-row1 flex-row-left-center">
                        <div class="PostWrite-row1-label">
                            만남장소
                        </div>
                        <div class="PostWrite-row1-input-box flex-row-left-center">
                        	<!--  -->
							<div class="sign_input">
								<button type="button" id="big_place1" class="big_place" value="1">시·도</button>
							<div id="place_pop1" class="place_pop1">
								<button type="button" class="big_place_btn" value="서울">서울</button>
							</div>		
						</div>
                            <!--  -->
                            <input type="text" class="form-control input-120-40">
                            <input type="text" class="form-control ">
                        </div>
                    </div>

                    <div class="PostWrite-row1 flex-row-left-center">
                        <div class="PostWrite-row1-label">
                            관심사
                        </div>
                        <div class="PostWrite-row1-input-box flex-row-left-center">
                            <input type="text" class="form-control input-120-40">
                            <input type="text" class="form-control input-120-40">
                            <input type="text" class="form-control ">
                        </div>
                    </div>

                    <div class="PostWrite-row2">
                        <div class="PostWrite-row2-left">
                            <div class="PostWrite-row1-label">
                                인원수
                            </div>
                            <div>
                            	<div class="PostWrite-row2-right">
                            		<div>
                            			<input type="text" class="price-slider-one" id="input-w-20" readonly="readonly">명
                            		</div>
                            		<div>
                            			<input type="text" class="price-slider-two" id="input-w-20" readonly="readonly">명
                            		</div>
                            	</div>
                            	<div class="PostWrite-row2-right">
                            		<div id="slider-range" class="input-w-250"></div>
                            	</div>
                            </div>
                            
                            <div>
                                <input type="text" class="post-people-range" id="input-w-60" readonly="readonly">
                            </div>
                        </div>
                        <div class="PostWrite-row2-right">
                            <div>
                                음주가능
                                <input type="checkbox">
                            </div>

                            <div>
                                동성만
                                <input type="checkbox">
                            </div>

                            <div>
                                참가제한
                                ☆☆☆☆☆
                            </div>
                        </div>
                    </div>

                    <div class="PostWrite-row2">
                        <div class="PostWrite-row2-left">
                            <div class="PostWrite-row1-label">
                                만남일
                            </div>
                            <div>
                            	<div id="slider-range-one" class="input-w-250"></div>
                            </div>
                            <div><input type="text" class="price-slider-tree" id="input-w-20">일</div>
                            <div>
                                2019.06.22
                            </div>
                        </div>
                        <div class="PostWrite-row2-right flex-row-right-center">
                            <div>분위기</div>
                            <div>
                                <input type="radio">무관
                            </div>
                            <div>
                                <input type="radio">진지한
                            </div>
                            <div>
                                <input type="radio">가벼운
                            </div>
                        </div>
                    </div>

                    <div class="PostWrite-row3 flex-item-grow flex-col-center-center">
						<form name="boardForm" method="post" onsubmit="return submitContents(this);">
							<div style="width: 830px; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
								<div align="left" style="border-bottom: 1px solid #cccccc;">
									<div style="padding: 5px 0px 5px 10px;">
										<textarea name="content" id="content" style="width: 95%; height: 400px;">${dto.content}</textarea>
									</div>
								</div>
							</div>
						</form>
					</div>
						

                    <div class="PostWrite-footer flex-col-center-center">
                        <button class="btn btn-orange btn-160-45" data-toggle="modal"  data-target="#exampleModal">모임개설</button>
                    </div>

                </form>
            </div>
            <!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">모임 개설</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="flex-col-center-center">
			      		<div>한 번 작성된 글은 수정이 불가능 합니다.</div>
				        <div>계속하시려면 모임 개설 버튼을 클릭해주세요.</div>
				        
				    </div>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary">모임 개설</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
        </div>
    </div>
</body>
</html>