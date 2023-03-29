<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- swiper cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<style>
	.swiper {
		width: 100%;
    }
    .swiper img {
        width: 100%;
        height: 100%;
    }
    .swiper-pagination-bullet-active {
        background-color: #776BFF !important;
    }
    .swiper-pagination-bullet {
        opacity: 1;
        background-color: #e4e1ff
    }
    .fas{
		font-size: 40px;
        cursor: pointer;
        margin-bottom: 15px;
        color: #776BFF;
	}
    .fa-beat {
        scale: 1;
        animation-duration: 2s;
    }
    .flex.flex-auto-width > * {
        flex-grow: 1;
    }
    h5, h3 {
        margin: 0;
    }
    h1, h2, h4 {
        margin: 0;
        display: inline;
    }
    .star {
        color: #776BFF;
    }
    .item-box {
        background-color: #f8f8f8;
        border-radius: 20px;
        padding-left: 17px;
        padding-right: 17px;
        padding-bottom: 20px;
    }
    .item-box:hover {
        background-color: #f8f8ff;
    }
    .item-img {
        width: 200px;
        height: 200px;
    }
    .recommend-box > *,
    .best-box > * {
        flex-grow: 1;
    }
</style>
<script type="text/javascript">
	$(function() {
		$(".fas").hover(function() {
            $(this).addClass("fa-beat");
            },
            function() {
                $(this).removeClass("fa-beat");
        });
	})
	window.addEventListener("load", function(){
		var swiper = new Swiper('.swiper', {
            direction: 'horizontal',
            loop: true,
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
                clickable: true,
            },
            autoplay: {
                delay: 5000,
                pauseOnMouseEnter: true,
            }
        });
	})
