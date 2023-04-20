<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.upload-btn {
        vertical-align: top;
        height: 3.1em;
        width: 8.7em;
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
	    // 선택 이미지 삭제버튼 경고창
	    $(".delete-btn").click(function() {
	        var checkedCount = $(".check-unit:checked").length;
	        if(checkedCount == 0) {
	            alert("삭제할 이미지를 선택해주세요.");
	            return false;
	        }
	        var result = confirm("이미지를 삭제하시겠습니까?");
	        if(!result) return false;
	    })
	    // 개별 이미지 삭제버튼 경고창
	    $(".single-delete-btn").click(function() {
	        var result = confirm("이미지를 삭제하시겠습니까?");
	        if(!result) return false;
	    })
	})
</script>

<div class="container-1000">
        <div class="row pb-20">
            <h1>메인 이미지 리스트</h1>
        </div>
        <form action="${pageContext.request.contextPath}/mainImgDeleteAll" method="post" class="delete-form">
            <div class="row w-100">
                <div class="row right">
                    <button type="submit" class="form-btn small neutral delete-btn">이미지 삭제</button>
                    <a class="form-btn small positive upload-btn" href="${pageContext.request.contextPath}/admin/mainImg/upload">이미지 등록</a>
                </div>
            </div>
            <div class="row">
                <table class="table table-qna">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" class="check-all">
                            </th>
                            <th>번호</th>
                            <th class="w-30">제목</th>
                            <th class="w-20">파일명</th>
                            <th>파일 형식</th>
                            <th>용량</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody class="center">
                        <c:forEach var="mainImgConnectDto" items="${list}">
                            <tr>
                                <td>
                                    <input type="checkbox" class="check-unit" name="mainNo" value="${mainImgConnectDto.mainNo}">
                                </td>
                                <td>${mainImgConnectDto.mainNo}</td>
                                <td>${mainImgConnectDto.mainTitle}</td>
                                <td>${mainImgConnectDto.imgName}</td>
                                <td>${mainImgConnectDto.imgType}</td>
                                <td>
                                	<fmt:formatNumber pattern="#,##0" value="${mainImgConnectDto.imgSize/1024}"></fmt:formatNumber>kb
                                </td>
                                <td>
                                    <a class="link single-delete-btn" href="${pageContext.request.contextPath}/admin/mainImg/delete?mainNo=${mainImgConnectDto.mainNo}">삭제</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
