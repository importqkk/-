<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp"></jsp:include>

<div class="w-80">
	<div class="row center">
		<h1>${memberDto.memberNick} 님</h1>
		<hr>
	</div>
	<!-- <div class="row mb-30 w-100"> -->
	<div class="row">
		
		<table class="table table-border">
			<tr>
				<th width="25%">아이디</th>
				<td>${memberDto.memberId}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${memberDto.memberName}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${memberDto.memberNick}</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td>${memberDto.memberPhone}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${memberDto.memberEmail}</td>
			</tr>
			<tr>
				<th>포인트</th>
				<td>
					<fmt:formatNumber value="${memberDto.memberPoint}" pattern="#,##0"/> point
				</td>
			</tr>
			<tr>
				<th>회원등급</th>
				<td>
					${memberDto.memberRole}
				</td>
			</tr>
			<tr>
				<th>가입일시</th>
				<td>
					<fmt:formatDate value="${memberDto.memberJoin}" pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
		</table>
	</div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>








