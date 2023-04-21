<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.social {
	    vertical-align: middle;
	    margin-bottom: 60px;
	}
	.social:hover {
		color: #22201e;
	}
	.footer-logo {
     	width: 150px;
     	padding-top: 5px;
    }
</style>

            </article>
        </section>
    </div>
        <footer>
            <div class="container-1000">
                <div class="row flex">
                    <div class="w-50 pt-25">
                        <a class="link" style="color: #776BFF;" href="${pageContext.request.contextPath}/">
                        	<img class="footer-logo" alt="로고" src="${pageContext.request.contextPath}/static/image/logo.png">
                        </a>
                    </div>
                    <div class="w-50 right">
                        <a class="link" href="#">
                            <i class="fa-brands fa-square-facebook custom-size social me-5"></i>
                        </a>
                        <a class="link" href="#">
                            <i class="fa-brands fa-instagram custom-size social me-5"></i>
                        </a>
                        <a class="link" href="#">
                            <img class="social" width="23px" height="23px" src="${pageContext.request.contextPath}/static/image/katalk.png">
                        </a>
                    </div>
                </div>
                <div class="row pb-20">
                    <div class="row">
                        사업장 번호 : 111-22-33333
                    </div>
                    <div class="row">
                        위치 : 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 C강의장
                    </div>
                    <div class="row">
                        대표 번호 : 02)444-5555 / 010)6666-7777
                    </div>
                </div>
            </div>
        </footer>
    </main>
</body>
</html>