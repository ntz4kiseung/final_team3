<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


최근 뱃지 포인트 내역


<br>
<c:forEach var="List" items="${List }" varStatus="status">
		
        <div> ${List.giveUserId} 님께 ${List.reviewDate}에 받은 포인트</div>
                
</c:forEach>
