<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp"></jsp:include>


<form action="password" method="post">
<div class="container-500">
	<div class="row center">
		<h2>비밀번호 변경</h2>
	</div>
	<div class="row">
		<label>현재 비밀번호</label>
		<input type="password" name="currentPw" required class="form-input w-100 medium light">
	</div>
	<div class="row">
		<label>변경할 비밀번호</label>
		<input type="password" name="changePw" required class="form-input w-100 medium light">
	</div>
	<div class="row">
		<button class="form-btn neutral w-20 medium">취소</button>
        <button type="submit" class="form-btn positive w-75 medium ms-25">변경</button>
	</div>
	<!-- 취소 버튼 클릭 이벤트 처리 -->
	<script>
		$('.form-btn.neutral').click(function(){
  		window.location.href = '/member/mypage';
		});
	</script>
	
	<!-- 오류가 발생한 경우 보여줄 메세지 -->
	<c:if test="${param.mode == 'error'}">
	<div class="row center" style="font-size: 15px; color: red;">
		<h2>비밀번호가 일치하지 않습니다</h2>
	</div>
	</c:if>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


$('.form-btn.neutral').click(function(){
  window.location.href = '/member/mypage';
});
