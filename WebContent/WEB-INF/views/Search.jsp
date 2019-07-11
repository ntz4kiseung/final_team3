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
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">

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
   </style>

   <script>
   	   var pageNum = 1;
   	   
       $(document).ready(function(){
    	   
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
           	
           	
           	// 페이지 최초 요청시 게시글 불러오고, 스크롤 내리면 또 불러오는 함수
           	function callList(pageNum){

           		$.ajax({
           			url: 'searchajax.action',
           			data: {pageNum : pageNum},
           			type: 'GET',
           			dataType: 'html'        			
           		}).done(function(result){
           			$('.Search-result-body').append(result);
           		}); 
           	};
         
       })

       
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
                                <button id="filterBtn" type="button" class="btn btn-primary"  data-toggle="modal" data-target="#Search-filter-modal">필터</button>
                            </div>
                        </div>

                        <div class="modal fade" id="Search-filter-modal" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-xlg Search-filter-modal">
                                <div class="modal-content">
                                    <form action="" class="flex-col-center-center">

                                        
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
                                                        <button type="text" class="btn btn-120-35" name="addrGuId1" id="addrGuId1" value="SI00003" >동작구</button>
                                                        <button class="filter-plus">+</button>                              
                                                    </div>                                                                  
                                                    <div class="flex-row-left-center hidden additional-filter">                               
                                                        <button type="text" class="btn btn-120-35" name="addrSiId2" id="addrSiId2" value="SI00001" >서울특별시</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35" name="addrGuId2" id="addrGuId2" value="SI00003" >동작구</button>
                                                        <button class="filter-plus">+</button>                               
                                                    </div>                                                                   
                                                    <div class="flex-row-left-center hidden additional-filter">                                
                                                        <button type="text" class="btn btn-120-35" name="addrSiId3" id="addrSiId3" value="SI00001" >서울특별시</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35" name="addrGuId3" id="addrGuId3" value="SI00003" >동작구</button>
                                                    </div>                                                                           
                                                 </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>관심사a</div>
                                                <div class="flex-col-left-center">
                                                    <div class="flex-row-left-center">
                                                        <button type="text" class="btn btn-120-35" name="interMainId1" id="interMainId1"  value="IM00001" readonly>스포츠</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35" name="interSubId1"  id="interSubId1"  value="IS00003" readonly>축구</button>
                                                        <button class="filter-plus">+</button>                                     
                                                    </div>                                                                         
                                                    <div class="flex-row-left-center hidden additional-filter">                                      
                                                        <button type="text" class="btn btn-120-35" name="interMainId2" id="interMainId2"  value="IM00001" readonly>스포츠</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35" name="interSubId2"  id="interSubId2"  value="IS00003" readonly>축구</button>
                                                        <button class="filter-plus">+</button>                                
                                                    </div>                                                                    
                                                    <div class="flex-row-left-center hidden additional-filter">                                 
                                                        <button type="text" class="btn btn-120-35" name="interMainId3" id="interMainId3"  value="IM00001" readonly>스포츠</button>&nbsp;&nbsp;
                                                        <button type="text" class="btn btn-120-35" name="interSubId3"  id="interSubId3"  value="IS00003" readonly>축구</button>
                                                    </div>                                                                                                        
                                                </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>인원수</div>
                                                <div>
                                                    --------------
                                                </div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>만남일</div>
                                                <div>------------</div>
                                            </div>
                                            <div class="filter-attribute">
                                                <div>분위기</div>
                                                <div>
                                                    <input type="radio">
                                                    <input type="radio">
                                                    <input type="radio">
                                                </div>
                                            </div>
                                            <div class="filter-attribute">필터6</div>
                                        </div>

                                        <div class="Search-filter-modal-footer flex-col-center-center">
                                            <button class="btn btn-orange btn-160-45" >필터적용</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 진짜 글목록 -->
                        <div class="Search-result-body">

							<c:forEach var="post" items="${list }">
                                <div class="PostList-post flex-row-left-center">
                                        <div class="PostList-post-left flex-col-center-center">
                                            <div class="PostList-post-badge user-badge-box">
                                                <img class="user-bad-badge" src="${post.urlBad }" alt="">
                                                <img src="${post.url }" alt="">
                                            </div>
                                            <div>
                                                ${post.nickname }
                                            </div>
                                        </div>
                                        <div class="PostList-post-center flex-col-left-center">
                                            <div class="PostList-post-title">
                                                ${post.title}
                                            </div>
                                            <div class="PostList-post-contents">
                                                ${post.contents}
                                            </div>
                                        </div>
                                        <div class="PostList-post-right flex-col-center-center">
                                            <div>
                                                <!-- 한얼이꺼랑 같이 쓰기 위해 버튼 빈칸을 남겨둠 -->
                                            </div>
                                            <div class="PostList-post-detail flex-col-left-center">
                                                <div>${post.addrSiName} ${post.addrGuName}</div>
                                                <div>${post.meetDate}</div>
                                            </div>
                                        </div>
                                    </div>
   								</c:forEach>

                        </div>
                    </div>

                </div>
            </div>

        </div>
        
    </div>
</body>
</html>