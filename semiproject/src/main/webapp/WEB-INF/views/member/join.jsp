<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/static/js/find-address.min.js"></script>

<script src="/static/js/member-join.js"></script>

<form class="join-form" action="join" method="post" enctype="multipart/form-data" autocomplete="off">
<div class="container-500">
        <div class="row center">
            <h2 style="color:#776BFF;">SEMI</h2>
        </div>
        <div class="row">
            <label>아이디</label>
            <input type="text" name="memberId" placeholder="영문 소문자, 숫자 8~16자"
                class="form-input w-100 medium light" >
         <div class="valid-message">사용 가능한 아이디입니다</div>
		<div class="invalid-message">아이디는 영문소문자로 시작하며 숫자를 포함한 8~16자로 작성하세요</div>
		<div class="invalid-message2">이미 사용중인 아이디입니다</div>
        </div>
        <div class="row">
          <label>닉네임</label>
          <input type="text" name="memberNick" placeholder="한글, 숫자 2~10자"
              class="form-input w-100 medium light" >
         <div class="valid-message">사용 가능한 닉네임입니다</div>
		<div class="invalid-message">닉네임은 한글 또는 숫자 2~10글자로 작성하세요</div>
		<div class="invalid-message2">이미 사용중인 닉네임입니다</div> 
      </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="memberPw" placeholder="영문 대/소문자, 숫자, 특수문자 8~20자"
                class="form-input w-100 medium light" >
         <div class="valid-message">올바른 비밀번호 형식입니다</div>
		<div class="invalid-message">영문 대/소문자, 숫자, 특수문자를 반드시 포함하여 8~20자로 작성하세요</div>
		</div>
        <div class="row">
            <label>비밀번호 확인</label>
            <input type="password"  id="passwordRe" name="memberPwRe" placeholder="비밀번호 확인"
                class="form-input w-100 medium light" >
		<div class="valid-message">비밀번호가 일치합니다</div>
		<div class="invalid-message">비밀번호가 일치하지 않습니다</div>
		<div class="invalid-message2">비밀번호를 먼저 작성하세요</div>
              <div class="row">
                <label>이메일</label>
                <input type="email" name="memberEmail" class="form-input w-100 medium light">
              </div>
              <div class="row">
                  <label>휴대전화</label>
                  <input type="tel" name="memberPhone" class="form-input w-100 medium light">
                  <div class="invalid-message">올바른 휴대전화번호가 아닙니다</div>
              </div>
        <div class="row">
        	<label class="form-label w-100 mb-10">주소</label><br>
    		<input type="text" name="memberPost" class="form-input medium light" placeholder="우편번호" readonly>
    		<button type="button" class="form-btn neutral find-address-btn medium light">검색</button>
        </div>
        <div class="row">
            <input type="text" name="memberBasicAddr" class="form-input w-100 medium light" placeholder="기본주소" readonly>
        </div>
        <div class="row">
            <input type="text" name="memberDetailAddr" class="form-input w-100 medium light" placeholder="상세주소" >
            <div class="invalid-message">주소는 비워두거나 모두 작성해야 합니다</div>
        </div>
        <div class="row">
            <button type="submit" class="form-btn positive w-100 medium">회원 가입</button>
        </div>
    </div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>