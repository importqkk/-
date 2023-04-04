<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.container {
	    display: grid;
	    place-items: center;
	    align-items: center;*/
	    min-height: 100vh;
	}
	.ti-exclamation-circle {
	    color: #776bff;
	    font-size: 150px;
	}
</style>    
    
<div class="container-1000 container">
    <div class="w-100">
        <div class="center pb-10">
            <i class="ti ti-exclamation-circle"></i>
        </div>
        <div class="center mb-50">
            <h2>오류가 발생했습니다.</h2>
        </div>
        <div class="w-100 center">
            <a class="form-btn positive medium w-50" href="/">메인으로</a>
        </div>
    </div>
</div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>