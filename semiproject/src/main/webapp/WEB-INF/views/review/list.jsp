<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/static/css/review.css">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container-1000">
	<div class="row">
		<c:choose>
			<c:when test="${list.isEmpty()}">
				<h4 class="center">작성한 리뷰가 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<div class="row">
					<h2 class="">내 리뷰 목록</h2>
					<h4>리뷰 내용을 클릭하면 해당 리뷰로 이동합니다.</h4>
				</div>
				<hr>
				<div class="row">
					<c:forEach var="reviewDto" items="${list}">
						<c:forEach begin="1" end="5" var="i">
							<i class="fa-regular fa-star starR ${reviewDto.reviewStar >= i ? 'fa-solid' : ''}" value="${i}"></i>
						</c:forEach>
						<div class="row reviewContent">						
							<a href="/product/detail?productNo=${reviewDto.productNo}">
								${reviewDto.reviewContent}
							</a>
						</div>
						<div class="row reviewTime">
							${reviewDto.reviewTime}
						</div>
						<hr>
					</c:forEach>
				</div>
<!-- 				<table class="table table-qna"> -->
<!-- 					<thead> -->
<!-- 						<tr> -->
<!-- 							<th>별점</th> -->
<!-- 							<th>내용</th> -->
<!-- 							<th>작성일</th> -->
<!-- 						</tr> -->
<!-- 					</thead> -->
<!-- 					<tbody class="center"> -->
<%-- 						<c:forEach var="reviewDto" items="${list}"> --%>
<!-- 							<tr> -->
<!-- 								<td> -->
<%-- 									  <c:forEach begin="1" end="5" var="i"> --%>
<%-- 					                    <i class="fa-regular fa-star starR ${reviewDto.reviewStar >= i ? 'fa-solid' : ''}" value="${i}"></i> --%>
<%-- 					                </c:forEach> --%>
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<a href="/product/detail?productNo=${reviewDto.productNo}"> --%>
<%-- 									${reviewDto.reviewContent} --%>
<!-- 									</a> -->
<!-- 								</td> -->
<%-- 								<td>${reviewDto.reviewTime}</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<!-- 					</tbody> -->
<!-- 				</table> -->
			</c:otherwise>
		</c:choose>
	</div>
	
	    <div class="row pagination center">
    
    	<!-- 처음 -->
    	<c:choose>
			<c:when test="${vo.first}">
				<a class="disabled">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a href="list?${vo.parameter}&page=1">&laquo;</a>
			</c:otherwise>
		</c:choose>
		
		<!-- 이전 -->
		<c:choose>
			<c:when test="${vo.prev}">
				<a href="list?${vo.parameter}&page=${vo.prevPage}">&lt;</a>
			</c:when>
			<c:otherwise>
				<a class="disabled">&lt;</a>
			</c:otherwise>
		</c:choose>
		
        <!-- 숫자 -->
        <c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
			<c:choose>
				<c:when test="${vo.page == i}">
					<a class="on">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="list?${vo.parameter}&page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
	
		<!-- 다음 -->
		<c:choose>
			<c:when test="${vo.next}">
				<a href="list?${vo.parameter}&page=${vo.nextPage}">&gt;</a>
			</c:when>
			<c:otherwise>
				<a class="disabled">&gt;</a>
			</c:otherwise>
		</c:choose>
		
		<!-- 마지막 -->
		<c:choose>
			<c:when test="${vo.last}">
				<a class="disabled">&raquo;</a>
			</c:when>
			<c:otherwise>
				<a href="list?${vo.parameter}&page=${vo.totalPage}">&raquo;</a>
			</c:otherwise>
		</c:choose>
    </div>
    
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>s