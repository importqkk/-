<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- LightPick -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>
<script src="/static/js/date-picker.js"></script>
<!-- 상품 정보 유효성 검사 -->
<script src="/static/js/product-edit-checker.js"></script>
<style>
	label, .invalid-message {
		padding-left: 20px
	}
	textarea {
		min-height: 200px;
		resize: none;
		border-radius: 25px;
		outline: none;
	    padding-left: 1.3em;
	    padding-right: 1.3em;
	    border-color: #776BFF;
	    font-size: 15px;
	    padding-top: 1em;
	    padding-bottom: 1em;
	    border-width: 2px;
	    border-style: solid;
	}
	.category-label {
		padding: 0;
		flex-grow: 1;
		display: flex;
    	align-items: center;
    	justify-content: center;
	}
	.category-label > label {
		padding-left: 5px;
	}
	.category-title:not(:last-child) {
		margin-right: 60px;
	}
</style>

<script type="text/javascript">
	$(function() {
		$(".back-btn").click(function() {
			var result = confirm("되돌아가면 수정하던 내용이 저장되지 않습니다.\n정말 돌아가시겠습니까?");
			if(!result) return false;
		})
	})
</script>

<div class="container-1000">
	<form action="edit" method="post" enctype="multipart/form-data" class="edit-form" autocomplete="off">
        <div class="row pb-20">
            <h1>상품 정보 수정</h1>
        </div>
        <div class="row">
        	<input hidden name="productNo" value="${productDto.productNo}">
            <label>상품명</label>
            <input type="text" class="form-input medium w-100" name="productName" value="${productDto.productName}">
        	<div class="invalid-message">상품명은 한글, 영어, 숫자, 특수문자를 포함한 1~33자입니다.</div>
        </div>
        <div class="row">
            <label>브랜드</label>
            <input type="text" class="form-input medium w-100" name="productBrand" value="${productDto.productBrand}">
        	<div class="invalid-message">브랜드명은 한글, 영어, 숫자, 특수문자를 포함한 1~10자입니다.</div>
        </div>
        <div class="row pb-5">
            <div class="w-100 ps-20">카테고리</div>
           		<c:choose>
           			<c:when test="${productTagDto.tagNo == null}">
           				<div class="w-100 category-label invalid">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           			<c:when test="${productTagDto.tagNo == 1}">
           				<div class="w-100 category-label">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1 checked><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           			<c:when test="${productTagDto.tagNo == 2}">
           				<div class="w-100 category-label">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2 checked><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           			<c:when test="${productTagDto.tagNo == 3}">
           				<div class="w-100 category-label">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3 checked><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           			<c:when test="${productTagDto.tagNo == 4}">
           				<div class="w-100 category-label">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4 checked><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           			<c:when test="${productTagDto.tagNo == 5}">
           				<div class="w-100 category-label">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5 checked><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           			<c:when test="${productTagDto.tagNo == 6}">
           				<div class="w-100 category-label">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6 checked><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           			<c:when test="${productTagDto.tagNo == 7}">
           				<div class="w-100 category-label">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7 checked><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           			<c:when test="${productTagDto.tagNo == 8}">
           				<div class="w-100 category-label">
			            	<div class="category-label flex">
	            				<input type="radio" id="tag1" name="tagNo" value=1><label class="category-title" for="tag1">피부</label>
							    <input type="radio" id="tag2" name="tagNo" value=2><label class="category-title" for="tag2">다이어트</label>
							    <input type="radio" id="tag3" name="tagNo" value=3><label class="category-title" for="tag3">여성</label>
							    <input type="radio" id="tag4" name="tagNo" value=4><label class="category-title" for="tag4">활력</label>
							    <input type="radio" id="tag5" name="tagNo" value=5><label class="category-title" for="tag5">남성</label>
							    <input type="radio" id="tag6" name="tagNo" value=6><label class="category-title" for="tag6">눈</label>
							    <input type="radio" id="tag7" name="tagNo" value=7><label class="category-title" for="tag7">치아</label>
							    <input type="radio" id="tag8" name="tagNo" value=8 checked><label class="category-title" for="tag8">관절/뼈</label>
							</div>
						</div>
           			</c:when>
           		</c:choose>
            <div class="invalid-message pt-10">올바른 카테고리를 1개 선택해주세요.</div>
        </div>
        <div class="row">
            <label>가격</label>
            <input type="text" class="form-input medium w-100" name="productPrice" value="${productDto.productPrice}">
        	<div class="invalid-message">0에서 2,100,000,000 이하의 숫자를 입력해주세요.</div>
        </div>
        <div class="row">
            <label>재고</label>
            <input type="text" class="form-input medium w-100" name="productStock" value="${productDto.productStock}">
        	<div class="invalid-message">0에서 2,100,000,000 이하의 숫자를 입력해주세요.</div>
        </div>
        <div class="row">
            <label>배송비</label>
            <input type="text" class="form-input medium w-100" name="productDeliveryPrice" value="${productDto.productDeliveryPrice}">
        	<div class="invalid-message">0에서 2,100,000,000 이하의 숫자를 입력해주세요.</div>
        </div>
        <div class="row">
            <label>누적판매수</label>
            <input type="text" class="form-input medium w-100" name="productSellCount" value="${productDto.productSellCount}">
        	<div class="invalid-message">0에서 2,100,000,000 이하의 숫자를 입력해주세요.</div>
        </div>
        <div class="row">
            <label>등록일</label>
            <input type="text" class="form-input medium w-100 date-picker" name="productJoin" value="${productDto.productJoin}">
        	<div class="invalid-message">등록일은 yyyy-mm-dd 형식으로 입력할 수 있습니다.</div>
        </div>
        <div class="row">
            <label class="w-100 flex">
            	<div class="w-50">
            		대표이미지
            	</div>
            	<div class="w-50 right pe-20">
            		기존 파일: ${img1Dto.imgName} / 
            		<fmt:formatNumber pattern="#,##0" value="${img1Dto.imgSize/1024}"></fmt:formatNumber>kb
            	</div>
            </label>
            <input type="file" class="form-input medium w-100" name="img1" accept=".png, .gif, .jpg">
        	<div class="invalid-message">1mb 이하의 이미지만 업로드할 수 있습니다.</div>
        </div>
        <div class="row">
            <label class="w-100 flex">
            	<div class="w-50">
	            	상세이미지
	            </div>
	            <div class="w-50 right pe-20">
	            	기존 파일: ${img2Dto.imgName} / 
            		<fmt:formatNumber pattern="#,##0" value="${img2Dto.imgSize/1024}"></fmt:formatNumber>kb
	            </div>
	        </label>
            <input type="file" class="form-input medium w-100" name="img2" accept=".png, .gif, .jpg">
        	<div class="invalid-message">1mb 이하의 이미지만 업로드할 수 있습니다.</div>
        </div>
        <div class="row">
            <label class="w-100">상품 설명</label>
            <textarea class="w-100" name="productContent">${productDto.productContent}</textarea>
            <div class="invalid-message">상품 설명은 1자 이상, 1,000자 이하로 입력할 수 있습니다.</div>
        </div>
        <div class="row">
        	<button type="submit" class="form-btn medium positive w-100">수정하기</button>
        </div>
        <div class="row">
        	<a class="form-btn medium neutral w-100 back-btn" href="/admin/productManage/list">돌아가기</a>
        </div>
    </form>
</div>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
