<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	
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
	<form action="upload" method="post" enctype="multipart/form-data">
	    <div class="row pt-30 pb-20">
	        <h1>메인 이미지 등록</h1>
	    </div>
	    <div class="row">
	        <label class="ps-20">제목</label>
	        <input type="text" class="form-input medium w-100" name="mainTitle">
	    </div>
	    <div class="row">
	        <label class="ps-20">파일</label>
	        <input type="file" class="form-input medium w-100" name="img" accept=".png, .gif, .jpg">
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
