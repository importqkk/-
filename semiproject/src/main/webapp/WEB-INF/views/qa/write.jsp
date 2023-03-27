<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-1000">

<div class="row left">
<c:choose>
	<c:when test="${boardParent==null }">
		<h1>문의 남기기</h1>
	</c:when>
<c:otherwise>
	<h1>답글작성</h1>
</c:otherwise>
</c:choose>
</div>

<form action="write" method="post">
	<%--답글일 때는 정보가 한 개 더 전송되어야 한다(boardParent) --%>
	<c:if test="${boardParent != null }">
	<input type ="hidden" name ="boardParent" value="${boardParent }">
	</c:if> 
	<select name="boardHead" class="form-input medium light">
		<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
		<option value="">카테고리</option>
		<c:if test="${sessionScope.memberrole=='관리자' }">
		</c:if>
		<option>상품문의</option>
		<option>결제문의</option>
		<option>기타문의</option>
	</select>
	
	<!--  제목  -->
	<c:choose>
		<c:when test="${boardParent == null}">
			<input type="text" name="boardTitle" class="form-input medium light hover"  required placeholder="제목을 입력해 주세요."><br><br>
		</c:when>
		<c:otherwise>
			<input type="text" name="boardTitle"  class="form-input medium light hover"  required placeholder="제목을 입력해 주세요." value="RE: "><br><br>
		</c:otherwise>
	</c:choose>

	<textarea name="boardContent" class="form-input large w-100" required rows="10" cols="60" placeholder="문의 내용을 입력해주세요."></textarea> <br><br>

	<div class="row right">
            <input type="checkbox">
            <span class="c-p100 font-h3">비밀글</span>
	<button type="submit" class="form-btn positive medium ms-20 me-20 font-h3">등록</button>
	<a href="/qa/list"class="form-btn nuetral medium font-h3">취소</a>
	</div>
</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>