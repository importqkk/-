<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="defaiutInfo" value="${defaiutInfo}" scope="application" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
    </style>
	<script type="text/javascript">
		$(function( ){
	        $(".insert-btn").click(function(){
	            window.open("popInsert",  "popupNo1", "width=460, height=500");       
	        });
	        
	        $(".btn").click(function() {
	            // form ������ �߰� ���� (�ռ� ������ ����)
				opener.document.getElementsByName('orderRecever')[0].value = $('input[name="orderRecever"]').val();
				opener.document.getElementsByName('orderReceivePhone')[0].value = $('input[name="orderReceivePhone"]').val();
				opener.document.getElementsByName('orderPost')[0].value = $('input[name="orderPost"]').val();
				opener.document.getElementsByName('orderBasicAddr')[0].value = $('input[name="orderBasicAddr"]').val();
				opener.document.getElementsByName('orderDetailAddr')[0].value = $('input[name="orderDetailAddr"]').val();
				opener.document.getElementsByName('orderRequest')[0].value = $('input[name="orderRequest"]').val();
	            
	            
	            window.close(); // �˾�â �ݱ�
	          });
	       
	    });  
        
    </script>
    <script type="text/javascript">
   
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
       	 
	        
	        
	   <form id="myForm" action="/order/buy" method="get">
	     <c:forEach var="allInfo" items="${allInfo}">
	        	<div style="border: 1px solid black; width: 500px; padding: 10px;">
	            	<div>
	            		<input type="text" name="orderRecever" readonly style="border: none;" value="${allInfo.memberName}" >
	            	</div>
		            <div>
		            	<input type="text" name="orderReceivePhone" readonly style="border: none;" value="${allInfo.memberPhone}">
		                
		            </div>
		            <div>
		           		<input type="text" name="orderPost" readonly style="border: none;" value="${allInfo.memberPhone}">
		           		<input type="text" name="orderBasicAddr" readonly style="border: none;" value="${allInfo.memberBasicAddr}">
		           		<input type="text" name="orderDetailAddr" readonly style="border: none;" value="${allInfo.memberDetailAddr}">
		           		
		           	 
		                
		            </div>
		            <div>
		           		 <input type="text" name="orderRequest" readonly style="border: none;" value="${allInfo.orderRequest}">
		            </div>
		            <div>
		                <button class="btn" type="button">����</button>
		            </div>
		        </div>
  		</c:forEach>
	</form>
    </div>
</body>
</html>