-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<head>
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
      
      .number {
      	appearence: none;
      	/*aling-item: center;*/
      	outline: none;
      	border: none;
      }
      
    </style>
    <script type="text/javascript">
    $(function(){
       // 이미지 높이 조절----------------------------------------------------
       
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
                     $(".productCount").val(number);
                 	
                 	// 총 금액 최신화
                    $(".total-price").text((number*productPrice+3000).toLocaleString());
                 },
                 error: function(xhr, status, error) {
                     console.log("에러다에러");
                 }
         	});
    	});
       // 상품 가격 조절 ajax-------------------------------------------
       
       // 장바구니버튼, 주문 버튼 개별 경로처리--------------------------------
       $(function(){
	         $(".cart-btn").click(function(){
	            $(".item-form").attr("action", "/cart/insert");
	            $(".item-form").attr("method", "post");
	         });
	         $(".buy-btn").click(function(){
	            $(".item-form").attr("action", "/order/buy");
	            $(".item-form").attr("method", "get");
	         });
	      });
       // 장바구니버튼, 주문 버튼 개별 경로처리--------------------------------
    });         
       
    </script>
    <title>상품 상세페이지</title>
</head>
<body>
    <div class="container-1000">
        <hr>
        <form class="item-form">
	        <!-- 이미지 부터 구매하기 버튼까지 -->
	        <div class="flex">
	            <!-- 상품 이미지 -->
	            <div class="w-50 center">
	                <img src="/static/image/basic_img.jpg" class="img-size img-rad-10 img-background ">
	            </div>
	         	
	            <!-- 상품 가격 부터 구매하기 버튼까지-->
	            <div class="flex-remain"> 
	                <div class="row">
	                	<input hidden type="number" name="productNo" value="${productDto.productNo}">
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
								<select class="productCount" name="productCount">
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
	                    <button class="w-49 form-btn small neutral cart-btn">장바구니</button>
	                    <button class="w-49 form-btn small positive buy-btn">구매하기</button>
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
   <div class="container-1000">
      <!--상세이미지 초기상태 -->
      <div class="row detail-img-initial">
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
            <div class="row left">
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

        <div class="container-1000">
            <div class="row">
                <h3 class="font-boldgrey">배송안내</h3>
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
        </div>
    
    </div>
</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

