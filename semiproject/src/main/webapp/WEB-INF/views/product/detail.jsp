-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


    <style>
        .flex-remain{
            flex:1;
        }
        .flex-content::after { /*플렉스 초기화 */ 
            content:"";
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
        .img-rad-10{ /*버튼을 둥글게 */
            border-radius: 10%;
        }
        .img-background{ /* 이미지 배경색 */
            background-color: #F5F5f5;
        }
        .w-49 {width: 49%;}  /*장바구니, 구매버튼을 위한 간격*/
		
		.font-black{
			color: black;
		}

        .font-lightgrey {
            color: #A2a1a1;
        }
        .font-grey{
            color: #A7a6a5;
        }
        .font-boldgrey{
            color: #5a5b5a;
        }
        .hr-bold{  /* 선 진하게 */
            border-width:2px;
        }

        .star-box{ /*별점 박스*/
            width: 100%;
            height: 85%;
            background-color: #F5F5f5;
            border-radius: 25%;
            justify-content: center;
            align-items: center;
            text-align: center;
            font-weight: bold;  
        }

        /* 차트 */
        .chart {
            flex-direction: column;
            height: 200px;
        }

        /* 차트용 폰트 */
        .chart-font {
            margin-bottom: 15.5px;
        }

        .font-warning{
            font-size:1px;
            font-weight: 200;
            color: red;
        }

        .bar {
            height: 20px;
            background-color: #776BFF;
            border-radius:50px;
            margin-bottom: 15px;
        }

        .font-white{
            color: white;
            -webkit-text-stroke: 2px #776BFF; /* 텍스트 테두리 색 지정 */
			

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
			  width:100%;
			  height: auto;
		}
		
		/* 상세정보 펼치기 */
		.show-detail{
			display:block;
			margin: 0 auto;
		}
		.hide-detail{
			display:none;
			margin: 0 auto;
		}
		
		.disc{
			list-style-type : disc;
		}
		
		.fs-20{
			font-size: 18px;
			text-decoration: none;
			font-weight: bold;
		}
		
		.up-10{
			
		}
		
    </style>
    <script type="text/javascript">
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
    	
    	
   		
   		
   		
    	// 상품 개당 가격 조절 ajax-------------------------------------
     	var productPrice = $(".product-price").text();

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
    	
    	
    	
    	
    	// 상품 가격 조절 ajax-------------------------------------------
    	
    	
    	// 스크롤을 해당하는 곳으로 옮기고 10만큼 올리는 예제 
    	// $("scrollTarget")
    });	   	
    	
    </script>

<body test>
	<h6 class="productNo" style="display:none;">${productDto.productNo}</h6>
    <div class="container-1000">
    	<form class="two-form"> <!-- 장바구니, 구매하기 까지 감싼 form -->
        <hr>
        <!-- 이미지 부터 구매하기 버튼까지 -->
        <div class="flex">
            <!-- 상품 이미지 -->
            <div class="w-50 center">
                <img src="/static/image/basic_img.jpg" class="img-size img-rad-10 img-background ">
            </div>
         
            <!-- 상품 가격 부터 구매하기 버튼까지-->
            <div class="flex-remain"> 
                <div class="row">
                    <h5 class="font-grey oneLine">${productDto.productBrand}</h5>
                    <h5 class="font-grey oneLine">${productDto.productName}</h5>
                 
                </div>
                <div class="row">
                    <h2>${productDto.productName}</h2>
                </div>
                <div class="row">
                    <br>
                    <h3 class="oneLine product-price">${productDto.productPrice}</h3>
                    <h3 class="oneLine">원</h3>
                    <br><br><br>
                    <h4 class="font-boldgrey oneLine">배송비</h4>
                    &nbsp;
                    <h4 class="oneLine">3,000원</h4><br>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h6 class="font-boldgrey oneLine"> 150개의 후기</h6>

                    
                </div>
                <div class="row">
                    <hr>
                    <div class="flex">
                        <div class="w-70">
                            <h5 class="font-boldgrey oneLine">${productDto.productName}</h5>
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
                    <br><hr>
                
                </div>
                <div class="row">
                    <h3 class="font-purple oneLine">총 금액&nbsp;</h3>
                    <h3 class="oneLine total-price">${productDto.productPrice}</h3>
                    <h3 class="oneLine">원</h3>
                </div>
                <div class="row center">
                    <button class="w-49 form-btn small neutral" onclick="location.href='/cart/' ">장바구니</button>
                    <button class="w-49 form-btn small positive" onclick="location.href='/order/' ">구매하기</button>
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
<!--                 <a class="fs-20 font-black" href="#scrollTargetDetailImage">제품상세정보</a> -->
                
