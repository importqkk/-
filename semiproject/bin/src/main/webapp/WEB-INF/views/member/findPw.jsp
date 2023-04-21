<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
  .container-600 {
    margin-top: 100px;
  }
  .error{ 
  font-size: 20px;
  color: red;
  }
</style>
  <form action="${pageContext.request.contextPath}/findPw" method="post" autocomplete="off">
    <div class="container-600">
        <div class="row center">  
            <h2>비밀번호 찾기</h2>
            <h3>아이디와 본인확인 이메일을 입력해주세요</h3>
        </div>
        <div class="row">
          <input type="text" name="memberId" required class="form-input w-100 medium light" placeholder="아이디" >
          <div class="row center">
            </div>
          </div>
        <div class="row">
          <input type="text" name="memberEmail" required class="form-input w-100 medium light" placeholder="이메일" >
          	</div>
     		<div class="row center">
          <button class="form-btn positive w-100 medium">찾기</button>
        </div>
        <c:if test="${param.mode == 'error'}">
          <div class="row center" style="font-size: 15px; color: red;">
            <h3 class="error">입력하신 정보와 일치하는 회원이 없습니다.</h3>
          </div>
        </c:if>
    </div>
  </form> 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>