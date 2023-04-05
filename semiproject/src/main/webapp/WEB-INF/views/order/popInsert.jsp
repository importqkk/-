<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/static/css/load.css">
<!-- font awesome 아이콘 -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<!-- tabler 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/reset.css">
<link rel="stylesheet" type="text/css" href="/static/css/layout.css">
<link rel="stylesheet" type="text/css" href="/static/css/commons.css">
<link rel="stylesheet" type="text/css" href="/static/css/test.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- 우편주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/static/js/find-address.min.js"></script>
<!-- 우편주소 api -->
<title>배송지 추가 팝업</title>
<style>
        
        #request {
            margin-bottom: 10px;
        }

        #etc-text {
            display: block;
        }
        .pop-100 {
		    
		    margin: 2em;
		}
		table {
		  border-spacing: 20px;
		}
		.qty-selector {
			font-size: 13px;
			padding-left: 1.3em;
		    padding-top: 0.75em;
		    padding-bottom: 0.75em;
		    text-align: left;
		    background:url('/static/image/down-arrow.png') no-repeat 96.5% 55%/11px auto;
		}
    </style>
    <script type="text/javascript">
           
        // option이 etc이면 textarea 선택
        $(function( ){
            $("#request").on("change", function(){
                var selectedValue = $(this).val();
            
                if(selectedValue === "etc"){
                    $("#etc-text").show();
                }else{
                    $("#etc-text").hide();
                 }
            });
            
            
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
                        
                        document.querySelector("[name=memberPost]").value = data.zonecode;
                        document.querySelector("[name=memberBasicAddr]").value = addr;
                        document.querySelector("[name=memberDetailAddr]").focus();
                    }
                    }).open();
            
        		});
        });
    </script>
	<script type="text/javascript">
	
	</script>
</head>
<body>
    <div class="pop-100">
        <div>
            <div>
                <h2>신규배송지</h2>
              </div>
        </div>
        <!-- 방법을 모르겠어서 form으로 보냄 .. -->
       <form action="/order/popInsert" method="post">
	       <div class="row">
	       		<label class="ps-10">수령인</label>
	       		<input type="text" class="form-input small w-100" name="memberName">
	       </div>
	       <div class="row">
	       		<label class="ps-10">휴대전화</label>
	       		<input type="text" class="form-input small w-100" name="memberPhone" placeholder="010XXXXXXXX">
	       </div>
	       <div class="row">
	       		<label class="ps-10 w-100">주소</label>
	       		<div class="flex">
	       			<input type="text" class="form-input small w-80 me-5" name="memberPost" placeholder="우편번호" required="required">
	       			<button class="address-btn form-btn small positive w-20" type="button">검색</button>
	       		</div>
	       </div>
	       <div class="row">
	       		<input type="text" class="form-input small w-100" name="memberBasicAddr" placeholder="기본주소" readonly="readonly">
	       </div>
	       <div class="row">
	       		<input type="text" class="form-input small w-100" name="memberDetailAddr" placeholder="상세주소">
	       </div>
	       <div class="row">
	       		<label class="ps-10">요청사항</label>
	       		<select name="orderRequest" id="orderRequest" class="qty-selector w-100">
			        <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
			        <option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요</option>
			        <option value="부재 시 집 앞에 놔주세요">부재 시 집 앞에 놔주세요</option>
			        <option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
			        <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.">파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.</option>
			        <option value="etc">직접입력</option>
		        </select>
		        <textarea name="etc-text" id="etc-text" cols="57" rows="5" style="display:none"></textarea>
	       </div>
	       <div class="row">
	       		<button class="btn form-btn small positive w-100" id="insert-btn" type="submit">등록하기</button>
	       </div>
        </form>
    </div>
</body>
</html>