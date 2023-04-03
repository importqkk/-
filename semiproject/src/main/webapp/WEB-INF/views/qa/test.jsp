<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<%-- 계정주인과 글쓴이 비교 필요--%>
<%--
<script> 	
var memberId = "${sessionScope.memberId}"; 
var memberId = "${qaDto.memberId}"; 
</script>
--%>

<script type="text/javascript">

</script>
<body>
	${hi}
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>