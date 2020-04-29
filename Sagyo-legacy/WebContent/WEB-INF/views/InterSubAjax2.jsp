<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<span class="interSub-item font-bold" id=""><a href="#">전체</a></span>&nbsp;&nbsp;&nbsp;
<c:forEach var="interSub" items="${list }">
	<c:set var="userInterSubId" value="${interSub.interSubId1 }" />
	<span class="interSub-item" id="${interSub.interSubId1 }"><a href="#">${interSub.interSubName1 }</a></span>&nbsp;&nbsp;&nbsp;				
</c:forEach>