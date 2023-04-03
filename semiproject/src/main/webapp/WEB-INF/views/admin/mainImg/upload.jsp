<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- 메인 이미지 정보 유효성 검사 -->
<script src="/static/js/main-img-checker.js"></script>
<style>
	label, .invalid-message {
		padding-left: 20px
	}
	h1 {
		margin: 0;
	}
</style>

<script type="text/javascript">
	$(function() {
	    $(".upload-btn").click(function() {
	        var title = $("[name=main_title]").val();
	        var img = $("[name=img]").val();
	        if(!title.length) {
	            alert("제목을 입력해주세요.");
	            return false;
	        }
	        else if(!img.length) {
	            alert("파일을 선택해주세요.");
	            return false;
	        }
	    })
	})
	window.addEventListener('beforeunload', (event) => {
    	event.preventDefault();
    	event.returnValue = '';
    });
</script>

<div class="container-1000">
	<form action="upload" method="post" enctype="multipart/form-data" class="upload-form" autocomplete="off">
	    <div class="row">
	        <h1>메인 이미지 등록</h1>
	    </div>
	    <div class="row pb-20">
	    	<span>메인 슬라이드 이미지의 적정 크기는 1000px x 520px입니다.</span>
	    </div>
	    <div class="row">
	        <label>제목</label>
	        <input type="text" class="form-input medium w-100" name="mainTitle">
	        <div class="invalid-message">제목을 1~100자로 입력해주세요.</div>
	    </div>
	    <div class="row pb-20">
	        <label>파일</label>
	        <input type="file" class="form-input medium w-100" name="img" accept=".png, .gif, .jpg">
	    	<div class="invalid-message">1mb 이하의 이미지만 업로드할 수 있습니다.</div>
	    </div>
	    <div class="row">
	        <button type="submit" class="form-btn medium positive w-100 upload-btn">등록하기</button>
	    </div>
	    <div class="row">
	        <a class="form-btn medium neutral w-100 back-btn" href="/admin/mainImg/list">돌아가기</a>
	    </div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
