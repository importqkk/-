<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<div class="container-750">
    <div class="row center pb-20">
        <h1>회원 목록</h1>
    </div>
    <div class="row">
        <table class="table table-border">
            <thead>
                <tr>
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>전화번호</th>
                    <th>등급</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody class="center">
            	<c:forEach var="memberDto" items="${list}">
				<tr>
					<td>${memberDto.memberId}</td>
					<td>${memberDto.memberNick}</td>
					<td>${memberDto.memberPhone}</td>
					<td>${memberDto.memberRole}</td>
					<td>
						<a class="btn-border" href="detail?memberId=${memberDto.memberId}">상세</a>
						<a class="btn-border" href="edit?memberId=${memberDto.memberId}">변경</a>
						<a class="btn-border" href="delete?memberId=${memberDto.memberId}&page=${page}" onclick="return confirm('정말 탈퇴시키겠습니까?')">탈퇴</a>
					</td>
				</tr>	
				</c:forEach>
            </tbody>
        </table>
    </div>	

    <div class="row center pt-20 pb-20">
        <!-- 페이지 네비 (vo에 있는 데이터를 기반으로 구현) -->
		<div class="row pagination">
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
    
    	<div class="row center">
		<!-- 검색창 -->
		<form action="list" method="get">
			<input type="hidden" name="column" value="member_id">
			<input class="form-input small" type="search" name="keyword" placeholder="검색할 아이디" value="${keyword}">
			<button  type="submit" class="form-btn small positive">검색</button>
		</form>
	</div>
<div>
	<c:choose>
		<c:when test="${list.isEmpty()}">
			<h2>데이터가 존재하지 않습니다</h2>
		</c:when>
		<c:otherwise>
				</c:otherwise>
	</c:choose>
	</div>
    
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>