<!--             </div> -->
<!--             <div class="flex-content w-33 center"> -->
<!--                 <a class="fs-20 oneLine font-black" href="#scrollTargetReview">후기</a> -->
<!--                 <h3 class="fs-20 oneLine font-black">(150)</h3> -->
               
<!--             </div> -->
<!--             <div class="flex-content w-33 center"> -->
<!--                 <a class="fs-20 font-black" href="#scrollTargetPurchaseGuide">상품구매안내</a> -->
                
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
		<div class="row detail-img-initial" id="scrollTargetDetailImage"> <!-- id 상세이미지로 스크롤 타겟팅 -->
			<img width="1000" class="center" src="/static/image/detail_img.jpg">
		</div>
	</div>
	

    <div class="container-1000">
        <div class="row center">
			<!--상세이미지 전부 보이기-->
            <button class="w-95 form-btn small positive show-detail" >상세정보 펼쳐 보기</button>
			<!--상세이미지 숨기기 -->
            <button class="w-95 form-btn small positive hide-detail" >상세정보 접기</button>
        </div>
    </div>




    <!-- 제품상세정보, 후기, 상품구매안내 -->
    <div class="container-1000 ">
        <div class="flex"> 
            <div class="flex-content w-33 center">
                <h3>제품상세정보</h3>
            </div>
            <div class="flex-content w-33 center">
                <h3 class="oneLine">후기</h3>
                <h3 class="oneLine font-grey">(150)</h3>
            </div>
            <div class="flex-content w-33 center">
                <h3>상품구매안내</h3>
                
            </div>
        </div>
    </div>
    <div class="container-1000 flex">
        <hr class="w-30">
        <hr class="w-30">
        <hr class="w-30">
    </div>
    <!-- 리뷰 별점 및 차트 -->
    <div class="container-1000 flex">
        <div class="w-40 center">
            <div class="star-box">
                <h4 class="font-purple oneLine">4.0</h4>
                <h4 class="font-lightgrey oneLine">&nbsp/ 5</h4><br>
                <h4 class="fas fa-star font-purple "></h4>
                <h4 class="fas fa-star font-purple "></h4>
                <h4 class="fas fa-star font-purple "></h4>
                <h4 class="fas fa-star font-purple "></h4>
                <h4 class="fas fa-star font-purple "></h4>
            </div>
        </div>
        <div class="w-65 flex ms-10 ">
            <!-- 리뷰 평 -->
            <div class="w-20">
                <h5 class="font-boldgrey chart-font">아주 좋아요</h5>
                <h5 class="font-boldgrey chart-font">좋아요</h5>
                <h5 class="font-boldgrey chart-font">보통이에요</h5>
                <h5 class="font-boldgrey chart-font">그저 그래요</h5>
                <h5 class="font-boldgrey chart-font">별로에요</h5>
                
            </div>
            <!-- 차트 -->
            <div class="w-75">
                <div class="chart">
                    <div class="bar w-50"></div> 
                    <div class="bar w-60"></div> 
                    <div class="bar w-70"></div> 
                    <div class="bar w-80"></div> 
                    <div class="bar w-90"></div> 
                </div>
            </div>
            <!-- 리뷰수-->
            <div class="w-5">
                <h5 class="font-boldgrey chart-font">50</h5>
                <h5 class="font-boldgrey chart-font">60</h5>
                <h5 class="font-boldgrey chart-font">70</h5>
                <h5 class="font-boldgrey chart-font">80</h5>
                <h5 class="font-boldgrey chart-font">90</h5>
            </div>
        </div>
    </div>

    <!-- 리뷰 작성하기  -->
    <div class="container-1000">
        <div class="row center">
            <div class="font-warning left">제품 구매 이력 있을 시에만 나타남</div>
            <button class="form-btn w-95  neutral small">리뷰 작성하기</button>
        </div>
        <div class="flex">
            <div class="w-75"></div>
            <div class="flex-remain">
                <h5 class="font-boldgrey ms-10">최신순  | 별점 높은 순 | 별점 낮은 순</h5>
            </div>
        </div>
        
        <!-- 리뷰 칸 -->

        <div class="container-1000"> 
            <div class="row left" id="scrollTargetReview"> <!-- 상품 리뷰 안내 -->
                <!-- 리뷰 예시 1-->
                <h2>testa***</h2>
                <div class="flex">
                    <div class="w-80">
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="font-boldgrey oneLine">아주 좋아요</div>

                    </div>
                    <div class="flex-remain  font-boldgrey flex">
                        <div class="w-20 font-purple">수정</div>
                        <div class="w-5 font-grey">|</div>
                        <div class="w-30 font-grey">삭제</div>
                        <div class="flex-remain">
                        2022-02-25</div>
                    </div>
                </div>
                <div class="row font-boldgrey">
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    
                </div>
                <!-- 리뷰 예시 1-->
                <h2>testb***</h2>
                <div class="flex">
                    <div class="w-80">
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-white "></div>
                        <div class="font-boldgrey oneLine">좋아요</div>

                    </div>
                    <div class="flex-remain right font-boldgrey">
                        2022-02-26
                    </div>
                </div>
                <div class="row font-boldgrey">
                    부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요
                    부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요
                    부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요
                    부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요

                </div>
            </div>
        </div>

        <!-- 리뷰 칸 -->

        <div class="row center">
            <div class="font-warning left">리뷰 개수 3개 이상일때만 보임</div>
            <button class="form-btn w-95 positive small">리뷰 모두 보기</button>
        </div>
        

        <div class="container-1000 ">
            <div class="flex"> 
                <div class="flex-content w-33 center">
                    <h3>제품상세정보</h3>
                    
                </div>
                <div class="flex-content w-33 center">
                    <h3 class="oneLine">후기</h3>
                    <h3 class="oneLine font-grey">(150)</h3>
                   
                </div>
                <div class="flex-content w-33 center">
                    <h3>상품구매안내</h3>
                </div>
            </div>
        </div>

        <div class="container-1000" >
            <div class="row">
                <h3 class="font-boldgrey" id="scrollTargetPurchaseGuide">배송안내</h3>
                <br>
            </div>
            <div class="row">
                <h4 class="font-grey">배송은 평일 결제 시 오후 12시에 출고가 마감됩니다. 오후 12시 이후 결제 건은 익일 출고가 진행됩니다. (주말 결제 시 다음 영업일 출고) </h4>
                <ul class="disc ms-20">
                	<li> 배송이 시작된 후에는 배송지 변경 및 취소가 불가능합니다.</li>
                	<li>배송기간은 출고일로부터 평균 3~5일 정도 소요됩니다.</li>
                	<li>도서·산간 지역 배송 시 추가 배송비가 없으나, 배송 기일이 추가적으로 소요될 수 있는 점 양해하여 주시기 바랍니다.</li>
                	<li>배송 과정 중 기상 악화 혹은 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다</li>                	
                </ul>
            </div>
            
            <div class="row">
                <h3 class="font-boldgrey">반품 및 교환 안내</h3>
                <br>
            </div>
            <div class="row">
                <h4 class="font-grey">교환 및 반품은 상품을 수령한 날부터 7일 이내에 고객센터로 문의해 주시기 바랍니다.</h4>
                <ul class="disc ms-20">
                	<li>제품 이상, 오배송 등과 같은 회사에 귀책사유가 있는 경우 맞교환이 진행됩니다. (배송비 회사 부담/부분 반품 가능)</li>
                	<li>제품 교환은 단순 고객 변심의 경우에는 교환을 원하는 제품은 반품(배송비 5,000원 고객부담)으로 진행되고, 수령을 원하는 제품은 추가 결제로 배송됩니다.</li>
                	<li>반품 후 환불금액은 상품 회수 및 검수 후 결정됩니다. (검수 시 상품의 훼손 및 누락이 있을 경우 변동될 수 있습니다.)</li>
                	<li>반품완료 및 교환회수 완료는 택배기사가 고객님께 반품/교환 상품을 인계받은(수거) 날로부터 약 3~5일 소요됩니다. (영업일 기준)</li>                	
                </ul>
            </div>
            
            <div class="row">
                <h3 class="font-boldgrey">주문취소 안내</h3>
                <br>
            </div>
            <div class="row">
                <h4 class="font-grey">주문취소는 [발송대기] 상태일 경우에만 취소가 가능합니다. 앱과 홈페이지에서 직접 취소하실 수 있습니다.</h4>
                <ul class="disc ms-20">
                	<li>필리케어 APP : MY필리 > 결제내역 > 해당 결제건 선택</li>
                	<li>홈페이지 : MY필리 > 결제관리 > 해당 결제건 선택</li>
                	<li>[배송중]부터는 취소가 불가능하니, 고객센터에 문의하여 반품으로 진행해 주시기 바랍니다.</li>
                	<li>주문 상품의 부분 취소가 필요하신 경우 전체 주문취소 후 다시 구매해 주시기 바랍니다.</li>
                	<li>주문 시 사용하였던 쿠폰 및 포인트는 유효기간이 지나지 않은 경우 복원됩니다.</li>                         	
                </ul>
            </div>
            
            <div class="row">
                <h3 class="font-boldgrey">전자상거래 등에서 소비자보호에 관한 법률에 따라 다음의 경우 청약철회가 제한될 수 있습니다.</h3>
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
        </div>
    
    </div>
</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


