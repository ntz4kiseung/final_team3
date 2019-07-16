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

<!-- 글쓰기 -->
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!-- jQuery silder -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- sagyo.css -->
<link href="css/sagyo.css" rel="stylesheet">
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
	.input-w-20	 /* 인원수 크기 */
	{
		width: 20px;
		background-color: white;
		border: none;
	}
	.input-w-60	/* 인원수 범위 크기 */
	{
		width: 60px;
		background-color: white;
		border: none;
	}
	.input-w-40	/* 인원수 범위 크기 */
	{
		width: 40px;
		/* background-color: white; */
		border: none;
	}
	.input-w-250	/* range 길이 크기 */
	{
		width: 200px;
	}
	.div-check{
	display: flex;
	align-items: center;
	}
	.popover{
    min-width: 400px !important;
    
	}
	.btn-120-35{
    width: 120px;
    height: 35px;
    font-size: 14px;
    padding: 6px 3px 6px 3px;
	}
	
	.modal-backdrop {
	z-index: 1020;
    display : none;
	}
</style>
<script type="text/javascript">
	var js = jQuery.noConflict();
	$(document).ready(function()
	{
		$(function() {
			js( "#slider-range" ).slider({
		      range: true,
		      min: 2,
		      max: 20,
		      values: [ 2, 20 ],
		      slide: function( event, ui ) {
		    	  js( ".price-slider-one" ).val(ui.values[ 0 ]);
		    	  js( ".price-slider-two" ).val(ui.values[ 1 ] );
		    	  js( ".post-people-range" ).val(ui.values[ 0 ] + " ~ " + ui.values[ 1 ]+"명");
		      }
		    });
			js( ".price-slider-one" ).val($( "#slider-range" ).slider( "values", 0 ));
			js( ".price-slider-two" ).val($( "#slider-range" ).slider( "values", 1 ));
			js( ".post-people-range" ).val($( "#slider-range" ).slider( "values", 0 ) +
		    	      " ~ " + js( "#slider-range" ).slider( "values", 1 )+"명" );
		  });
		
		js("input[name='minMeetDate']").val(sysdateToString(2));
		
		js("#filter-minMeetDate").text(sysdateToString(2));
		js( "#slider-range-one" ).slider({
			  range: "max",
		      min: 2,
		      max: 10,
		      values: 2,
		      slide: function( event, ui ) {
		    	  js(this).next().val(sysdateToString(ui.value));
		    	  js("#filter-minMeetDate").text(sysdateToString(ui.value));
		      }
		    });

		$(".btn-check-cate1").click(function() {
			$(".btn-pop-sido").click(function() {
				
				$("#addrSiName").text($(this).text());
				$("#addrSiId").val($(this).val());
				var siid = $(this).val();
				var str = "";
				 $.ajax({
	                   url: '<%=cp %>/addrguajax.action',
	                   type: 'GET',
	                   dataType: 'html',
	                   data : {'siid': siid}
	                }).done(function(result){
	                  
						console.log('성공');
						$("#inbodyB").empty();
						$("#inbodyB").append(result);
	                }); 
			})
			
		})
		
		$(".btn-check-cate2").click(function()
		{
			$(".btn-pop-gu").click(function()
			{
				$("#btn-check-gugun").text($(this).text());
				 
				$("#addrGuId").val($(this).val());
				$("#addrGuName").val($(this).text());
				
				console.log("구 아이디 = " + $("#addrGuId").val());
				console.log("구 이름 = " + $("#addrGuName").val());
			})
		})
		
		
		
		/* interSubName1 */
		$(".btn-check-cate3").click(function() {
			
			$(".btn-pop-main").click(function() {
				$("#interMainName").text($(this).text());
				$("#interMainId").val($(this).val());
				var mainid = $(this).val();
				
				$.ajax({
						url: '<%=cp %>/intersubajax.action',
						type: 'GET',
						dataType: 'html',
						data: {'mainid': mainid}
					}).done(function(result) {
						console.log('성공')
						
						$("#inbodyD").empty();
						$("#inbodyD").append(result);
					})
			})
		})
		
		$(".btn-check-cate4").click(function()
		{
			$(".btn-pop-sub").click(function()
			{
				$("#btn-check-sub").text($(this).text());
				 
				$("#interSubId").val($(this).val());
				$("#interSubName").val($(this).text());
				
				console.log("서브 아이디 = " + $("#interSubId").val());
				console.log("서브 이름 = " + $("#interSubName").val());
			})
		})
						
							
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
		$(function(){
		    $("[data-toggle=popover]").popover({
		        html : true,
		        content: function() {
		          var content = $(this).attr("data-popover-content");
		          return $(content).children(".popover-body").html();
		        },
		        title: function() {
		          var title = $(this).attr("data-popover-content");
		          return $(title).children(".popover-heading").html();
		        }
		    });
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
				  //oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text."]);
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
		
		$(".star-rating>img").click(function(){
		 	   
		 	   var num = $(this).attr('id');
		 	   
		 	   $(this).parent().children('img').each(function(index, item){
					$(item).addClass("grayscale");
		 	   });
		 	   
		 	   for (var i = 0; i < num; i++)
			   {
				   $(this).parent().children("#"+(i+1)).removeClass("grayscale");
			   }
		 	   
		 	   // 색 칠해진 별의 갯수를 hidden input 태그에 넣어줌
		 	   $(this).parent().children("input").val(num);
		    });
	    $('#postWriteEvent').click(function()
	    {
	    	var title = $('#title').val();
	    	var addrSiId = $('.btn-pop-sido').val();
	    	var addrGuId = $('#addrGuId').val();
	    	var addrDetail = $('#addrDetail').val();
	    	var interMainId = $('.btn-pop-main').val();
	    	var interSubId = $('#interSubId').val();
	    	var interDetail = $('#interDetail').val();
	    	var minNum = $('#minNum').val();
	    	var maxNum = $('#maxNum').val();
	    	if($('#drink').is(":checked"))
	    	{
	    		$('#drink').val('DR00001');
	    	}
	    	else
	    	{
	    		$('#drink').val('DR00002');
	    	}
	    	
	    	if($('#samegenders').is(":checked"))
	    	{
	    		$('#samegender').val('SG00001');
	    	}
	    	else
	    	{
	    		$('#samegender').val('SG00002');
	    	}
	    	console.log($('#samegender').val());
	    	var grade = $('#grade').val();
	    	var hour = $('#hour').val();
	    	var min = $('#min').val();
	    	var meetDate = $('#filter-minMeetDate').html();
	    	$('#meetDate').val(meetDate+hour+":"+min+":00");	
	    	if(title == "")
	    	{
	    		alert("제목이 없습니다.");
	    		return false;
	    	}
	    	else if(addrSiId == "")
	    	{
	    		alert("도시를 선택하지 않았습니다.");
	    		return false;
	    	}
	    	else if(addrGuId == "")
	    	{
	    		alert("구를 선택하지 않았습니다.");
	    		return false;
	    	}
	    	else if(addrDetail == "")
	    	{
	    		alert("상세지역를 선택하지 않았습니다.");
	    		return false;
	    	}
	    	else if(interMainId == "")
	    	{
	    		alert("대카테고리를 선택하지 않았습니다.");
	    		return false;
	    	}
	    	else if(interSubId == "")
	    	{
	    		alert("소카테고리를 선택하지 않았습니다.");
	    		return false;
	    	}
	    	else if(interDetail == "")
	    	{
	    		alert("상세관심사 내용을 선택하지 않았습니다.");
	    		return false;
	    	}
	    	else if(minNum == "")
	    	{
	    		alert("최소인원을 선택하지 않았습니다.");
	    		return false;
	    	}
	    	else if(maxNum == "")
	    	{
	    		alert("최대인원을 선택하지 않았습니다.");
	    		return false;
	    	}
	    	else if(hour == "")
	    	{
	    		alert("만나는 시간을 입력하지 않았습니다.");
	    		return false;
	    	}
	    	else if(min == "")
	    	{
	    		alert("만나는 분을 입력하지 않았습니다.");
	    		return false;
	    	}
	    	else
			{
				alert("글쓰기 완료 접근");
				var form = document.getElementById("PostWriteForm");
				form.submit();
			}
	    });
	});
</script>
<script type="text/javascript">
	function sysdateToString(day){
		var date = new Date();
		date.setDate(date.getDate()+day);
		var result = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
		return result;
	}
	function defaultMinMeetDate(){
		var date = new Date();
		date.setDate(date.getDate()+2);
		var result = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
		return result;
	}
</script>
</head>
<body>
    <div class="browser flex-col-center-center">
        <c:import url="/WEB-INF/views/Navbar.jsp"></c:import>
        <div class="body-box flex-item-grow flex-col-center-up">
            <div class="body flex-item-grow flex-col-center-center">
                <form class="PostWrite flex-item-grow" id="PostWriteForm" action="postInsert.action" method="post">
                    
                    <div class="PostWrite-row1 flex-row-left-center">
                        <div class="PostWrite-row1-label">
                            	제목*
                        </div>
                        <div class="PostWrite-row1-input-box">
                            <input type="text" class="form-control" id="title" name="title" value="">
                        </div>
                    </div>

                    <div class="PostWrite-row1 flex-row-left-center">
                        <div class="PostWrite-row1-label">
                            	만남장소
                        </div>
                        <div class="PostWrite-row1-input-box flex-row-left-center">
								<div class="box-245-40 div-addr">
									<button type="button" class="btn btn-check-cate1" id="addrSiName" name="addrSiName" value="1"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#a" data-placement="bottom">시·도</button>
									 
                                	<button type="button" class="btn btn-check-cate2" id="btn-check-gugun" value="1"
									 tabindex="0" data-toggle="popover"
									 data-trigger="focus" data-popover-content="#b" data-placement="bottom">구·군</button>
									 <input type="hidden" id="addrSiId" name="addrSiId" value="">
									 <input type= "hidden" id="addrGuId" name="addrGuId" value="">
									 <input type= "hidden" id="addrGuName" name="addrGuName" value="">
                                </div>
                                <input type="text" class="form-control" id="addrDetail" name="addrDetail"> 
                        </div>
                    </div>

                    <div class="PostWrite-row1 flex-row-left-center">
                        <div class="PostWrite-row1-label">
                            	관심사
                        </div>
                        <div class="PostWrite-row1-input-box flex-row-left-center">
							<div class="box-245-40 div-inter">
								<button type="button" class="btn btn-check-cate3"
									id="interMainName" name="interMainName" value="1"
									tabindex="0" data-toggle="popover" data-trigger="focus"
									data-popover-content="#c" data-placement="bottom">대분류</button>

								<button type="button" class="btn btn-check-cate4"
									id="btn-check-sub" name="btn-check-sub" value="1"
									tabindex="0" data-toggle="popover" data-trigger="focus"
									data-popover-content="#d" data-placement="bottom">소분류
								</button>
								<input type="hidden" id="interMainId" name="interMainId" value=""/>
								<input type="hidden" id="interSubId" name="interSubId" value=""> 
								<input type="hidden" id="interSubName" name="interSubName" value="">
							</div>
							<input type="text" class="form-control " id="interDetail" name="interDetail">
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
                            			<input type="text" class="price-slider-one input-w-20" id="minNum" name="minNum" readonly="readonly" value="2">명
                            		</div>
                            		<div>
                            			<input type="text" class="price-slider-two input-w-20" id="maxNum" name="maxNum" readonly="readonly" value="20">명
                            		</div>
                            	</div>
                            	<div class="PostWrite-row2-right">
                            		<div id="slider-range" class="input-w-250"></div>
                            	</div>
                            </div>
                            
                            <div>
                                <input type="text" class="post-people-range input-w-60" readonly="readonly" value="2 ~ 20명">
                            </div>
                        </div>
                        <div class="PostWrite-row2-right">
                            <div>
                               	 음주가능
                                <input type="checkbox" id="drink" name="drink" value="">
                            </div>

                            <div>
                                동성만
                                <input type="checkbox" id="samegenders" name="samegenders" value="">
                                <input type="hidden" id="samegender" name="samegender" value="">
                            </div>

                            <div class="flex-row-center-center">
								참가제한
								<div class="star-rating star-25-box flex-row-left-center">
									<img id="1" src="img/star.png" alt="" /> 
									<img class="grayscale" id="2" src="img/star.png" alt="" /> 
									<img class="grayscale" id="3" src="img/star.png" alt="" /> 
									<img class="grayscale" id="4" src="img/star.png" alt="" /> 
									<img class="grayscale" id="5" src="img/star.png" alt="" /> 
									<input class="hidden" type="text" id="grade" name="grade" value="1" />
								</div>
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
                            <div>
                                <span id="filter-minMeetDate">2</span>
                            </div>
                            <div class="flex-row-center-center">
                            	<div>
                            		<input type="text" class="input-w-40" id="hour">
                            	</div>
                            	:
                            	<div>
                            		<input type="text" class="input-w-40" id="min">
                            	</div>
                            	<input type="hidden" id="meetDate" name="meetDate" value="">
                            </div>
                        </div>
                        <div class="PostWrite-row2-right flex-row-right-center">
                            <div>분위기</div>
                            <div class="radio-div"><input type="radio" id="moodId1" name="moodName" value="MI00001" checked><label for="moodId1">무관</label></div>
                            <div class="radio-div"><input type="radio" id="moodId2" name="moodName" value="MI00002"> <label for="moodId2">진지한</label></div>
	                        <div class="radio-div"><input type="radio" id="moodId3" name="moodName" value="MI00003"> <label for="moodId3">가벼운</label></div>
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
			      	<button type="button" class="btn btn-primary" id="postWriteEvent" >모임 개설</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
        </div>
    </div>

<!-- 시/구 대/소 선택 -->    
<div id="a" class="hidden">
    <div class="popover-heading">
       시·도 선택
    </div>
    <div class="popover-body" >
       <div id="inbodyA">
		    <c:forEach var="addrsi" items="${addrsilist }" varStatus="status">
				<button type="button" id="si${status.index}" name="si${status.index}" class="btn btn-120-35 btn-pop-sido" value="${addrsi.addrSiId1 }">${addrsi.addrSiName1 }</button>
			</c:forEach>
       </div> 

    </div>
</div>




<div id="b" class="hidden">
    <div class="popover-heading">
       구·군 선택
    </div>
    
    <div class="popover-body" >
       <div id="inbodyB">
       </div> 
    </div>
</div>   


<div id="c" class="hidden">
    <div class="popover-heading">
       대 분류 선택
    </div>
    <div class="popover-body" >
       <div id="inbodyC">
		    <c:forEach var="intermain" items="${intermainlist }" varStatus="status">
				<button type="button" id="main${status.index}" name="main${status.index}" class="btn btn-120-35 btn-pop-main" value="${intermain.interMainId1 }">${intermain.interMainName1 }</button>
			</c:forEach>
       </div>

    </div>
</div>


<div id="d" class="hidden">
    <div class="popover-heading">
       소 분류 선택
    </div>
    
    <div class="popover-body" >
       <div id="inbodyD">
       </div> 
    </div>
</div>   
</body>
</html>