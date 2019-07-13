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
</head>
<body>
    <div class="browser flex-col-center-center">
        
        
        
        <c:import url="/WEB-INF/views/Navbar.jsp"></c:import>



        <div class="body-box flex-item-grow flex-col-center-up">
            <div class="body flex-item-grow flex-col-center-center">
                <div class="Main flex-item-grow flex-col-center-center">

                    <!-- 맨 위 -->
                    <div class="Main-navbar flex-col-left-center">
                        메인&nbsp;&nbsp;&nbsp;카테고리
                    </div>

                    <!-- 사진있는 부분 -->
                    <div class="Main-search">

                        <!-- 사진있는 부분 텍스트 -->
                        <div class="Main-search-text">
                            Sagyo와 함께 잊지 못할 모임을 함께 하세요!
                        </div>

                        <!-- 사진있는 부분 검색창 -->
                        <div class="Main-search-form">
                            <form action="" class="">
                                <!-- 만남장소, 관심사 선택장 → 로그인시 이 부분 display: none;으로만 바꾸면 됨 -->
                                <div class="flex-row-center-center <%=( (user==null||user.equals("")) ? "" : "hidden")%> }">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">만남장소</span>
                                        </div>
                                        <input type="text" value="서울특별시" class="form-control">
                                        <input type="text" value="송파구" class="form-control">
                                    </div>
                                    &nbsp;&nbsp;&nbsp;
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">관심사</span>
                                        </div>
                                        <input type="text" value="스포츠" class="form-control">
                                        <input type="text" value="전체" class="form-control">
                                    </div>
                                </div>

                                <!-- 키워드 검색 -->
                                <div class="input-group">  
                                    <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-orange" type="button" id="button-addon2">Button</button>
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
        
        
        
        
    </div>
</body>
</html>