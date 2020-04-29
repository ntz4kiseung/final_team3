<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

.font-15{
	font-size: 17px;
	font-weight: bold;
}

.font-14{
	font-size: 14px;
	font-weight: 500;
	 word-spacing: 3px;
}

.word-sp{
word-spacing: 3px;
}
.letter-sp
{
letter-spacing: 0px;
}

 .box {
        display: flex;
      }

      .one {
        flex: 1 1 auto;
      }

      .two {
        flex: 1 1 auto;
      }

      .three {
        flex: 1 1 auto;
      }
  

</style>

<div class="font-15">최근 뱃지 포인트 내역</div>

<br>
<c:forEach var="List" items="${List }" varStatus="status">
		
        <div class="flex-row-center-center box" >
        <div class="font-14 letter-sp one"> ${List.giveUserId}</div> 
                &nbsp;님께&nbsp;<div class="font-14 two">${List.reviewDate}</div><div class="three">&nbsp;에 받은 포인트</div>
        </div>
                
</c:forEach>
