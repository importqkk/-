<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/static/js/find-address.min.js"></script>
<script src="/static/js/admin-edit.js"></script>



<script type="text/javascript">
var checkUnload = true;
$(window).on("beforeunload", function(){
    if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
});
</script>
<form action="edit" method="post" class="content admin-edit-form">
<input type="hidden" name="memberId" value="${memberDto.memberId}">
<div class="container-600">
	<div class="row center">
		<h2>회원 정보 변경</h2>
	</div>
	<div class="row">
		<label>닉네임</label>
		<input type="text" name="memberNick" required class="form-input w-100 medium light"  value="${memberDto.memberNick}">
		<div class="valid-message">사용 가능한 닉네임입니다</div>
		<div class="invalid-message">닉네임은 한글 또는 숫자 2~10자로 작성하세요</div>
		<div class="invalid-message2">이미 사용중인 닉네임입니다</div>
	</div>
	<div class="row">
		<label>전화번호</label>
		<input type="tel" name="memberPhone" required class="form-input w-100 medium light"  value="${memberDto.memberPhone}">
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
		<label>주소</label><div></div>
		<input type="text" name="memberPost" class="form-input medium light" placeholder="우편번호" readonly value="${memberDto.memberPost}">
		<button type="button" class="form-btn neutral find-address-btn medium light">검색</button>
	</div>
	<div class="row">
		<input type="text" name="memberBasicAddr" class="form-input w-100 medium light" placeholder="기본주소" readonly value="${memberDto.memberBasicAddr}">
	</div>
	<div class="row">
		<input type="text" name="memberDetailAddr" required class="form-input w-100 medium light"  placeholder="상세주소" value="${memberDto.memberDetailAddr}">
	<div class="invalid-message">주소를 작성해주세요</div>
	</div>
	
	<div class="row">
		<label class="form-label w-100">회원등급</label>
		<c:choose>
			<c:when test="${memberDto.memberRole == '일반회원'}">
				<select name="memberRole" class="form-input small light w-20">
					<option selected>일반회원</option>
					<option>관리자</option>
				</select>
			</c:when>
			<c:otherwise>
				<select name="memberRole" class="form-input small light w-20">
					<option selected>관리자</option>
					<option>일반회원</option>
				</select>
			</c:otherwise>
		</c:choose>
		
		(현재 등급 : ${memberDto.memberRole})
	</div>
	
	<div class="row">
		<label class="form-label w-100 me-15">포인트</label>
		<input type="text" name="memberPoint" value="${memberDto.memberPoint}" required class="form-input w-20 small light">
				(현재 포인트 : ${memberDto.memberPoint} point)
	</div>
	
	<div class="row right">
		<a href="list" class="form-btn neutral medium">목록</a>
		<button type="submit" id="saveBtn" class="form-btn positive medium">변경</button>
	</div>
		<script>

		$("#saveBtn").on("click", function(){
		    checkUnload = false;
		    $("#saveForm").submit();
		});

	</script>
</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>