<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="defaiutInfo" value="${defaiutInfo}" scope="page" />
<c:set var="listSize" value="${fn:length(allInfo)}" />
<c:set var="count" value="0" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/static/css/load.css">
	    <!-- font awsome ������ -->
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
	    <!-- tabler ������ -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/test.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="EUC-KR">
<title>��������� �˾�</title>
	<style>
		
		.flex {
            display: flex;

            justify-content: space-between;
        }
        .flex2{
            display: flex;
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
        .pop-100 {
		    
		    margin: 2em;
		}
    </style>
	<script type="text/javascript">
	
	//�˾�â����
		//�߰���ư Ŭ���� �˾��ϳ������
		$(function( ){
	        
	        //��ư Ŭ���� �ش� ����� ���� �θ�â���� �ѱ�
	        $(".select-btn").click(function() {
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
	
		$(document).on("click", ".delete-btn", function() {
			  var index = $(this).data("index");
			  $("#myForm").append('<input type="hidden" name="deleteIndex" value="' + index + '">');
			  $("#myForm").submit();
			});
		
        
    </script>
    <script type="text/javascript">

    	    $(document).ready(function(){
    	        $(".insert-btn").click(function(){
    	            var size = ${listSize};
    	            if(size == 3){
    	                alert("�ִ� ���� ���� �ּ����� 3���Դϴ�.");
    	            } else {
    	                window.open("popInsert", "popupNo1", "width=530, height=500");
    	            }
    	            console.log(${listSize});
    	        });
    	    });
    	    
    	    

	</script>

</head>
<body>

    <div class="pop-100">
        
            <div class="row flex">
                <h2>����� ����</h2>
                <button class="row  insert-btn form-btn small2 neutral pt-50">�ű� ����� ���</button>
                
              </div>
      
       	 
	        
	        
	   <form id="myForm" action="/order/popup" method="post">
	     <c:forEach var="allInfo" items="${allInfo}" varStatus="loop">
	        	<div class="mt-20" style="border: 2px solid rgb(119,107,255) ; width: 500px; padding: 10px;">
	            	<div class="row">
	            		<h2>${allInfo.memberName} ���� �����</h2> 
	            		<hr>
	            		������: <span class="ms-20" id="orderRecever${loop.index}">${allInfo.memberName}</span>
	            	</div>
	            	
		            <div class="row">
		            	��ȭ��ȣ: <span class="ms-10" id="orderReceivePhone${loop.index}">${allInfo.memberPhone}</span>
		            </div>
		            
		            <div class="row">
		           		�ּ�:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(<span class="" id="orderPost${loop.index}">${allInfo.memberPost}</span>)	     <span id="orderBasicAddr${loop.index}">${allInfo.memberBasicAddr}</span>  	<span id="orderDetailAddr${loop.index}">${allInfo.memberDetailAddr}</span>		           
		            </div>
		            
		            <div class="row">
		           		 ��û����: <span class="ms-10" id="orderRequest${loop.index}">${allInfo.orderRequest}</span>
		            </div>
		           
		            <div>
		                <button class="select-btn form-btn small2 positive" type="submit" data-index="${loop.index}">����</button>
		                <button class="delete-btn form-btn small2 positive" type="button" data-index="${loop.index}">����</button>
		            </div>
		        </div>
  		</c:forEach>
	</form>
    </div>
</body>
</html>