<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<style>
.flex-remain {
	flex: 1;
}

.flex-content::after { /*플렉스 초기화 */
	content: "";
	display: block;
	clear: both;
}

.oneLine { /* 한줄에 표현 */
	display: inline;
}

.img-size { /* 이미지 사이즈 조정 */
	width: 400px;
	height: 400px;
}

.img-rad-10 { /*버튼을 둥글게 */
	border-radius: 10%;
}

.img-background { /* 이미지 배경색 */
	background-color: #F5F5f5;
}

.w-49 {
	width: 49%;
} /*장바구니, 구매버튼을 위한 간격*/
.font-black {
	color: black;
}

.font-lightgrey {
	color: #A2a1a1;
}

.font-grey {
	color: #A7a6a5;
}

.font-boldgrey {
	color: #5a5b5a;
}

.hr-bold { /* 선 진하게 */
	border-width: 2px;
}

.star-box { /*별점 박스*/
	width: 400px;
	height: 110px;
	background-color: #F5F5f5;
	border-radius: 1em;
	justify-content: center;
	align-items: center;
	flex-direction: column; /* 이 부분은 수평 중앙 정렬을 위해 필요합니다 */
	text-align: center; /* 이 부분은 수평 중앙 정렬을 위해 필요합니다 */
	font-weight: bold;
	margin: 0 auto;
}

/* 차트용 폰트 */
.chart-font {
	font-size: 12px;
	margin-top: 10px;
	margin-bottom: 22px;
}

.font-warning {
	font-size: 1px;
	font-weight: 200;
	color: red;
}

.bar {
	height: 20px;
	background-color: #776BFF;
	border-radius: 50px;
	margin-bottom: 15px;
}

/* 상세 이미지 초기 설정*/
.detail-img-initial {
	position: relative;
	overflow: hidden;
	height: 400px; /* 보여질 높이 설정 */
}

.detail-img-click {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: auto;
}

/* 상세정보 펼치기 */
.show-detail {
	display: block;
	margin: 0 auto;
}

.hide-detail {
	display: none;
	margin: 0 auto;
}

/* 리뷰 초기 설정*/
.review-initial {
	position: relative;
	overflow: hidden;
	height: 100px; /* 보여질 높이 설정 */
}

.review-click {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: auto;
}
/*리뷰 펼치기 */
.show-review {
	display: block;
	margin: 0 auto;
}

.hide-review {
	display: none;
	margin: 0 auto;
}

.disc {
	list-style-type: disc;
}

.fs-20 {
	font-size: 18px;
	text-decoration: none;
	font-weight: bold;
}

.font-white {
	color: white;
	-webkit-text-stroke: 1.5px #776BFF; /* 텍스트 테두리 색 지정 */
	font-size: 18px;
	font-weight: bolder;
}

.font-purple {
	color: #776BFF;
	font-size: 18px;
	font-weight: bolder;
}

.font-lightgrey {
	color: #afafaf;
	font-size: 13px;
	font-weight: bolder;
}

fs-18 {
	font-size: 18px;
}

.bar {
	fill: #776BFF;
	rx: 15px;
	ry: 15px;
	border-radius: 50%;
}
</style>
<script src="/static/js/review.js"></script>
<script type="text/template" id="review-template">
	<div class="review-item">
		<div class="memberId"></div>
		<div class="flex w-100">
			<div class="w-50">
				<div class="reviewStar w-33 left"></div> 
			</div>
			<div class="w-50">
				<div class="changeText right">
					<span class="text edit-text">수정</span>
					<span class="text delete-text">삭제</span>
				</div>
				<div class="reviewTime right"></div>
			</div>
		</div>
		<div class="reviewContent"></div>
		<div class="reviewLike">
			<span class="heart-count">${reviewDto.reviewLike}</span>
		</div>
	</div>
</script>

