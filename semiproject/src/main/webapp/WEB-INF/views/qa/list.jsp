<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<c:if test="${sessionScope.memberRole == '관리자'}">
<script type="text/javascript">
	function checkAll(){
		var allCheckbox = document.querySelector(".check-all");
		var checkboxes = document.querySelectorAll("input[type=checkbox][name=qaNo]");
		for(var i=0; i < checkboxes.length; i++) {
			checkboxes[i].checked = allCheckbox.checked;
		}
	}
	function checkUnit(){
		var allCheckbox = document.querySelector(".check-all");
		var checkboxes = document.querySelectorAll("input[type=checkbox][name=qaNo]");
		var count = 0;
		for(var i=0; i < checkboxes.length; i++) {
			if(checkboxes[i].checked) {
				count++;
			}
		}
		allCheckbox.checked = (checkboxes.length == count);
	}
	function formCheck() {
		var checkboxes = document.querySelectorAll(
							"input[type=checkbox][name=qaNo]:checked");	
		if(checkboxes.length == 0) return false;
		
		return confirm("정말 삭제하시겠습니까?");
	}
</script>
</c:if>

<div class="container-1000">
    <div class="row left">
        <h1>Q&A 게시판</h1>
    </div>
    
    <c:if test="${sessionScope.memberRole == '관리자'}">
    <form action="deleteAll" method="post" onsubmit="return formCheck();">
    </c:if>
    <div class="row right">
    	<c:if test="${sessionScope.memberRole == '관리자'}">
    	<button type="submit" class="form-btn negative">삭제</button>
    	</c:if>
        <a href="write" class="form-btn neutral">글쓰기</a>
    </div>
    <div class="row">
        <table class="table table-border">
            <thead>
            
                <tr>
                	<c:if test="${sessionScope.memberRole == '관리자'}">
                	<!-- 전체 선택 체크박스를 배치 -->
                	<th>
                		<input type="checkbox" class="check-all"	
                										onchange="checkAll();">
                	</th>
                	</c:if>
                    <th class="w-10">번호</th>
                    <th class="w-10">카테고리</th>
                    <th class="w-40">제목</th>
                    <th class="w-15">작성자</th>
                    <th class="w-15">작성일</th>
                    <th class="w-10">조회수</th>
                </tr>
            </thead>
            <hr>
            <tbody class="center">
            	<!-- 공지사항을 출력 -->
				<c:forEach var="qaDto" items="${noticeList}">
				<tr style="background-color:#eee">
					<c:if test="${sessionScope.memberRole == '관리자'}">
					<td></td>
					</c:if>
					<td class="center">${qaDto.qaNo}</td>
					<td class="center">${qaDto.qaHead}</td>
					<td class="left">
					<td>
					<a href="detail?qaNo=${qaDto.qaNo}" class="link">
							${qaDto.qaTitle}
						</a>
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
					<c:if test="${sessionScope.memberRole == '관리자'}">
					<!-- 개별 선택 체크박스를 배치 -->
					<td>
						<input type="checkbox" name="qaNo" value="${qaDto.qaNo}"
								onchange="checkUnit();">
					</td>
					</c:if>
					
					<td>${qaDto.qaNo}</td>
					<td class="center">
						${qaDto.qaHead}
						<!-- qaDepth만큼 띄어쓰기를 실시 -->
						<c:forEach var="i" begin="1" end="${qaDto.qaDepth}">
							&nbsp;&nbsp;
						</c:forEach>
						<!-- qaDepth가 1 이상일 경우만 답글 표식을 추가 -->
						<c:if test="${qaDto.qaDepth > 0}">
							→
						</c:if>
					</td>
					
					<td>
					<a href="detail?qaNo=${qaDto.qaNo}" class="link">
							${qaDto.qaTitle}
						</a>
					</td>
					<td class="left">${qaDto.memberId}</td>
					
					<%-- DTO에 만든 가상의 Getter 메소드를 불러 처리 --%>
					<td>${qaDto.qaDate}</td>
					<td>${qaDto.qaRead}</td>
				</tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row right">
    	<c:if test="${sessionScope.memberRole == '관리자'}">
    	<button type="submit" class="form-btn negative">삭제</button>
    	</c:if>
        <a href="write" class="form-btn neutral">글쓰기</a>
    </div>
    
    <c:if test="${sessionScope.memberRole == '관리자'}">
    </form>
    </c:if>
    
    <div class="row pagination center">
    
    	<!-- 처음 -->
    	<c:choose>
			<c:when test="${vo.first}">
				<a class="disabled">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a href="list?${vo.parameter}&page=1">&laquo;</a>
			</c:otherwise>
		</c:choose>
		
		<!-- 이전 -->
		<c:choose>
			<c:when test="${vo.prev}">
				<a href="list?${vo.parameter}&page=${vo.prevPage}">&lt;</a>
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
					<a href="list?${vo.parameter}&page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
	
		<!-- 다음 -->
		<c:choose>
			<c:when test="${vo.next}">
				<a class="disabled">&gt;</a>
			</c:when>
			<c:otherwise>
				<a href="list?${vo.parameter}&page=${vo.nextPage}">&gt;</a>
			</c:otherwise>
		</c:choose>
		
		<!-- 마지막 -->
		<c:choose>
			<c:when test="${vo.last}">
				<a class="disabled">&raquo;</a>
			</c:when>
			<c:otherwise>
				<a href="list?${vo.parameter}&page=${vo.totalPage}">&raquo;</a>
			</c:otherwise>
		</c:choose>
    </div>
    
    <!-- 검색창 -->
    <div class="row center">
		<form action="list" method="get">
		
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


