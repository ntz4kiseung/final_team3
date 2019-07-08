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
</head>
<body>
	
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
								<!-- 페이징 처리 ~ 시작  -->
			                           <div class="flex-row-center-center;">
			                            <form action="noticelist.action" method="get">
			                            <div class="flex-row-center-center;">
			                              <script type="text/javascript">
			                              
			                              var max = ${pages }
			                             for (var i = 1; i <= max; i++)
										{
											document.write("<h1>"+i+"</h1>");
										}
											
											
										  </script>
										 </div>
			                           </form>
			                           </div>
			                           <h1>${pages }</h1>
                               <!-- 페이징 처리 ~ 끝~  -->
                               <!-- 페이징 처리 ~ 끝~  -->
							 
			                    

</body>
</html>