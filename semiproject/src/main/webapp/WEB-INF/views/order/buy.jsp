<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<c:set var="listSize" value="${fn:length(cartinfo)}" />


<html>
		
<head>
<title>Insert title here</title>
	<style>
		.flex {
            display: flex;

            justify-content: space-between;
        }
        .flex2{
            display: flex;
        }
        
        .order {
            text-align: center;
            border-width: 2px;
            border-color: #776bff;
            background-color: #f8f8ff;
            border-style: solid;
            padding: 10px;
            border-radius: 1em;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        
        .form-btn.small2 {
             display: inline;
             font-size: 13px;
             padding: 0.55em;
             padding-left: 1em;
             padding-right: 1em;
             border-width: 2px;
             border-style: solid;
             margin-bottom: 18px;
        }
        .form-btn.small3 {
             display: inline;
             font-size: 13px;
             padding: 0.55em;
             padding-left: 1em;
             padding-right: 1em;
             border-width: 2px;
             border-style: solid;
        }

        .form-input.small2 {
            font-size: 13px;
            padding-top: 0.75em;
            padding-bottom: 0.75em;
            border-width: 1.5px;
            border-style: solid;
        }
        h3 {
            line-height: 2;
            display: inline;
        }   
        .ps-110{
            padding-left: 110px;
        }
        .ps-120{
            padding-left: 120px;
        }
        .ps-130{
            padding-left: 130px;
        }
        .form-input {
            outline: none;
            border-radius: 50px;
            padding-left: 1.3em;
            padding-right: 1em;
            border-color: #776BFF;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td:first-child {
            text-align: left;
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: bold;
        }

        td:last-child {
            text-align: right;
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: bold;
        }
        
        .info div {
            margin-bottom: 5px; /* 세로 간격 조정 */
        }
        
        .brand-name-box {
        	min-height: 2em;
        }
        .no-margin {
        	margin: 0;
        }
        .product-img {
	        background-color: #f8f8f8;
	        border-radius: 25px;
	        padding: 10px;
	    }
	    .content-top {
	    	align-items: flex-start;
	    }
    </style>



    <!-- 우편주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 우편주소 api -->
	<c:set var="cartinfo" value="${cartinfo}" />

<!-- calculateTotalPrice 함수를 선언하는 코드 -->
<script type="text/javascript">
$(function(){
    $("#pay-btn").prop("disabled", true);
    
    //유효성 검사
    function isOrderFormValid() {
        var regexName = /^[가-힣]{2,7}$/;
        var regexPhone = /^01[016789][1-9][0-9]{6,7}$/;
        
        var orderReceverValid = regexName.test($("[name=orderRecever]").val());
        var orderReceivePhoneValid = regexPhone.test($("[name=orderReceivePhone]").val());
        var orderRequestValid = $("[name=orderRequest]").val().length <= 33;
        
        var orderPost = $("[name=orderPost]").val();
        var orderBasicAddr = $("[name=orderBasicAddr]").val();
        var orderDetailAddr = $("[name=orderDetailAddr]").val();
        var orderAddressValid = orderPost.length > 0 && orderBasicAddr.length > 0 && orderDetailAddr.length > 0;
        
        return orderReceverValid && orderReceivePhoneValid && orderRequestValid && orderAddressValid;
    }
    
    //수령인 검사
    $("[name=orderRecever]").blur(function(){
        var isValid = /^[가-힣]{2,7}$/.test($(this).val());
        
        $(this).removeClass("valid invalid")
                    .addClass(isValid ? "valid" : "invalid");
        
        $("#pay-btn").prop("disabled", !isOrderFormValid());
        
    });
    
    //수령인 번호 검사
    $("[name=orderReceivePhone]").blur(function(){
        var isValid = /^01[016789][1-9][0-9]{6,7}$/.test($(this).val());
        //console.log(isValid);
        $(this).removeClass("valid invalid")
                    .addClass(isValid ? "valid" : "invalid");
        
        $("#pay-btn").prop("disabled", !isOrderFormValid());
    });
    
    //배송지 검사
    $("[name=orderDetailAddr]").blur(function(){
        var orderPost = $("[name=orderPost]").val();
        var orderBasicAddr = $("[name=orderBasicAddr]").val();
        var orderDetailAddr = $(this).val();
        
        var isAllEmpty = orderPost.length == 0 && orderBasicAddr.length == 0 && orderDetailAddr.length == 0;
        var isAllWritten = orderPost.length > 0 && orderBasicAddr.length > 0 && orderDetailAddr.length > 0;
        var isValid = isAllEmpty || isAllWritten;
        //console.log(isValid);
        
        $(this).removeClass("valid invalid")
                    .addClass(isValid ? "valid" : "invalid");
        
        $("#pay-btn").prop("disabled", !isOrderFormValid());
    });
    
    //요청사항 검사
    $("[name=orderRequest]").blur(function() {
        var isValid = $(this).val().length <= 33;
        //console.log(isValid);
        $(this).removeClass("valid invalid")
                    .addClass(isValid ? "valid" : "invalid");
        
        $("#pay-btn").prop("disabled", !isOrderFormValid());
    })
    
});


</script>

<!-- 총 가격을 출력하는 코드 -->
	<script type="text/javascript">
/*------------------------------------------------------------------------------------------------------------------------------*/
	//팝업생성
	$(function( ){
        $(".pop-btn").click(function(){
            window.open("popup",  "popupNo", "width=570, height=980")        
        });
    });
/*------------------------------------------------------------------------------------------------------------------------------*/
     //주소api
    $(function(){
		
        $(".address-btn").click(function(){
                   
            new daum.Postcode({ 
                oncomplete: function(data) {
                   
                    var addr = ''; 
                    var extraAddr = ''; 
                   
                    if (data.userSelectedType === 'R') { 
                        addr = data.roadAddress;
                    } else { 
                        addr = data.jibunAddress;
                    }
                    
                    document.querySelector("[name=orderPost]").value = data.zonecode;
                    document.querySelector("[name=orderBasicAddr]").value = addr;
                    document.querySelector("[name=orderDetailAddr]").focus();
                }
                }).open();
        
    		});
        /*------------------------------------------------------------------------------------------------------------------------------*/
        
      
       //체크박스 선택시
		var checkboxes = document.getElementsByName("option");
		let prevChecked = null;
	
		for (let i = 0; i < checkboxes.length; i++) {
		  checkboxes[i].addEventListener("click", function() {
		    if (prevChecked !== null && prevChecked !== this) {
		      prevChecked.checked = false;
		    }
		    if (this.checked) {
		      prevChecked = this;
		    } else {
		      prevChecked = null;
		    }
		  });
		}
    });
    </script>
    
    
    <script type="text/javascript">
    
 /*------------------------------------------------------------------------------------------------------------------------------*/
    //포인트적용
    $(function(){
    $(".apply").click(function(){
    	//총 상품가격
    	var totalProduct = ${totalproduct};
    
        // 사용하는 포인트
        var usePoint = $("input[name='orderUserPoint']").val();
       
        // 사용가능 포인트
        var point = ${point};
       
        var fee=3000;
        // 사용포인트가 사용가능 포인트보다 많으면
        if(usePoint > point){
            alert("보유 적립금 이상으로 입력할 수 없습니다.");
			
        }else if(usePoint < 0){
        	alert("0원 이하로 입력할 수 없습니다.");
        }else {
        	if(totalProduct==0)
            // 제품금액
            
            //console.log(usePoint);
            
            // 적립금 사용 후 남은 사용가능 적립금
            var remainingPoint = point - usePoint;
            //console.log(remainingPoint);
            // 총 금액
            var totalPrice = totalProduct - usePoint + 3000;
            //console.log(totalPrice);

            $("span#usePoint").text(remainingPoint.toLocaleString() + "원");
            $("span#remainingPoint").text(remainingPoint.toLocaleString() + "원");
            if(usePoint <= 0){
                $("table tr:nth-child(3) td:nth-child(2)").text(usePoint.toLocaleString() + "원");

            }else{
                $("table tr:nth-child(3) td:nth-child(2)").text("-"+ usePoint.toLocaleString() + "원");

            }
            $("table tr:last-child td:last-child").text(totalPrice.toLocaleString() + "원");
        }
    });
});

/*------------------------------------------------------------------------------------------------------------------------------*/
    </script>
    <script type="text/javascript">
    		
    </script>
  
    
	    
  	<script src="https://cdn.iamport.kr/v1/iamport.js">
   	</script>

   	<script>
	   	$(function() {
	   		$("button#pay-btn").click(function(){
	   			//재고관리
	   			
	   			
	   			
	   			
	   			
	   			const IMP = window.IMP; // 생략 가능
				  IMP.init("imp07065242");  // 예: imp00000000a
					
				  var name = $("label#productName").val(); //상품이름 변수로 선언
				
				  var totalPrice = parseInt($("td.tPrice").next().text().replace(/\D/g,''));
				
				 
				// IMP.request_pay(param, callback) 결제창 호출
				IMP.request_pay({ // param
				   pg: "kakaopay",
				   pay_method: "card",
				   merchant_uid : 'merchant_' + new Date().getTime(),
				   name: name +"개 외",   //필수 파라미터 입니다.
				   amount: parseInt(totalPrice), //숫자타입
				   buyer_email : 'iamport@siot.do1',
				   buyer_name : '구매자이름',
				   buyer_tel : '010-1234-5678',
				   buyer_addr : '서울특별시 강남구 삼성동',
				   buyer_postcode : '123-456'
				}, function (rsp) { // callback
				   if (rsp.success) { 
					   $("form#pay").submit();
			 
				   } else {
					   alert("결제를 취소하셨습니다.");
				   }
				})
	   	});
	   });
	   	
	   	
	   	
	    $(function() {
	        $("input[name='orderUserPoint']").on("input", function() { 
	          if ($(this).val() === "") {
	            $(this).val("0");
	          }
	        });
	      });
	    
   	</script>
   
    
</head>
<body>
<!-- align-items: center; -->
<div class="container-1000">
    <h1>주문/결제</h1>
     <form id="pay" action="/order/buy" method="post">
   <div class="flex mt-30 content-top">
       <div class=" w-70 pe-70">
           <p><h2>주문상품</h2></p>
           <c:if test="${empty productInfo} && ${empty cartInfo}">
			  <script>
			    $(function() {
			      window.location.replace("http://localhost:8080/");
			    });
			  </script>
			</c:if>
    <!-- 상품상세에서 온거면 -->
        <c:if test="${not empty productInfo}">
            <c:forEach var="productInfo" items="${productInfo}" varStatus="status">
            <div class="row flex2">
            	<c:choose>
            		<c:when test="${productInfo.productImgNo != 0}">
            			<img src="/img/download?imgNo=${productInfo.productImgNo}" class="product-img me-20" width="130" height="130">
            		</c:when>
            		<c:otherwise>
            			<img class="product-img me-20" alt="상품 대표 이미지" src="${pageContext.request.contextPath}/static/image/productDummy.png" width="130" height="130">
            		</c:otherwise>
            	</c:choose>
                        <input type="hidden" name="productNo" value="${productInfo.productNo}">
                        <input type="hidden" name="productPrice" value="${productInfo.productPrice}">
                        <input type="hidden" name="productCount" value="${Count}">
                    
                    <div class="left info mt-10">
                        <div class="brand-name-box">
                            <h4>[${productInfo.productBrand}] </h4>
                            <label id="productName">${productInfo.productName}</label>
                        </div>
                        
                        <label>상품가격: ${productInfo.productPrice}</label>
                        <c:set var="Count" value="${productCount}" scope="page" />
                        <div>
                            <label class="me-10"><h4>수량</h4></label>
                            <h4>${Count}</h4>
                        </div>
                    </div>   
                    
            </div>
            </c:forEach>
        </c:if>
    <!-- 카트에서 온거면 -->
        <c:if test="${not empty cartinfo}">
        
			<c:forEach var="cartinfo" items="${cartinfo}" varStatus="loop">
			    <div class="row flex2">
			    	
			    	<c:choose>
			    		<c:when test="${cartinfo.imgNo != 0}">
			    			<img src="/img/download?imgNo=${cartinfo.imgNo}" class="product-img me-20" width="130" height="130"> 
			    		</c:when>
			    		<c:otherwise>
			    			<img class="product-img me-20" alt="상품 대표 이미지" src="${pageContext.request.contextPath}/static/image/productDummy.png" width="130" height="130">
			    		</c:otherwise>
			    	</c:choose>
			                
			        <div class="left info mt-10">
			            <div class="brand-name-box">
			                <h4 class="me-10">[${cartinfo.productBrand}]</h4>
			                <label id="productName">${cartinfo.productName}</label>
			            </div>
			            	<h3 id="productPrice${loop.index}">
			            		<fmt:formatNumber pattern="#,##0" value="${cartinfo.productPrice}"></fmt:formatNumber>
			            		 원
			            	</h3>
			            <div>
			                <label id="productCount${loop.index}" class="me-10"><h4>수량</h4></label>
			                <h4>${cartinfo.productCount}</h4>
			            </div>
			        </div>      
			    </div>
			    
			</c:forEach>
        </c:if>
    
    <!-- 배송지부분 -->
           <div class="left pt-30">
                <div class="flex">
                    <h2>배송지</h2>
                    <button class="pop-btn form-btn small2 neutral mt-20" type="button">배송지 불러오기</button> 
               </div>
               <div class="row">
                   <label class="ps-10">받는사람</label>
                   <input type="text" class="form-input light w-100 medium" name="orderRecever" required="required">
                   <span></span>
               </div>

               <div class="row">
                   <label class="ps-10">연락처</label>
                   <input type="text" class="form-input light w-100 medium" name="orderReceivePhone">
                   <span></span>
               </div>

               <div class="row">
               		<div>
               			<label class="w-100 ps-10">주소</label>
               		</div>
                   <div class="flex">
	                   <input type="text" class="form-input light medium w-75" name="orderPost" placeholder="우편번호" required="required">
	                   <button class="form-btn medium positive address-btn" type="button">우편번호찾기</button>
                   </div>
               </div>

               <div class="row">
                   <input type="text" class="form-input light medium w-100" name="orderBasicAddr" placeholder="기본주소" readonly>
               </div>

               <div class="row">
                   <input type="text" class="form-input light medium w-100" name="orderDetailAddr" placeholder="상세주소">
                   <span></span>
               </div>

               <div class="row">
                   <label class="ps-10">배송요청사항</label>
                   <input type="text" class="form-input light medium w-100" name="orderRequest">
               </div>
           </div>
           </div>

      <!-- 결제정보 -->
       <div class="w-30">
       <c:set var="payment" value="${cartinfo}" scope="page" />
           <div>
               <p><h2>결제정보</h2></p>
               <p class="no-margin ps-10"><label>적립금</label></p>
                    <input type="number" class="form-input small2 light w-80" name="orderUserPoint" value="0">
                    <button class="form-btn positive small3 apply no-margin" type="button">적용</button>
               <p class="right no-margin font-h5 pe-10">적용가능한 적립금: <span id="usePoint"><fmt:formatNumber value="${point}" pattern="#,##0"/>원</span></p>


               <div class="row order">
                <div>
                    <table>
                        <tr>
                          <td>제품금액</td>
                          <td><fmt:formatNumber value="${totalproduct}" pattern="#,##0"/> 원</td>
                          
                        </tr>
                        <tr>
                          <td>배송비</td>
                          <td><fmt:formatNumber value="3000" pattern="#,##0"/> 원</td>
                        </tr>
                        <tr>
                          <td>적립금</td>
                          <td>0 원</td>
                        </tr>
                        <tr>
                          <td class="tPrice">총 결제금액</td>
                          <td>
                          <fmt:formatNumber value="${totalprice}" pattern="#,##0"/> 원 
                          </td>
                        </tr>
                    </table>
                </div>
                  
            </div>


               <h2>결제수단</h2>
                <div class="pt-20">
                    <div class="flex2 row">
                        <input type="checkbox" name="option" class="me-10"> 신용 / 체크카드
                    </div>
                    <div class="flex2 row">
                        <input type="checkbox" name="option" class="me-10"> 무통장 입금
                    </div>
                    <div class="flex2 row">
                        <input type="checkbox" name="option" class="me-10"> 에스크로 (실시간 계좌이체)
                    </div>
                    <div class="flex2 row">
                        <input type="checkbox" name="option" class="me-10"> 휴대폰 결제
                    </div>
                </div>
               <div>
                   <button class="form-btn positive medium w-100 mt-30" id="pay-btn" type="button" >결제하기</button>
               </div>
           </div>
       </div>
       
  </div>     
       </form>
</div>


</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>