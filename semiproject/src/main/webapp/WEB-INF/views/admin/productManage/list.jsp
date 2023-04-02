<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.register-btn {
		vertical-align: top;
		height: 3.1em;
		width: 7.2em;
	}
	.qty-selector {
		width: 100px;
		text-align: left;
	}
</style>
<script type="text/javascript">
	$(function() {
		// 체크박스 처리
		$(".check-all").change(function() {
            var isChecked = $(this).prop("checked");
            $(".check-all, .check-unit").prop("checked", isChecked);
        })
        $(".check-unit").change(function() {
            var checkboxCount = $(".check-unit").length;
            var checkedCount = $(".check-unit:checked").length;
            var isAllChecked = checkboxCount == checkedCount;
            $(".check-all").prop("checked", isAllChecked);
        })
        // 선택 상품 삭제버튼 경고창
        $(".delete-btn").click(function() {
        	var checkedCount = $(".check-unit:checked").length;
        	if(checkedCount == 0) {
        		alert("삭제할 상품을 선택해주세요.");
        		return false;
        	}
        	var result = confirm("상품을 삭제하시겠습니까?");
			if(!result) return false;
        })
		// 개별 상품 삭제버튼 경고창
		$(".single-delete-btn").click(function() {
			var result = confirm("상품을 삭제하시겠습니까?");
			if(!result) return false;
		})
	})
</script>

<div class="container-1000">
    <div class="row pb-20">
        <a class="link" href="/admin/productManage/list">
        	<h1>상품 목록</h1>
        </a>
    </div>
    <div class="row flex w-100">
    	<!-- 검색창 start -->
        <form action="list" method="get" class="row w-100 search-form">
	        <div class="flex">
	        	<c:choose>
	        		<c:when test="${vo.column == 'product_brand'}">
	        			<select name="column" class="form-input small me-5 qty-selector">
			            	<option value="product_name">상품명</option>
			                <option value="product_no">품번</option>
			                <option value="product_brand" selected>브랜드</option>
			            </select>
		            </c:when>
		            <c:when test="${vo.column == 'product_no'}">
			            <select name="column" class="form-input small me-5 qty-selector">
			            	<option value="product_name">상품명</option>
			                <option value="product_no" selected>품번</option>
			                <option value="product_brand">브랜드</option>
			            </select>
		            </c:when>
		            <c:otherwise>
			            <select name="column" class="form-input small me-5 qty-selector">
			            	<option value="product_name" selected>상품명</option>
			                <option value="product_no">품번</option>
			                <option value="product_brand">브랜드</option>
			            </select>
		            </c:otherwise>
		        </c:choose>
	            <input type="text" name="keyword" class="form-input small w-35 me-5" placeholder="검색어를 입력하세요." value="${vo.keyword}" required>
	            <button type="submit" class="form-btn small positive">검색</button>
	        </div>
	    </form>
        <!-- 검색창 end -->
        <form action="deleteAll" method="post" class="delete-form w-30">
	        <div class="row right">
            	<button type="submit" class="form-btn small neutral delete-btn">상품삭제</button>
	            <a class="form-btn small positive register-btn" href="/admin/productManage/register">상품등록</a>
	        </div>
	    </div>
	    <div class="row">
	    	<c:choose>
	        	<c:when test="${list.isEmpty()}">
	        		<h3 class="mt-50 mb-50 center c-p100">검색 결과가 없습니다.</h3>
	        	</c:when>
	        	<c:otherwise>
	        		<table class="table table-qna mb-30">
			            <thead>
			                <tr>
			                    <th class="w-5">
			                        <input type="checkbox" class="check-all">
			                    </th>
			                    <th class="w-5">품번</th>
			                    <th class="w-30">상품명</th>
			                    <!-- <th>카테고리</th> -->
			                    <th>가격</th>
			                    <th>재고</th>
			                    <th>판매량</th>
			                    <th>출시일</th>
			                    <th class="w-10">관리</th>
			                </tr>
			            </thead>
			            <tbody class="center">
			            	<c:forEach var="productDto" items="${list}">
				                <tr>
				                    <td>
				                        <input type="checkbox" class="check-unit" name="productNo" value="${productDto.productNo}">
				                    </td>
				                    <td title="${productDto.productNo}">${productDto.productNo}</td>
				                    <td style="text-align: left">
				                        <a class="link" href="/product/detail?productNo=${productDto.productNo}" title="[${productDto.productBrand}] ${productDto.productName}">
				                            [${productDto.productBrand}] ${productDto.productName}
				                        </a>
				                    </td>
				                    <!-- <td>${tagTitle}</td> -->
				                    <td class="right" title="${productDto.productPrice}">
				                    	<fmt:formatNumber pattern="#,##0" value="${productDto.productPrice}"></fmt:formatNumber>
				                    </td>
				                    <td class="right" title="${productDto.productStock}">
				                    	<fmt:formatNumber pattern="#,##0" value="${productDto.productStock}"></fmt:formatNumber>
				                    </td>
				                    <td class="right" title="${productDto.productSellCount}">
				                    	<fmt:formatNumber pattern="#,##0" value="${productDto.productSellCount}"></fmt:formatNumber>
				                    </td>
				                    <td title="${productDto.productJoin}">${productDto.productJoin}</td>
				                    <td>
				                        <a class="link" href="/admin/productManage/edit?productNo=${productDto.productNo}">수정 </a>
				                        <span>| </span>
				                        <a class="link single-delete-btn" href="/admin/productManage/delete?productNo=${productDto.productNo}">삭제</a>
				                    </td>
				                </tr>
				            </c:forEach>
			            </tbody>
			        </table>
	        	</c:otherwise>
	        </c:choose>
	    </div>
	    </form>
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
