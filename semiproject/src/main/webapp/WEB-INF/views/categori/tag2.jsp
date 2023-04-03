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
        	width: 200px;
        	height: 200px;
        }
        .star-13{
        	font-size: 13px;
        }
        
        .img-box{
        	margin: 10px; 
        	width: 240px;
        	height: 400px;
         	background-color: #f1f1f1;  /* 배경색 */
        	border-radius: 0.5em; /* 끝부분 조정*/
        	align-items: center;
        }
       

		.flex-wr{
			display: flex;		
			flex-wrap: wrap;
		}
		
		.flex-wr.center{
			justify-content: center;
		}
		.flex-wr.left{
			justify-content: right;
		}
		
		.a-font-purple{
			color: #d0ccff;
			font-size:13px;
			font-weight:bolder;
			cursor:pointer;
			
		}
		.a-font-lightgrey{
			color: #afafaf;
			font-size:13px;
			font-weight:bolder;
			cursor:pointer;
		}
		
		a.fas{
			text-decoration: none;
			color: #776bff;
		}
		
</style>
<script type="text/javascript">
	// "none"
	$(function(){
		$(".a-font-lightgrey").click(function(){ // 회색글씨가 눌리면 
			$(".a-font-purple").removeClass("a-font-purple").addClass("a-font-lightgrey"); // 보라글씨의 a-font-purple클래스를 지우고 a-font-lightgrey 클래스를 추가
			$(this).removeClass("a-font-lightgrey") // 눌린 글씨의 a-font-ligtgrey 클래스를 제거
			$(this).addClass("a-font-purple") // 눌린 글씨에 a-font-purple
			if($(this).text()=="인기순")	
			{
				console.log($(this));
				$(".best").show();
				$(".new").hide();
				$(".cheap").hide();
				$(".expensive").hide();
				
			}
			else if($(this).text()=="최신순"){
				console.log($(this));
				$(".best").hide();
				$(".new").show();
				$(".cheap").hide();
				$(".expensive").hide();
			}
			else if($(this).text()=="낮은가격순")
			{
				console.log($(this));
				$(".best").hide();
				$(".new").hide();
				$(".cheap").show();
				$(".expensive").hide();
			}
			else{
				console.log($(this));
				$(".best").hide();
				$(".new").hide();
				$(".cheap").hide();
				$(".expensive").show();
			}
		});	
		
		$(".img-box").click(function(){
			var index = $(this).data('index'); // best로 정렬한 순서에서 클릭된 위치의 index 반환
			var index1 = $(this).data('index1'); // new로 정렬한 순서에서 클릭된 위치의 index 반환
			var index2 = $(this).data('index2'); // cheap로 정렬한 순서에서 클릭된 위치의 index 반환
			var index3 = $(this).data('index3'); // expensive로 정렬한 순서에서 클릭된 위치의 index 반환
			if(index!=null){ // best가 
				indexr = index;
				var productNo = $(".productNoBest").eq(indexr).text();
			}
			if(index1!=null){ // new
				indexr = index1;
				var productNo = $(".productNoNew").eq(indexr).text();
			}
			if(index2!=null){ // cheap
				indexr = index2;
				var productNo = $(".productNoCheap").eq(indexr).text();
			}
			if(index3!=null){ // expensive
				indexr = index3;
				var productNo = $(".productNoExpensive").eq(indexr).text();
			}; 			 
  			$(location).attr("href","/product/detail?productNo="+productNo);
		});
	})
	
</script>

</head>