</script>
		<!----------------------메인컨텐츠 start---------------------->
		    <div class="container-1000">
		        <!-- 이미지 슬라이드 start -->
		        <div class="row">
		            <div class="swiper">
		                <div class="swiper-wrapper center">
		                    <div class="swiper-slide"><img src="/static/image/mainDummy1.png"></div>
		                    <div class="swiper-slide"><img src="/static/image/mainDummy2.png"></div>
		                    <div class="swiper-slide"><img src="/static/image/mainDummy3.png"></div>
		                </div>
		                <div class="swiper-pagination center"></div>
		            </div>
		        </div>
		        <!-- 이미지 슬라이드 end -->
		        <!-- 카테고리 버튼 start -->
		        <div class="flex center pt-40 flex-auto-width mb-40">
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-solid fa-bars"></i>
		                    <h5>전체</h5>
		                </a>
		            </div>
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-light fa-face-smile"></i>
		                    <h5>피부</h5>
		                </a>
		            </div>
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-light fa-weight-scale"></i>
		                    <h5>다이이트</h5>
		                </a>
		            </div>
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-light fa-venus"></i>
		                    <h5>여성</h5>	
		                </a>
		            </div>
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-sharp fa-light fa-bolt-lightning"></i>
		                    <h5>활력</h5>
		                </a>
		            </div>
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-thin fa-mars"></i>
		                    <h5>남성</h5>
		                </a>
		            </div>
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-light fa-eye"></i>
		                    <h5>눈</h5>
		                </a>
		            </div>
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-light fa-tooth"></i>
		                    <h5>치아</h5>
		                </a>
		            </div>
		            <div>
		                <a class="link" href="#">
		                    <i class="fas fa-light fa-bone"></i>
		                    <h5>뼈</h5>
		                </a>
		            </div>
		        </div>
		        <!-- 추천상품 목록 start -->
		        <div class="row pb-40">
		            <div class="row">
		                <h1 class="c-b80 me-5">NEW</h1><h2 class="c-b80 me-5">in</h2><h1 class="me-10 c-p100">SEMI</h1>
		                <span class="c-b80">이달의 신상품을 만나보세요!</span>
		            </div>
 		            <div class="row flex recommend-box">
		            	<c:forEach var="productInfoDto" items="${newProduct}" end="3">
			                <a class="link item-box me-10" href="/product/detail?productNo=${productInfoDto.productNo}">
			                    <div>
			                    	<c:choose>
					            		<c:when test="${productInfoDto.imgNo != 0}">
					            			<img class="item-img" alt="상품 대표 이미지" src="/img/download?imgNo=${productInfoDto.imgNo}">	<!-- 상품 이미지 - 바꿔야함 -->
				 	            		</c:when>
					            		<c:otherwise>
					            			<img class="item-img" alt="상품 대표 이미지" src="/static/image/productDummy.png">	<!-- 상품 이미지 - 바꿔야함 -->
					            		</c:otherwise>
					            	</c:choose>
			                    </div>
			                    <div class="mb-20">
			                        <h4 class="c-b40">[${productInfoDto.productBrand}] </h4><h4>${productInfoDto.productName}</h4>
			                    </div>
			                    <div class="mb-10">
			                        <h3>
		                            	<fmt:formatNumber pattern="#,##0" value="${productInfoDto.productPrice}"></fmt:formatNumber>
		                            	원
		                            </h3>
			                    </div>
			                    <div>
			                    	<c:choose>
			                    		<c:when test="${productInfoDto.reivewAVG >= '4.5'}">
			                    			<span class="star">★★★★★</span>
			                    		</c:when>
			                    		<c:when test="${productInfoDto.reivewAVG >= '3.5'}">
			                    			<span class="star">★★★★☆</span>
			                    		</c:when>
			                    		<c:when test="${productInfoDto.reivewAVG >= '2.5'}">
			                    			<span class="star">★★★☆☆</span>
			                    		</c:when>
			                    		<c:when test="${productInfoDto.reivewAVG >= '1.5'}">
			                    			<span class="star">★★☆☆☆</span>
			                    		</c:when>
			                    		<c:when test="${productInfoDto.reivewAVG >= '0.5'}">
			                    			<span class="star">★☆☆☆☆</span>
			                    		</c:when>
			                    		<c:when test="${productInfoDto.reivewAVG < '0.5'}">
			                    			<span class="star">☆☆☆☆☆</span>
			                    		</c:when>
			                    	</c:choose>
			                        <span class="ms-5 c-b40">${productInfoDto.reivewCNT}</span>
			                    </div>
			                </a>
			            </c:forEach>
		            </div>
		        </div>
		        <!-- 추천상품 목록 end -->
		        <!-- 인기상품 목록 start -->
		        <div class="row pb-40">
		            <div class="row">
		                <h1 class="c-b80 me-5">BEST</h1><h2 class="c-b80 me-5">in</h2><h1 class="me-10 c-p100">SEMI</h1>
		                <span class="c-b80">이번 달 SEMI에서 가장 인기 있는 상품이에요.</span>
		            </div>
		            <div class="row">
		                <div class="row flex best-box">
		                	<c:forEach var="productInfoDto" items="${bestProduct}" end="3">
			                    <a class="link item-box me-10" href="/product/detail?productNo=${productInfoDto.productNo}">
			                        <div>
			                            <c:choose>
						            		<c:when test="${productInfoDto.imgNo != 0}">
						            			<img class="item-img" alt="상품 대표 이미지" src="/img/download?imgNo=${productInfoDto.imgNo}">	<!-- 상품 이미지 - 바꿔야함 -->
					 	            		</c:when>
						            		<c:otherwise>
						            			<img class="item-img" alt="상품 대표 이미지" src="/static/image/productDummy.png">	<!-- 상품 이미지 - 바꿔야함 -->
						            		</c:otherwise>
						            	</c:choose>
			                        </div>
			                        <div class="mb-20">
			                            <h4 class="c-b40">[${productInfoDto.productBrand}] </h4><h4>${productInfoDto.productName}</h4>
			                        </div>
			                        <div class="mb-10">
			                            <h3>
			                            	<fmt:formatNumber pattern="#,##0" value="${productInfoDto.productPrice}"></fmt:formatNumber>
			                            	원
			                            </h3>
			                        </div>
			                        <div>
			                            <c:choose>
				                    		<c:when test="${productInfoDto.reivewAVG >= '4.5'}">
				                    			<span class="star">★★★★★</span>
				                    		</c:when>
				                    		<c:when test="${productInfoDto.reivewAVG >= '3.5'}">
				                    			<span class="star">★★★★☆</span>
				                    		</c:when>
				                    		<c:when test="${productInfoDto.reivewAVG >= '2.5'}">
				                    			<span class="star">★★★☆☆</span>
				                    		</c:when>
				                    		<c:when test="${productInfoDto.reivewAVG >= '1.5'}">
				                    			<span class="star">★★☆☆☆</span>
				                    		</c:when>
				                    		<c:when test="${productInfoDto.reivewAVG >= '0.5'}">
				                    			<span class="star">★☆☆☆☆</span>
				                    		</c:when>
				                    		<c:when test="${productInfoDto.reivewAVG < '0.5'}">
				                    			<span class="star">☆☆☆☆☆</span>
				                    		</c:when>
				                    	</c:choose>
				                        <span class="ms-5 c-b40">${productInfoDto.reivewCNT}</span>
			                        </div>
			                    </a>
			                </c:forEach>
		                </div>
		            </div>
		        </div>
		        <!-- 인기상품 목록 end -->
		    </div>
		    <!----------------------메인컨텐츠 end---------------------->
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>