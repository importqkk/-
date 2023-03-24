<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body test>
    <div class="container-1000 center">
        <div class="row pt-">
            <h1>주문이 성공적으로 접수되었습니다.!</h1>
        </div>
        <div class="row">
            <img src="https://picsum.photos/500/500">
        </div>
        <div class="pt-20">
            <p>배송은 영업일 기준 3-5일 내로 시작되며,</p>
            <p>처리 과정은 마이페이지 구매내역에서 확인할 수 있습니다.</p> 
        </div>

        <div class="row pt-50">
            <div>
                <button class="form-btn medium neutral w-50">마이페이지</button>
            </div>
            <div>
                <button class="form-btn medium positive w-50">메인으로</button>
            </div>
        </div>
    </div>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>