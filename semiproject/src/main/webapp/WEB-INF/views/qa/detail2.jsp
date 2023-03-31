<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
$(function(){
	let qaNo = "${qaDto.qaNo}";
	
	$.ajax({
		url:"/qa/detail",
		type:"POST",
		data:{"qaNo": qaNo},
		dataType:"json",
		cache:false,
		success: function(data){
			var reEditTemplate = $("#reEdit-template").html();
	        var reEditHtml = $.parseHTML(reEditTemplate);
	        $(reEditHtml).find("head").val();
	        $(reEditHtml).find(".textarea2").val();
	        $(reEditHtml).find(".cancel-btn").click(function(){
	            //this == 취소버튼
	            $(this).parents(".reEdit-panel").hide()
	                        .next(".reView-panel").show();
	        });
	        $(reEditHtml).find(".save-btn").click(function(){
	            //this == 저장버튼
	            var reEditedAnswer = $(this).parents(".reEdit-panel").find(".textarea2").val();

	            $.ajax({
	                url:"/qa/update",
	                type:"PUT",
	                data:{
	                    "qaNo": qaNo,
	                    "qaAnswer": reEditedAnswer
	                },
	                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	                cache:false,
	                success: function(data){
	                    // 수정 성공했을 때 처리할 코드 작성
	                    alert("수정사항이 저장되었습니다.");
	                    $(this).parents(".reEdit-panel").hide().next(".reView-panel").show()
	                    			.find(".answer").text(reEditedAnswer);
	                }.bind(this),
	                error: function(request,status,error){
	                    // 수정 실패했을 때 처리할 코드 작성
	                    alert("수정실패");
	                }
	            });
	        });
	        $(".target2").append(reEditHtml);

	        
	        var reViewTemplate = $("#reView-template").html();
	        var reViewHtml = $.parseHTML(reViewTemplate);
	        $(reViewHtml).find(".answer").text(data.qaAnswer);
	        $(reViewHtml).find(".reEdit-btn").click(function(){
	            //this == 수정버튼
	            var answer = $(this).prev(".answer").text();
	            $(this).parents(".reView-panel")
	                    .prev(".reEdit-panel")
	                    .find(".textarea2")
	                    .val(answer);
	                    
	            $(this).parents(".reView-panel").hide()
	                        .prev(".reEdit-panel").show();
		        });
	        
	        
		        $(reViewHtml).find(".reDelete-btn").click(function(){
		            var choice = window.confirm("정말 삭제하시겠습니까?");
		                        if(choice == false) return;
		                        
		                        // a 태그 기본 동작 막기
		    		            event.preventDefault();
		    		            
		    	// AJAX 요청으로 게시물 삭제하기
		    	$.ajax({
		    		   url: "/qa/reDelete",
		    		   type: "GET",
		    		   data: {
		    		       "qaNo": qaNo
		    		   },
		    		   success: function(data) {
		    		       // 삭제가 성공적으로 완료되었을 때 처리할 코드 작성
		    		       alert("삭제되었습니다.");
		    		       window.location.href="/qa/list";
		    		   },
		    		   error: function(xhr, status, error) {
		    		       // 삭제가 실패했을 때 처리할 코드 작성
		    		       alert("삭제 실패");
		    		   }
		     });	
		 });
		        $(".target2").append(reViewHtml);
	
		    	$(".reEdit-panel").hide();
		},
	   error: function(request,status,error){
		   alert("조회 실패");
			}
	 });//ajax end
});
</script>


 <!-- 답글편집용 템플릿 -->
    <script type="text/template" id="reEdit-template">
		<div class="reEdit-panel right">
			<textarea class="form-input large w-100 font-h2 textarea2"></textarea></div>
        	<button type="submit" class="form-btn positive reSave-btn">저장</button>
        	<button class="form-btn neutral cancel-btn ms-20">취소</button
		</div>
    </script>
    
     <!-- 답글표시용 템플릿 -->
    <script type="text/template" id="reView-template">
		<div class="reView-panel right">
			<div class="contents left font-h2">${qaDto.qaAnswer}</div>
        	<a class="form-btn neutral ReEdit-btn">수정</a>
        	<a class="form-btn neutral ms-20 ReDelete-btn">삭제</a>
        	<a class="form-btn neutral ms-20" href="/qa/list">목록으로</a>
		</div>
    </script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>