<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <style>
      h1{
        color:#776BFF;
      }
      .error{ 
	    font-size: 20px;
	    color: red;
	  }	
    </style>
<div class="container-500 mt-100">
	<div class="row center">
		<h1>WELCOME</h1>
	</div>
	<div class="row center">
<h2>회원가입이 완료되었습니다!</h2><p>
<h2>나한테 필요한 영양제를 찾으러 가볼까요?</h2>
	</div>
	<div class="row center">
		<a href="${pageContext.request.contextPath}/" class="form-btn neutral medium w-30 mt-10">홈으로</a>
		<a href="${pageContext.request.contextPath}/login" class="form-btn positive medium w-30 mt-10">로그인</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
		
	