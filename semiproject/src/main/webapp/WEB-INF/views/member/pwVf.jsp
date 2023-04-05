<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp"></jsp:include>

<style>
  .container-600 {
    margin-top: 100px;
  }
  .content {
  	min-height: 416px;
  }
  .error{ 
    font-size: 20px;
    color: red;
  }
</style>
<script type="text/javascript">
	
</script>
    <form action="pwVf" method="post" autocomplete="off" class="pw-form content">
    <div class="container-600">
        <div class="row center">  
            <h2>비밀번호 인증</h2>
            <h3>정보보호를 위해 비밀번호를 다시 인증합니다.</h3>
        </div>
        <div class="row">
          <input type="password" name="password" required class="form-input w-100 medium light" placeholder="비밀번호 입력" >
          </div>
     		<div class="row">
		<div class="row">
		<button class="form-btn neutral w-24 medium">취소</button>
        <button type="submit" class="form-btn positive w-75 medium confirm-btn ms-25">확인</button>
		
		</div>
				<!-- 취소 버튼 클릭 이벤트 처리 -->
		<script>
			$('.form-btn.neutral').click(function(){
  			window.location.href = '/member/mypage';
			});
		</script>
        
        <c:if test="${param.mode == 'error'}">
          <div class="row center">
            <h3 class="error">비밀번호가 틀렸습니다.</h3>
          </div>
        </c:if>
    </div>
  </form> 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>