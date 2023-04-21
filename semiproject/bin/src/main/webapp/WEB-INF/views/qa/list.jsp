<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container-1000">
    <div class="row left pt-20 pb-20">
    	<h1><a href="${pageContext.request.contextPath}/qa/list" class="link">Q&A게시판</a></h1>
    </div>
    <div class="row center pt-40 pb-40">
    	<h4>욕설, 비방 글, 상업적인 게시글은 통보없이 삭제될 수 있고 이용에 제한이 생길 수 있습니다. </h4>
    </div>
    
       <c:if test="${sessionScope.memberId != null || sessionScope.memberRole == '관리자'}">
    <div class="row right">
        <a href="${pageContext.request.contextPath}/write" class="form-btn neutral pb-30">글쓰기</a>
    </div>
    </c:if>
    
    <div class="row">
        <table class="table table-qna">
            <thead>
            
                <tr>
                    <th class="w-10">번호</th>
                    <th class="w-10">카테고리</th>
                    <th class="w-40">제목</th>
                    <th class="w-15">작성자</th>
                    <th class="w-15">작성일</th>
                    <th class="w-10">조회수</th>
                </tr>
            </thead>

            <tbody class="center">
            	<!-- 공지사항을 출력 -->
				<c:forEach var="qaDto" items="${noticeList}">
				<tr style="background-color:#e4e1ff">
					<c:if test="${sessionScope.memberRole == '관리자'}">
					<td></td>
					</c:if>
					<td class="center">${qaDto.qaNo}</td>
					<td class="center">${qaDto.qaHead}</td>
					<td>
	      				<a href="${pageContext.request.contextPath}/detail?qaNo=${qaDto.qaNo}" class="link">${qaDto.qaTitle}</a>
					</td>
					<td class="left">${qaDto.memberId}</td>
					
					<%-- DTO에 만든 가상의 Getter 메소드를 불러 처리 --%>
					<td>${qaDto.qaDate}</td>
					<td>${qaDto.qaRead}</td>
				</tr>
				</c:forEach>
				
				<!-- 검색 또는 목록 결과를 출력 -->
				<c:forEach var="qaDto" items="${list}">
				<tr>
					<td class="center">${qaDto.qaNo}</td>
					<td class="center">
						${qaDto.qaHead}
					</td>
					
					<td class="left">
					  <c:choose>
					    <c:when test="${qaDto.qaSecret == 'Y' && sessionScope.memberRole != '관리자' && sessionScope.memberId != qaDto.memberId}">
					      <c:choose>
					        <c:when test="${qaDto.qaDepth == 1}">
					          <i class="fa-solid fa-lock" style="color: #776bff;"></i>
					          <span>ㄴRE : 비밀글 질문의 답글입니다.</span>
					        </c:when>
					        <c:otherwise>
					         <i class="fa-solid fa-lock" style="color: #776bff;"></i>
					          <span>
					          비밀글 처리 되었습니다.
					          </span>
					        </c:otherwise>
					      </c:choose>
					    </c:when>
					    <c:otherwise>
					      <a href="${pageContext.request.contextPath}/detail?qaNo=${qaDto.qaNo}" class="link">
					        <c:choose>
					          <c:when test="${qaDto.qaDepth == 1}">
					            <c:choose>
					              <c:when test="${qaDto.qaSecret == 'Y' && (sessionScope.memberRole == '관리자' || sessionScope.memberId == qaDto.memberId)}">
					                <i class="fa-solid fa-lock" style="color: #776bff;"></i>
					              </c:when>
					            </c:choose>
					            ㄴRE : ${qaDto.qaTitle}의 답변입니다.
					          </c:when>
					          <c:otherwise>
					            <c:choose>
					              <c:when test="${qaDto.qaSecret == 'Y' && (sessionScope.memberRole == '관리자' || sessionScope.memberId == qaDto.memberId)}">
					                <i class="fa-solid fa-lock" style="color: #776bff;"></i>
					              </c:when>
					            </c:choose>
					            ${qaDto.qaTitle}
					          </c:otherwise>
					        </c:choose>
					      </a>
					    </c:otherwise>
					  </c:choose>
					</td>
					<c:choose>
						<c:when test="${qaDto.qaDepth == 1}">
							<td class="center">관리자</td>
						</c:when>
						<c:otherwise>
							<td class="center">${qaDto.memberId}</td>
						</c:otherwise>
					</c:choose>

					<%-- DTO에 만든 가상의 Getter 메소드를 불러 처리 --%>
					<td>${qaDto.qaDate}</td>
					<td>${qaDto.qaRead}</td>
				</tr>
				

				</c:forEach>
            </tbody>
        </table>
    </div>
      <c:if test="${sessionScope.memberId != null || sessionScope.memberRole == '관리자'}">
    <div class="row right">
        <a href="${pageContext.request.contextPath}/write" class="form-btn neutral pt-30">글쓰기</a>
    </div>
    </c:if>
    
    
    <div class="row pagination center pt-90 pb-20">
    
    	<!-- 처음 -->
    	<c:choose>
			<c:when test="${vo.first}">
				<a class="disabled">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/list?${vo.parameter}&page=1">&laquo;</a>
			</c:otherwise>
		</c:choose>
		
		<!-- 이전 -->
		<c:choose>
			<c:when test="${vo.prev}">
				<a href="${pageContext.request.contextPath}/list?${vo.parameter}&page=${vo.prevPage}">&lt;</a>
			</c:when>
			<c:otherwise>
				<a class="disabled">&lt;</a>
			</c:otherwise>
		</c:choose>
		
        <!-- 숫자 -->
        <c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
			<c:choose>
				<c:when test="${vo.page == i}">
					<a class="on">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/list?${vo.parameter}&page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
	
		<!-- 다음 -->
		<c:choose>
			<c:when test="${vo.next}">
				<a href="${pageContext.request.contextPath}/list?${vo.parameter}&page=${vo.nextPage}">&gt;</a>
			</c:when>
			<c:otherwise>
				<a class="disabled">&gt;</a>
			</c:otherwise>
		</c:choose>
		
		<!-- 마지막 -->
		<c:choose>
			<c:when test="${vo.last}">
				<a class="disabled">&raquo;</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/list?${vo.parameter}&page=${vo.totalPage}">&raquo;</a>
			</c:otherwise>
		</c:choose>
    </div>
    
    <!-- 검색창 -->
    <div class="row center">
		<form action="${pageContext.request.contextPath}/list" method="get">
		
			<c:choose>
				<c:when test="${vo.column == 'qa_content'}">
					<select name="column" class="form-input">
						<option value="qa_title">제목</option>
						<option value="qa_content" selected>내용</option>
						<option value="member_id">작성자</option>
						<option value="qa_head">카테고리</option>
					</select>
				</c:when>
				<c:when test="${vo.column == 'member_id'}">
					<select name="column" class="form-input">
						<option value="qa_title">제목</option>
						<option value="qa_content">내용</option>
						<option value="member_id" selected>작성자</option>
						<option value="qa_head">카테고리</option>
					</select>
				</c:when>
				<c:when test="${vo.column == 'qa_head'}">
					<select name="column" class="form-input">
						<option value="qa_title">제목</option>
						<option value="qa_content">내용</option>
						<option value="member_id">작성자</option>
						<option value="qa_head" selected>카테고리</option>
					</select>
				</c:when>
				<c:otherwise>
					<select name="column" class="form-input">
						<option value="qa_title" selected>제목</option>
						<option value="qa_content">내용</option>
						<option value="member_id">작성자</option>
						<option value="qa_head">카테고리</option>
					</select>
				</c:otherwise>
			</c:choose>
			
			
			<input class="form-input" type="search" name="keyword" placeholder="검색어" required value="${vo.keyword}">
			
			<button type="submit" class="form-btn neutral">검색</button>
		</form>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


