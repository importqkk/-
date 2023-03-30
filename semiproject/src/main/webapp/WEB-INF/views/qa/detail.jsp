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
	        $(editHtml).find(".save-btn").click(function(){
	            //this == 저장버튼
	            var editedContent = $(this).parents(".edit-panel").find("textarea").val();
	            $.ajax({
	                url:"/qa/detail",
	                type:"PUT",
	                data:{
	                    "qaNo": qaNo,
	                    "qaContent": editedContent
	                },
	                dataType:"json",
	                cache:false,
	                success: function(data){
	                    // 수정 성공했을 때 처리할 코드 작성
	                    alert("수정되었습니다.");
	                    $(this).parents(".edit-panel").hide().next(".view-panel").show().find(".contents").text(editedContent);
	                }.bind(this),
	                error: function(request,status,error){
	                    // 수정 실패했을 때 처리할 코드 작성
	                    alert("수정 실패");
	                }
	            });
	            $(this).parents(".edit-panel").hide().next(".view-panel").show().find(".contents").text(editedContent);
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
		                        
		                        // a 태그 기본 동작 막기
		    		            event.preventDefault();
		    		            
		    	// AJAX 요청으로 게시물 삭제하기
		    	$.ajax({
		    		   url: "/qa/delete",
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
            <button type="submit" class="form-btn positive save-btn">저장</button>
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
            <a class="form-btn neutral ms-20 delete-btn">삭제</a>
            <a class="form-btn neutral ms-20" href="/qa/list">목록으로</a>
        </div>
    </script>
<div class="container-1000">
        <div class="row">
            <h1>Q&A 상세</h1>
        </div>
        <div class="row target">
        </div>
        
		<hr>
        <br>
        <!-- 댓글 작성란 -->
	<div class="row">
		
		<div class="row">
			<c:choose>
				<c:when test="${sessionScope.memberId != null}">
					<textarea name="replyContent" class="form-input w-100"
							placeholder="댓글 내용을 작성하세요"></textarea>	
				</c:when>
				<c:otherwise>
					<textarea name="replyContent" class="form-input w-100"
							placeholder="로그인 후에 댓글 작성이 가능합니다" disabled></textarea>	
				</c:otherwise>
			</c:choose>
			
		</div>
		<c:if test="${sessionScope.memberId != null}">		
		<div class="row right">
			<button type="button" class="form-btn positive reply-insert-btn">댓글 작성</button>
		</div>
		</c:if>

	</div>
	
	
	<div class="row right">
		<a class="form-btn positive" href="/qa/write?qaParent=${qaDto.qaNo}">답글쓰기</a>
		
		<c:if test="${owner}">
		<!-- 내가 작성한 글이라면 수정과 삭제 메뉴를 출력 -->
		<a class="form-btn neutral" href="/qa/edit?qaNo=${qaDto.qaNo}">수정</a>
		</c:if>
		
		<c:if test="${owner || admin}">
		<!-- 파라미터 방식일 경우의 링크 -->
		<a class="form-btn neutral" href="/qa/delete?qaNo=${qaDto.qaNo}">삭제</a>
		<!-- 경로 변수 방식일 경우의 링크 -->
	<%-- 				<a href="/qa/delete/${qaDto.qaNo}">삭제</a> --%>
		</c:if>
		<a class="form-btn neutral" href="/qa/list">목록보기</a>
	</div>
    </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>