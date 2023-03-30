<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/static/css/review.css">

<div class="container-1000">
	<div class="row center">
		내 리뷰 목록
	</div>
	
	<div class="row center">
	
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>평점</th>
					<th>내용</th>
					<th>추천수</th>
					<th>작성 시간</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<c:forEach var="reviewDto" items="">
						<td>${reviewDto.memberId}</td>
						<td>${reviewDto.reviewStar}</td>
						<td>${reviewDto.reviewContent}</td>
						<td>${reviewDto.reviewLike }</td>
						<td>${reviewDto.reviewTime}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>