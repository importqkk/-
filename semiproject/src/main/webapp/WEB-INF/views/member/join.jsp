<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/static/js/find-address.min.js"></script>

<script src="/static/js/member-join.js"></script>
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script type="text/javascript">
$(function(){
// 체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
});

// 체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;

    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
});
});
//체크박스 값주기	
// 	$(".normal").val('N');
// 	// 체크박스의 값이 변경될 때마다 호출
// 	$(".normal").change(function(){
// 	  if(this.checked){
// 	    $(this).val('Y');
// 	  } else {
// 	    $(this).val('N');
// 	  }
// });
// });
// //체크박스 값주기	
	
// 		$(".normal").prop('value', 'N');

// // 체크박스의 값이 변경될 때마다 호출
// 		$(".normal").change(function(){
// 		  if(this.checked){
// 		    $(this).prop('value', 'Y');
// 		  }else{
// 		    $(this).prop('value', 'N');
// 		  }
// 		});
// });
    </script>
<form class="join-form" action="join" method="post" enctype="multipart/form-data" autocomplete="off">
<div class="container-500">
        <div class="row center">
            <h2 style="color:#776BFF;">SEMI</h2>
        </div>
        <div class="row">
            <label>아이디</label>
            <input type="text" name="memberId" placeholder="영문 소문자, 숫자 8~16자"
               required class="form-input w-100 medium light" >
        <div class="valid-message">사용 가능한 아이디입니다</div>
		<div class="invalid-message">아이디는 영문소문자로 시작하며 숫자를 포함한 8~16자로 작성하세요</div>
		<div class="invalid-message2">이미 사용중인 아이디입니다</div>
        </div>
         <div class="row">
        	<label>이름</label>
        	<input type="text" name="memberName" placeholder="성, 이름 포함 한글 2글자 이상 7글자 이하"
            	required class="form-input w-100 medium light" >
        <div class="valid-message">멋진 이름입니다!</div>
		<div class="invalid-message">이름은 성, 이름 포함 한글 2~7자로 작성하세요</div>
        </div>
        <div class="row">
          <label>닉네임</label>
          <input type="text" name="memberNick" placeholder="한글, 숫자 2~10자"
             required class="form-input w-100 medium light" >
        <div class="valid-message">사용 가능한 닉네임입니다</div>
		<div class="invalid-message">닉네임은 한글 또는 숫자 2~10자로 작성하세요</div>
		<div class="invalid-message2">이미 사용중인 닉네임입니다</div> 
      </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="memberPw" placeholder="영문 대/소문자, 숫자, 특수문자 8~20자"
               required class="form-input w-100 medium light" >
         <div class="valid-message">올바른 비밀번호 형식입니다</div>
		<div class="invalid-message">영문 대/소문자, 숫자, 특수문자를 반드시 포함하여 8~20자로 작성하세요</div>
		</div>
        <div class="row">
            <label>비밀번호 확인</label>
            <input type="password"  id="passwordRe" name="memberPwRe" placeholder="비밀번호 확인"
               required class="form-input w-100 medium light" >
		<div class="valid-message">비밀번호가 일치합니다</div>
		<div class="invalid-message">비밀번호가 일치하지 않습니다</div>
		<div class="invalid-message2">비밀번호를 먼저 작성하세요</div>
		</div>
              <div class="row">
            <label>이메일</label>
            <input type="text" name="memberEmail" class="form-input w-100 medium light" required placeholder="이메일 입력">
        <div class="valid-message">사용 가능한 이메일 입니다</div>
		<div class="invalid-message">올바른 이메일 형식을 입력해주세요</div>
		<div class="invalid-message2">이미 사용중인 이메일입니다</div> 
          </div>
          <div class="row">
              <label>전화번호</label>
              <input type="tel" name="memberPhone" placeholder="대시(-)를 제외하고 작성" required class="form-input w-100 medium light">
              <div class="valid-message">사용 가능한 전화번호입니다</div>
              <div class="invalid-message">올바른 전화번호가 아닙니다</div>
          </div>
        <div class="row">
        	<label class="form-label w-100 mb-10">주소</label><br>
    		<input type="text" name="memberPost" class="form-input medium light" required placeholder="우편번호" readonly>
    		<button type="button" class="form-btn neutral find-address-btn medium light">검색</button>
        </div>
        <div class="row">
            <input type="text" name="memberBasicAddr" class="form-input w-100 medium light" placeholder="기본주소" readonly>
        </div>
        <div class="row">
            <input type="text" name="memberDetailAddr" class="form-input w-100 medium light" placeholder="상세주소" >
            <div class="invalid-message">주소는 비워두거나 모두 작성해야 합니다</div>
        </div>
        <div class="checkbox_group">
        <div class="row">
  <input type="checkbox" id="check_all">
  <label for="check_all">SEMI 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신(선택)에 모두 동의합니다.</label>
                
        </div>
        <div class="row mt-40">
        	<textarea class="form-input w-100" readonly>어쩌구저쩌구</textarea>
        </div>

        <div class="row">
  <input type="checkbox" name="agreeTos" id="check_1" required class="normal"  value="Y">
  <label for="check_1">(필수) 개인정보 처리방침 동의</label>
        </div>

        <div class="row mt-40">
            <textarea class="form-input w-100" readonly>어쩌구저쩌구</textarea> 
        </div>

        <div class="row">
  <input type="checkbox" name="agreePrivacy" id="check_2" required class="normal"  value="Y">
  <label for="check_2">(필수) 서비스 이용약관 동의</label>
        </div>

        <div class="row mt-40">
            <textarea class="form-input w-100" readonly>어쩌구저쩌구</textarea>
        </div>

        <div class="row">
  <input type="checkbox" name="agreePromotion" id="check_3" class="normal"  value="Y">
  <label for="check_3">(선택) 마케팅 수신 동의</label>
        </div>

        <div class="row">
            <button type="submit" class="form-btn positive w-100 medium next-btn">회원 가입</button>
        </div>
    </div>
    </div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>