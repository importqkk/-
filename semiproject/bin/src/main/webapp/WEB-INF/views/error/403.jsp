<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
    .container {
        display: grid;
        place-items: center;
        min-height: 80vh;
    }
    .ti-exclamation-circle {
	    color: #776bff;
	    font-size: 150px;
	}
</style>    
    
<div class="container-1000 container">
   <div class="w-100">
       <div class="center">
           <i class="ti ti-exclamation-circle"></i>
       </div>
       <div class="center mb-50">
           <h2>권한이 없습니다.</h2>
       </div>
       <div class="w-100 center">
           <a class="form-btn positive medium w-50" href="${pageContext.request.contextPath}/">메인으로</a>
       </div>
   </div>
</div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