<script type="text/template" id="review-edit-template">
	<div class="edit-panel">
		<div class="reviewStar"></div>

		<div class="row review-edit-content">
            <textarea name="reviewContent" class="form-input w-100 semi-round" style="min-height:100px"></textarea>
        </div>

		<div class="flex w-100 btn-panel">
			<div class="w-50">
                <label class="input-file-button" for="chooseFile">
                    사진등록
                </label>
                <input type="file" id="chooseFile" name="attach" class="form-input w-10">
        	</div>
			<div class="flex w-50 right">
                <button type="button" class="form-btn small neutral review-cancel-btn me-10">취소</button>
                <button type="button" class="form-btn small positive review-edit-btn">수정</button>
            </div>  
		</div>
	</div>
	</script>
<script>
	var memberId = "${sessionScope.memberId}";
	var reviewNo = "${reviewLikeDto.reviewNo}";
</script>
<script type="text/javascript">
 	// 페이지 로드--------------
    $(function(){    	
    	// 이미지 높이 조절---------------------------------------------------   	
    	// 초기상태에서 클리되었을때 
   		$(".show-detail").click(function(){
   			
   			// 상세이미지를 전부 펼처보임
   			$(".detail-img-initial").addClass("detail-img-click");
   			$(".detail-img-click").removeClass("detail-img-initial");
   			
   			// 버튼을 접기로 바꿈
   			$(".show-detail").css("display","none");// 펼처 보기 버튼 숨기기
   			$(".hide-detail").css("display","block");// 접기 버튼 열기  
   		});
    	
   		// 펼쳐진상태에서 클리되었을때 
   		$(".hide-detail").click(function(){
   			
   			// 상세이미지를 숨김 
   			$(".detail-img-click").addClass("detail-img-initial");
   			$(".detail-img-initial").removeClass("detail-img-click");
   			
   			// 버튼을 펼처보기로 바뀸
   			$(".show-detail").css("display","block");// 펼처 보기 버튼 숨기기
   			$(".hide-detail").css("display","none");// 접기 버튼 열기  
   		});
   		// 이미지 높이 조절----------------------------------------------------
    	
    	
   		// 리뷰 높이 조절----------------------------------------------
   		$(".show-review").click(function(){
   			// 리뷰를 전부 펼침
   			$(".review-initial").addClass("review-click");
   			$(".review-click").removeClass("review-initial");
   			
   			// 버튼은 접기로 바꿈
   			$(".show-review").css("display","none");
   			$(".hide-review").css("display","block");
   		});
   		
   		$(".hide-review").click(function(){
   			// 리뷰를 전부 펼침
   			$(".review-click").addClass("review-initial");
   			$(".review-initial").removeClass("review-click");
   			
   			// 버튼은 접기로 바꿈
   			$(".show-review").css("display","block");
   			$(".hide-review").css("display","none");
   		});
   		// 리뷰 높이 조절----------------------------------------------
	
    	// 상품 개당 가격 조절 ajax-------------------------------------
     	var productPrice = $(".product-price").text();
   		$(".product-price").text(parseInt(productPrice).toLocaleString());
     	var number = $(".productCount").val();
     	$(".total-price").text((number*productPrice+3000).toLocaleString());
     	
    	$(".productCount").on('change',function(){
    		
    		 var number = $(this).val();
    		 number = parseInt(number);
    		 $.ajax({ // 서버에 데이터 요청
     			type:'POST',
         		url:"/rest/number",
         		data: JSON.stringify({'number': number.toString()}),
                 contentType: 'application/json; charset=utf-8',
                 success: function(data) {
                 	// 개수 최신화
                     $(".number").text(number);
                 	
                 	// 총 금액 최신화 
                     $(".total-price").text((number*productPrice+3000).toLocaleString());
                 },
                 error: function(xhr, status, error) {
                     console.log("에러다에러");
                 }
         	});
    	});
    	//-------------------------------------------------------------
    	
    	// 별 다섯개 짜리로 구성된 평점을 표시하는 별--------------
    	var avg = $('.avg').text();
    	var ratings = $('.rating');
    	ratings.each(function(idx,rating){
    		var stars = $(rating).find('.fa');
        	stars.each(function(index,star){
        		console.log(index);
        		if (index+1 <= avg){ // 별이 있는 구간
        			$(star).removeClass('font-white').addClass('font-purple');
        		}
        		else{    			 // 빈별 구간 
        			$(star).removeClass('font-purple').addClass('font-white');
        		}        		
        	});
    	});    	

    	// 장바구니버튼, 주문 버튼 개별 경로처리--------------------------------
         $(".cart-btn").click(function(){
            $(".item-form").attr("action", "/cart/insert");
            $(".item-form").attr("method", "post");
         });
         $(".buy-btn").click(function(){
            $(".item-form").attr("action", "/order/detail");
            $(".item-form").attr("method", "post");
         });
        // 장바구니버튼, 주문 버튼 개별 경로처리--------------------------------
        // 장바구니 상품 담기 처리
 		var params = new URLSearchParams(location.search);
 		var mode = params.get("mode");
 			if(mode == "error1") {
 				alert("이미 장바구니에 담긴 상품입니다.");
 				return false;
 			}
 			else if(mode == "error2") {
 				alert("재고가 부족합니다.");
 				return false;
 			}
 			else if(mode == "error3") {
 				alert("최대 10개까지 담을 수 있습니다.");
 				return false;
 			}
 			else if(mode == "success") {
 				alert("장바구니에 상품을 담았습니다.")
 			}
     });        
});	   	
    </script>
    // 페이지 로드--------------
	<script>
