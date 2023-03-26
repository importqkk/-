<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
		
<style>
    h1, h2, h3, h4, span {
        margin: 0;
    }
    .product-img {
        background-color: #f8f8f8;
        border-radius: 25px;
        padding: 10px;
    }
    .check-btn, .fa-xmark {
        cursor: pointer;
    }
    .qty-selector {
	    padding-top: 5px;
	    padding-bottom: 5px;
	    text-align: center;
	    border: 2px solid #776bff;
	    border-radius: 100px;
	    outline: none;
	    appearance: none;
	    background:url('/static/image/down-arrow.png') no-repeat 88% 55%/11px auto;
	}
</style>
<script type="text/javascript">
    $(function() {
        // 전체 체크박스 체크하면 개별 체크박스 체크 처리
        $(".check-all").change(function() {
            var isChecked = $(this).prop("checked");
            $(".check-all, .check-item").prop("checked", isChecked);
        })
        // 개별 체크박스 전부 체크하면 전체 체크박스 체크 처리
        $(".check-item").change(function() {
            var checkboxCount = $(".check-item").length;
            var checkedCount = $(".check-item:checked").length;
            var isAllchecked = checkboxCount == checkedCount;
            $(".check-all").prop("checked", isAllchecked);
        })
        // 아무 상품도 선택하지 않고 선택상품 결제 버튼 누르면 경고창 뜨게 하기
        $(".selected-btn").click(function() {
            var checkItem = $(".check-item:checked").length;
            if(checkItem < 1) alert("구매하실 상품을 한 개 이상 선택해주세요.");
        })
        $(".qty-selector").on("input", function() {
        	var quentity = $(this).val();
        	if(quentity > 10) {
        		alert ("최소 1개, 최대 10개까지 구매할 수 있습니다.");
        		$(".all-btn, .selected-btn").click(function() {
        			alert ("상품을 1개 이상, 10개 이하로 담아주세요.");
        			return false;
        		});
        	}
        })
    });
    
</script>

    <div class="container-1000 mt-40">

        <div class="row-large flex">
            <h1 class="me-15">장바구니</h1>
            <h1 class="c-p100">3</h1>	<!-- 바꿔야함 -->
        </div>

        <div class="row-medium">
            <div class="flex me-15">
                <label class="flex">
                    <input type="checkbox" class="me-10 check-all">
                    <h3>전체선택</h3>
                </label>
            </div>
        </div>

<!-- ------------------------------------ 반복문 돌릴 부분 start ------------------------------------ -->
        <c:forEach var="cartProductInfoDto" items="${itemInfo}">
	        <div class="row-large flex cart-item">
	            <div class="flex me-15">
	                <input type="checkbox" class="check-item">
	            </div>
	            <div class="flex me-15">
	                <img class="product-img" src="/static/image/productDummy.png" width="130" height="130">	<!-- 바꿔야함 -->
	            </div>
	            <div class="w-100">
	                <div class="row-medium flex">
	                    <h4 class="me-5 c-b80">[${cartProductInfoDto.productBrand}]</h4>
	                    <span class="c-b80">${cartProductInfoDto.productName}</span>
	                </div>
	                <div class="row">
	                    <h4>
	                    	<fmt:formatNumber value="${cartProductInfoDto.productPrice}" pattern="#,##0"></fmt:formatNumber>
							원
	                    </h4>
	                </div>
	                <!------------ 수량조절 ------------>
	                <div>
	                    <select class="w-10 qty-selector">
	                        <option>1</option>
	                        <option>2</option>
	                        <option>3</option>
	                        <option>4</option>
	                        <option>5</option>
	                        <option>6</option>
	                        <option>7</option>
	                        <option>8</option>
	                        <option>9</option>
	                        <option>10</option>
	                    </select>
	                </div>
	            </div>
	            <!------------ 상품 삭제할 x 아이콘 ------------>
	            <div class="flex row" style="align-self: baseline;">
	            	<a href="delete?memberId=${cartProductInfoDto.memberId}&productNo=${cartProductInfoDto.productNo}" class="link">
	                	<i class="fa-solid fa-xmark font-h2 delete-btn"></i>
	                </a>
	            </div>
	        </div>
	    </c:forEach>
<!-- ------------------------------------ 반복문 돌릴 부분 end ------------------------------------ -->

        <div class="row-large">
            <a class="form-btn medium neutral w-100" href="/">더 쇼핑하기</a>
        </div>

<!-- ----------------------------------------- 계산 ---------------------------------------- -->
        <div class="row-large">
            <table class="table table-cart">
                <tbody class="center">
                    <tr>
                        <th class="w-30">총 제품 금액</th>
                        <th></th>
                        <th class="w-20">기본 배송비</th>
                        <th></th>
                        <th class="w-35">예상 결제 금액</th>
                    </tr>
                    <tr>
                        <td><h2 class="product-price">60,000</h2></td><!-- 바꿔야함 -->
                        <td><h2 class="plus c-b80">+</h2></td>
                        <td><h2 class="delevery-price">3,000</h2></td><!-- 바꿔야함 -->
                        <td><h2 class="equal c-b80">=</h2></td>
                        <td><h2 class="total-price">63,000</h2></td><!-- 바꿔야함 -->
                    </tr>
                </tbody>
            </table>
        </div>
<!-- ----------------------------------------- 계산 ---------------------------------------- -->

        <div class="row">
            <div class="row">
                <a class="form-btn medium neutral w-100 selected-btn" href="#">선택상품 결제하기</a>
            </div>
            <div class="row">
                <a class="form-btn medium positive w-100 all-btn" href="#">전체상품 결제하기</a>
            </div>
        </div>

    </div>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>