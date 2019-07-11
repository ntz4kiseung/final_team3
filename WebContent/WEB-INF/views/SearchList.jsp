<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<meta charset="UTF-8">




			
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
								
			<form action="noticelist.action" method="post" id="formId">
			<c:forEach var="num" begin="1" end="${pages }" step="1"> 
				<button type='submit' id='pagesu' name='pagesu' value=${num }>${num }</button>
				
			</c:forEach>
			</form>			 
			                    


















