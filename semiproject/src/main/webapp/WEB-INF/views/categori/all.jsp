<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<head>
<style>
		.fas{
			font-size: 40px;
		}

		.font-lightgrey{
			color: #afafaf;
		}
		
		.w-2{
			width:2%;
		}
</style>
</head>

<body test>
	<div class="container-1200">
		<div class="row">
			<hr>
			<h5 class="font-lightgrey"> <i class=" fa-solid fa-house"></i> > 면역력 어쩌구</h5>
			
		</div>
		<div class="row">
			<hr>
		</div>
		<div class="flex center">
			<i class="w-10 fas fa-solid fa-bars "></i>		
			<i class="w-10 fas fa-light fa-face-smile"></i>
			<i class="w-10 fas fa-light fa-weight-scale"></i>
			<i class="w-10 fas fa-light fa-venus"></i>	
			<i class="w-10 fas fa-sharp fa-light fa-bolt-lightning"></i>
			<i class="w-10 fas fa-thin fa-mars"></i>
			<i class="w-10 fas fa-light fa-eye"></i>	
			<i class="w-10 fas fa-light fa-tooth"></i>
			<i class="w-10 fas fa-light fa-bone"></i>
		</div>
		<div class="flex center">
			<h5 class="w-10">전체</h5>
			<h5 class="w-10">피부</h5>
			<h5 class="w-10">다이어트</h5>
			<h5 class="w-10">여성</h5>
			<h5 class="w-10">활력</h5>
			<h5 class="w-10">남성</h5>
			<h5 class="w-10">눈</h5>
			<h5 class="w-10">치아</h5>
			<h5 class="w-10">뼈</h5>
		</div>
		<div class="flex left">	
			<div class="flex w-60">
				<h5 class="w-5 font-purple">인기순</h5>
				<h5 class="w-2 font-lightgrey">|</h5>
				<h5 class="w-5 font-lightgrey">최신순</h5>
				<h5 class="w-2 font-lightgrey">|</h5>
				<h5 class="w-5 font-lightgrey">낮은가격순</h5>
				<h5 class="w-2 font-lightgrey">|</h5>
				<h5 class="w-5 font-lightgrey">높은가격순</h5>
			</div>
			<div class="flex w-40 right">
				<h5 class="w-5 font-lightgrey">100개의 제품</h5>
			</div>
		</div>	
	</div>
</body>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
