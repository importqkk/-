<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-1000">
	<form action="register" method="post" enctype="multipart/form-data">
        <div class="row pb-30 pt-30">
            <h1>상품 등록</h1>
        </div>
        <div class="row">
            <!-- <input hidden name="productNo" value=""> -->
            <label>상품명</label>
            <input type="text" class="form-input medium w-100" name="productName">
        </div>
        <div class="row">
            <label>브랜드</label>
            <input type="text" class="form-input medium w-100" name="productBrand">
        </div>
        <div class="row">
            <label>가격</label>
            <input type="text" class="form-input medium w-100" name="productPrice">
        </div>
        <div class="row">
            <label>재고</label>
            <input type="text" class="form-input medium w-100" name="productStock">
        </div>
        <div class="row">
            <label>상품 설명</label>
            <input type="text" class="form-input medium w-100" name="productContent">
        </div>
        <div class="row">
            <label>배송비</label>
            <input type="text" class="form-input medium w-100" name="productDeleveryPrice">
        </div>
        <div class="row">
            <label>판매수량</label>
            <input type="text" class="form-input medium w-100" name="productSellCount">
        </div>
        <div class="row">
            <label>등록일</label>
            <input type="date" class="form-input medium w-100" name="productJoin">
        </div>
        <div class="row">
            <label>대표이미지</label>
            <input type="file" class="form-input medium w-100" name="img1" accept=".png, .gif, .jpg">
        </div>
        <div class="row">
            <label>상세이미지</label>
            <input type="file" class="form-input medium w-100" name="img2" accept=".png, .gif, .jpg">
        </div>
        <div class="row pb-30">
        	<button type="submit" class="form-btn medium positive w-100">등록</button>
        </div>
    </form>
</div>
<hr>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
