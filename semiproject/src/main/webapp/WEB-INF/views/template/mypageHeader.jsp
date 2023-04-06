<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
  .w-20 {
    float: left;
  }
</style>
<div class="container-1000 mt-100">
  <div class="flex">
    <div class="w-20">
<!-- <aside class="left"> -->
	<ul class="leftside">
		<li>
			마이페이지
			<ul>
				<li><a href="/member/mypage">회원정보</a></li>
				<li><a href="/member/pwVf">회원정보 수정</a></li>
				<li><a href="/member/password">비밀번호 변경</a></li>
			</ul>
		</li>
		<li>
			쇼핑 정보
			<ul>
				<li><a href="/order/myList">주문/배송 조회</a></li>
				
 				<li><a href="/review/list">상품리뷰</a></li>

				<li><a href="/member/delete">회원 탈퇴</a></li>
		
			</ul>
	</ul>  
	</div>
	
	
<!-- </aside> -->