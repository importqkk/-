// 상품 수정 유효성 검사 스크립트

$(function(){

	var valid = {
		productNameValid:true,
		productBrandValid:true,
		/*productTypeValid:true,*/
		productContentValid:true,
		productPriceValid:true,
		productStockValid:true,
		productDeliveryPriceValid:true,
		productSellCountValid: true,
		productJoinValid: true,
		/*img1Valid: true,
		img2Valid: true,*/
		isAllValid:function() {
			return this.productNameValid && this.productBrandValid 
			&& this.productContentValid && this.productPriceValid 
			&& this.productStockValid && this.productDeliveryPriceValid 
			&& this.productSellCountValid && this.productJoinValid
			/*&& this.img1Valid && this.img2Valid*/;
		}
	}
	
	// 상품명 검사
	$("[name=productName]").blur(function() {
		var regex = /^[A-Za-z0-9가-힣-!@#$%^&*\s]{1,33}$/;
		var isValid = regex.test($(this).val());
		valid.productNameValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	// 브랜드 검사
	$("[name=productBrand]").blur(function() {
		var regex = /^[A-Za-z0-9가-힣-!@#$%^&*\s]{1,10}$/;
		var isValid = regex.test($(this).val());
		valid.productBrandValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	// 상품 설명 검사
	$("[name=productContent]").blur(function() {
		var isValid = $(this).val().length <= 1000 && $(this).val().length > 0;
		valid.productContentValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	// 상품 가격 검사
	$("[name=productPrice]").blur(function() {
		var isValid = $(this).val() >= 0 && $(this).val() <= 2100000000 && $(this).val().length > 0;
		valid.productPriceValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	// 상품 재고 검사
	$("[name=productStock]").blur(function() {
		var isValid = $(this).val() >= 0 && $(this).val() <= 2100000000 && $(this).val().length > 0;
		valid.productStockValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	// 배송비 검사
	$("[name=productDeliveryPrice]").blur(function() {
		var isValid = $(this).val() >= 0 && $(this).val() <= 2100000000 && $(this).val().length > 0;
		valid.productDeliveryPriceValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	// 판매수 검사
	$("[name=productSellCount]").blur(function() {
		var isValid = $(this).val() >= 0 && $(this).val() <= 2100000000 && $(this).val().length > 0;
		valid.productSellCountValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	// 출시일 검사
	$("[name=productJoin]").blur(function() {
		var regex = /^(19[0-9]{2}|20[0-9]{2})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|02-(0[1-9]|[12][0-9]))$/;
		var isValid = regex.test($(this).val());
		valid.productJoinValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	/*// 대표이미지 크기 검사
	$("[name=img1]").blur(function() {
		var isValid = $(this).val().length <= 9223372036854775807 && $(this).val().length > 0;
		valid.img1Valid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	// 상세이미지 크기 검사
	$("[name=img2]").blur(function() {
		var isValid = $(this).val().length <= 9223372036854775807 && $(this).val().length > 0;
		valid.img2Valid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})*/
	
	// form 검사
	$(".edit-form").submit(function(e) {
		return valid.isAllValid();
	})
	
});
