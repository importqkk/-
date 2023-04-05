<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 <style>
   .container-500 {
     margin-top: 100px;
   }
 </style>
<div class="container-500">
	<div class="row center">
<h2>회원님의 이메일로 가입된</h2>
<h2>아이디가 있습니다.</h2>
	</div>
	<div class="row">
	<input type="text" name="memberEmail" required class="form-input w-100 medium light"  value="가입된 아이디: ${findId}" readonly>
	</div>	
	<div class="row center">
<h2><a href="login">로그인 하러가기</a></h2>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>