$(function(){
    $(".review-content").hide();
    $(".btn-panel").hide();
    $(".review-star").hide();
    $(".edit-btn").click(function(){
      if (${hasBuyHistory}) {
        $(".view-panel").hide();
        $(".review-content").show();
        $(".btn-panel").show();
        $(".review-star").show();
        if (${reviewDto != null}){
            alert("구매 당 1회의 리뷰만 작성할 수 있습니다");
            $(".review-content").hide();
            $(".btn-panel").hide();
            $(".review-star").hide();
            $(".view-panel").show();
        }
      } else if (${memberId == null}){
    	  alert("로그인 후 리뷰를 작성할 수 있습니다");
      } else {
        alert("해당 상품을 구매한 이력이 있는 회원만 리뷰를 작성할 수 있습니다");
      }
      
  })
    $(".cancel-btn").click(function(){
    $(".view-panel").show();
    $(".review-content").hide();
    $(".btn-panel").hide();
    $(".review-star").hide();
  })    
});
</script>
<body>
	<!-- 숨겨진 정보 클래스 선택으로 정보를 가져오기 위한 데이터 상품번호랑 평균 -->
	<h6 class="productNo" style="display: none;">${productInfoDto.productNo}</h6>
	<h6 class="avg" style="display: none;">${reviewAvg}</h6>
	<!--  -->
	<div class="container-1000">
		<form class="item-form">
			<!-- 이미지 부터 구매하기 버튼까지 -->
			<div class="flex">
				<!-- 상품 이미지 -->
				<div class="w-50 center">
					<img src="/static/image/basic_img.jpg"
						class="img-size img-rad-10 img-background ">
				</div>

				<!-- 상품 가격 부터 구매하기 버튼까지-->

				<div class="flex-remain">
					<div class="row">
						<input hidden type="number" name="productNo"
							value="${productDto.productNo}">
						<h5 class="font-grey oneLine">${productInfoDto.productBrand}</h5>
						<h5 class="font-grey oneLine">${productInfoDto.productName}</h5>
					</div>
					<div class="row">
						<h2>${productInfoDto.productName}</h2>
					</div>
					<div class="row">
						<br>
						<h3 class="oneLine product-price">${productInfoDto.productPrice}</h3>
						<h3 class="oneLine">원</h3>
						<br>
						<br>
						<br>
						<h4 class="font-boldgrey oneLine">배송비</h4>
						&nbsp;
						<h4 class="oneLine">3,000원</h4>
						<br>
						<div class="rating oneLine">
							<span class="fa fa-star font-white"></span> <span
								class="fa fa-star font-white"></span> <span
								class="fa fa-star font-white"></span> <span
								class="fa fa-star font-white"></span> <span
								class="fa fa-star font-white"></span>
						</div>
						<h6 class="font-boldgrey oneLine">${reviewCount}개의 후기</h6>
					</div>
					<div class="row">
						<hr>
						<div class="flex">
							<div class="w-70">
								<h5 class="font-boldgrey oneLine">${productInfoDto.productName}</h5>
							</div>
							<div class="flex-remain center">
								<!--                             <button class="w-100 form-btn small neutral center"> -->
								<select class="productCount" name="number">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
								<!-- 							</button> -->
							</div>
						</div>
						<br>
						<hr>

					</div>
					<div class="row">
						<h3 class="font-purple oneLine">총 금액&nbsp;</h3>
						<h3 class="oneLine total-price">${productInfoDto.productPrice}</h3>
						<h3 class="oneLine">원</h3>
					</div>
					<div class="row center">
						<button class="w-49 form-btn small neutral"
							onclick="location.href='/cart/' ">장바구니</button>
						<button class="w-49 form-btn small positive"
							onclick="location.href='/order/' ">구매하기</button>
					</div>

				</div>
			</div>
		</form>
	</div>
	<!-- 구매하기 버튼 이후부터 -->




	<!-- 제품상세정보, 후기, 상품구매안내 -->
	<div class="container-1000 ">
		<div class="flex">
			<div class="flex-content w-33 center">
				<a class="fs-20 font-black" href="#scrollTargetDetailImage">제품상세정보</a>
			</div>
			<div class="flex-content w-33 center">
				<a class="fs-20 oneLine font-black" href="#scrollTargetReview">후기</a>
				<a class="fs-20 oneLine font-grey" href="#scrollTargetReview">(${reviewCount})</a>
			</div>
			<div class="flex-content w-33 center">
				<a class="fs-20 font-black" href="#scrollTargetPurchaseGuide">상품구매안내</a>
			</div>
		</div>
	</div>


	<div class="container-1000 flex">
		<hr class="w-30">
		<hr class="w-30">
		<hr class="w-30">
	</div>


	<div class="container-1000">
		<!--상세이미지 초기상태 -->
		<div class="row detail-img-initial" id="scrollTargetDetailImage">
			<!-- id 상세이미지로 스크롤 타겟팅 -->
			<img width="1000" class="center" src="/static/image/detail_img.jpg">
		</div>
	</div>


	<div class="container-1000">
		<div class="row center">
			<!--상세이미지 전부 보이기-->
			<button class="w-95 form-btn small positive show-detail">상세정보
				펼쳐 보기</button>
			<!--상세이미지 숨기기 -->
			<button class="w-95 form-btn small positive hide-detail">상세정보
				접기</button>
		</div>
	</div>


	<!-- 제품상세정보, 후기, 상품구매안내 -->
	<div class="container-1000 ">
		<div class="flex">
			<div class="flex-content w-33 center">
				<a class="fs-20 font-black" href="#scrollTargetDetailImage">제품상세정보</a>
			</div>
			<div class="flex-content w-33 center">
				<a class="fs-20 oneLine font-black" href="#scrollTargetReview">후기</a>
				<a class="fs-20 oneLine font-grey" href="#scrollTargetReview">(${reviewCount})</a>
			</div>
			<div class="flex-content w-33 center">
				<a class="fs-20 font-black" href="#scrollTargetPurchaseGuide">상품구매안내</a>
			</div>
		</div>
	</div>


	<div class="container-1000 flex">
		<hr class="w-30">
		<hr class="w-30">
		<hr class="w-30">
	</div>

	<!--       =--------------------------------------------------------------------d -->
	<div class="container-1000">
		<!-- 리뷰 등록창 -->
		<div class="review-write">
			<!-- 리뷰 별점 -->
			<div class="review-star">
				<i class="fa-regular fa-star starR" value="1"></i> <i
					class="fa-regular fa-star starR" value="2"></i> <i
					class="fa-regular fa-star starR" value="3"></i> <i
					class="fa-regular fa-star starR" value="4"></i> <i
					class="fa-regular fa-star starR" value="5"></i>
			</div>

			<!-- 리뷰 작성하기 창 -->
			<div class="view-panel center">
				<button class="form-btn small neutral edit-btn w-100"
					style="height: 40px;">리뷰 작성하기</button>
			</div>

			<!-- 리뷰 작성창 -->
			<div class="row review-content">
				<textarea name="reviewContent" class="form-input w-100 semi-round"
					style="min-height: 100px"></textarea>
			</div>
			<div class="flex w-100 btn-panel">
				<div class="w-50"></div>
				<div class="flex w-50 right">
					<button type="button"
						class="form-btn small neutral cancel-btn me-10">취소</button>
					<button type="button"
						class="form-btn small positive review-insert-btn">등록</button>
				</div>
			</div>
		</div>
		<div class="row review-list review-initial" id=scrollTargetReview">
			리뷰 목록 위치</div>
		<button class="form-btn w-95 positive small show-review">리뷰
			모두 보기</button>
		<button class="form-btn w-95 neutral small hide-review">리뷰 접기</button>
	</div>

	<div class="row center"></div>
	<!--       =--------------------------------------------------------------------d -->

	<!-- 리뷰 별점 및 차트 -->
	<div class="container-1000">
		<div class="row center">
			<div class="star-box center">
				<br>
				<h4 class="font-purple oneLine">${reviewAvg}</h4>
				<h4 class="font-grey fs-18 oneLine">&nbsp;/ 5</h4>
				<br>
				<div class="rating">
					<span class="fa fa-star font-white"></span> <span
						class="fa fa-star font-white"></span> <span
						class="fa fa-star font-white"></span> <span
						class="fa fa-star font-white"></span> <span
						class="fa fa-star font-white"></span>
				</div>
			</div>
		</div>
	</div>



	<div class="container-1000 ">
		<div class="flex">
			<div class="flex-content w-33 center">
				<a class="fs-20 font-black" href="#scrollTargetDetailImage">제품상세정보</a>
			</div>
			<div class="flex-content w-33 center">
				<a class="fs-20 oneLine font-black" href="#scrollTargetReview">후기</a>
				<a class="fs-20 oneLine font-grey" href="#scrollTargetReview">(${reviewCount})</a>
			</div>
			<div class="flex-content w-33 center">
				<a class="fs-20 font-black" href="#scrollTargetPurchaseGuide">상품구매안내</a>
			</div>
		</div>
	</div>


	<div class="container-1000 flex">
		<hr class="w-30">
		<hr class="w-30">
		<hr class="w-30">
	</div>


	<div class="container-1000">
		<br>
		<div class="row">
			<h3 class="font-boldgrey" id="scrollTargetPurchaseGuide">배송안내</h3>
			<br>
		</div>
		<div class="row">
			<h4 class="font-grey">배송은 평일 결제 시 오후 12시에 출고가 마감됩니다. 오후 12시 이후
				결제 건은 익일 출고가 진행됩니다. (주말 결제 시 다음 영업일 출고)</h4>
			<ul class="disc ms-20">
				<li>배송이 시작된 후에는 배송지 변경 및 취소가 불가능합니다.</li>
				<li>배송기간은 출고일로부터 평균 3~5일 정도 소요됩니다.</li>
				<li>도서·산간 지역 배송 시 추가 배송비가 없으나, 배송 기일이 추가적으로 소요될 수 있는 점 양해하여 주시기
					바랍니다.</li>
				<li>배송 과정 중 기상 악화 혹은 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다</li>
			</ul>
		</div>
		<br>

		<div class="row">
			<h3 class="font-boldgrey">반품 및 교환 안내</h3>
			<br>
		</div>
		<div class="row">
			<h4 class="font-grey">교환 및 반품은 상품을 수령한 날부터 7일 이내에 고객센터로 문의해 주시기
				바랍니다.</h4>
			<ul class="disc ms-20">
				<li>제품 이상, 오배송 등과 같은 회사에 귀책사유가 있는 경우 맞교환이 진행됩니다. (배송비 회사 부담/부분
					반품 가능)</li>
				<li>제품 교환은 단순 고객 변심의 경우에는 교환을 원하는 제품은 반품(배송비 5,000원 고객부담)으로
					진행되고, 수령을 원하는 제품은 추가 결제로 배송됩니다.</li>
				<li>반품 후 환불금액은 상품 회수 및 검수 후 결정됩니다. (검수 시 상품의 훼손 및 누락이 있을 경우 변동될
					수 있습니다.)</li>
				<li>반품완료 및 교환회수 완료는 택배기사가 고객님께 반품/교환 상품을 인계받은(수거) 날로부터 약 3~5일
					소요됩니다. (영업일 기준)</li>
			</ul>
		</div>
		<br>

		<div class="row">
			<h3 class="font-boldgrey">주문취소 안내</h3>
			<br>
		</div>
		<div class="row">
			<h4 class="font-grey">주문취소는 [발송대기] 상태일 경우에만 취소가 가능합니다. 앱과 홈페이지에서
				직접 취소하실 수 있습니다.</h4>
			<ul class="disc ms-20">
				<li>필리케어 APP : MY필리 > 결제내역 > 해당 결제건 선택</li>
				<li>홈페이지 : MY필리 > 결제관리 > 해당 결제건 선택</li>
				<li>[배송중]부터는 취소가 불가능하니, 고객센터에 문의하여 반품으로 진행해 주시기 바랍니다.</li>
				<li>주문 상품의 부분 취소가 필요하신 경우 전체 주문취소 후 다시 구매해 주시기 바랍니다.</li>
				<li>주문 시 사용하였던 쿠폰 및 포인트는 유효기간이 지나지 않은 경우 복원됩니다.</li>
			</ul>
		</div>
		<br>

		<div class="row">
			<h3 class="font-boldgrey">전자상거래 등에서 소비자보호에 관한 법률에 따라 다음의 경우
				청약철회가 제한될 수 있습니다.</h3>
			<br>
		</div>
		<div class="row">
			<ul class="disc ms-20">
				<li>고객님이 배송 포장을 개봉하여 상품의 실링 스티커 제거 및 사용하여 상품의 가치가 훼손된 경우</li>
				<li>고객님의 단순 변심으로 인한 교환/반품 신청이 상품 수령한 날로부터 7일이 경과한 경우</li>
				<li>고객님의 사용 또는 일부 소비에 의해 상품의 가치가 훼손된 경우</li>
				<li>시간 경과에 따라 상품 등의 가치가 현저히 감소하여 재판매가 불가능한 경우</li>
				<li>상품 포장, 용기의 멸실 또는 훼손 & 무상 교환을 위해 고의로 상품을 불량으로 만드는 경우</li>
				<li>구매한 상품의 구성품이 누락된 경우 (사은품 등)</li>
				<li>구매한 상품과 반품 입고 상품의 정보(상품번호/SKU)가 상이한 경우</li>
				<li>기타 상품상세페이지에 반품/교환이 불가하다고 안내되어 있는 경우</li>
			</ul>
		</div>
		<br>
	</div>

</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

