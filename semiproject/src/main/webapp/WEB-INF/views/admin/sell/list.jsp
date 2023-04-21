<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.qty-selector {
		width: 130px;
		text-align: left;
	}
</style>
<script type="text/javascript">

</script>

<div class="container-1000">
    <div class="row pb-20">
        <a class="link" href="${pageContext.request.contextPath}/admin/sell/list">
        	<h1>판매 내역</h1>
        </a>
    </div>
    <div class="row flex w-100">
    	<!-- 검색창 start -->
        <form action="${pageContext.request.contextPath}/list" method="get" class="row w-100 search-form">
	        <div class="flex">
	        	<c:choose>
	        		<c:when test="${vo.column == 'product_brand'}">
	        			<select name="column" class="form-input small me-5 qty-selector">
			            	<option value="product_name">상품명</option>
			                <option value="product_brand" selected>브랜드</option>
			                <option value="member_id">구매자아이디</option>
			                <option value="order_stat">상태</option>
			            </select>
		            </c:when>
		            <c:when test="${vo.column == 'member_id'}">
			            <select name="column" class="form-input small me-5 qty-selector">
			            	<option value="product_name">상품명</option>
			                <option value="product_brand">브랜드</option>
			                <option value="member_id" selected>구매자아이디</option>
			                <option value="order_stat">상태</option>
			            </select>
		            </c:when>
		            <c:when test="${vo.column == 'order_stat'}">
			            <select name="column" class="form-input small me-5 qty-selector">
			            	<option value="product_name">상품명</option>
			                <option value="product_brand">브랜드</option>
			                <option value="member_id">구매자아이디</option>
			                <option value="order_stat" selected>상태</option>
			            </select>
		            </c:when>
		            <c:otherwise>
			            <select name="column" class="form-input small me-5 qty-selector">
			            	<option value="product_name" selected>상품명</option>
			                <option value="product_brand">브랜드</option>
			                <option value="member_id">구매자아이디</option>
			                <option value="order_stat">상태</option>
			            </select>
		            </c:otherwise>
		        </c:choose>
	            <input type="text" name="keyword" class="form-input small w-35 me-5" placeholder="검색어를 입력하세요." value="${vo.keyword}" required>
	            <button type="submit" class="form-btn small positive">검색</button>
	        </div>
	    </form>
    </div>
    <!-- 검색창 end -->
    <div class="row">
    	<c:choose>
        	<c:when test="${list.isEmpty()}">
        		<h3 class="mt-50 mb-50 center c-p100">검색 결과가 없습니다.</h3>
        	</c:when>
        	<c:otherwise>
        		<table class="table table-qna mb-30">
		            <thead>
		                <tr>
		                    <th>주문번호</th>
		                    <th>주문일</th>
		                    <th class="w-40">상품명</th>
		                    <th>구매수량</th>
		                    <th>구매자아이디</th>
		                    <th>금액</th>
		                </tr>
		            </thead>
		            <tbody class="center">
		            	<c:forEach var="sellListDto" items="${list}">
			                <tr>
			                    <td title="${sellListDto.orderNo}">${sellListDto.orderNo}</td>
			                    <td title="${sellListDto.orderDate}">
			                        ${sellListDto.orderDate}
			                    </td>
			                    <td class="left" title="[${sellListDto.productBrand}] ${sellListDto.productName}">
			                    	<a class="link" href="${pageContext.request.contextPath}/product/detail?productNo=${sellListDto.productNo}">
			                    		[${sellListDto.productBrand}] ${sellListDto.productName}
			                    	</a>
			                    </td>
			                    <td class="right" title="${sellListDto.productCount}">
			                    	<fmt:formatNumber pattern="#,##0" value="${sellListDto.productCount}"></fmt:formatNumber>
			                    </td>
			                    <td title="${sellListDto.memberId}">
			                    	<a class="link" href="../member/detail?memberId=${sellListDto.memberId}">
			                    		${sellListDto.memberId}
			                    	</a>
			                    </td>
			                    <td class="right" title="${sellListDto.productPrice}">
			                    	<fmt:formatNumber pattern="#,##0" value="${sellListDto.productPrice * sellListDto.productCount}"></fmt:formatNumber>
			                    </td>
			                </tr>
			            </c:forEach>
		            </tbody>
		        </table>
        	</c:otherwise>
        </c:choose>
    </div>
    <div class="row center">
        <!-- 페이지 네비 (vo에 있는 데이터를 기반으로 구현) -->
		<div class="row pagination mb-40">
			<!-- << (첫페이지로) -->
			<c:choose>
				<c:when test="${!vo.first}">
					<a href="${pageContext.request.contextPath}/list?page=1${vo.parameter}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="disabled">&laquo;</a>
				</c:otherwise>
			</c:choose>
			<!-- < (이전페이지로) -->
			<c:choose>
				<c:when test="${vo.prev}">
					<a href="${pageContext.request.contextPath}/list?page=${vo.prevPage}${vo.parameter}">&lt;</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="disabled">&lt;</a>
				</c:otherwise>
			</c:choose>
			<!-- 숫자(begin ~ end) -->
			<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
				<c:choose>
					<c:when test="${vo.page == i}">
						<a href="#" class="on">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/list?page=${i}${vo.parameter}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- >  (다음페이지로) -->
			<c:choose>
				<c:when test="${vo.next}">
					<a href="${pageContext.request.contextPath}/list?page=${vo.nextPage}${vo.parameter}">&gt;</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="disabled">&gt;</a>
				</c:otherwise>
			</c:choose>
			<!-- >> (마지막 페이지로) -->
			<c:choose>
				<c:when test="${!vo.last}">
					<a href="${pageContext.request.contextPath}/list?&page=${vo.totalPage}${vo.parameter}">&raquo;</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="disabled">&raquo;</a>
				</c:otherwise>
			</c:choose>
		</div>
    </div>
</div>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
