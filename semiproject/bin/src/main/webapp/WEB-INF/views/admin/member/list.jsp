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
                    <th class="w-10">등급</th>
                    <th>가입일</th>
                    <th class="w-20">관리</th>
                </tr>
            </thead>
            <tbody class="center">
               <c:forEach var="memberDto" items="${list}">
            <tr>
               <td>${memberDto.memberId}</td>
               <td>${memberDto.memberNick}</td>
               <td>${memberDto.memberPhone}</td>
               <td>${memberDto.memberRole}</td>
               <td>${memberDto.memberJoin}</td>
               <td>
                  <a class="btn-border" href="${pageContext.request.contextPath}/detail?memberId=${memberDto.memberId}">상세</a>
                  <a class="btn-border" href="${pageContext.request.contextPath}/edit?memberId=${memberDto.memberId}">변경</a>
                  <a class="btn-border" href="${pageContext.request.contextPath}/delete?memberId=${memberDto.memberId}&page=${page}" onclick="return confirm('정말 탈퇴시키겠습니까?')">탈퇴</a>
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
    
    <!-- 검색창 -->
       <div class="row center">
      <form action="${pageContext.request.contextPath}/list" method="get">
        <div class="flex">
       <c:choose>
          <c:when test="${vo.column == 'member_id'}">
             <select name="column" class="form-input small me-5 qty-selector">
                  <option value="member_id">아이디</option>
                   <option value="member_nick">닉네임</option>
                   <option value="member_phone" selected>전화번호</option>
               </select>
            </c:when>
            <c:when test="${vo.column == 'member_nick'}">
               <select name="column" class="form-input small me-5 qty-selector">
                  <option value="member_id">아이디</option>
                   <option value="member_nick" selected>닉네임</option>
                   <option value="member_phone">전화번호</option>
               </select>
            </c:when>
            <c:otherwise>
               <select name="column" class="form-input small me-5 qty-selector">
                  <option value="member_id" selected>아이디</option>
                   <option value="member_nick">닉네임</option>
                   <option value="member_phone">전화번호</option>
               </select>
            </c:otherwise>
        </c:choose>
      <input type="text" name="keyword" class="form-input small w-35 me-5" placeholder="검색어를 입력하세요." value="${vo.keyword}" required>
         <button  type="submit" class="form-btn small positive">검색</button>
      </form>
   </div>
<div>
<c:choose>
<c:when test="${list.isEmpty()}">
   <h3 class="mt-50 mb-50 center c-p100">검색 결과가 없습니다.</h3>
</c:when>
<c:otherwise>
            </c:otherwise>
   </c:choose>
   </div>
   </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>




