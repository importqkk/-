<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp"></jsp:include>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/static/js/find-address.min.js"></script>

 
<form action="edit" method="post">
<div class="container-600">
	<div class="row center">
		<h2>회원 정보 변경</h2>
	</div>
	<div class="row">
		<label>닉네임</label>
		<input type="text" name="memberNick" placeholder="한글, 숫자 2~10자" required class="form-input w-100 medium light" value="${memberDto.memberNick}">
	</div>
	<div class="row">
		<label>휴대전화</label>
		<input type="tel" name="memberPhone" required class="form-input w-100 medium light" placeholder="대시(-)를 제외하고 작성" value="${memberDto.memberPhone}">
	</div>
	<div class="row">
		<label>이메일</label>
		<input type="email" name="memberEmail" required class="form-input w-100 medium light" value="${memberDto.memberEmail}">
	</div>
	<div class="row">
		<label>주소</label><p>
		<input type="text" name="memberPost" class="form-input medium light" placeholder="우편번호" readonly value="${memberDto.memberPost}">
		<button type="button" class="form-btn neutral find-address-btn medium light">검색</button>
	</div>
	<div class="row">
		<input type="text" name="memberBasicAddr" class="form-input w-100 medium light" placeholder="기본주소" readonly value="${memberDto.memberBasicAddr}">
	</div>
	<div class="row">
		<input type="text" name="memberDetailAddr" class="form-input w-100 medium light"  placeholder="상세주소" value="${memberDto.memberDetailAddr}">
	</div>
	<div class="row">
		<label>비밀번호 확인</label>
		<input type="password" name="memberPw" required class="form-input w-100 medium light" >
	</div>
	
	<div class="row">
		<button class="form-btn neutral w-20 medium">취소</button>
        <button type="submit" class="form-btn positive w-75 medium ms-25">변경하기</button>
	</div>
		<!-- 취소 버튼 클릭 이벤트 처리 -->
	<script>
		$('.form-btn.neutral').click(function(){
  		window.location.href = '/member/mypage';
		});
	</script>
	<c:if test="${param.mode == 'error'}">
	<div class="row center">
		<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>
	</div>
	</c:if>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


