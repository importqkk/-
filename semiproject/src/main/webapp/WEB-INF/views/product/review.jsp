<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/static/css/review.css">
<script>
	var memberId = "${sessionScope.memberId}";
	var reviewNo = "${reviewLikeDto.reviewNo}";
</script>
<script src="/static/js/review.js"></script>
<script type="text/template" id="review-template">
	<div class="review-item">
		<div class="memberId"></div>
		<div class="flex w-100">
			<div class="w-50">
				<div class="reviewStar w-33 left"></div> 
			</div>
			<div class="w-50">
				<div class="changeText right">
					<span class="text edit-text">수정</span>
					<span class="text delete-text">삭제</span>
				</div>
				<div class="reviewTime right"></div>
			</div>
		</div>
		<div class="reviewContent"></div>
		<div class="reviewLike">
			<span class="heart-count">${reviewDto.reviewLike}</span>
		</div>
	</div>
</script>

<script type="text/template" id="review-edit-template">
	<div class="edit-panel">
		<div class="reviewStar"></div>

		<div class="row review-edit-content">
            <textarea name="reviewContent" class="form-input w-100 semi-round" style="min-height:100px"></textarea>
        </div>

		<div class="flex w-100 btn-panel">
			<div class="w-50">
                <label class="input-file-button" for="chooseFile">
                    사진등록
                </label>
                <input type="file" id="chooseFile" name="attach" class="form-input w-10">
        	</div>
			<div class="flex w-50 right">
                <button type="button" class="form-btn small neutral review-cancel-btn me-10">취소</button>
                <button type="button" class="form-btn small positive review-edit-btn">수정</button>
            	</div> 
		</div>
	</div>
</script>
<script>
$(function(){
    $(".review-content").hide();
    $(".btn-panel").hide();
    $(".review-star").hide();
    $(".edit-btn").click(function(){
      if (${hasBuyHistory}) {
        $(".view-panel").hide();
        $(".review-content").show();
        $(".btn-panel").show();
        $(".review-star").show();
        if (${reviewDto != null}){
            alert("구매 당 1회의 리뷰만 작성할 수 있습니다");
            $(".review-content").hide();
            $(".btn-panel").hide();
            $(".review-star").hide();
            $(".view-panel").show();
        }
      } else if (${memberId == null}){
    	  alert("로그인 후 리뷰를 작성할 수 있습니다");
      } else {
        alert("해당 상품을 구매한 이력이 있는 회원만 리뷰를 작성할 수 있습니다");
      }
      
  })
    $(".cancel-btn").click(function(){
    $(".view-panel").show();
    $(".review-content").hide();
    $(".btn-panel").hide();
    $(".review-star").hide();
  })    
});
</script>
	
    <div class="container-1000">
    	<div class="row">
    	</div>
		
		<!-- 리뷰 등록창 -->
		<div class="review-write">
			<!-- 리뷰 별점 -->
	        <div class="review-star">
	            <i class="fa-regular fa-star starR" value="1"></i>
	            <i class="fa-regular fa-star starR" value="2"></i>
	            <i class="fa-regular fa-star starR" value="3"></i>
	            <i class="fa-regular fa-star starR" value="4"></i>
	            <i class="fa-regular fa-star starR" value="5"></i>
	        </div>

			<!-- 리뷰 작성하기 창 -->
			<div class="view-panel center">
					<button class="form-btn small neutral edit-btn w-100" style="height:40px;">리뷰 작성하기</button>
			</div>

	       <!-- 리뷰 작성창 -->
	        <div class="row review-content">
	            <textarea name="reviewContent" class="form-input w-100 semi-round" style="min-height:100px"></textarea>
	        </div>
	        <div class="flex w-100 btn-panel">
	            <div class="w-50">
	            </div>
	            <div class="flex w-50 right">
	                <button type="button" class="form-btn small neutral cancel-btn me-10">취소</button>
	                <button type="button" class="form-btn small positive review-insert-btn">등록</button>
	            </div> 
	        </div>
		</div>
        
        
        <div class="row review-list">
        	리뷰 목록 위치
        </div>
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>