<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	session.setAttribute("userId", "lks");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
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
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
        
        
        
        

   </style>

   <script>
   	   var pageNum = 1;
   	   
   	   
       $(document).ready(function(){
    	   
    	// Search.jsp 진입시 → setSearchCookies : 전에 있던 Search용 쿠키 값 비워주고 기본 값들로 채워줌
    	setSearchCookies();
    	function setSearchCookies(){
    		document.cookie="userId="+sessionStorage.getItem("userId");
    		document.cookie="keyword="+"|keyword|";
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
           	
           	$(".ajaxbtn").click(function(){
           		
           		callList(pageNum);
           	});
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
           	
           	$("#filterOnBtn").click(function(){
           		$('.Search-result-body').empty();
           		
 	          	$( "#filterForm" ).submit(function( event ) {
 	          	  values = $(this).serializeArray();
				  values.forEach(function(item){
					 document.cookie= item.name+"="+item.value;
				  });  
				  pageNum=1;
				  callList(pageNum);
 	          	  return false;
 	          	});
           	});
           	
           	
           	
           	
           	
           	
           	
           	
           	var a;
			$(".btn-check-cate1").click(function() {
				a = $(this).val();
				console.log("a = " + a);
				$(".btn-pop-sido").click(function() {
					
					$("#addrSiName"+a).text($(this).text());
					
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
				
				$(".btn-pop-main").click(function() {
					$("#interMainName"+d).text($(this).text());
					
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
                    <div class="Search-filter">
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
                        <div class="Search-filter-item flex-row-center-center">사진 촬영<a href="" disabled>&nbsp;&nbsp;Ｘ</a></div>
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
                                                        <button type="text" class="btn btn-120-35" name="addrSiId1" id="addrSiId1" value="SI00001" >서울특별시</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35 addrGuId" name="addrGuId1" id="addrGuId1" value="SI00003" >동작구</button>
                                                        <input type="text" class="hidden" name="addrGuId1" value="GU00003"/>
                                                        <button class="filter-plus">+</button>                                
                                                    </div>                                                                  
                                                    <div class="flex-row-left-center hidden additional-filter">                               
                                                        <button type="text" class="btn btn-120-35" name="addrSiId2" id="addrSiId2" value="SI00001" >서울특별시</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35 addrGuId" name="addrGuId2" id="addrGuId2" value="SI00003" >동작구</button>
                                                        <input type="text" class="hidden" name="addrGuId2" value="GU00001"/>
                                                        <button class="filter-plus">+</button>                               
                                                    </div>                                                                   
                                                    <div class="flex-row-left-center hidden additional-filter">                                
                                                        <button type="text" class="btn btn-120-35" name="addrSiId3" id="addrSiId3" value="SI00001" >서울특별시</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35 addrGuId" name="addrGuId3" id="addrGuId3" value="SI00003" >동작구</button>
                                                        <input type="text" class="hidden" name="addrGuId3" value="GU00010"/>
                                                    </div>                                                                           
                                                 </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>관심사a</div>
                                                <div class="flex-col-left-center">
                                                    <div class="flex-row-left-center">
                                                        <button type="text" class="btn btn-120-35" name="interMainId1" id="interMainId1"  value="IM00001" readonly>스포츠</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35 interSubId" name="interSubId1"  id="interSubId1"  value="IS00003" readonly>축구</button>
                                                        <input type="text" class="hidden" name="interSubId1" value=""/>
                                                        <button class="filter-plus">+</button>                                     
                                                    </div>                                                                         
                                                    <div class="flex-row-left-center hidden additional-filter">                                      
                                                        <button type="text" class="btn btn-120-35" name="interMainId2" id="interMainId2"  value="IM00001" readonly>스포츠</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35 interSubId" name="interSubId2"  id="interSubId2"  value="IS00003" readonly>축구</button>
                                                        <input type="text" class="hidden" name="interSubId2" value=""/>
                                                        <button class="filter-plus">+</button>                                
                                                    </div>                                                                    
                                                    <div class="flex-row-left-center hidden additional-filter">                                 
                                                        <button type="text" class="btn btn-120-35" name="interMainId3" id="interMainId3"  value="IM00001" readonly>스포츠</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35 interSubId" name="interSubId3"  id="interSubId3"  value="IS00003" readonly>축구</button>
                                                    	<input type="text" class="hidden" name="interSubId3" value=""/>
                                                    </div>                                                                                                        
                                                </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>인원수</div>
                                                <div class="flex-row-left-center">
                                                    <input type="text" name="minNum" value="2" />임시
                                                    <input type="text" name="maxNum"  value="19" />인원수
                                                </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>만남일</div>
                                                <div>
                                                    <input type="text" name="minMeedDate" value="2019-07-12" />임시
                                                    <input type="text" name="maxMeetDate"  value="2019-07-20" />만남일
												</div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>분위기</div>
                                                <div>
                                                    <input type="radio" name="moodId" value="MD00001"> 무관
                                                    <input type="radio" name="moodId" value="MD00002"> 진지한
                                                    <input type="radio" name="moodId" value="MD00003"> 가벼운
                                                </div>
                                            </div>
                                            <div class="filter-attribute flex-col-left-center">
                                            	<div>
                                            		<div>참가제한</div>
                                            		<div>
														<div class="star-rating star-20-box flex-row-left-center">
															<img class="" id="1" src="img/star.png" alt=""/>
															<img class="grayscale" id="2"  src="img/star.png" alt="" />
															<img class="grayscale" id="3"  src="img/star.png" alt="" />
															<img class="grayscale" id="4"  src="img/star.png" alt="" />
															<img class="grayscale" id="5"  src="img/star.png" alt="" />
															<input class="hidden" type="text" id="limitGrade" name="limitGrade" value="" />
														</div>                                            		
                                            		</div>

                                            	</div>
                                            	<div>
                                            		<div>음주가능</div>
                                            		<div>
                                            			<input type="checkbox" name="drinkId" value="DR00001"/>
                                            			<input type="hidden" name="drinkId" value="DR00002"/>
                                            		</div>
                                            	</div>
                                            	<div>
                                            	    <div>동성만</div>
                                            		<div>
                                            			<input type="checkbox" name="sameGenderId" value="SG00001"/>
                                            			<input type="hidden" name="sameGenderIdss" value="SG00002"/>
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
    <!-- Content for Popover #1 -->
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