<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<form action="join" method="post" enctype="multipart/form-data">
	아이디 : <input type="text" name="memberId" required> <br><br>
	비밀번호 : <input type="password" name="memberPw" required><br><br>
	닉네임 : <input type="text" name="memberNick" required><br><br>
	전화번호 : <input type="tel" name="memberTel" required><br><br>
	이메일 : <input type="email" name="memberEmail"><br><br>
	생년월일 : <input type="date" name="memberBirth" required><br><br>
	우편번호 : <input type="text" name="memberPost"><br><br>
	기본주소 : <input type="text" name="memberBasicAddr"><br><br>
	상세주소 : <input type="text" name="memberDetailAddr"><br><br>
	프로필 이미지 : <input type="file" name="attach"><br><br>
	<button>가입</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>