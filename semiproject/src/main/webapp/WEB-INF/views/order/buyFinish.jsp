<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.fa-gifts {
		font-size: 130px;
	}
</style>

    <div class="container-1000 center">
        <div class="row pb-60">
            <h1>주문이 성공적으로 접수되었습니다!</h1>
        </div>
        <div class="row">
            <i class="fa-solid fa-gifts c-p100"></i>
        </div>
        <div class="pt-50">
            <p>배송은 영업일 기준 3-5일 내로 시작되며,</p>
            <p>처리 과정은 마이페이지 구매내역에서 확인할 수 있습니다.</p> 
        </div>

        <div class="row pt-10">
            <div class="row">
                <button class="form-btn medium neutral w-50">마이페이지</button>
            </div>
            <div class="row">
                <button class="form-btn medium positive w-50">메인으로</button>
            </div>
        </div>
    </div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>