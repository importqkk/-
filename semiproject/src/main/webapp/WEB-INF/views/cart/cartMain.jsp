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
        // 아무 상품도 선택하지 않고 선택상품 결제 버튼 누르면 경고창 뜨게 하기
        $(".qty-selector").on("input", function() {
        	var quantity = $(this).val();
        	if(quantity > 10) {
        		alert ("최소 1개, 최대 10개까지 구매할 수 있습니다.");
        		$(".order-btn").click(function() {
        			alert ("상품을 1개 이상, 10개 이하로 담아주세요.");
        			return false;
        		});
        	}
        })
        
        $(".qty-selector").on("input", function() {
        	// 수량
        	var productCount = $(this).val();
        	// 상품번호
        	var productNo = $(this).parent().prev().prev().find(".productNo").text();
        	// 상품 가격
        	var productPrice = $(this).parent().prev().find(".productPrice").text();
        	// 수량선택창
        	var qtySelector = $(this);
        	// 장바구니 하나의 상품의 개당 가격 * 개수
            var productValue = productCount * productPrice;
        	$.ajax({
        		url:"/rest/cart/",
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
        })
        
    });
</script>

    <div class="container-1000 mt-40">

        <div class="row-large flex">
            <h1 class="me-15">장바구니</h1>
            <h1 class="c-p100">${cartCnt}</h1> <%-- 상품 총 수량(상품별 개수X, 상품 종류 개수O) --%>
        </div>
