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
<title>��������� �˾�</title>
	<style>
    </style>
	<script type="text/javascript">
	
	//�˾�â����
		//�߰���ư Ŭ���� �˾��ϳ������
		$(function( ){
	        $(".insert-btn").click(function(){
	            window.open("popInsert",  "popupNo1", "width=460, height=500");       
	        });
	        //��ư Ŭ���� �ش� ����� ���� �θ�â���� �ѱ�
	        $(".btn").click(function() {
	            //�ε��� ���� �޾Ƽ� ������
	            var index = $(this).data("index");
	            //�ش� �ε��������� �̸��� �־ �ҷ���
				opener.document.getElementsByName('orderRecever')[0].value = $('span#orderRecever'+index).text();
				opener.document.getElementsByName('orderReceivePhone')[0].value = $('span#orderReceivePhone'+index).text();
				opener.document.getElementsByName('orderPost')[0].value = $('span#orderPost'+index).text();
				opener.document.getElementsByName('orderBasicAddr')[0].value = $('span#orderBasicAddr'+index).text();
				opener.document.getElementsByName('orderDetailAddr')[0].value = $('span#orderDetailAddr'+index).text();
				opener.document.getElementsByName('orderRequest')[0].value = $('span#orderRequest'+index).text();
	            
	            
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
	     <c:forEach var="allInfo" items="${allInfo}" varStatus="loop">
	        	<div style="border: 1px solid black; width: 500px; padding: 10px;">
	            	<div>
	            		
	            		<h2>${allInfo.memberName} ���� �����</h2> 
	            		������: <span id="orderRecever${loop.index}">${allInfo.memberName}</span>
	            	</div>
	            	
		            <div>
		            	��ȭ��ȣ: <span id="orderReceivePhone${loop.index}">${allInfo.memberPhone}</span>
		            </div>
		            
		            <div>
		           		�ּ�:(<span id="orderPost${loop.index}">${allInfo.memberPost}</span>)	     <span id="orderBasicAddr${loop.index}">${allInfo.memberBasicAddr}</span>  	<span id="orderDetailAddr${loop.index}">${allInfo.memberDetailAddr}</span>		           
		            </div>
		            
		            <div>
		           		 <span id="orderRequest${loop.index}">${allInfo.orderRequest}</span>
		            </div>
		            
		            <div>
		                <button class="btn" type="button" data-index="${loop.index}">����</button>
		            </div>
		            
		        </div>
  		</c:forEach>
	</form>
    </div>
</body>
</html>