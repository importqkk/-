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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="EUC-KR">
<title>배송지관리 팝업</title>
	<style>
    </style>
	<script type="text/javascript">
	
	//팝업창메인
		//추가버튼 클릭시 팝업하나더띄움
		$(function( ){
	        
	        //버튼 클릭시 해당 행들의 값을 부모창으로 넘김
	        $(".select-btn").click(function() {
	            //인덱스 값을 받아서 저장후
	            var index = $(this).data("index");
	            //해당 인덱스값들을 이름에 넣어서 불러옴
				opener.document.getElementsByName('orderRecever')[0].value = $('span#orderRecever'+index).text();
				opener.document.getElementsByName('orderReceivePhone')[0].value = $('span#orderReceivePhone'+index).text();
				opener.document.getElementsByName('orderPost')[0].value = $('span#orderPost'+index).text();
				opener.document.getElementsByName('orderBasicAddr')[0].value = $('span#orderBasicAddr'+index).text();
				opener.document.getElementsByName('orderDetailAddr')[0].value = $('span#orderDetailAddr'+index).text();
				opener.document.getElementsByName('orderRequest')[0].value = $('span#orderRequest'+index).text();
	            
	            
	            window.close(); // 팝업창 닫기
	          });

	       $(".delete-btn").click(function(){
	    	   var index = $(this).data("index");
	    	   var item = ${allInfo};
	    	   
	    	   item.splice(index, 1);
	       });
	    });  
	
	$(function(){
		
	})
        
    </script>
    <script type="text/javascript">

    	    $(document).ready(function(){
    	        $(".insert-btn").click(function(){
    	            var size = ${listSize};
    	            if(size == 4){
    	                alert("최대 저장 가능 주소지는 4개입니다.");
    	            } else {
    	                window.open("popInsert", "popupNo1", "width=460, height=500");
    	            }
    	            console.log(${listSize});
    	        });
    	    });

	</script>

</head>
<body>

    <div>
        <div>
            <div>
                <h2 style="display: inline-block;">배송지 변경</h2>
                <button class="form-btn insert-btn" style="display: inline-block;">신규 배송지 등록</button>
                ${listSize}
                
              </div>
        </div>
       	 
	        
	        
	   <form id="myForm" action="/order/buy" method="get">
	     <c:forEach var="allInfo" items="${allInfo}" varStatus="loop">
	        	<div style="border: 1px solid black; width: 500px; padding: 10px;">
	            	<div>
	            		<h2>${allInfo.memberName} 님의 배송지</h2> 
	            		수령인: <span id="orderRecever${loop.index}">${allInfo.memberName}</span>
	            	</div>
	            	
		            <div>
		            	전화번호: <span id="orderReceivePhone${loop.index}">${allInfo.memberPhone}</span>
		            </div>
		            
		            <div>
		           		주소:(<span id="orderPost${loop.index}">${allInfo.memberPost}</span>)	     <span id="orderBasicAddr${loop.index}">${allInfo.memberBasicAddr}</span>  	<span id="orderDetailAddr${loop.index}">${allInfo.memberDetailAddr}</span>		           
		            </div>
		            
		            <div>
		           		 <span id="orderRequest${loop.index}">${allInfo.orderRequest}</span>
		            </div>
		            
		            <div>
		                <button class="select-btn" type="button" data-index="${loop.index}">선택</button>
		                <button class="delete-btn" type="button" data-index="${loop.index}">삭제</button>
		            </div>
		        </div>
  		</c:forEach>
	</form>
    </div>
</body>
</html>