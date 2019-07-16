<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <!-- 부트스트랩(bootstrap css, jquery, popper.js, bootstrap js 필요) -->
    <link href="css/bootstrap-4.3.1.min.css" rel="stylesheet">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper-1.14.7.min.js"></script>
   	<script src="js/bootstrap-4.3.1.min.js"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="css/sagyo-font.css" rel="stylesheet">
    
    <!-- Slider -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- sagyo.css, sagyo.js -->
    <link href="css/sagyo.css" rel="stylesheet">
	
	
   <style>
       .Main{
           width: 100%;
       }
       .Main>div{
           width: 100%;
       }
       .Main-navbar{
            flex-basis: 100px;
            padding-left: 35px;
            font-size: 30px;
            width: 100%;
       }
       .Main-search{
            flex-basis: 455px;
            background-image: url('img/Main.png');
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            padding-top: 120px;
            padding-bottom: 75px;
       }
       .Main-search-text{
           z-index: 1;
           color: white;
           font-size: 35px;
           font-weight: bold;
       }
       .Main-search-form{
           z-index: 1;
           width: 570px;
       }
       .Main-search-form>form{
           height: 95px;
           display: flex;
           flex-direction: column;
           justify-content: space-between;
           align-items: center;
       }
       .Main-search-form input{
           height: 42px;
       }
       .Main-search-layer{
           width: 100%;
           height: 100%;
           position: absolute;
           top:0px;
           left:0px;
           background-color: rgba(0,0,0,0.3);
           z-index: 0;
       }
       .Main-body{
            padding: 0px 45px 0px 45px;
       }
       .Main-body>div{
           width: 100%;
       }
       .Main-badge{
           background-color: rgb(248,248,248);
           padding: 0px 15px 0px 15px;
           border-top: 2px solid rgb(220,220,220);
           border-bottom: 2px solid rgb(220,220,220);
       }

       .Main-badge-box{
           height: 185px;
           border-top: 2px solid rgb(220,220,220);
       }
       .Main-badge-left{
           width: 260px;
       }
       .Main-badge-badge{
           width: 120px;
           height: 120px;
       }
       .Main-badge-right, .Main-badge-center{
            padding: 35px 0px 35px 0px;
            width: 300px;
            height: 100%;
            justify-content: space-between;
       }
       .Main-badge-center{
           padding-right: 100px;
       }
       .Main-badge-title{
           font-size: 20px;
           font-weight: bold;
       }
       .Main-badge-contents, .Main-badge-detail{
           font-size: 16px;
       }

       
        .PostList-label{
            margin: 10px 0px 10px 15px;
            font-size: 20px;
            font-weight: bold;
        }

        .footer-box{
            flex-basis: 250px;
            background-color: rgb(255,159,16);
            width: 100%;
        }

        /*  */
        .Main-navbar span{
            width: 320px;
            font-size: 13px;
        }
        .Search{
            width: 100%;
        }
        .Search-filter{
            width: 100%;
            flex-basis: 130px;
            background-color: rgb(245,245,245);
            box-shadow: 0px 0px 5px 1px rgba(0,0,0,0.1);

            display: flex;
            flex-wrap: wrap;
            align-content: space-between;
            padding: 13.3px 13.3px 13.3px 13.3px;
        }
        .Search-filter-item{
            height: 45px;
            padding: 0px 15px 0px 15px;
            margin-right: 15px;
            border-radius: 30px;
            background-color: white;
            box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.03);
        }
        .Search-result-box{
            /* 높이는 수정해야됨 */
            height: 660px; 
            width: 100%;
        }
        .Search-result-box>div{
            width: 100%;
            padding: 0px 50px 0px 50px;
        }
        .Search-result-header{
            height: 55px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .Search-result-header>div{
            padding: 0px 20px 0px 20px;
        }
        .Search-result-body{
            overflow-y: scroll;
            overflow-x: hidden;
        }
        .Search-filter-modal{
            margin: 0px auto 0px auto;
            display: flex;
            justify-content: center;
            align-items:center; 
            height: 100%;
        }
        .modal-xlg{
            max-width: 1200px;
        }
        .Search-filter-modal form{
            width: 100%;
            height: 100%;
            padding: 0px 20px 0px 20px;
        }
        .Search-filter-modal form>div{
            width: 100%;
        }
        .Search-filter-modal-footer{
            padding: 35px 0px 35px 0px;
        }
        .Search-filter-modal-header{
            padding: 25px 30px 25px 30px;
            border-bottom: 2px solid rgb(220,220,220);
        }
        .Search-filter-modal-header span:first-child{
            font-size: 24px;
            font-weight: bold;
        }
        .Search-filter-modal-header span:first-child{
            font-size: 24px;
            font-weight: bold;
        }

        .Search-filter-modal-body{
            padding: 0px 245px 0px 245px;
        }
        .Search-filter-modal-body>div{
            width: 100%;
            border-bottom: 2px solid rgb(220,220,220);
        }
        .filter-attribute{
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 15px 0px 15px 0px;
        }
        .filter-attribute2{
        	width: 50%;
        }
        .filter-attribute>div:first-child{
            width: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 16px;
        }
        #filterBtn{
        	background-color: rgba(0,0,0,0);
        	border: none;
        }
        
	.radio-div {
	  display: inline-flex;
	  align-items: center;
	  margin-right: 5px;
	}
	.radio-div label{
		margin-bottom: 0px;
	}
	input[type='radio'],
	input[type='radio']:checked {
		-webkit-appearance:none;
	  width: 0.9rem;
	  height: 0.9rem;
	  border-radius: 100%;
	  margin-right: 0.1rem;
	}
	
	input[type='radio'] {
	  background-color: white;
	  border: 1.5px solid rgba(255,170,10);
	}
	input[type='radio']:checked {
	  background-clip: content-box;
	  background-color: orange;
	  border: 1.5px solid rgba(255,170,10);
	  padding: 2px 2px 2px 2px;
	}
	
	.slider-range-box{
		width: 275px;
	}
   </style>

   <script>
   	   var pageNum = 1;
   	   var js = jQuery.noConflict();

   	   
       $(document).ready(function(){
    	   
    	   
			js( "#slider-range" ).slider({
		      range: true,
		      min: 2,
		      max: 20,
		      values: [ 2, 20 ],
		      slide: function( event, ui ) {
		    	  js(this).next().val(ui.values[ 0 ]);
		    	  js(this).next().next().val(ui.values[ 1 ]);
		    	  js("#filter-minNum").text(ui.values[ 0 ]);
		    	  js("#filter-maxNum").text(ui.values[ 1 ]);
		      }
		    });
			
			// 필터에 있는 만남일 초기값은 현재일에 따라 바뀌어야 함
			js("input[name='minMeetDate']").val(sysdateToString(2));
			js("input[name='maxMeetDate']").val(sysdateToString(10));
			js("#filter-minMeetDate").text(sysdateToString(2));
	    	js("#filter-maxMeetDate").text(sysdateToString(10));
			js( "#slider-range2" ).slider({
			      range: true,
			      min: 2,
			      max: 10,
			      values: [ 2, 10 ],
			      slide: function( event, ui ) {
			    	  js(this).next().val(sysdateToString(ui.values[ 0 ]));
			    	  js(this).next().next().val(sysdateToString(ui.values[ 1 ]));
			    	  js("#filter-minMeetDate").text(sysdateToString(ui.values[ 0 ]));
			    	  js("#filter-maxMeetDate").text(sysdateToString(ui.values[ 1 ]));
			      }
			    });
    		
    	   
    	// Search.jsp 진입시 → setSearchCookies : 전에 있던 Search용 쿠키 값 비워주고 기본 값들로 채워줌
    	setSearchCookies();
    	function setSearchCookies(){
    		document.cookie="addrGuId1=";
    		document.cookie="addrGuId2=";
    		document.cookie="addrGuId3=";
    		document.cookie="interSubId1=";
    		document.cookie="interSubId2=";
    		document.cookie="interSubId3=";
    		document.cookie="minMeetDate=2019-07-01";
    		document.cookie="maxMeetDate=2020-07-31";
    		document.cookie="moodId=";
    		document.cookie="drinkId=";
    		document.cookie="sameGenderId=";
    		document.cookie="minNum=2";
    		document.cookie="maxNum=20";
    		document.cookie="limitGrade=1";
    	}
    	   
           /* *************************************** */
           
		// 별점 보여줄때 쓰이는 jQuery. hidden input value 안에 입력받은 숫자 만큼 width를 바꿔줌
		// jsp→html 만들때 hidden input태그의 value에 값이 들어가고
		// html이 document.ready될때 아래 별점 채우기가 시작됨
	    $(".star-show>div:nth-child(2)").css("width", $(".star-show>input").val()*20+"%");
		
	    // 별점 평가시 쓰이는 jQuery
	    // 평가용 별 누를때 마다 발동됨
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

           /* *************************************** */
           // 모달 함수 가능하게 해줌
            $('#Search-filter-modal').on('shown.bs.modal', function () {
            });
			
    	    // 필터창 킬때 주소, 관심사 1개만 노출(여러번 필터쓸때를 위해서)
			$('#filterBtn').click(function(){
				$('.filter-plus').removeClass('hidden');
				$('.additional-filter').addClass("hidden");
			});
			
    	    // 주소 추가 함수
            $('.filter-plus').click(function(){
                console.log(this);
                
				$(this).addClass("hidden");
				$(this).parent().next().removeClass("hidden");
				return false;
            });
    	    
            // 페이지 요청시 게시글 불러옴
            callList(pageNum);
            
            // 무한 스크롤
           	$(".Search-result-body").scroll(function(){
           		div = $(".Search-result-body")[0];
				
           		if(div.scrollHeight==(div.scrollTop+div.clientHeight)){
           			pageNum++;
					callList(pageNum);
           		}
           	})
           	
           	// 페이지 최초 요청시 게시글 불러오고, 스크롤 내리면 또 불러오는 함수
           	function callList(pageNum){
				console.log('ajax 페이지 요청 : ', pageNum);
				document.cookie = "pageNum="+pageNum;
				
           		$.ajax({
           			url: 'searchajax.action',
           			data: cookieToJson(),
           			type: 'GET',
           			dataType: 'html'
           		}).done(function(result){
               		$('.Search-result-body').append(result);
           		}); 
           	};
         	
           	// 현재 쿠키상태를 기반으로 필터창을 갈아줌
           	function fillFilter(){
           		// 비워주고
           		$(".Search-filter-cookie").remove();
           		// 쿠키 Json으로 만들고
           		var json = cookieToJson();
           		// 필수 필터들 입력 → 기본 값이 아닐시에만 출력
           		if(json.minNum!="2" || json.maxNum!="20"){
    				$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="minNum">인원수 : '+json.minNum+' ~ '+json.maxNum+' <a class="filter-cancle1" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');           			
           		}
           		if(json.minMeetDate!=defaultMinMeetDate() || json.maxMeetDate!=defaultMaxMeetDate()){
    				$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="minMeetDate">만남일 : '+json.minMeetDate+' ~ '+json.maxMeetDate+' <a class="filter-cancle1" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');           			
           		}
				if(json.limitGrade!="1"){
					$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="limitGrade">참가제한 : '+json.limitGrade+'점 이상 <a class="filter-cancle1" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');					
				}
				// 부가 필터는 있으면 입력
				if(json.addrGuId1!=""){
					$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="addrGuId1">'+$("#addrSiName1").text()+' '+json.addrGuName1+' <a class="filter-cancle2" href="#" >&nbsp;&nbsp;Ｘ</a></div>');
				}
				if(json.addrGuId2!=""){
					$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="addrGuId2">'+$("#addrSiName2").text()+' '+json.addrGuName2+' <a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
				}
				if(json.addrGuId3!=""){
					$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="addrGuId3">'+$("#addrSiName3").text()+' '+json.addrGuName3+' <a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
				}
				if(json.interSubId1!=""){
					$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="interSubId1">'+$("#interMainName1").text()+' > '+json.interSubName1+' <a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
				}
				if(json.interSubId2!=""){
					$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="interSubId2">'+$("#interMainName2").text()+' > '+json.interSubName2+' <a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
				}
				if(json.interSubId3!=""){
					$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="interSubId3">'+$("#interMainName3").text()+' > '+json.interSubName3+' <a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
				}
				if(json.moodId!=""){
					if(json.moodId=="MI00002"){
						$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="moodId">진지한<a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
					}
					else{
						$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="moodId">가벼운<a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
					}
				}
				if(json.drinkId!=""){
					if(json.drinkId="DR00001"){
						$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="drinkId">음주가능<a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
					}else{
						$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="drinkId">음주불가<a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
					}
				}
				if(json.sameGenderId!=""){
					$("#Search-filter").append('<div class="Search-filter-item flex-row-center-center Search-filter-cookie" id="sameGenderId">동성만<a class="filter-cancle2" href="#" disabled>&nbsp;&nbsp;Ｘ</a></div>');
				}
           	}
           	
           	// 필수 정보 필터는 취소하면 기본값으로 만듬
           	$(document).on("click", ".filter-cancle1", function(){
           		id = $(this).parent().attr("id");
           		if(id=="minNum"){
           			document.cookie="minNum=2";
           			document.cookie="maxNum=20";
           		}else if(id=="minMeetDate"){
           			document.cookie="minMeetDate="+defaultMinMeetDate();
           			document.cookie="maxMeetDate="+defaultMaxMeetDate();
           		}else if(id=="limitGrade"){
           			document.cookie="limitGrade=1";
           		}
           		// 필터창 갈아주고
			  	fillFilter();
           		// 결과창 비워주고
           		$('.Search-result-body').empty();
			  	// 필터 새로 적용하면 페이지 넘버 초기화
			  	pageNum=1;
			 	 // 페이지 넘버랑 같이 해서 ajax호출(검색 키워드 쿠키는 search.action 최초 호출시 컨트롤러에서 채워놓음)
			  	callList(pageNum);
           		return false;
           	})
           	
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
           	function defaultMaxMeetDate(){
           		var date = new Date();
           		date.setDate(date.getDate()+10);
           		var result = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
           		return result;
           	}
           	// 부가정보 필터는 취소하면 해당 쿠키 비움
           	$(document).on("click", ".filter-cancle2", function(){
           		document.cookie= $(this).parent().attr("id")+"=";
           		moveAddrInter("addrGu");
           		moveAddrInter("interSub");
			  	// 필터창 갈아주고
			  	fillFilter();
			  	// 결과창 비워주고
			  	$('.Search-result-body').empty();
			  	// 필터 새로 적용하면 페이지 넘버 초기화
			  	pageNum=1;
			 	 // 페이지 넘버랑 같이 해서 ajax호출(검색 키워드 쿠키는 search.action 최초 호출시 컨트롤러에서 채워놓음)
			  	callList(pageNum);
           		return false;
           	});
           	
           	// 필터 X 누르는 순서때문에 addr이나 inter중 앞에게 비었을때 메꿔주는거
			function moveAddrInter(what){
				var id1 = what+"Id1";
				var id2 = what+"Id2";
				var id3 = what+"Id3";
				var name1 = what + "Name1";
				var name2 = what + "Name2";
				var name3 = what + "Name3";
				if( cookieIsEmpty(id1) && (!cookieIsEmpty(id2)) ){
					document.cookie=id1+"="+getCookie(id2);
					document.cookie=id2+"=";
					document.cookie=name1+"="+getCookie(name2);
					document.cookie=name2+"=";
					if( what=="addrGu" ){
						document.cookie="addrSiName1="+getCookie("addrSiName2");
					}else if( what=="interSub"){
						document.cookie="interMainName1="+getCookie("interMainName2");
					}
				}else if( cookieIsEmpty(id1) && cookieIsEmpty(id2) && (!cookieIsEmpty(id3)) ){
					document.cookie=id1+"="+getCookie(id3);
					document.cookie=id3+"=";
					document.cookie=name1+"="+getCookie(name3);
					document.cookie=name3+"=";
					if( what=="addrGu" ){
						document.cookie="addrSiName1="+getCookie("addrSiName3");
					}else if( what=="interSub"){
						document.cookie="interMainName1="+getCookie("interMainName3");
					}
				}
			}
			// 쿠키가 비었니?
			function cookieIsEmpty(cookieName){
				var cookie = getCookie(cookieName);
				if(cookie==null || cookie==""){
					return true;
				}
				return false;
			}
			// 쿠키 얻기
			function getCookie(name) {
				  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
				  return value? value[2] : null;
			};
           	// 현재 문서의 쿠키를 Json으로 바꿔줌
           	function cookieToJson(){
           		var result='{';
           		cookies = document.cookie;
           		cookies.split("; ").forEach(function(cookie){
           			result+=(',"'+cookie.split("=")[0]+'"');
           			result+=(':"'+cookie.split("=")[1]+'"');
           		});
           		result+='}';
           		var result2 = result.replace(",", "");
           		console.log(JSON.parse(result2));
           		return JSON.parse(result2);
           	}
           	
           	// 필터 모달 적용시
           	$("#filterOnBtn").click(function(){
           		// 결과창 비우는 함수
           		$('.Search-result-body').empty();
           		
           		// 폼에 있는거 다 집어서
 	          	$( "#filterForm" ).submit(function( event ) {
 	          	  values = $(this).serializeArray();
				  // 쿠키로 만들고
 	          	  values.forEach(function(item){
					 document.cookie= item.name+"="+item.value;
				  }); 
				  // addrSiName, interSubName도 쿠키로 만듬
				  for (var i = 1; i < 4; i++)
				  {
						document.cookie="addrSiName"+i+"="+$("#addrSiName"+i).text();
						document.cookie="interMainName"+i+"="+$("#interMainName"+i).text();
				  }
				  // 필터창 갈아주고
				  fillFilter();
				  // 필터 새로 적용하면 페이지 넘버 초기화
				  pageNum=1;
				  // 페이지 넘버랑 같이 해서 ajax호출(검색 키워드 쿠키는 search.action 최초 호출시 컨트롤러에서 채워놓음)
				  callList(pageNum);
				  
				  $('#Search-filter-modal').modal("hide");
				  
				  return false;
 	          	});
           	});
           	
           	// 필터에서 x 누르면 일어나는 함수

           	
			var a;
			$(".btn-check-cate1").click(function() {
				a = $(this).val();
				btn = $(this);
				console.log("a = " + a);
				$(".btn-pop-sido").click(function() {
					
					$("#addrSiName"+a).text($(this).text());
					btn.next().text("구·군");
					btn.next().next().val("");
					btn.next().next().next().val("");
					var siid = $(this).val();
					var str = "";
					 $.ajax({
		                   url: '<%=cp %>/addrguajax.action',
		                   type: 'GET',
		                   dataType: 'html',
		                   data : {'siid': siid}
		                }).done(function(result){
		                  
							console.log('성공');
							$("#inbodyB"+a).empty();
							$("#inbodyB"+a).append(result);
		                }); 
				})
				
			})
			
			
			
			
			var c;
			$(".btn-check-cate2").click(function()
			{
				c = $(this).val();
				$(".btn-pop-gu").click(function()
				{
					$("#btn-check-gugun"+c).text($(this).text());
					 
					$("#addrGuId"+c).val($(this).val());
					$("#addrGuName"+c).val($(this).text());
					
					console.log("구 아이디 = " + $("#addrGuId"+c).val());
					console.log("구 이름 = " + $("#addrGuName"+c).val());
				})
			})
			
			
			
			/* interSubName1 */
			var d;
			$(".btn-check-cate3").click(function() {
				d = $(this).val();
				btn = $(this);
				$(".btn-pop-main").click(function() {
					$("#interMainName"+d).text($(this).text());
					btn.next().text("소분류");
					btn.next().next().val("");
					btn.next().next().next().val("");
					var mainid = $(this).val();
					
					$.ajax({
							url: '<%=cp %>/intersubajax.action',
							type: 'GET',
							dataType: 'html',
							data: {'mainid': mainid}
						}).done(function(result) {
							console.log('성공')
							
							$("#inbodyD"+d).empty();
							$("#inbodyD"+d).append(result);
						})
				})
			})
			
			var e;
			$(".btn-check-cate4").click(function()
			{
				e = $(this).val();
				console.log(e);
				$(".btn-pop-sub").click(function()
				{
					$("#btn-check-sub"+e).text($(this).text());
					 
					$("#interSubId"+e).val($(this).val());
					$("#interSubName"+e).val($(this).text());
					
					console.log("서브 아이디 = " + $("#interSubId"+e).val());
					console.log("서브 이름 = " + $("#interSubName"+e).val());
				})
			})
       })
	
       	$(function(){
       		
		    $("[data-toggle=popover]").popover({
		        html : true,
		        sanitize : false,
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
       
   </script>
</head>
<body>
    <div class="browser flex-col-center-center">
		
		
		<c:import url="/WEB-INF/views/Navbar.jsp"></c:import>
		
		
        <div class="body-box flex-item-grow flex-col-center-up">

            <div class="body flex-item-grow flex-col-center-center">
                <div class="Search flex-item-grow flex-col-center-up">
                    <!-- 맨 위 -->
                    <div class="Main-navbar flex-row-left-center">
                       통합검색&nbsp;&nbsp;&nbsp;<span>검색 키워드와 개설자의 신뢰도를 바탕으로 추천했습니다. 회원가입 후 더 상세한 추천을 받을 수 있습니다.</span>
                    </div>

                    <!-- 필터창 -->
                    <div class="Search-filter" id="Search-filter">
                        <div class="Search-filter-item flex-row-center-center">검색 : ${inputKeyword }</div>
                    </div>

                    <!-- 글목록 -->
                    <div class="Search-result-box flex-col-center-up">
                        <!-- 글목록 헤더 -->
                        <div class="Search-result-header">
                            <div>
                                <!-- 카테고리용으로 비워둠 -->
                            </div>
                            <div>
                                <button id="filterBtn" type="button" class="btn btn-primary"  data-toggle="modal" data-target="#Search-filter-modal"><img src="img/필터.png" alt="" /></button>
                            </div>
                        </div>

                        <div class="modal fade" id="Search-filter-modal" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-xlg Search-filter-modal">
                                <div class="modal-content">
                                    <form action="" class="flex-col-center-center" id="filterForm">

                                        
                                        <div class="Search-filter-modal-header">
                                            <div>
                                                <span>필터</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>sagyo의 추천 결과중 필터링할 정보를 설정합니다. 필터링 후 재추천 해드립니다.</span>
                                            </div>
                                        </div>

                                        <div class="Search-filter-modal-body flex-col-center-center">
                                            <div class="filter-attribute">
                                                <div>만남장소</div>
                                                
                                                 <div class="flex-col-left-center">
                                                 
                                                    <div class="flex-row-left-center">
															<button type="button" class="btn btn-check-cate1 btn-120-35" id="addrSiName1" name="addrSiName1" value="1" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#a1" data-placement="bottom">시·도</button>
						                                	<button type="button" class="btn btn-check-cate2 btn-120-35" id="btn-check-gugun1"               value="1" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#b1" data-placement="bottom">구·군</button>
															 <input type= "hidden" id="addrGuId1" name="addrGuId1" value="">
															 <input type= "hidden" id="addrGuName1" name="addrGuName1" value="">
															 <button class="btn filter-plus">+</button>  
                                                    </div>
                                                                                                                      
                                                    <div class="flex-row-left-center hidden additional-filter">                               
						                                    <button type="button" class="btn btn-check-cate1 btn-120-35" id="addrSiName2" name="addrSiName2" value="2" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#a2" data-placement="bottom">시·도</button>
															<button type="button" class="btn btn-check-cate2 btn-120-35" id="btn-check-gugun2" value="2" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#b2" data-placement="bottom">구·군</button>
															<input type= "hidden" id="addrGuId2" name="addrGuId2" value="">
															<input type= "hidden" id="addrGuName2" name="addrGuName2" value="">
															<button class="btn filter-plus">+</button>   
                                                    </div>
                                                                                                                       
                                                    <div class="flex-row-left-center hidden additional-filter">                                
						                                   <button type="button" class="btn btn-check-cate1 btn-120-35" id="addrSiName3" name="addrSiName3" value="3" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#a3" data-placement="bottom">시·도</button>
						                                   <button type="button" class="btn btn-check-cate2 btn-120-35" id="btn-check-gugun3" value="3" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#b3" data-placement="bottom">구·군</button>
															<input type= "hidden" id="addrGuId3" name="addrGuId3" value="">
															<input type= "hidden" id="addrGuName3" name="addrGuName3" value="">
                                                    </div> 
                                                                                                                              
                                                 </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>관심사</div>
                                                <div class="flex-col-left-center">
                                                    <div class="flex-row-left-center">
					                                    <button type="button" class="btn btn-check-cate3 btn-120-35 " id="interMainName1" name="interMainName1" value="1" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#c1" data-placement="bottom">대분류</button>
					                                	<button type="button" class="btn btn-check-cate4 btn-120-35 " id="btn-check-sub1" name="btn-check-sub1" value="1" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#d1" data-placement="bottom">소분류</button>
														 <input type= "hidden" id="interSubId1" name="interSubId1" value="">
														 <input type= "hidden" id="interSubName1" name="interSubName1" value="">
                                                        <button class="btn filter-plus">+</button>                                     
                                                    </div>                                                                         
                                                    <div class="flex-row-left-center hidden additional-filter">                                      
					                                    <button type="button" class="btn btn-check-cate3 btn-120-35 " id="interMainName2" name="interMainName2" value="2" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#c2" data-placement="bottom">대분류</button>
					                                	<button type="button" class="btn btn-check-cate4 btn-120-35 " id="btn-check-sub2" name="btn-check-sub2" value="2" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#d2" data-placement="bottom">소분류</button>
														 <input type= "hidden" id="interSubId2" name="interSubId2" value="">
														 <input type= "hidden" id="interSubName2" name="interSubName2" value="">
                                                        <button class="btn filter-plus">+</button>                                
                                                    </div>                                                                    
                                                    <div class="flex-row-left-center hidden additional-filter">                                 
					                                    <button type="button" class="btn btn-check-cate3 btn-120-35 " id="interMainName3" name="interMainName3" value="3" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#c3" data-placement="bottom">대분류</button>
					                                	<button type="button" class="btn btn-check-cate4 btn-120-35 " id="btn-check-sub3" name="btn-check-sub3" value="3" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#d3" data-placement="bottom">소분류</button>
														 <input type= "hidden" id="interSubId3" name="interSubId3" value="">
														 <input type= "hidden" id="interSubName3" name="interSubName3" value="">
                                                    </div>                                                                                                        
                                                </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>인원수</div>
                                                <div class="flex-row-left-center">
                                                	<div class="slider-range-box">
	                                                	<div id="slider-range" class=" input-w-250"></div>
	                                                	<input type="text" name="minNum" class="price-slider-one hidden" value="2">
               	                            			<input type="text" name="maxNum" class="price-slider-two hidden" value="20">
                                                	</div>
                                                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<span id="filter-minNum">2</span>&nbsp;~&nbsp;<span id="filter-maxNum">20</span>&nbsp;명
                                                </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>만남일</div>
                                                <div class="flex-row-left-center">
                                                	<div class="slider-range-box">
	                                                	<div id="slider-range2" class=" input-w-250"></div>
	                                                	<input type="text" name="minMeetDate" class="price-slider-one hidden" value="">
               	                            			<input type="text" name="maxMeetDate" class="price-slider-two hidden" value="">
                                                	</div>
                                                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<span id="filter-minMeetDate">2</span>&nbsp;~&nbsp;<span id="filter-maxMeetDate">20</span>&nbsp;
												</div>
                                            </div>
                                            <div class="flex-row-left-center">
                                            	<div class="filter-attribute filter-attribute2 flex-row-left-center">
	                                                <div>분위기</div>
	                                                <div class="flex-row-left-center">
	                                                    <div class="radio-div"><input type="radio" id="moodId1" name="moodId" value="" checked><label for="moodId1">무관</label></div>
	                                                    <div class="radio-div"><input type="radio" id="moodId2" name="moodId" value="MI00002"> <label for="moodId2">진지한</label></div>
	                                                    <div class="radio-div"><input type="radio" id="moodId3" name="moodId" value="MI00003"> <label for="moodId3">가벼운</label></div>
	                                                </div>
                                            	</div>
                                            	<div class="filter-attribute filter-attribute2 flex-row-left-center">
                                            		<div>음주여부</div>
                                            		<div class="flex-row-left-center">
                                            			<div class="radio-div"><input type="radio" id="drinkId1"  name="drinkId" value="" checked><label for="drinkId1">무관 </label></div>
	                                                    <div class="radio-div"><input type="radio" id="drinkId2"  name="drinkId" value="DR00001"> <label for="drinkId2">허용 </label></div>
	                                                    <div class="radio-div"><input type="radio" id="drinkId3"  name="drinkId" value="DR00002"> <label for="drinkId3">불가</label></div> 
                                            		</div>
                                            	</div>
                                            </div>
                                            <div class="flex-row-left-center">
                                            
                                            	<div class="filter-attribute filter-attribute2 flex-row-left-center">
                                            		<div>참가제한</div>
                                            		<div>
														<div class="star-rating star-20-box flex-row-left-center">
															<img class="" id="1" src="img/star.png" alt=""/>
															<img class="grayscale" id="2"  src="img/star.png" alt="" />
															<img class="grayscale" id="3"  src="img/star.png" alt="" />
															<img class="grayscale" id="4"  src="img/star.png" alt="" />
															<img class="grayscale" id="5"  src="img/star.png" alt="" />
															<input class="hidden" type="text" id="limitGrade" name="limitGrade" value="1" />
														</div>                                            		
                                            		</div>

                                            	</div>
                                            	
                                            	<div class="filter-attribute filter-attribute2 flex-row-left-center">
                                            	    <div>동성여부</div>
                                            		<div class="flex-row-left-center">
                                            		    <div class="radio-div"><input type="radio" id="sameGenderId1" name="sameGenderId" value="" checked><label for="sameGenderId1"> 무관</label></div>
	                                                    <div class="radio-div"><input type="radio" id="sameGenderId2" name="sameGenderId" value="SG00001"> <label for="sameGenderId2">동성만</label></div>
                                            		</div>
                                            	</div>
                                            	
                                            </div>
                                        </div>

                                        <div class="Search-filter-modal-footer flex-col-center-center">
                                            <button class="btn btn-orange btn-160-45" id="filterOnBtn" >필터적용</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 진짜 글목록 -->
                        <div class="Search-result-body">









							

                        </div>
                    </div>

                </div>
            </div>

        </div>
        
    </div>
    
    
    
    
    
    



<!-- Content for Popover #1 -->
<c:forEach var="i" begin="1" end="3">
	<div id="a${i}" class="hidden">
	    <div class="popover-heading">
	       시·도 선택
	    </div>
	    <div class="popover-body" >
	       <div id="inbodyA${i}">
			    <c:forEach var="addrsi" items="${addrsilist }" varStatus="status">
					<button type="button" id="si${status.index}" name="si${status.index}" class="btn btn-120-35 btn-pop-sido" value="${addrsi.addrSiId1 }">${addrsi.addrSiName1 }</button>
				</c:forEach>
	       </div> 
	
	    </div>
	</div>
</c:forEach>




<c:forEach var="j" begin="1" end="3">
<div id="b${j}" class="hidden">
    <div class="popover-heading">
       구·군 선택
    </div>
    
    <div class="popover-body" >
       <div id="inbodyB${j}">
       </div> 
    </div>
</div>   
</c:forEach>


<c:forEach var="k" begin="1" end="3">
	<div id="c${k}" class="hidden">
	    <div class="popover-heading">
	       대 분류 선택
	    </div>
	    <div class="popover-body" >
	       <div id="inbodyC${k}">
			    <c:forEach var="intermain" items="${intermainlist }" varStatus="status">
					<button type="button" id="main${status.index}" name="main${status.index}" class="btn btn-120-35 btn-pop-main" value="${intermain.interMainId1 }">${intermain.interMainName1 }</button>
				</c:forEach>
	       </div>
	
	    </div>
	</div>
</c:forEach>


<c:forEach var="l" begin="1" end="3">
<div id="d${l}" class="hidden">
    <div class="popover-heading">
       소 분류 선택
    </div>
    
    <div class="popover-body" >
       <div id="inbodyD${l}">
       </div> 
    </div>
</div>   
</c:forEach>





</body>
</html>