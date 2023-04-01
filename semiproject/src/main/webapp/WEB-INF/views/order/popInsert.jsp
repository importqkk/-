<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="EUC-KR">
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
           
        
        $(function( ){
            $("#request").on("change", function(){
                var selectedValue = $(this).val();
                // 선택된 값이 "etc"인 경우, 텍스트 영역을 나타냅니다.
                if(selectedValue === "etc"){
                    $("#etc-text").show();
                }else{
                    $("#etc-text").hide();
                 }
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
        <div>
            <div><label>수령인</label> <input type="text"></div>
            <div>
                <label>휴대전화</label> <input type="text">
            </div>

            <div>
                <label>주소</label>
                <input type="text"> <button>검색</button>
            </div>
            <div>
                <input type="text">
            </div>
            <div>
                <input type="text">
            </div>

            <div>
                요청사항
                <select name="request" id="request">
                    <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                    <option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요</option>
                    <option value="부재 시 집 앞에 놔주세요">부재 시 집 앞에 놔주세요</option>
                    <option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
                    <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.">파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.</option>
                    <option value="etc">직접입력</option>
                    <textarea name="etc-text" id="etc-text" cols="57" rows="5" style="display:none"></textarea>
                </select>
            </div>
        </div>
    </div>
</body>
</html>