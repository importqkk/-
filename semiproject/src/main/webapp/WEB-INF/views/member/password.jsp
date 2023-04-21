<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/static/js/password.js"></script>
<style>
  .content {
  	min-height: 416px;
  }
  .error{ 
    font-size: 20px;
    color: red;
  }
</style>
<form action="${pageContext.request.contextPath}/password" method="post" class="content password-form">
<div class="container-600 mt-70">
	<div class="row center">
		<h2>비밀번호 변경</h2>
	</div>
	<div class="row">
		<label>현재 비밀번호</label>
		<input type="password" name="currentPw" required class="form-input w-100 medium light">
	</div>
	<div class="row">
		<label>변경할 비밀번호</label>
		<input type="password" name="changePw"  id="passwordRe" required class="form-input w-100 medium light">
		<div class="valid-message"></div>
		<div class="invalid-message">영문 대/소문자, 숫자, 특수문자를 반드시 포함하여 8~20자로 작성하세요</div>	
<!-- 		<span></span> -->
	<div class="row">
		<button class="form-btn neutral w-24 medium">취소</button>	
        <button type="submit" class="form-btn positive w-75 medium ms-25">변경</button>
        </div>

	<!-- 취소 버튼 클릭 이벤트 처리 -->
	<script>
		$('.form-btn.neutral').click(function(){
  		window.location.href = '${pageContext.request.contextPath}/member/mypage';
		});
	</script>

	
	<!-- 오류가 발생한 경우 보여줄 메세지 -->
	<c:if test="${param.mode == 'error'}">
	<div class="row center">
		<h3 class="error">비밀번호가 일치하지 않습니다</h3>
	</div>
	</c:if>
</div>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


