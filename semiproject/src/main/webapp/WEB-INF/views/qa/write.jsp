<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-1000">

<div class="row">
<c:choose>
	<c:when test="${qaParent==null }">
		<h1>새글작성</h1>
	</c:when>
<c:otherwise>
	<h1>답글작성</h1>
</c:otherwise>
</c:choose>
</div>

<form action="write" method="post">
	<%--답글일 때는 정보가 한 개 더 전송되어야 한다(qaParent) --%>
	<c:if test="${qaParent != null }">
	<input type ="hidden" name ="qaParent" value="${qaParent }">
	</c:if>
	말머리 : 
	<select name="qaHead">
		<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
		<option value="">없음</option>
		<c:if test="${sessionScope.memberrole=='관리자' }">
		<option>상품문의</option>
		</c:if>
		<option>결제문의</option>
		<option>기타문의</option>
	</select>
	<br><br>
	
	<!--  제목  -->
	<c:choose>
		<c:when test="${qaParent == null}">
			제목 : <input type="text" name="qaTitle" required><br><br>
		</c:when>
		<c:otherwise>
			제목 : <input type="text" name="qaTitle" required value="RE: "><br><br>
		</c:otherwise>
	</c:choose>
	
	<textarea name="qaContent" required rows="10" cols="60"></textarea> <br><br>
	<button type="submit">등록</button>
</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>