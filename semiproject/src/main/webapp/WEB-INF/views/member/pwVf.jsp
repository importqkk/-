<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
  .container-600 {
    margin-top: 100px;
  }
</style>
    <form action="findPw" method="post" autocomplete="off">
    <div class="container-600">
        <div class="row center">  
            <h2>비밀번호 인증</h2>
            <h3>정보보호를 위해 비밀번호를 다시 인증합니다.</h3>
        </div>
        <div class="row">
          <input type="text" name="memberId" required class="form-input w-100 medium light" placeholder="비밀번호 입력" >
          </div>
     		<div class="row">
          <button class="form-btn neutral w-20 medium">취소</button>
          <button class="form-btn positive w-75 medium ms-25">찾기</button>
        </div>
        
        <c:if test="${param.mode == 'error'}">
          <div class="row center" style="font-size: 15px; color: red;">
            <h3>비밀번호가 틀렸습니다.</h3>
          </div>
        </c:if>
    </div>
  </form> 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>