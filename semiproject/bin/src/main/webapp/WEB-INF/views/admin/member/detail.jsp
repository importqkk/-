<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<div class= "row center">
		<h2>${memberDto.memberNick}님 회원정보</h2>
		</div>
<div class="container-650 ms-100">
	<div class="row center">
	</div>
		<div class="w-70">
			<table class="table table-border">
				<tr>
					<th class="w-25">아이디</th>
					<td>${memberDto.memberId}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${memberDto.memberNick}</td>
				</tr>	
				<tr>
					<th>전화번호</th>
					<td>${memberDto.memberPhone}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${memberDto.memberEmail}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						[${memberDto.memberPost}] 
						${memberDto.memberBasicAddr}
						${memberDto.memberDetailAddr}
					</td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td>${memberDto.memberRole}</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td>${memberDto.memberPoint} point</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>
						<fmt:formatDate value="${memberDto.memberJoin}"
								pattern="y년 M월 d일 E a h시 m분 s초"/>
					</td>
				</tr>
			</table>
		<div class="w-100 flex">
			<div class="row w-50 pe-5">
				<a href="${pageContext.request.contextPath}/edit?memberId=${memberDto.memberId}" class="form-btn neutral small w-100">개인정보변경</a>
			</div>
			<div class="row w-50 center">
				<a href="${pageContext.request.contextPath}/delete?memberId=${memberDto.memberId}" class="form-btn neutral small w-100" onclick="return confirm('정말 탈퇴시키겠습니까?')">회원 탈퇴</a>
			</div>
			
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/list" class="form-btn positive small w-100">목록</a>
		</div>
		</div>
	</div>	

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>








