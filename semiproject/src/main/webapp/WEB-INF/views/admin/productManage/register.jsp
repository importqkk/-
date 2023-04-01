<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- LightPick -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>
<script src="/static/js/date-picker.js"></script>
<!-- 상품 정보 유효성 검사 -->
<script src="/static/js/product-register-checker.js"></script>
<style>
	label, .invalid-message {
		padding-left: 20px
	}
</style>

<div class="container-1000">
	<form action="register" method="post" enctype="multipart/form-data" class="register-form" autocomplete="off">
        <div class="row pb-30 pt-30">
            <h1>상품 등록</h1>
        </div>
        <div class="row">
            <!-- <input hidden name="productNo" value=""> -->
            <label>상품명</label>
            <input type="text" class="form-input medium w-100" name="productName">
            <div class="invalid-message">상품명은 한글, 영어, 숫자, 특수문자를 포함한 1~33자입니다.</div>
        </div>
        <div class="row">
            <label>브랜드</label>
            <input type="text" class="form-input medium w-100" name="productBrand">
            <div class="invalid-message">브랜드명은 한글, 영어, 숫자, 특수문자를 포함한 1~10자입니다.</div>
        </div>
        <div class="row">
            <label>가격</label>
            <input type="text" class="form-input medium w-100" name="productPrice">
            <div class="invalid-message">0에서 2,100,000,000 이하의 숫자를 입력해주세요.</div>
        </div>
        <div class="row">
            <label>재고</label>
            <input type="text" class="form-input medium w-100" name="productStock">
            <div class="invalid-message">0에서 2,100,000,000 이하의 숫자를 입력해주세요.</div>
        </div>
        <div class="row">
            <label>상품 설명</label>
            <input type="text" class="form-input medium w-100" name="productContent">
            <div class="invalid-message">상품 설명은 1자 이상, 1,000자 이하로 입력할 수 있습니다.</div>
        </div>
        <div class="row">
            <label>배송비</label>
            <input type="text" class="form-input medium w-100" name="productDeliveryPrice">
            <div class="invalid-message">0에서 2,100,000,000 이하의 숫자를 입력해주세요.</div>
        </div>
        <div class="row">
            <label>누적판매수</label>
            <input type="text" class="form-input medium w-100" name="productSellCount">
            <div class="invalid-message">0에서 2,100,000,000 이하의 숫자를 입력해주세요.</div>
        </div>
        <div class="row">
            <label>등록일</label>
            <input type="text" class="form-input medium w-100 date-picker" name="productJoin">
            <div class="invalid-message">등록일은 yyyy-mm-dd 형식으로 입력할 수 있습니다.</div>
        </div>
        <div class="row">
            <label>대표이미지</label>
            <input type="file" class="form-input medium w-100" name="img1" accept=".png, .gif, .jpg">
            <div class="invalid-message">등록할 수 있는 용량을 초과하는 파일입니다.</div>
        </div>
        <div class="row">
            <label>상세이미지</label>
            <input type="file" class="form-input medium w-100" name="img2" accept=".png, .gif, .jpg">
            <div class="invalid-message">등록할 수 있는 용량을 초과하는 파일입니다.</div>
        </div>
        <div class="row pb-30">
        	<button type="submit" class="form-btn medium positive w-100 register-btn">등록</button>
        </div>
    </form>
</div>
<hr>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
