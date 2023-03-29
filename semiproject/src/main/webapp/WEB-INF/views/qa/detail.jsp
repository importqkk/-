<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<%-- 계정주인과 글쓴이 비교 필요--%>
<%--
<script> 	
var memberId = "${sessionScope.memberId}"; 
var memberId = "${qaDto.memberId}"; 
</script>
--%>

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
			var editTemplate = $("#edit-template").html();
	        var editHtml = $.parseHTML(editTemplate);
	        $(editHtml).find("head").val();
	        $(editHtml).find("textarea").val();
	        $(editHtml).find(".cancel-btn").click(function(){
	            //this == 취소버튼
	            $(this).parents(".edit-panel").hide()
	                        .next(".view-panel").show();
	        });
	        $(".target").append(editHtml);

	        var viewTemplate = $("#view-template").html();
	        var viewHtml = $.parseHTML(viewTemplate);
	        $(viewHtml).find(".contents").text(data.qaContent);
	        $(viewHtml).find(".edit-btn").click(function(){
	            //this == 수정버튼

	            //(+추가)
	            //글자 유지하도록 처리
	            //= 버튼앞에 .contents에 작성된 글자 불러와서
	            //= .edit-panel에 있는 textarea에 설정
	            var contents = $(this).prev(".contents").text();
	            $(this).parents(".view-panel")
	                    .prev(".edit-panel")
	                    .find("textarea")
	                    .val(contents);
	                    
	            $(this).parents(".view-panel").hide()
	                        .prev(".edit-panel").show();
		        });
		        $(viewHtml).find(".delete-btn").click(function(){
		            var choice = window.confirm("정말 삭제하시겠습니까?");
		                        if(choice == false) return;
		                        //var no = $(this).parent().prev().prev().prev().text();
		                        //var no = $(this).attr("data-no");
		                        var no = $(this).data("no");//읽기만 가능 
		        });
		        
// 		        게시물 수정 코드...

/*
		        $(".edit-panel button[type='submit']").click(function() {
		            var editedContent = $(this).siblings("textarea").val(); // textarea의 값 가져오기
		            var qaNo = "${qaDto.qaNo}"; // 수정할 QA 글 번호
		            $.ajax({
		                url: "/qa/update",
		                type: "POST",
		                data: {
		                    "qaNo": qaNo,
		                    "qaContent": editedContent
		                },
		                success: function(data) {
		                    // 수정이 성공적으로 완료되었을 때 처리할 코드 작성
		                },
		                error: function(xhr, status, error) {
		                    // 수정이 실패했을 때 처리할 코드 작성
		                }
		            });
		        });
*/

		        $(".target").append(viewHtml);
		    
	
		    	$(".edit-panel").hide();
		},
	   error: function(request,status,error){
		   alert("조회 실패");
			}
	 });//ajax end
});

</script>
    <!-- 편집용 템플릿 -->
    <script type="text/template" id="edit-template">
        <div class="edit-panel right">
			<div class="contents left">
			<div class="left font-h1">${qaDto.qaHead}</div>
			<div class="left font-h1">${qaDto.qaTitle}</div>
            <textarea class="form-input large w-100 font-h2"></textarea></div>
            <button type="submit" class="form-btn positive">저장</button>
            <button class="form-btn neutral cancel-btn ms-20">취소</button>
        </div>
    </script>
    <!-- 표시용 템플릿 취소 했는데 삭제가 됨-->
    <script type="text/template" id="view-template">
        <div class="view-panel right" style="min-height:150px;">
			<div class="left font-h1">${qaDto.qaHead}</div>
			<div class="left font-h1">${qaDto.qaTitle}</div>
			<div class="contents left font-h2">${qaDto.qaContent}</div>
            <a class="form-btn neutral edit-btn">수정</a>
            <a class="form-btn neutral ms-20 delete-btn" href="/qa/delete?qaNo=${qaDto.qaNo}">삭제</a>
            <a class="form-btn neutral ms-20" href="/qa/list">목록으로</a>
        </div>
    </script>
<div class="container-1000">
        <div class="row">
            <h1>Q&A 상세</h1>
        </div>
        <div class="row target">
        </div>
    </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>