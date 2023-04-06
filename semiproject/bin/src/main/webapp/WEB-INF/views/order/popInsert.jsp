-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- 우편주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/find-address.min.js"></script>
	<!-- 우편주소 api -->
<title>Insert title here</title>
<style>
        
        #request {
            margin-bottom: 10px;
        }

        #etc-text {
            display: block;
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

</head>
<body>
    <div>
        <div>
            <div>
                <h2>신규배송지</h2>
              </div>
        </div>
        <!-- 방법을 모르겠어서 form으로 보냄 .. -->
       <form action="/order/popInsert" method="post">
        <div>
            <div><label>수령인</label> <input type="text" name="memberName"></div>
            <div>
                <label>휴대전화</label> <input type="text" name="memberPhone">
            </div>

            <div>
                <label>주소</label>
                <input type="text" name="memberPost"> <button class="address-btn" type="button">검색</button>
            </div>
            <div>
                <input type="text" name="memberBasicAddr">
            </div>
            <div>
                <input type="text" name="memberDetailAddr">
            </div>

            <div>
                요청사항
                <select name="orderRequest" id="orderRequest">
                    <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                    <option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요</option>
                    <option value="부재 시 집 앞에 놔주세요">부재 시 집 앞에 놔주세요</option>
                    <option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
                    <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.">파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.</option>
                    <option value="etc">직접입력</option>
                    <textarea name="etc-text" id="etc-text" cols="57" rows="5" style="display:none"></textarea>
                </select>
            </div>
            <button class="btn" type="submit">등록하기</button>
        </div>
        </form>
    </div>
</body>
</html>