<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp"></jsp:include>

<form action="delete" method="post" autocomplete="off">
<script type="text/javascript">
    $(function() {
//         $(".leave").prop("disabled", true);
//         $("[name=memberPw").on("input", function() {
//             var isTyped = $("[name=memberPw").val().length > 0;
//             if(isTyped) $(".leave").prop("disabled", false);
//             else $(".leave").prop("disabled", true);
//         })
       	var params = new URLSearchParams(location.search);
		var mode = params.get("mode");
		if(mode == "error") {
	        $(".leave").click(function() {
	            if(!result) return false;
	            else {
	                var result = confirm("정말 탈퇴하시겠습니까?");
	            	if(choice){
	                    return true;
	                }
	                else{
	                    return false;
	                }
	    		});
	    	});


</script>

<div class="container-500">
	<div class="row center">
		<h2>비밀번호 확인</h2>
	</div>

	
	<div class="row">
		<input type="password" name="memberPw" placeholder="비밀번호를 입력하세요" required class="form-input w-100 medium light">
	</div>
	
	<div class="row">
		<button class="form-btn neutral w-20 medium">취소</button>
        <button type="submit" class="leave form-btn positive w-75 medium ms-25">탈퇴하기</button>
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



