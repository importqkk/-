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
	        $(".insert-btn").click(function(){
	            window.open("popInsert",  "popupNo1", "width=460, height=500");       
	        });
	    });  
        
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
                <h2 style="display: inline-block;">배송지 변경</h2>
                <button class="insert-btn" style="display: inline-block;">신규 배송지 등록</button>
              </div>
        </div>
        <div style="border: 1px solid black; width: 500px; padding: 10px;">
            <div>이름</div>
            <div>
                주소
            </div>
            <div>
                번호
            </div>
            <div>
                요청사항
            </div>
            <div>
                <button>선택</button>
            </div>
        </div>
    </div>
</body>
</html>