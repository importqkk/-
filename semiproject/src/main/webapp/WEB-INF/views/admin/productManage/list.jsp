<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>

</style>

<div class="container-1000" test>
    <div class="row">
        <h1 class="mb-30">상품 목록</h1>
    </div>
    <div class="row flex">
        <div class="row w-70">
            <a class="form-btn small positive me-5" href="/register">상품등록</a>
            <a class="form-btn small neutral" href="/delete">상품삭제</a>
        </div>
        <!-- 검색창 start -->
        <div class="row w-100 flex">
        	<c:choose>
        		<c:when test="${vo.column == 'product_name'}">
		            <select name="column" class="form-input small me-5">
		            	<option value="product_name" selected>상품명</option>
		                <option value="product_no">품번</option>
		                <option value="product_brand">브랜드</option>
		            </select>
	            </c:when>
	            <c:when test="${vo.column == 'product_no'}">
		            <select name="column" class="form-input small me-5">
		            	<option value="product_name">상품명</option>
		                <option value="product_no" selected>품번</option>
		                <option value="product_brand">브랜드</option>
		            </select>
	            </c:when>
	            <c:otherwise>
		            <select name="column" class="form-input small me-5">
		            	<option value="product_name">상품명</option>
		                <option value="product_no">품번</option>
		                <option value="product_brand" selected>브랜드</option>
		            </select>
	            </c:otherwise>
	        </c:choose>
            <input type="text" name="keyword" class="form-input small w-80 me-5" placeholder="검색어를 입력하세요." value="${vo.keyword}" required>
            <button type="submit" class="form-btn small positive w-20">검색</button>
        </div>
        <!-- 검색창 end -->
    </div>
    <div class="row">
    	<c:choose>
        	<c:when test="${list.isEmpty()}">
        		<h3 class="mt-50 mb-50">검색 결과가 없습니다.</h3>
        	</c:when>
        	<c:otherwise>
        		<table class="table table-qna mb-30">
		            <thead>
		                <tr>
		                    <th>
		                        <input type="checkbox" class="all-check">
		                    </th>
		                    <th>품번</th>
		                    <th class="w-20">상품명</th>
		                    <th>브랜드</th>
		                    <th>가격</th>
		                    <th>재고</th>
		                    <th>판매량</th>
		                    <th class="w-15">입고일</th>
		                    <th class="w-10">관리</th>
		                </tr>
		            </thead>
		            <tbody class="center">
		            	<c:forEach var="productDto" items="${list}">
			                <tr>
			                    <td>
			                        <input type="checkbox" class="all-check">
			                    </td>
			                    <td>${productDto.productNo}</td>
			                    <td>
			                        <a class="link" href="#">
			                            ${productDto.productName}
			                        </a>
			                    </td>
			                    <td>필리</td>
			                    <td class="right">${productDto.productPrice}</td>
			                    <td class="right">${productDto.productStock}</td>
			                    <td class="right">${productDto.productSellCount}</td>
			                    <td>${productDto.productJoin}</td>
			                    <td>
			                        <a class="link" href="/edit">수정 </a>
			                        <span>| </span>
			                        <a class="link" href="/delete">삭제</a>
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
					<a href="list?page=1${vo.parameter}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="disabled">&laquo;</a>
				</c:otherwise>
			</c:choose>
			<!-- < (이전페이지로) -->
			<c:choose>
				<c:when test="${vo.prev}">
					<a href="list?page=${vo.prevPage}${vo.parameter}">&lt;</a>
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
						<a href="list?page=${i}${vo.parameter}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- >  (다음페이지로) -->
			<c:choose>
				<c:when test="${vo.next}">
					<a href="list?page=${vo.nextPage}${vo.parameter}">&gt;</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="disabled">&gt;</a>
				</c:otherwise>
			</c:choose>
			<!-- >> (마지막 페이지로) -->
			<c:choose>
				<c:when test="${!vo.last}">
					<a href="list?&page=${vo.totalPage}${vo.parameter}">&raquo;</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="disabled">&raquo;</a>
				</c:otherwise>
			</c:choose>
		</div>
    </div>
</div>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
