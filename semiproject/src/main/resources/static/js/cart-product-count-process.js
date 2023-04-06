$(function() {
    $(".qty-selector").on("input", function() {
    	// 수량
    	var productCount = parseInt($(this).val());
    	// 상품번호
    	var productNo = $(this).parent().prev().prev().find(".productNo").text();
    	// 상품 가격
    	var productPrice = $(this).parent().prev().find(".productPrice").text();
    	// 상품 재고
    	var productStock = parseInt($(this).parent().prev().prev().find(".productStock").text());
    	
		if(productCount <= 0) {
			alert ("최소 1개, 최대 10개까지 구매할 수 있습니다.")
		}
    	// 개발자모드로 10개 이상 담으면 경고창
    	else if(productCount > 10) {
    		alert ("최소 1개, 최대 10개까지 구매할 수 있습니다.");
    	}
    	// 개발자모드로 재고보다 많이 담으면 경고창
    	else if(productCount > productStock) {
    		alert ("상품 재고가 부족합니다.");
    	}
    	// 상품을 10개 이하로 담았을 경우만 수량 변경 실행
    	else if(productCount <= 10 && productCount > 0 && productCount <= productStock) {
    		$.ajax({
        		url:contextPath + "/rest/cart/",
        		method:"patch",
        		data: {
        			productNo: productNo,
        			productCount: productCount,
        			productPrice: productPrice
        		},
        		success: function(response) {
        			var totalProductPrice = 0;
        			for(var i=0; i<response.length; i++) {
        				totalProductPrice += response[i].productCount * response[i].productPrice;
        			}
        			$(".total-product-price").text(totalProductPrice.toLocaleString());
        			$(".final-price").text((totalProductPrice+3000).toLocaleString());
        		},
        		error: function() {
					alert("시스템 오류가 발생했습니다. 잠시 후 다시 시도해주세요.\n같은 문제가 지속적으로 발생할 경우 QnA 게시판에 문의 남겨주세요.")
				}
        	})
    	}
    })
    
    $(".order-btn").click(function() {
		// 수량
    	var productCount = parseInt($(this).val());
    	if(productCount <= 0) {
			alert ("최소 구매수량은 1개입니다.");
		}
	})
});