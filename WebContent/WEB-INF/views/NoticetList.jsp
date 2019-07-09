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
<!-- ajax 스크립트 시작 -->

<!-- ajax 스크립트 끝  -->

<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">
    <!--ajax test1 시작   -->
    <script type="text/javascript">
	function loadXMLDocs()
	{
		// AJAX객체를 사용하기 위해서는 AJAX 변수(XMLHttpRequest)가 필요하다 
		// XMLHttpRequest객체를 담을 변수 선언
		var xmlHttp; 
		
		//브라우저에서 (window)를 통해서 XMLHttpRequest를 지원하는 상황이라면~~ 『else』는 그게 아니라면~~
		// activex를 통해 ajax 오브잭트를 컨트롤 한다. 
		
		//(클라이언트 측) 브라우저에 따른 분기 
		//(클라이언트 측에서) 자신의 브라우저가 XMLHttpRequest 를 
		// 지원하고있는 상황이라면....
		if(window.XMLHttpRequest)
		{
			//alert("XMLHttpRequest 지원~!!!");
			
			// 지원한다면 이와같은 방법으로 객체를 생성하고 
			xmlHttp = new XMLHttpRequest();
		}
		// (클라이언트 측에서)자신의 브라우저가 XMLHttpRequest를
		// 지원하지 않는다면... 
		else
		{
			//alert("XMLHttpRequest 지원 안함~!!!");
			// 그렇지 않으면 이와 같은 방법으로 객체를 생성해라.
			xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		//※ 객체를 생성하는 방법의 차이만 있을 뿐
		//  여기까지 수행하면 XMLHttpRequest 객체 생성 완료
		
		
		
		//『xmlHttp』 : XMLHttpRequest 객체 
		// 서버로 부터 응답이 오면 『readystatechange』이벤트가 발생하게 된다. 
		// 『onreadystatechange』 : readystatechange 이벤트가 발생했을때 (onclick 처럼 on이 붙어있음)
		// 동작할 수 있도록 이벤트 핸들러를 등록하는 과정.
		// 즉 이와 같은 이벤트가 발생하게 되면 아래의 내용처럼 동작하게 된다. 
		// (한번에 큰 요청이 꿍 하고 전달되고 가만히 있고 꿍 받고 가만히 있는 기존방식이 아니다. 
		// 뭔 상황이 있을때마다 응답오고 응답오고~ 실시간으로 이루어지는거 )
		xmlHttp.onreadystatechange = function()
		{
			//응답이 올 떄 마다
			// readyState 가 그 상황에서의 XMLHttpRequest 상태를 저장하게 된다.
			// 즉, readyState는 XMLHttpRequest 객체의 property 이다.
			// ==>> readystatechange 이벤트는
			//      readyState가 변경될 때 마다 발생한다.
			
			//※ 『XMLHttpRequest』의 『readyState』는 0 에서 4 까지 순차적으로 변화한다.
			// 0 → 요청이 초기화되지 않음.
			// 1 → 서버 연결이 이루어지지 않음.
			// 2 → 요청이 수신됨.
			// 3 → 요청을 처리중
			// 4 → 요청의 처리가 종료되고, 응답이 준비 됨. 
			// (원영요약) 일 시켜놓고 계속해서 진행상황을 소통공유 하는 상황 
			
			//=====start=============상태값을 전달해서 컨트롤 할수 있도록 연결만 시켜놓은거(구동은 아님)================
			// ※ 『XMLHttpRequest』의 『status』는 HTTP Status 코드를 의미한다.
			//    200은 → 올바른 응답
			//    40X → 클라이언트 측 에러 『404 페이지를 찾을 수 없음』
			//    50x  → 서버 측 에러 (JAVA 에러 )
			//					   ↓4번 (응답 준비되었는지) 
			if(xmlHttp.readyState==4 && xmlHttp.status==200)  //← 200은 404에러나 500에러와 같은 에러 종류중 하나 
			{			
				// ↓이 구문을 통해 서버로부터 응답을 가져와 DOM을 업데이트 하겠다는 의미
				// ★★★★ 아래 xmlHttp.responseText 설명  ★★★★
				// 응답의 속성에는 두 가지가 있는데
				// 『responseText』는 텍스트 형식의 응답일 경우 사용하게 되고,
				// 『responseXML』은 응답이 XML 형식일 경우 사용하게 된다. 
				document.getElementById("boardList").innerHTML = xmlHttp.responseText;
				//myDiv를 선택해서 그 안에 텍스트를 넣겠다~ 
			}
			
			//================상태값을 전달해서 컨트롤 할수 있도록 연결만 시켜놓은거(구동은 아님)====end==============
		}
		
		// 『XMLHttpRequest』의 『open()』이라는 메소드를 호출한 상황
		// 『XMLHttpRequest』의 『open("페이지요청방식","URL",async)』
		//													  true false로 asyncronous가 맞는지 아닌지 넣어줌
		// 『xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		// xmlHttp.send(input1=value1&input2=value2);』
		// 와 같이 헤더를 추가해 주어야 한다. 
		
		xmlHttp.open("POST","searchnotice.action"+"?keyword="+document.getElementById("keyword").value,true);
		xmlHttp.send(""); //xmlHttp.send(); 매개변수 아무것도 안넘기는것도 됨
		
		
	}
	
	/* pagesu function 시작 */
	
	/* $(function()
	{$('#pagesu').on('click', function()
	{
		//alert("클릭하면 나오나?");
		//var pagesu = document.getElementById("pagesu");
		//alert($("#pagesu").html()+"pagesu찍어보기");
		$("#pagesu").html().submit();
		alert("클릭하면 나오나?");
		
	})
		
	}) */
	/* pagesu function  끝  */
	
	/* list에서 요소 지우기  시작  */
/* 	$(function()
	{$('#pagesu').on('click', function()
	{
		$('#boardList').empty();
	} )
		
	}) */
	/* list에서 요소 지우기  끝  */
	
	
	
	
</script>
    
    
    <!-- ajax test1 끝  -->
 

</head>
<body>
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
                <div class="CustomerService flex-item-grow flex-col-center-up">


                    <div class="CustomerService-header flex-col-left-center">
                        고객센터
                    </div>

                    <div class="CustomerService-category flex-row-left-center">
                        <span><a href="">공지사항</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="">자주묻는질문</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="">1:1문의</a></span>&nbsp;&nbsp;&nbsp;
                        <span><a href="">회원탈퇴</a></span>&nbsp;&nbsp;&nbsp;
                    </div>

                    <div class="CustomerService-body flex-item-grow flex-col-center-up">

                        <div class="Withdrawal-header flex-col-center-center">
                            <div class="logo-box flex-item-grow flex-row-center-center">
                                <div class="logo-img">
                                    <img src="img/Logo.png" alt="이미지 없음">
                                </div>
                                <div class="logo-text">
                                    Sagyo
                                </div>
                            </div>
                        </div>

                        <div class="Withdrawal-body flex-col-center-start container"> <!--  게시판 영역 시작  -->
                        	<div>
                        	<!-- <form action="searchnotice.action" method="post"> -->
                        		<input type="text" class="form-control form-control-sm" name="keyword" id="keyword"> <!-- 입력 창 -->
                        		
                        		<input type="button"  onclick="loadXMLDocs()" class="btn btn-success btn-default" value="검색" id="search"/>
                        		
                        	<!-- </form> -->
                        	</div>
                        	
                            <div>
                                <table>
                                	<tr>
                                		<td>제목</td><td>작성일</td>
                                	</tr>
                                </table>
                            </div>
                            
                            <!-- <div class="Withdrawal-desc">
                                <div>
                                	<a>[공지]</a><span>공지사항입니다.</span><span>2019-07-03</span>
                                </div>
                            </div> -->
                            
                            <!-- 아코디언 소스코드 시작  -->
                            <div id="accordion" style="width:1040px;"> 
                            
                            <!-- 본래의 게시물 리스트 (시작) -->
                            <div id="boardList">
	                            <c:forEach var="notice" items="${list }">
								    <div class="card"> 
								      <div class="card-header"> 
								        <a class="card-link" data-toggle="collapse" data-parent="#accordion"  href="#collapse${notice.id }"> 
								          <span style="border:1px;">공지</span> ${notice.title }  <span>${notice.noticedate }</span>
								        </a> 
								      </div> 
								      <div id="collapse${notice.id }" class="collapse"> 
								        <div class="card-body"> 
								          ${notice.contents} 
								        </div> 
								      </div> 
								    </div> 
								 </c:forEach>  
								 
							 </div>
							 <!-- 페이징 처리 ~ 시작  -->
			                           <div class="flex-row-center-center;">
			                            <form action="noticelist.action" method="post" id="formId">
			                            <div class="flex-row-center-center;" id="numbering">
			                              <script type="text/javascript">
			                              
											var max = ${pages };
											var print = "";
											for (var i = 1; i <= max; i++)
											{
												
												print = i;
												document.write("<button type='submit' id='pagesu' name='pagesu' value="+ print +">"+print+"</button>");
											}
											//document.write("<button type='submit' id='pagesu' name='pagesu' value="+ print +">"+print+"</button>");
											
										</script>
										 </div>
			                           </form>
			                           </div>
                               <!-- 페이징 처리 ~ 끝~  -->
							 <!-- 본래의 게시물 리스트 (끝 ) -->
							 
							 <!-- 검색이 되었을때의 게시물 리스트 (시작) -->
							<%--  <c:forEach var="searchlist" items="${searchlist }">
							    <div class="card"> 
							      <div class="card-header"> 
							        <a class="card-link" data-toggle="collapse" data-parent="#accordion"  href="#collapse${searchlist.id }"> 
							          <span style="border:1px;">공지</span> ${searchlist.title }  <span>${searchlist.noticedate }</span>
							        </a> 
							      </div> 
							      <div id="collapse${searchlist.id }" class="collapse"> 
							        <div class="card-body"> 
							          ${searchlist.contents} 
							        </div> 
							      </div> 
							    </div> 
							 </c:forEach>   --%> 
							 <!-- 검색이 되었을때의 게시물 리스트 (끝) -->
							 
							 </div>
							  
							  <!--참고자료 시작  -->
							  <%-- <c:forEach var="student" items="${list }">
									<tr>
										<td>${student.sid }</td>
										<td>${student.name }</td>
										<td>${student.tel }</td>
										
										<c:if test="${student.sub == 0  }">
										<td>X</td>
										</c:if>
										
										<c:if test="${student.sub == 1 }">
										<td>O</td>
										</c:if>
									</tr>
								</c:forEach> --%>
							  <!--참고자료 끝  -->
							  
                            <!-- 아코디언 소스코드 종료  -->
                            
                            
                            
                           <!--  <form action="noticelist.action" method="get">
	                            <div class="flex-row-center-center;">
	                               <a href="noticelist.action" id="pagesu" >1</a>
	                               <a href="noticelist.action">2</a>
	                               <a href="noticelist.action">3</a>
									<button type="submit" id="pagesu" name="pagesu" value="1">1</button>
									<button type="submit" id="pagesu" name="pagesu" value="2">2</button>
									<button type="submit" id="pagesu" name="pagesu" value="3">3</button>
	                            </div>
                            </form> -->
                            
                        </div><!-- 게시판 영역 끝  -->

                       <br />
                       <br />
                       <br />
                       <br />
                       <br />
                       <br />

                    </div>                    
                </div>
            </div>
        </div>
    </div>
</body>
</body>
</html>