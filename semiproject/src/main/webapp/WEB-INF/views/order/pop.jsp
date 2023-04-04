<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
       <!-- font awsome 아이콘 -->
       <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
       <!-- tabler 아이콘 -->
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
       <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
       <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
       <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
       <link rel="stylesheet" type="text/css" href="/static/css/test.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="EUC-KR">
<title>배송지관리 팝업</title>
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

          
       });  
   $(function( ){
      $(".delete-btn").click(function() {
           var index = $(this).data("index");
           
             
           $("#myForm").append('<input type="hidden" name="name" value="' + $('span#orderRecever'+index).text() + '">');
           $("#myForm").append('<input type="hidden" name="phone" value="' + $('span#orderReceivePhone'+index).text() + '">');
           $("#myForm").append('<input type="hidden" name="post" value="' + $('span#orderPost'+index).text() + '">');
           $("#myForm").append('<input type="hidden" name="basic" value="' + $('span#orderBasicAddr'+index).text() + '">');
           $("#myForm").append('<input type="hidden" name="request" value="' + $('span#orderRequest'+index).text() + '">');
           $("#myForm").attr("action", "/order/popDelete");
             $("#myForm").attr("method", "post");
           
         });
   });
        
    </script>
    <script type="text/javascript">

           $(function() {
             $(".insert-btn").click(function(){
                   var size = ${listSize};
                   if(size == 3){
                       alert("최대 저장 가능 주소지는 3개입니다.");
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
                <h2>배송지 변경</h2>
                <button class="row  insert-btn form-btn small2 neutral pt-50">신규 배송지 등록</button>
                
              </div>
      
           
           
           
      <form id="myForm" action="/order/popup" method="post">
        <c:forEach var="allInfo" items="${allInfo}" varStatus="loop">
              <div class="mt-20" style="border: 2px solid rgb(119,107,255) ; width: 500px; padding: 10px;">
                  <div class="row">
                     <h2>${allInfo.memberName} 님의 배송지</h2> 
                     <hr>
                     수령인: <span class="ms-20" id="orderRecever${loop.index}">${allInfo.memberName}</span>
                  </div>
                  
                  <div class="row">
                     전화번호: <span class="ms-10" id="orderReceivePhone${loop.index}">${allInfo.memberPhone}</span>
                  </div>
                  
                  <div class="row">
                       주소:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(<span class="" id="orderPost${loop.index}">${allInfo.memberPost}</span>)        <span id="orderBasicAddr${loop.index}">${allInfo.memberBasicAddr}</span>     <span id="orderDetailAddr${loop.index}">${allInfo.memberDetailAddr}</span>                 
                  </div>
                  
                  <div class="row">
                        요청사항: <span class="ms-10" id="orderRequest${loop.index}">${allInfo.orderRequest}</span>
                  </div>
                 
                  <div>
                      <button class="form-btn small2 positive select-btn" data-index="${loop.index}">선택</button>
                      <button class="form-btn small2 positive delete-btn" data-index="${loop.index}">삭제</button>
                  </div>
              </div>
        </c:forEach>
   </form>
    </div>
</body>
</html>