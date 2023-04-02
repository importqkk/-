-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
                border-width: 1px;
                border-color: rgb(119,107,255);
                background-color: rgb(248, 248, 255);
                border-style: solid;
                width: auto;
                height: 240px;
                border-radius: 1em;
            }
        
        .form-btn.small2 {
                display: inline;
                font-size: 13px;
                padding: 0.55em;
                padding-left: 0.5em;
                padding-right: 0.5em;
                border-width: 2px;
                border-style: solid;
                height:30px
        }

        .form-input.small2 {
            font-size: 13px;
            padding-top: 0.75em;
            padding-bottom: 0.75em;
            border-width: 0.1px;
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
            margin-bottom: 20px; /* 세로 간격 조정 */
        }
    </style>



    <!-- 우편주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/static/js/find-address.min.js"></script>
	<!-- 우편주소 api -->
	
	<script type="text/javascript">
	//팝업생성
	$(function( ){
        $(".pop-btn").click(function(){
            window.open("popup",  "popupNo", "width=570, height=970")        
        });
    });
	
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
    //포인트적용
    $(function(){
		$(".apply").click(function(){
			  var usePoint = $("input[name='orderUserPoint']").val();
			  var point=${point};
			  
			if(usePoint > point){
				alert("보유 적립금 이상으로 입력할 수 없습니다.")
				
			}else{
				var total= point-usePoint;
				$("span").text(total + "원");
				$("table tr:nth-child(3) td:nth-child(2)").text("-"+ usePoint + "원");
			}
		});
    });
    </script>
    
    <script>
    
	//결제api 진행중    
   		<script src="https://cdn.iamport.kr/v1/iamport.js">
   	</script>

   	<script>
    	const IMP = window.IMP; // 생략 가능
    	IMP.init("imp07065242"); // 예: imp00000000a
	    function requestPay() {
	        IMP.request_pay({
	          pg: "kakaopay",
	          pay_method: "kakopay",
	          merchant_uid: "ORD20180131-0000011",   // 주문번호
	          name: "노르웨이 회전 의자",         //상품명
	          amount: 64900,                         // 가격
	          buyer_email: "gildong@gmail.com",    //구매자 이메일
	          buyer_name: "홍길동",                 //구매자 이름
	          buyer_tel: "010-4242-4242",                //구매자 번호
	          buyer_addr: "서울특별시 강남구 신사동",           //구매자 주소
	          buyer_postcode: "01181"                   //구매자 우편번호
	        }, function (rsp) { // callback함수
	          if (rsp.success) {
	        	  if (rsp.success) {
	                    console.log(rsp);
	          } else {
	            // 결제 실패 시 로직
	        	  console.log(rsp);
	          }
	        });
	      }
   	</script>
   
    
</head>
<body>
<!-- align-items: center; -->
<div class="container-1000">
    <h1>주문/결제</h1>
     <form action="/order/buy" method="post">
   <div class="flex">
       <div class=" w-70 pe-70">
           <p><h2>주문상품</h2></p>
    <!-- 상품상세에서 온거면 -->
        <c:if test="${not empty productInfo}">
            <c:forEach var="productInfo" items="${productInfo}" varStatus="status">
            <div class="row flex2">
                    <img src="https://picsum.photos/100/100" class="pe-20">
                        <input  type="hidden" name="productNo" value="${productInfo.productNo}">
                        <input  type="hidden" name="productPrice" value="${productInfo.productPrice}">
                        <input  type="hidden" name="productCount" value="${Count}">
                    
                    <div class="left info">
                        <div>
                            <label>[브랜드명] </label> <label>${productInfo.productName}</label>
                        </div>
                        
                        <label>상품가격: ${productInfo.productPrice}</label>
                        <c:set var="Count" value="${productCount}" scope="page" />
                        <div>
                                <label>상품수량:${Count}</label>
                        </div>
                    </div>   
                    
            </div>
            </c:forEach>
        </c:if>
    <!-- 카트에서 온거면 -->
        <c:if test="${not empty cartinfo}">
        <c:forEach var="cartinfo" items="${cartinfo}">
            <div class="row flex2">
                <img src="https://picsum.photos/100/100" class="pe-20">
                                        
                
                <div class="left info">
                        <div>
                            <label>[브랜드명]:${cartinfo.productBrand} </label> <label>${cartinfo.productName}</label>
                        </div>
                        
                        <label>상품가격: ${cartinfo.productPrice}</label>
                        <div>
                                <label>상품수량:${cartinfo.productCount}</label>
                        </div>
                </div>
                    
            </div>
            </c:forEach>
        </c:if>
    
    <!-- 배송지부분 -->
           <div class="row left">
                <div class="row">
                    <h2>배송지</h2>
                    <button class="pop-btn form-btn small2 neutral" type="button">배송지 불러오기</button> 
               </div>
               <div class="row">
                   <p>받는사람</p>
                   <input type="text" class="form-input light w-100 medium" name="orderRecever">
               </div>

               <div class="row">
                   <p>연락처</p>
                   <input type="text" class="form-input light w-100 medium" name="orderReceivePhone">
               </div>

               <div class="row">
                   <p>주소</p>
                   <input type="text" class="form-input light medium w-50" name="orderPost" placeholder="우편번호">
                   <button class="form-btn medium positive address-btn" type="button">우편번호찾기</button>
               </div>

               <div class="row">
                   <p></p>
                   <input type="text" class="form-input light medium w-100" name="orderBasicAddr" placeholder="기본주소" readonly>
               </div>

               <div class="row">
                   <input type="text" class="form-input light medium w-100" name="orderDetailAddr" placeholder="상세주소">
               </div>

               <div class="row">
                   <p>배송요청사항</p>
                   <input type="text" class="form-input light medium w-100" name="orderRequest">
               </div>
           </div>
           </div>

      <!-- 결제정보 -->
       <div class="w-30">
       <c:set var="payment" value="${cartinfo}" scope="page" />
           <div>
               <p><h2>결제정보</h2></p>
               <p><label>적립금</label></p>
                    <input type="text" class="form-input small2 light" name="orderUserPoint" value="0">
                    <button class="form-btn positive medium apply" type="button">적용</button>
               <p class="right">적용가능한 적립금: <span>${point}원</span></p>


               <div class="row order">
                <div class="pt-30">
                    <table>
                        <tr>
                          <td>제품금액:</td>
                          <td></td>
                          
                        </tr>
                        <tr>
                          <td>배송비:</td>
                          <td>3,000원</td>
                        </tr>
                        <tr>
                          <td>적립금:</td>
                          <td>0원</td>
                        </tr>
                        <tr>
                          <td>총 결제금액:</td>
                          <td>원</td>
                        </tr>
                    </table>
                </div>
                  
            </div>


               <h2>결제수단</h2>
                <div>
                        <div>
                            <input type="checkbox" name="option" > 신용 / 체크카드
                        </div>

                        <div>
                            <input type="checkbox" name="option" > 무통장 입금
                        </div>
                        <div>
                            <input type="checkbox" name="option" > 에스크로 (실시간 계좌이체)
                        </div>
                        <div>
                            <input type="checkbox" name="option" > 휴대폰 결제
                        </div>
                </div>
               <div>
                   <button class="form-btn positive large w-100 mt-30" type="submit" >결제하기</button>
               </div>
           </div>
       </div>
       
  </div>     
       </form>
</div>


</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>