<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    </style>
    <script type="text/javascript">
    $(function(){
    		  // 주문 페이지가 열리면, 서버에서 수량 정보 가져오기
    		  $.ajax({
    		    type: 'GET',
    		    url: '/rest/quantity',
    		    data: {'productNo': productNo},
    		    success: function(data) {
    		      // 수량 정보가 있으면, 해당 정보로 업데이트
    		      if (data) {
    		        $(".number").text(data.quantity);
    		        $(".total-price").text(data.quantity * productPrice + 3000);
    		        console.log(productNo);
    		      }
    		    },
    		    error: function(xhr, status, error) {
    		      console.log("에러다에러");
    		    }
    
    });
    
</head>
<body test>
 <div class="container-1000">
        <div class="flex">
            <div class=" w-60 pt-20">
                <p><h2>주문상품</h2></p>
                
                <div class="row flex">
                    <img src="https://picsum.photos/100/100" class="pe-20">
                    
                </div>
                <div class="row left">
                    <p><h2>배송지</h2></p>
                    <div class="row">
                        <p>받는사람</p>
                        <input type="text" class="form-input light w-100 medium">
                    </div>

                    <div class="row">
                        <p>연락처</p>
                        <input type="text" class="form-input light w-100 medium">
                    </div>

                    <div class="row">
                        <p>이메일</p>
                        <input type="text" class="form-input light medium w-100 ">
                    </div>

                    <div class="row">
                        <p>주소</p>
                        <input type="text" class="form-input light medium w-50" placeholder="우편번호">
                        <button class="form-btn medium positive">우편번호찾기</button>
                    </div>

                    <div class="row">
                        
                        <input type="text" class="form-input light medium w-100" placeholder="기본주소" readonly>
                    </div>

                    <div class="row">
                        <input type="text" class="form-input light medium w-100" placeholder="상세주소">
                    </div>

                    <div class="row">
                        <p>배송요청사항</p>
                        <input type="text" class="form-input light medium w-100">
                    </div>
                </div>

            </div>
            <div class="orderscroll w-30">
                <div>
                    
                    <p><h2>결제정보</h2></p>
                    <p><label>적립금</label></p>
                    <input type="text" class="form-input medium light">
                    <button class="form-btn positive medium">전액</button>
                    <p class="right">보유 적립금: <span>3000원</span></p>
                    <div class="row abc">
                        <label>제품금액: <span>3000원</span></label>
                        <div>
                            <label>배송비 : <span class="right">${productDto.productdeliveryprice}</span></label>
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
                        <input type="checkbox"> 신용 / 체크카드
                    </div>
    
                    <div>
                        <input type="checkbox"> 무통장 입금
                    </div>
                    <div>
                        <input type="checkbox"> 에스크로 (실시간 계좌이체)
                    </div>
                    <div>
                        <input type="checkbox"> 휴대폰 결제
                    </div>
    
                    <div>
                        <button class="form-btn positive large w-100">결제하기</button>
                    </div>
                </div>
            </div>
            
           

    </div>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>