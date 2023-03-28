<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
		
      

<!-- 
	파일 전송은 input[type=file]로 한다
	GET방식은 용량제한 때문에 파일 전송이 불가능하며 이름만 전송
	POST방식은 용량제한은 없지만 전송이 불가능하며 이름만 전송
	
	POST 방식은 Encoding Type에 따라 두 가지로 나눠진다
	- application/x-www-form-urlencoded은 기본 방식이며 key=value 형태로 전송
	- key와 value가 1:1 연결되므로 파일과 같이 정보가 많을 때는 전송이 어렵다
	- 파일을 전송하고 싶다면 반드시 enctype="multipart/form-data"로 변경해야 한다
 -->

<div class="container-1000">
	<div class="row">
		<h1>이미지 파일 등록</h1>
	</div>
	<div class="row">
		<form action="upload" method="post" enctype="multipart/form-data">
			이미지 등록: <input type="file" name="attach" accept=".png, .gif, .jpg"><br><br>
			<button>등록</button>
		</form>
	</div>
</div>
<hr>
		
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>









