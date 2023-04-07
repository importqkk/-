<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<!-- chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- 차트 비동기 스크립트 -->
<script src="${pageContext.request.contextPath}/static/js/product-category-stat.js"></script>

<style>

</style>
<script type="text/javascript">

</script>

<div class="w-100">
	<div class="row center pb-30">
		<h1>카테고리별 상품 통계</h1>
	</div>
	<div class="row">
		<h2>카테고리별 상품 개수</h2>
	</div>
	<div class="row pb-50">
		<canvas id="categoryCount"></canvas>
	</div>
	<div class="row">
		<h2>카테고리별 판매량</h2>
	</div>
	<div class="row pb-50">
		<canvas id="categorySellCount"></canvas>
	</div>
	<div class="row">
		<h2>카테고리별 가격</h2>
	</div>
	<div class="row">
		<canvas id="categoryPrice"></canvas>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>