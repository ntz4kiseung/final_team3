<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="gu" items="${list }">
		<button type="button" class="btn btn-120-35 btn-pop-gu" value="${gu.addrGuId1 }">${gu.addrGuName1}</button>
</c:forEach>
