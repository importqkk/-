-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
        <div><h1>내 주문 내역 조회</h1></div>
    </div>
    <thead>
        <tr>
          <th>입금/결제<span>0</span></th>
          <th>배송중/픽업대기<span>0</span></th>
          <th>배송완료/픽업완료<span>0</span></th>
          <th>환불<span>0</span></th>
        </tr>
      </thead>


    <table>
        <thead>
          <tr>
            <th>상품정보</th>
            <th>주문일자</th>
            <th>주문번호</th>
            <th>주문금액</th>
            <th>주문상태</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>상품 A</td>
            <td>2023-04-01</td>
            <td>123456</td>
            <td>50,000원</td>
            <td>배송중</td>
          </tr>
          <tr>
            <td>상품 B</td>
            <td>2023-03-31</td>
            <td>789012</td>
            <td>25,000원</td>
            <td>배송완료</td>
          </tr>
          <tr>
            <td>상품 C</td>
            <td>2023-03-29</td>
            <td>345678</td>
            <td>15,000원</td>
            <td>주문취소</td>
          </tr>
        </tbody>
      </table>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>