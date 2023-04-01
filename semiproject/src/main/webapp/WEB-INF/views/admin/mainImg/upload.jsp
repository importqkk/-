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
	    $(".back-btn").click(function() {
	    	var result = confirm("목록으로 돌아가면 작성하던 정보가 저장되지 않습니다.\n정말 돌아가시겠습니까?");
	    	if(!result) return false;
	    })
	})
</script>

<div class="container-1000">
	<form action="upload" method="post" enctype="multipart/form-data" class="upload-form" autocomplete="off">
	    <div class="row pt-30 pb-20">
	        <h1>메인 이미지 등록</h1>
	    </div>
	    <div class="row">
	        <label>제목</label>
	        <input type="text" class="form-input medium w-100" name="mainTitle">
	        <div class="invalid-message">제목을 1자 이상, 100자 이하로 입력해주세요.</div>
	    </div>
	    <div class="row">
	        <label>파일</label>
	        <input type="file" class="form-input medium w-100" name="img" accept=".png, .gif, .jpg">
	    	<div class="invalid-message">등록할 수 있는 용량을 초과하는 파일입니다.</div>
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
