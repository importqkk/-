-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<head>
    <style>
    
      
    </style>
    <script type="text/javascript">
    $(function(){
       // 이미지 높이 조절----------------------------------------------------
 
       
       
         
       // 상품 개당 가격 조절 ajax-------------------------------------
       var productPrice = $(".product-price").text();

         
       $(".minus").click(function(){// 마이너스 버튼이 눌리면 비동기 통신 시작 
          var number = $(this).next(".number").text();
          number = parseInt(number);
          if(number>=2){
            number=number-1;
         }
          // 총 금액
            
          $.ajax({ // 서버에 데이터 요청
             type:'POST',
             url:"/rest/number",
              data: JSON.stringify({'number': number.toString()}),
                contentType: 'application/json; charset=utf-8',
                success: function(data) { // 개수 비동기 통신 성공 시, 
               
                   // 개수 최신화
                    $(".number").text(number);
                   
                    
                 },
                error: function(xhr, status, error) {
                    console.log("에러다에러");
                   
                }
           });   
       });
       $(".plus").click(function(){// 플러스 버튼이 눌리면 비동기 통신 시작 
          var number = $(this).prev(".number").text(); // plus잔의 
          
          number = parseInt(number);
          number = number+1;

          $.ajax({ // 서버에 데이터 요청
             type:'POST',
              url:"/rest/number",
              data: JSON.stringify({'number': number.toString()}),
                contentType: 'application/json; charset=utf-8',
                success: function(data) {
           
                   // 개수 최신화
                    $(".number").text(number);
                   
                   // 총 금액 최신화 
                    $(".total-price").text(number*productPrice+3000);
                },
                error: function(xhr, status, error) {
                    console.log("에러다에러");
                }
           });   
        });
       // 상품 가격 조절 ajax-------------------------------------------
       
       $(function(){
	         $(".cart-btn").click(function(){
	            $(".item-form").attr("action", "/cart/insert");
	            $(".item-form").attr("method", "post");
	         });
	         $(".buy-btn").click(function(){
	            $(".item-form").attr("action", "/order/insert");
	            $(".item-form").attr("method", "post");
	         });
	      });
    });         
       
    </script>
    <title>상품 상세페이지</title>
</head>
<body test>
   <h6 class="productNo" style="display:none;">${productDto.productNo}</h6>
    <div class="container-1000">
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
	                	<input hidden name="productNo" value="${productDto.productNo}">
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

	
	                    
	                </div>
	                <div class="row">
	                    <hr>
	                    <div class="flex">
	                        <div class="w-70">
	                            <h5 class="font-boldgrey oneLine">${productDto.productName}</h5>
	                        </div>
	                        <div class="flex-remain center">
	                            <button class="w-100 form-btn small neutral center">
	                        <div class="qty-stepper flex">
	                           <a class="w-30 minus">-</a>
	                           <a class="w-30 number">1</a>
	                           <a class="w-30 plus">+</a>
	                        </div>
	                     </button>
	                        </div>                        
	                    </div>
	                    <br><hr>
	                
	                </div>
	                <form class="item-form">
		                <div class="row">
		                	<input hidden name="productNo" value="${productDto.productNo}">
		                    <h3 class="font-purple oneLine">총 금액&nbsp;</h3>
		                    <h3 class="oneLine total-price">${productDto.productPrice}</h3>
		                    <h3 class="oneLine">원</h3>
		                </div>
		                <div class="row center">
		                    <button class="w-49 form-btn small neutral cart-btn">장바구니</button>
		                    <button class="w-49 form-btn small positive buy-btn">구매하기</button>
		                </div>
	                </form>
	            </div>
	            
	        </div>
        
   



  
</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
