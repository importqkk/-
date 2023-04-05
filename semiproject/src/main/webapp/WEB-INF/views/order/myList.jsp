<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="count" value="0" />
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<head>

<meta charset="UTF-8">
<title>목록</title>
<style>
	thead th{
	  padding-right: 20px; /* 적절한 간격으로 변경 가능 */
	}
	table {
		  margin: 0 auto;
		  text-align: center;
		   border-collapse: separate;
  			border-spacing: 0 15px; /* 간격 조절 */
		}
		
</style>
	<script type="text/javascript">
	$(function() {

	 // 옵션1 선택 시 필터링
	    $('.option1').on('click', function() {
	    	$(".empty").hide();
	      $('.paymentShow').show();
	      $('.prepareShow, .deliveryShow, .completeShow').hide();


	    });

	    // 옵션2 선택 시 필터링
	    $('.option2').on('click', function() {
	    	$(".empty").hide();
	      $('.prepareShow').show();
	      $('.paymentShow, .deliveryShow, .completeShow').hide();
	      

	    });

	    // 옵션3 선택 시 필터링
	    $('.option3').on('click', function() {
	    	$(".empty").hide();
	      $('.deliveryShow').show();
	      $('.paymentShow, .prepareShow, .completeShow').hide();
	    
	    });

	    // 옵션4 선택 시 필터링
	    $('.option4').on('click', function() {
	      $(".empty").hide();
	      $('.completeShow').show();
	      $('.paymentShow, .prepareShow, .deliveryShow').hide();
	      
	    });
	});
	</script>

</head>
<body>
		<div class="container-1000"> 
			<div>
		        <div><h1>내 주문 내역 조회</h1><h4>(최대 표시가능한 주문목록은 10개입니다.)</h4></div>
		    </div>
			
		
		    <table>
<hr style="height: 1px; background-color: black; margin: 1;">
				    <thead>
				        <tr>
				          <th class="option1">입금/결제
	      			      <th class="option2">배송준비중/픽업준비중</th>
	         			  <th class="option3">배송중/픽업대기</th>
	        			  <th class="option4">배송완료/픽업완료</th>
				        </tr>
				     </thead>
	<thead>
  <tr>
    <th colspan="5">
      <hr style="height: 1px; background-color: black; margin: 1;">
    </th>
  </tr>
</thead>
				        <thead>
				          <tr>
				            <th>상품정보</th>
				            <th>주문일자</th>
				            <th>주문번호</th>
				            <th>주문금액</th>
				            <th>주문상태</th>
				          </tr>

				        </thead>

			        <tbody>
			       
    <!-- --------------------------------반복문---------------------------------------------------------------------  -->
			
				<c:forEach var="payment" items="${payment}">
					<tr class="paymentShow">
				<c:choose>
            		<c:when test="${payment.imgNo != 0}">
            			<td><img src="/img/download?imgNo=${payment.imgNo}" class="product-img me-20" width="130" height="130"></td>
            		</c:when>
            		<c:otherwise>
            			<td><img class="product-img me-20" alt="상품 대표 이미지" src="/static/image/productDummy.png" width="130" height="130"></td>
            		</c:otherwise>
            	</c:choose>
						<td>${payment.orderDate}</td>
						<td>${payment.orderNo}</td>
						<td>${payment.productPrice}</td>
						<td>${payment.orderStat}</td>
					</tr>

				</c:forEach>
			
				<c:forEach var="prepare" items="${prepare}">
					<tr class="prepareShow" style="display:none">
						<c:choose>
            		<c:when test="${prepare.imgNo != 0}">
            			<td><img src="/img/download?imgNo=${prepare.imgNo}" class="product-img me-20" width="130" height="130"></td>
            		</c:when>
            		<c:otherwise>
            			<td><img class="product-img me-20" alt="상품 대표 이미지" src="/static/image/productDummy.png" width="130" height="130"></td>
            		</c:otherwise>
            	</c:choose>
						<td>${prepare.orderDate}</td>
						<td>${prepare.orderNo}</td>
						<td>${prepare.productPrice}</td>
						<td>${prepare.orderStat}</td>
					</tr>

				</c:forEach>
			
				<c:forEach var="delivery" items="${delivery}">
					<tr class="deliveryShow" style="display:none">
						<c:choose>
            		<c:when test="${delivery.imgNo != 0}">
            			<td><img src="/img/download?imgNo=${delivery.imgNo}" class="product-img me-20" width="130" height="130"></td>
            		</c:when>
            		<c:otherwise>
            			<td><img class="product-img me-20" alt="상품 대표 이미지" src="/static/image/productDummy.png" width="130" height="130"></td>
            		</c:otherwise>
            	</c:choose>
						<td>${delivery.orderDate}</td>
						<td>${delivery.orderNo}</td>
						<td>${delivery.productPrice}</td>
						<td>${delivery.orderStat}</td>
					</tr>

				</c:forEach>
			
				<c:forEach var="complete" items="${complete}">
					<tr class="completeShow" style="display:none">
						<c:choose>
            		<c:when test="${complete.imgNo != 0}">
            			<td><img src="/img/download?imgNo=${complete.imgNo}" class="product-img me-20" width="130" height="130"></td>
            		</c:when>
            		<c:otherwise>
            			<td><img class="product-img me-20" alt="상품 대표 이미지" src="/static/image/productDummy.png" width="130" height="130"></td>
            		</c:otherwise>
            	</c:choose>
						<td>${complete.orderDate}</td>
						<td>${complete.orderNo}</td>
						<td>${complete.productPrice}</td>
						<td>${complete.orderStat}</td>
					</tr>

				</c:forEach>
			</tbody>
			  </table>
			  <div class="empty" style="display:none">
				<h2>주문하신 내역이 없습니다...!</h2>
			</div>
      	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>