<body>
	<div class="container-1200">
		<div class="row">
			<hr>
			<h5 class="font-lightgrey"> <i class=" fa-solid fa-house"></i> > 면역력 어쩌구</h5>
			
		</div>
		<div class="row">
			<hr>
		</div>
		<div class="flex center">
			<a class="w-5 me-50 fas fa-solid fa-bars" href="all"></a>		
			<a class="w-5 me-50 fas fa-light fa-face-smile" href="tag1"></a>
			<a class="w-5 me-50 fas fa-light fa-weight-scale purple-box"></a>
			<a class="w-5 me-50 fas fa-light fa-venus" href="tag3"></a>	
			<a class="w-5 me-50 fas fa-sharp fa-light fa-bolt-lightning" href="tag4"></a>
			<a class="w-5 me-50 fas fa-thin fa-mars" href="tag5"></a>
			<a class="w-5 me-50 fas fa-light fa-eye" href="tag6"></a>	
			<a class="w-5 me-50 fas fa-light fa-tooth" href="tag7"></a>
			<a class="w-5 me-50 fas fa-light fa-bone" href="tag8"></a>
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
				<a class="w-6 a-font-lightgrey oneLine">인기순</a>
				<a class="w-2 font-lightgrey oneLine">&nbsp;|</a>
				<a class="w-5 a-font-lightgrey oneLine">최신순</a>
				<a class="w-2 font-lightgrey oneLine">&nbsp;|</a>
				<a class="w-9 a-font-lightgrey oneLine">낮은가격순</a>
				<a class="w-2 font-lightgrey oneLine">|</a>
				<a class="w-9 a-font-lightgrey oneLine">높은가격순</a>
			</div>
			<div class="flex w-40 right">
				<h5 class="w-30 me-10 font-lightgrey">${count}개의 제품</h5>
			</div>
		</div>	
		<br>
<!---------------------여기부터는 이미지 들의 리스트 ------------------->
		<!--인기상품 -->
				<div class="flex-wr center mb-20 best">
		<c:forEach var="productInfoDto" items="${bestList}" varStatus="status">		
				<div class="img-box me-20 center" data-index="${status.index}" data-info="best">
					<img src="/static/image/basic_img.jpg" class="img-list center mt-20">
					<br><h5 class="productNoBest" style="display: none;">${productInfoDto.productNo}</h5>				
					<h5 class="left ms-20 font-grey">[${productInfoDto.productBrand}] ${productInfoDto.productName}</h5>
					<br>
					<h4 class="left ms-20">${productInfoDto.productPrice}원</h4>
					<br>
					<div class="flex left ms-20">
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
		<!--최신상품 -->
		<div class="flex-wr center mb-20 new" style="display: none;">
		<c:forEach var="productInfoDto" items="${newList}" varStatus="status1">		
				<div class="img-box me-20 center" data-index1="${status1.index}" data-info="new">
					<img src="/static/image/basic_img.jpg" class="img-list center mt-20">
					<br><h5 class="productNoNew" style="display: none;">${productInfoDto.productNo}</h5>	
					<h5 class="left ms-20 me-20 font-grey">[${productInfoDto.productBrand}] ${productInfoDto.productName}</h5>
					<br>
					<h4 class="left ms-20">${productInfoDto.productPrice}원</h4>
					<br>
					<div class="flex left ms-20">
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
		<!--낮은 가격순 -->
		<div class="flex-wr center mb-20 cheap" style="display: none;">
		<c:forEach var="productInfoDto" items="${cheapList}" varStatus="status2">		
				<div class="img-box me-20 center" data-index2="${status2.index}" data-info="cheap">
					<img src="/static/image/basic_img.jpg" class="img-list center mt-20">
					<br><h5 class="productNoCheap" style="display: none;">${productInfoDto.productNo}</h5>	
					<h5 class="left ms-20 font-grey">[${productInfoDto.productBrand}] ${productInfoDto.productName}</h5>
					<br>
					<h4 class="left ms-20">${productInfoDto.productPrice}원</h4>
					<br>
					<div class="flex left ms-20">
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
		<!--높은 가격순 -->
		<div class="flex-wr center mb-20 expensive" style="display: none;">
		<c:forEach var="productInfoDto" items="${expensiveList}" varStatus="status2">		
				<div class="img-box me-20 center" data-index3="${status2.index}" data-info="expensive">
					<img src="/static/image/basic_img.jpg" class="img-list center mt-20">
					<br><h5 class="productNoExpensive" style="display: none;">${productInfoDto.productNo}</h5>	
					<h5 class="left ms-20 font-grey">[${productInfoDto.productBrand}] ${productInfoDto.productName}</h5>
					<br>
					<h4 class="left ms-20">${productInfoDto.productPrice}원</h4>
					<br>
					<div class="flex left ms-20">
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
	</div>
</body>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
