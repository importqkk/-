-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
<head>
<title>Insert title here</title>
	<style>
	
    </style>
    <!-- 우편주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/static/js/find-address.min.js"></script>
	<!-- 우편주소 api -->
	
	<script type="text/javascript">
$(function(){
		
        //주소 
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
    
    
</head>
<body test>
 <div class="container-1000">
  		<form name="product" action="/order/buy" method="post">
        <div class="flex">
            <div class=" w-70 pt-20">
                <p><h2>주문상품</h2></p>
            <c:forEach var="cartinfo" items="${cartinfo}">
                <div class="row flex">
                    <img src="https://picsum.photos/100/100" class="pe-20">
                								
						<label>상품이름: ${cartinfo.productName}</label>
						<label>브랜드명: ${cartinfo.productBrand}</label>		
						<label>상품가격: ${cartinfo.productPrice}</label>
						<label>상품수량: ${cartinfo.productCount}</label>
						
                </div>
               </c:forEach>
         
                <div class="row left">
         
                   	<div class="flex"> 
                   	<h2 class="w-80">배송지</h2>
                   	 주문자 정보 가져오기<input type="checkbox" class="post-check w-10"> </div> 
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
                        <input type="text" class="form-input light medium w-100" id="orderRequest">
                    </div>
				
                </div>
                </div>
           
            <div class="orderscroll w-30">
          		
                <div>
                    
                    <p><h2>결제정보</h2></p>
                    <p><label>적립금</label></p>
                    <input type="text" class="form-input medium light" name="orderUserPoint" value="0" min="0">
                    <button class="form-btn positive medium" type="button">전액</button>
                    <p class="right">보유 적립금: <span>3000원</span></p>
                    <div class="row abc">
                        <label>제품금액: <span>3000원</span></label>
                        <div>
                            <label>배송비 : <span class="right">1000</span></label>
                        </div>
                        <div> 
                            <label>적립금 : <span class="right">1000원</span></label>
    
                        </div>
                        <div>
                            <label>총 결제금액 : <span class="right">0원</span></label>
                        </div>
                    </div>
                    <h2>결제수단</h2>
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
    		
                    <div>
                        <button class="form-btn positive large w-100" type="submit" >결제하기</button>
                    </div>
                </div>
            </div>
            
       </div>     
                </form>
	
    </div>


</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>