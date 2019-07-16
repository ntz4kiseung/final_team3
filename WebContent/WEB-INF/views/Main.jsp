<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	/* session.setAttribute("userId", "adiard"); */
	String user = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html lang="en">
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
        

        
   </style>
   
   <script>
    $(document).ready(function(){

    	$("#mainSearchBtn").click(function(){
    		
    		/* 비로그인시 쿠키 하나 추가해줌 */
    		if(sessionStorage.getItem("userId")==null || sessionStorage.getItem("userId")==""){
        		document.cookie="guestAddrGuId="+$("#addrGuId1").val();   			
        		console.log("비로그인유저 입력 만남장소",$("#addrGuId1").val());
    		}
			$("#mainSearchForm").submit();
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
		});
		
		var c;
		$(".btn-check-cate2").click(function()
		{
			c = $(this).val();
			console.log("c = " + c);
			
			$(".btn-pop-gu").click(function()
			{
				console.log('진입 성공2');
				$("#btn-check-gugun"+c).text($(this).text());
				 
				$("#addrGuId"+c).val($(this).val());
				$("#addrGuName"+c).val($(this).text());
				
				console.log("구 아이디 = " + $("#addrGuId"+c).val());
				console.log("구 이름 = " + $("#addrGuName"+c).val());
			});
		});
		
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
		});
		
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
		});
		
    });
    
    
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
        
        
        
        <c:import url="/WEB-INF/views/Navbar.jsp">
        	<c:param name="isMain"><%=user %></c:param>
        </c:import>



        <div class="body-box flex-item-grow flex-col-center-up">
            <div class="body flex-item-grow flex-col-center-center">
                <div class="Main flex-item-grow flex-col-center-center">

                    <!-- 맨 위 -->
                    <div class="Main-navbar flex-row-left-center">
                        <span class="font-bold">메인</span>&nbsp;&nbsp;&nbsp;<span><a href="searchcate.action">카테고리</a></span>
                    </div>

                    <!-- 사진있는 부분 -->
                    <div class="Main-search">

                        <!-- 사진있는 부분 텍스트 -->
                        <div class="Main-search-text">
                            Sagyo와 함께 잊지 못할 모임을 함께 하세요!
                        </div>

                        <!-- 사진있는 부분 검색창 -->
                        <div class="Main-search-form">
                            <form action="search.action" class="" id="mainSearchForm">
                                <!-- 만남장소, 관심사 선택장 → 로그인시 이 부분 display: none;으로만 바꾸면 됨 -->
                                <div class="flex-row-center-center <%=( (user==null||user.equals("")) ? "" : "hidden")%> }">
                                    <div class="btn-group">
	        							<button type="button" class="btn btn-light btn-80-40">만남장소</button>
										<input type= "hidden" id="addrGuId1" name="" value="">
										<input type= "hidden" id="addrGuName1" name="" value="">
										<button type="button" class="btn btn-check-cate1 btn-light btn-100-40 btn-border-side" id="addrSiName1" name="addrSiName1" value="1" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#a1" data-placement="bottom">시·도</button>
	                                	<button type="button" class="btn btn-check-cate2 btn-light btn-100-40" id="btn-check-gugun1" name="btn-check-gugun1"  value="1" tabindex="0" data-toggle="popover"  data-popover-content="#b1" data-placement="bottom">구·군</button>

                                    </div>
                                    &nbsp;&nbsp;&nbsp;
                                    <div class="btn-group">
										<button type="button" class="btn btn-light btn-80-40">관심사</button>
										<input type= "hidden" id="interSubId1" name="" value="">
										<input type= "hidden" id="interSubName1" name="" value="">
	                                    <button type="button" class="btn btn-check-cate3 btn-light btn-100-40 btn-border-side" id="interMainName1" name="interMainName1" value="1" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#c1" data-placement="bottom">대분류</button>
	                                	<button type="button" class="btn btn-check-cate4 btn-light btn-100-40" id="btn-check-sub1" name="btn-check-sub1" value="1" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#d1" data-placement="bottom">소분류</button>
                                    </div>
                                </div>

                                <!-- 키워드 검색 -->
                                <div class="input-group">  
                                    <input type="text" name="keyword" class="form-control" placeholder="관심사의 키워드를 입력하세요" aria-describedby="mainSearchBtn">
                                    <div class="input-group-append">
                                        <button class="btn btn-orange" type="button" id="mainSearchBtn">검색</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- 사진 위에 검은 배경 까는 용도 -->
                        <div class="Main-search-layer"></div>
                    </div>

                    
                    <div class="Main-body flex-item-grow flex-col-center-center">
                    
                    
                        <!-- Sagyo 가 nickname 님에게 추천하는 모임 -->
                        <div>
                            <div class="PostList flex-col-left-center">
                                <!-- 라벨 -->
                                <div class="PostList-label">
                                    <%=( (user==null||user.equals("")) ? "요즘 가장 핫한 모임!" : "Sagyo가"+user+" 님에게 추천하는 모임")%>
                                </div>
                                <c:forEach var="post" items="${mainPostList1 }">
                                	<div class="PostList-post flex-row-left-center">
	                                    <div class="PostList-post-left flex-col-center-center">
	                                        <div class="PostList-post-badge user-badge-box">
	                                        	<img class="user-bad-badge" src="${post.urlBad }" alt="">
	                                            <img src="${post.url}" alt="">
	                                        </div>
	                                        <div>
	                                            ${post.nickname}
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
	                                            <div>${post.addrSiName}&nbsp;${post.addrGuName}</div>
	                                            <div>${post.meetDate}</div>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>
                            </div>
                        </div>


                        <!-- 뱃지 소개 -->
                        <div class="Main-badge">
                        	<div class="PostList-label">
	                            	뱃지 소개
	                        </div>
                        	<c:forEach var="item" items="${badgeList }" varStatus="status">
	                            <div class="Main-badge-box flex-row-left-center">
	
	                                <div class="Main-badge-left flex-col-center-center">
	                                    <div class="Main-badge-badge">
	                                        <img src="${item.url }" alt="">
	                                    </div>
	                                </div>
	                                <div class="Main-badge-center flex-item-grow flex-col-left-center">
	                                    <div class="Main-badge-title">
											${item.badgePointName }
	                                    </div>
	                                    <div class="Main-badge-contents">
	                                        &nbsp;${item.badgePointDesc1 }
	                                    </div>
	                                </div>
	                                <div class="Main-badge-right flex-col-left-center">
	                                    <div class="Main-badge-title">
	                                        	신규&nbsp;${item.badgePointName }
	                                    </div>
	                                    <div class="Main-badge-detail flex-col-left-center">
	                                    	<c:forEach var="nickname" items="${userList.get(status.index) }">
	                         					<div>'${nickname }'님 축하드립니다!</div>           	
	                                    	</c:forEach>
	                                    </div>
	                                </div>
	                            </div>                        		
                        	</c:forEach>
						</div>



                        <!-- 마감 임박 모임 -->
                        <div>
                            <div class="PostList flex-col-left-center">
                                <!-- 라벨 -->
                                <div class="PostList-label">
                                   	 마감 임박 모임
                                </div>
                                <c:forEach var="post" items="${mainPostList2 }">
                                	<div class="PostList-post flex-row-left-center">
	                                    <div class="PostList-post-left flex-col-center-center">
	                                        <div class="PostList-post-badge user-badge-box">
	                                        	<img class="user-bad-badge" src="${post.urlBad }" alt="">
	                                            <img src="${post.url}" alt="">
	                                        </div>
	                                        <div>
	                                            ${post.nickname}
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
	                                            <div>${post.addrSiName}&nbsp;${post.addrGuName}</div>
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



        <div class="footer-box">
            footer 만들긴 했는데 뭐씀?
        </div>
        
        
        <!-- ----------------------------------------------------------------------------------------------------------- -->
        <!-- ----------------------------------------------------------------------------------------------------------- -->
        <!-- ----------------------------------------------------------------------------------------------------------- -->
	    <div id="a1" class="hidden">
		    <div class="popover-heading">
		       시·도 선택
		    </div>
		    <div class="popover-body" >
		       <div id="inbodyA1">
				    <c:forEach var="addrsi" items="${addrsilist }" varStatus="status">
						<button type="button" id="si${status.index}" name="si${status.index}" class="btn btn-120-35 btn-pop-sido" value="${addrsi.addrSiId1 }">${addrsi.addrSiName1 }</button>
					</c:forEach>
		       </div> 
		    </div>
		</div>
		
		<div id="b1" class="hidden">
		    <div class="popover-heading">
		       구·군 선택
		    </div>
		    
		    <div class="popover-body" >
		       <div id="inbodyB1">
		       </div> 
		    </div>
		</div>   

		<div id="c1" class="hidden">
		    <div class="popover-heading">
		       대 분류 선택
		    </div>
		    <div class="popover-body" >
		       <div id="inbodyC1">
				    <c:forEach var="intermain" items="${intermainlist }" varStatus="status">
						<button type="button" id="main${status.index}" name="main${status.index}" class="btn btn-120-35 btn-pop-main" value="${intermain.interMainId1 }">${intermain.interMainName1 }</button>
					</c:forEach>
		       </div>
		    </div>
		</div>
		
		<div id="d1" class="hidden">
		    <div class="popover-heading">
		       소 분류 선택
		    </div>
		    
		    <div class="popover-body" >
		       <div id="inbodyD1">
		       </div> 
		    </div>
		</div> 		
		
    </div>
</body>
</html>