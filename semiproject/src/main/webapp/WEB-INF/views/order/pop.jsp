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
                // ���õ� ���� "etc"�� ���, �ؽ�Ʈ ������ ��Ÿ���ϴ�.
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
                <h2 style="display: inline-block;">����� ����</h2>
                <button class="insert-btn" style="display: inline-block;">�ű� ����� ���</button>
              </div>
        </div>
        <div style="border: 1px solid black; width: 500px; padding: 10px;">
            <div>�̸�</div>
            <div>
                �ּ�
            </div>
            <div>
                ��ȣ
            </div>
            <div>
                ��û����
            </div>
            <div>
                <button>����</button>
            </div>
        </div>
    </div>
</body>
</html>