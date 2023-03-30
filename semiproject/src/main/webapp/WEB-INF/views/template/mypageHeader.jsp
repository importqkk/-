<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-1000 mt-100" >
	<div class="flex">
	<div class="w-20">
<!-- <aside class="left"> -->
	<ul>
		<li>
			마이페이지
			<ul>
				<li><a href="${pageContext.request.contextPath}/member/mypage">회원정보</a></li>
				<li><a href="${pageContext.request.contextPath}/member/pwVf">회원정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/member/password">비밀번호 변경</a></li>
			</ul>
		</li>
		<li>
			쇼핑 정보
			<ul>
				<li><a href="${pageContext.request.contextPath}/order/list">주문/배송 조회</a></li>
				
				<!-- 테이블,컨트롤러 따로 만들어야되서 보류 .못할거같음 <li><a href="${pageContext.request.contextPath}/address/list">배송지 관리</a></li>-->
<%-- 				<li><a href="${pageContext.request.contextPath}/review/list?type=member_id&keyword=${loginId}">상품리뷰</a></li> --%>
<%-- 				<li><a href="${pageContext.request.contextPath}/qa/list?type=member_id&keyword=${loginId}">상품문의</a></li> --%>
				<li><a href="${pageContext.request.contextPath}/member/delete">회원 탈퇴</a></li>
			</ul>
	</ul>
	</div>
	
<!-- </aside> -->