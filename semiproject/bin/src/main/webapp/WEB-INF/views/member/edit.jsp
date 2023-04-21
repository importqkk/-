<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp"></jsp:include>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/static/js/find-address.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/edit.js"></script>

 <script type="text/javascript">
    var checkUnload = true;
    $(window).on("beforeunload", function(){
        if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
    });
</script>
<form action="edit" method="post" class="content edit-form">
<div class="container-600">
	<div class="row center">
		<h2>회원 정보 변경</h2>
	</div>
	<div class="row">
		<label>닉네임</label>
		<input type="text" name="memberNick" placeholder="한글, 숫자 2~10자" required class="form-input w-100 medium light" value="${memberDto.memberNick}">
		<div class="valid-message">사용 가능한 닉네임입니다</div>
		<div class="invalid-message">닉네임은 한글 또는 숫자 2~10자로 작성하세요</div>
		<div class="invalid-message2">이미 사용중인 닉네임입니다</div> 
	</div>
	<div class="row">
		<label>전화번호</label>
		<input type="tel" name="memberPhone" required class="form-input w-100 medium light" placeholder="대시(-)를 제외하고 작성" value="${memberDto.memberPhone}">
		<div class="valid-message">사용 가능한 전화번호입니다</div>
        <div class="invalid-message">올바른 전화번호가 아닙니다</div>
	</div>
	<div class="row">
		<label>이메일</label>
		<input type="email" name="memberEmail" required class="form-input w-100 medium light" value="${memberDto.memberEmail}">
		<div class="valid-message">사용 가능한 이메일 입니다</div>
		<div class="invalid-message">올바른 이메일 형식을 입력해주세요</div>
		<div class="invalid-message2">이미 사용중인 이메일입니다</div> 
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
	<div class="invalid-message">주소를 작성해주세요</div>
	</div>

	
	<div class="row">
		<a href="${pageContext.request.contextPath}/mypage" id="canBtn" class="form-btn neutral w-24 medium">취소</a>
        <button type="submit" id="saveBtn" class="form-btn positive w-75 medium	 ms-25">변경하기</button>
	</div>

	<script>
	//저장시에는 알림창 안뜨게
		$("#saveBtn").on("click", function(){
		    checkUnload = false;
		    $("#saveForm").submit();
		});

	</script>

</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


