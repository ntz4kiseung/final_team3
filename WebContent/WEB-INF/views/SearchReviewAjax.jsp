<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:forEach var="list" items="${reviewList }" varStatus="status">
	<div class="PostList-post flex-row-left-center">
		<div class="PostList-post-left flex-col-center-center">
			<div class="PostList-post-badge">
				<img src="${list.url }" onerror="this.src='img/뉴비.png'">
			</div>
			<div>
				${list.nickname }
			</div>
		</div>
		<div class="PostList-post-center flex-col-left-center">
			<div class="PostList-post-title">${list.title }</div>
			<div class="PostList-post-contents">${list.contents }</div>
		</div>
		<div class="PostList-post-right flex-col-center-center">
			<div>
				<!-- 1(모집중), 2(만남확정), 3(만남실패), 4(후기남기기), 5(후기조회) -->
				<c:choose>
					<c:when test="${list.postStatus eq '1'}">
						<button data-toggle="modal" data-target="#reviewModal"
							value="${list.postId }"
							class="btn btn-outline-secondary btn-120-35 mybtn btn-review"
							disabled="disabled">모집중</button>
						<input type="hidden" id="review-action${list.postId }"
							name="review-action${list.postId }" class="review" value="1">
					</c:when>

					<c:when test="${list.postStatus eq '2'}">
						<button data-toggle="modal" data-target="#reviewModal"
							value="${list.postId }"
							class="btn btn-outline-secondary btn-120-35 mybtn btn-review"
							disabled="disabled">만남확정</button>
						<input type="hidden" id="review-action${list.postId }"
							name="review-action${list.postId }" class="review" value="2">
					</c:when>

					<c:when test="${list.postStatus eq '3'}">
						<button data-toggle="modal" data-target="#reviewModal"
							value="${list.postId }"
							class="btn btn-outline-secondary btn-120-35 mybtn btn-review"
							disabled="disabled">만남실패</button>
						<input type="hidden" id="review-action${list.postId }"
							name="review-action${list.postId }" class="review" value="3">
					</c:when>

					<c:when test="${list.postStatus eq '4'}">
						<button data-toggle="modal" data-target="#reviewModal"
							value="${list.postId }"
							class="btn btn-outline-orange btn-120-35 mybtn btn-review">후기남기기</button>
						<input type="hidden" id="review-action${list.postId }"
							name="review-action${list.postId }" class="review" value="4">
					</c:when>

					<c:when test="${list.postStatus eq '5'}">
						<button data-toggle="modal" data-target="#inquiryModal"
							value="${list.postId }"
							class="btn btn-outline-orange btn-120-35 mybtn btn-inquiry">후기조회</button>
						<input type="hidden" id="review-action${list.postId }"
							name="review-action${list.postId }" class="review" value="5">
					</c:when>

					<c:otherwise>
						오류
					</c:otherwise>
				</c:choose>
			</div>
			<div class="PostList-post-detail flex-col-left-center">
				<div>${list.addrSiName }${list.addrGuName }</div>
				<div>${list.meetDate }</div>
			</div>

		</div>
	</div>
</c:forEach>
