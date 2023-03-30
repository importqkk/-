<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		.font-grey{
			color: grey;
		}
		
		.w-2{
			width:2%;
		}
		.w-7{
			width:7%;
		}
		.w-8{
			width:8%;
		}
		.w-9{
			width:9%;
		}
        .flex-row {
            flex-direction: column;
        }
        
        .oneLine { /* 한줄에 표현 */
            display: inline;
        }

        .purple-box{
        	background-color: #d0ccff;
        	border-radius: 0.1em;
        }
        .vertical-center{
        	align-items: center;
        }
        
        .img-list{
        	width: 250px;
        	height: 200px;
        }
        .star-13{
        	font-size: 13px;
        }
        
        .flex.img-box{
        	margin: 10px; 
        	width: 300px;
        	height: 400px;
         	background-color: #f1f1f1;  /* 배경색 */
        	border-radius: 0.5em; /* 끝부분 조정*/
        	align-items: center;
        }
       
		/*이미지 배치 한행에 4개 */
        .flex.img-box:nth-child(4n+1),
		.flex.img-box:nth-child(4n+2),
		.flex.img-box:nth-child(4n+3),
		.flex.img-box:nth-child(4n+4) {
    		flex-basis: calc(25% - 20px);
		}
		
		.flex-wr{
			display: flex;		
			flex-wrap: wrap;
		}
		
		.flex-wr.center{
			justify-content: center;
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
			<i class="w-5 me-50 fas fa-solid fa-bars "></i>		
			<i class="w-5 me-50 fas fa-light fa-face-smile"></i>
			<i class="w-5 me-50 fas fa-light fa-weight-scale"></i>
			<i class="w-5 me-50 fas fa-light fa-venus purple-box"></i>	
			<i class="w-5 me-50 fas fa-sharp fa-light fa-bolt-lightning"></i>
			<i class="w-5 me-50 fas fa-thin fa-mars"></i>
			<i class="w-5 me-50 fas fa-light fa-eye"></i>	
			<i class="w-5 me-50 fas fa-light fa-tooth"></i>
			<i class="w-5 me-50 fas fa-light fa-bone"></i>
		</div>
		<div class="flex center">
			<h5 class="w-5 me-50">전체</h5>
			<h5 class="w-5 me-50">피부</h5>
			<h5 class="w-5 me-50">다이어트</h5>
			<h5 class="w-5 me-50">여성</h5>
			<h5 class="w-5 me-50">활력</h5>
			<h5 class="w-5 me-50">남성</h5>
			<h5 class="w-5 me-50">눈</h5>
			<h5 class="w-5 me-50">치아</h5>
			<h5 class="w-5 me-50">뼈</h5>
		</div>
		<div class="flex left grey-box">	
			<div class="flex w-60 ">
				<h5 class="w-5 ms-10 font-purple oneLine">인기순</h5>
				<h5 class="w-2 font-lightgrey oneLine">&nbsp;|</h5>
				<h5 class="w-5 font-lightgrey oneLine">최신순</h5>
				<h5 class="w-2 font-lightgrey oneLine">&nbsp;|</h5>
				<h5 class="w-9 font-lightgrey oneLine">낮은가격순</h5>
				<h5 class="w-2 font-lightgrey oneLine">|</h5>
				<h5 class="w-9 font-lightgrey oneLine">높은가격순</h5>
			</div>
			<div class="flex w-40 right">
				<h5 class="w-30 me-10 font-lightgrey">100개의 제품</h5>
			</div>
		</div>	
		<br>
<!---------------------여기부터는 이미지 들의 리스트 ------------------->
		<!--이미지 리스트 구간-->
		<div class="flex-wr center mb-20">
		<c:forEach var="productDto" items="${list}">		
				<div class="img-box me-20 center">
					<img src="/static/image/basic_img.jpg" class="img-list center mt-20">
					<br><br>
					
					<h5 class="left ms-20 font-grey">[${productDto.productBrand}] ${productDto.productName}원</h5>
					<br>
					<h4 class="left ms-20">${productDto.productPrice}</h4>
					<br>
					<div class="flex-wr left ">
						<h4 class="fas fa-star font-purple star-13"></h4>
						<h5 class="fas fa-star font-purple star-13"></h5>
						<h6 class="fas fa-star font-purple star-13"></h6>
						<h6 class="fas fa-star font-purple star-13"></h6>
						<h6 class="fas fa-star font-purple star-13"></h6>
						<h6 class="font-grey ms-20">150</h6>
					</div>
				</div>
		</c:forEach>
		</div>		
<%-- 		<c:forEach var="productDto" items="${list}"> --%>
<%-- 			<h5>${productDto.productName }</h5> --%>
<%-- 		</c:forEach> --%>
		
	</div>
</body>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
