<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="sub" items="${list }">
		<button type="button" class="btn btn-120-35 btn-pop-sub" value="${sub.interSubId1}">${sub.interSubName1}</button>
</c:forEach>
