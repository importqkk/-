<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/static/css/review.css">
<script>
	var memberId = "${sessionScope.memberId}"
</script>
<script src="/static/js/review.js"></script>
<script type="text/template" id="review-template">
	<div class="review-item">
		<div class="memberId"></div>
		<div class="reviewStar"></div> 
		<div class="reviewTime"></div>
		<div class="reviewContent"></div>
		<div class="reviewLike"></div>
	</div>
</script>
    <div class="container-1000">
    	<div class="row">
    	</div>
<!--         <div class="star-rating"> -->
<!--             <i class="fa-regular fa-star starR" value="1"></i> -->
<!--             <i class="fa-regular fa-star starR" value="2"></i> -->
<!--             <i class="fa-regular fa-star starR" value="3"></i> -->
<!--             <i class="fa-regular fa-star starR" value="4"></i> -->
<!--             <i class="fa-regular fa-star starR" value="5"></i> -->
<!--         </div> -->

        <div class="view-panel center">
            <button class="form-btn small neutral edit-btn w-100" style="height:40px;">리뷰 작성하기</button>
        </div>
       
        <div class="row review-content">
            <textarea name="reviewContent" class="form-input w-100 semi-round" style="min-height:100px"></textarea>
            <textarea name="reviewStar"></textarea>
        </div>
        <div class="flex w-100 btn-panel">
            <div class="w-50">
                <label class="input-file-button" for="chooseFile">
                    사진등록
                </label>
                <input type="file" id="chooseFile" name="attach" class="form-input w-10">
            </div>
            <div class="flex w-50 right">
                <button type="button" class="form-btn small neutral cancel-btn me-10">취소</button>
                <button type="button" class="form-btn small positive review-insert-btn">등록</button>
            </div> 
        </div>
        <hr>
        <div class="row review-list">
        	리뷰 목록 위치
        </div>
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>