<!-- ------------------------------------ 반복문 돌릴 부분 start ------------------------------------ -->
        <c:forEach var="cartProductInfoDto" items="${itemInfo}">
	        <div class="row-large flex cart-item">
	            <div class="flex me-15">
  	            	<c:choose>
	            		<c:when test="${cartProductInfoDto.imgNo != 0}">
	            			<a class="link" href="/product/detail?productNo=${cartProductInfoDto.productNo}">
		            			<img class="product-img" alt="상품 대표 이미지" src="/img/download?imgNo=${cartProductInfoDto.imgNo}" width="130" height="130">
	 	            		</a>
 	            		</c:when>
	            		<c:otherwise>
	            			<a class="link" href="/product/detail?productNo=${cartProductInfoDto.productNo}">
	            				<img class="product-img" alt="상품 대표 이미지" src="/static/image/productDummy.png" width="130" height="130">
	            			</a>
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            <div class="w-100">
	                <div class="row-medium flex">
	                	<span hidden class="productNo">${cartProductInfoDto.productNo}</span> <%-- 상품번호(숨김) --%>
	                    <a class="link" href="/product/detail?productNo=${cartProductInfoDto.productNo}">
	                    	<h4 class="me-5 c-b80" style="display: inline;">[${cartProductInfoDto.productBrand}]</h4>	<%-- 브랜드명 --%>
	                    	<span class="c-b80">${cartProductInfoDto.productName}</span>	<%-- 상품명 --%>
	                    </a>
	                </div>
	                <div class="row">
	                    <h4>
	                    	<span class="productPrice"><fmt:formatNumber value="${cartProductInfoDto.productPrice}" pattern="#,##0"></fmt:formatNumber></span> <%-- 해당상품가격 --%>
	                    	<!-- <span class="productPrice">${cartProductInfoDto.productPrice}</span> <%-- 해당상품가격 --%> -->
							원
	                    </h4>
	                </div>
	                <!------------ 수량조절 ------------>
	                <div>
	                    <select class="w-10 qty-selector">
	                    	<c:choose>
	                    		<c:when test="${cartProductInfoDto.productCount == '1'}">
			                        <option selected>1</option>
			                        <option>2</option>
			                        <option>3</option>
			                        <option>4</option>
			                        <option>5</option>
			                        <option>6</option>
			                        <option>7</option>
			                        <option>8</option>
			                        <option>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '2'}">
			                        <option>1</option>
			                        <option selected>2</option>
			                        <option>3</option>
			                        <option>4</option>
			                        <option>5</option>
			                        <option>6</option>
			                        <option>7</option>
			                        <option>8</option>
			                        <option>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '3'}">
			                        <option>1</option>
			                        <option>2</option>
			                        <option selected>3</option>
			                        <option>4</option>
			                        <option>5</option>
			                        <option>6</option>
			                        <option>7</option>
			                        <option>8</option>
			                        <option>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '4'}">
			                        <option>1</option>
			                        <option>2</option>
			                        <option>3</option>
			                        <option selected>4</option>
			                        <option>5</option>
			                        <option>6</option>
			                        <option>7</option>
			                        <option>8</option>
			                        <option>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '5'}">
			                        <option>1</option>
			                        <option>2</option>
			                        <option>3</option>
			                        <option>4</option>
			                        <option selected>5</option>
			                        <option>6</option>
			                        <option>7</option>
			                        <option>8</option>
			                        <option>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '6'}">
			                        <option>1</option>
			                        <option>2</option>
			                        <option>3</option>
			                        <option>4</option>
			                        <option>5</option>
			                        <option selected>6</option>
			                        <option>7</option>
			                        <option>8</option>
			                        <option>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '7'}">
			                        <option>1</option>
			                        <option>2</option>
			                        <option>3</option>
			                        <option>4</option>
			                        <option>5</option>
			                        <option>6</option>
			                        <option selected>7</option>
			                        <option>8</option>
			                        <option>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '8'}">
			                        <option>1</option>
			                        <option>2</option>
			                        <option>3</option>
			                        <option>4</option>
			                        <option>5</option>
			                        <option>6</option>
			                        <option>7</option>
			                        <option selected>8</option>
			                        <option>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '9'}">
			                        <option>1</option>
			                        <option>2</option>
			                        <option>3</option>
			                        <option>4</option>
			                        <option>5</option>
			                        <option>6</option>
			                        <option>7</option>
			                        <option>8</option>
			                        <option selected>9</option>
			                        <option>10</option>
			                    </c:when>
			                    <c:when test="${cartProductInfoDto.productCount == '10'}">
			                    	<option>1</option>
			                        <option>2</option>
			                        <option>3</option>
			                        <option>4</option>
			                        <option>5</option>
			                        <option>6</option>
			                        <option>7</option>
			                        <option>8</option>
			                        <option>9</option>
			                        <option selected>10</option>
			                    </c:when>
		                    </c:choose>
	                    </select>
	                </div>
	                <c:set var="total" value="${total + cartProductInfoDto.productPrice * cartProductInfoDto.productCount}"></c:set>
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
		<c:if test="${isEmpty == 0}">
			<div class="center row-large">
				<h3>장바구니에 담긴 상품이 없어요.</h3>
			</div>
			<div class="row-large">
	            <a class="form-btn medium positive w-100" href="/">쇼핑하러 가기</a>
	        </div>
		</c:if>
		<c:if test="${isEmpty > 0}">
	        <div class="row-large">
	            <a class="form-btn medium neutral w-100" href="/">더 쇼핑하기</a>
	        </div>
        </c:if>
<!-- ----------------------------------------- 계산 ---------------------------------------- -->
		<c:if test="${isEmpty > 0}">
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
	                        <td>
	                        	<h2>
	                        		<span class="total-product-price">
	                        			<fmt:formatNumber pattern="#,##0" value="${total}"></fmt:formatNumber>
	                        		</span>
	                        	</h2>
	                        </td>
	                        <td>
	                        	<h2 class="plus c-b80">+</h2>
	                        </td>
	                        <td>
	                        	<h2 class="delevery-price">3,000</h2>
	                        </td>
	                        <td>
	                        	<h2 class="equals c-b80">=</h2>
	                        </td>
	                        <td>
	                        	<h2 class="final-price">
	                        		<span><fmt:formatNumber pattern="#,##0" value="${total+3000}"></fmt:formatNumber></span>
	                        	</h2>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
<!-- ----------------------------------------- 계산 ---------------------------------------- -->
	        <div class="row">
	            <div class="row">
	                <a class="form-btn medium positive w-100 order-btn" href="#">주문하기</a>
	            </div>
	        </div>
		</c:if>
    </div>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
