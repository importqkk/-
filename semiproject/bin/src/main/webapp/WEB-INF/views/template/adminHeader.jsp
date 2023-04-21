<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/load.css">
	    <!-- font awesome 아이콘 -->
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	    <!-- tabler 아이콘 -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/reset.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/layout.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/commons.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/test.css">
	    <!-- jquery cdn -->
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	    <!-- favicon -->
	    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/favicon.ico">
	    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/favicon.ico">
	    <script>
	    	const contextPath = "${pageContext.request.contextPath}";
	    </script>
	    
    <style>
       .logo {
            margin: 0;
            padding: 0;
            border: 0;
            /* font-size: 100%;
            font: inherit; */
            font-family: inherit;
            vertical-align: baseline;
        }
        .custom-size {
            font-size: 25px;
        }
        .menu-btn,
        .close-btn {
            font-size: 40px;
            cursor: pointer;
            margin-bottom: 5px;
        }
        .close-btn {
            font-size: 53px;
        }
        .fa-chevron-right {
            margin-top: 10px;
        }
        .row.large {
            margin: 20px 0px;
        }
        .menu-item {
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 20px;
            border-radius: 100px;
            cursor: pointer;
        }
        .menu-item:hover {
            background-color: #f8f8ff;
        }
        .fa-wrench,
        .fa-cart-shopping,
        .fa-user,
        .fa-right-to-bracket,
        .fa-right-from-bracket {
            margin-top: 12px;
            font-size: 25px;
            text-align: center;
        }
        .header-menu-text {
        	font-size: 0.67em;
        	display: block;
        	text-align: center;
        }
        .admin-menu {
        	padding-right: 20px;
        	margin-right: 50px;
        	border-right: 1px solid rgb(204, 204, 204);
        	align-self: flex-start;
        	position: sticky;
        	display: inline-block;
			top: 135px;
        }
        .social {
            vertical-align: middle;
            margin-top: 30px;
        }
        .logo-img {
        	width: 110px;
        	padding-top: 5px;
        }
        /* 사이드메뉴 */
        .category {
            border-radius: 25px;
            padding-top: 25px;
            padding-bottom: 25px;
        }
        .category:hover {
            background-color: #f8f8ff;
        }
        .category-text {
            color: #d3d2d2;
        }
        .social-icon {
            vertical-align: middle;
        }
        .link-social {
            text-decoration: none;
            color: #22201e;
        }
        .fa {
            cursor: pointer;
            font-size: 45px;
            color: #d3d2d2;
            margin-bottom: 10px;
        }
        h5, h3 {
            margin: 0;
        }
        h1, h2, h4 {
            margin: 0;
            display: inline;
        }
    </style>
    <script type="text/javascript">
        $(function() {
            $(".side-menu").hide();
            $(".close-btn").hide();
            $(".menu-btn").click(function() {
                $(".menu-btn").hide();
                $(".close-btn").show();
                $(".side-menu").show();
            })
            $(".close-btn").click(function() {
                $(".close-btn").hide();
                $(".menu-btn").show();
                $(".side-menu").hide();
            })
            $(".category").hover(function() {
                $(this).find("h3").css("color", "#776bff");
                $(this).find(".fa").css("color", "#776bff");
            },
            function() {
                $(this).find("h3").css("color", "");
                $(this).find(".fa").css("color", "");
            })
        })
        $(function(){	
			$("a.logout").click(function(e){
            	var choice = confirm("로그아웃 하시겠습니까?");
            	if(choice){
                return true;
            }
            else{
                return false;
            }
		});
	});
    </script>
    <title>MYFORMULA</title>
</head>
	<body>
    <main>
        <div id="wrapper">
        <header style="border-bottom: 0.5px solid #72706f;">
            <div class="container-1000">
                <div class="flex">
                    <div class="flex w-25">
                        <div class="w-20">
                            <i class="fa-solid fa-bars fa-2x c-p100 menu-btn"></i>
                            <i class="fa-solid fa-xmark fa-2x c-p100 close-btn"></i>
                        </div>
                        <div class="w-100 center">
                            <a class="link" style="color: #776BFF;" href="${pageContext.request.contextPath}/">
                            	<img class="logo-img" alt="로고" src="${pageContext.request.contextPath}/static/image/logo.png">
                            </a>
                        </div>
                    </div>
                    <div class="center w-50">
                    	<form action="${pageContext.request.contextPath}/product/search/">
                        <div class="search-box">
                            <input class="search-input w-100" name="keyword" placeholder="어떤 영양제가 궁금하세요?">
                            <button class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                        </form>
                    </div>
                    <div class="right w-25 flex pb-10">
                    	<!-- 로그인 o, 관리자 -->
                    	<c:if test="${sessionScope.memberId != null && sessionScope.memberRole == '관리자'}">
                    		<div class="me-15 center">
                    			<a class="link" href="${pageContext.request.contextPath}/admin" title="관리자 메인">
	                            	<i class="fa-solid fa-wrench c-p100"></i>
	                            	<span class="header-menu-text">관리</span>
	                        	</a>
                    		</div>
                        </c:if>
                        <!-- 로그인 o -->
                        <c:if test="${sessionScope.memberId != null}">
	                        <div class="me-15 center">
		                        <a class="link" href="${pageContext.request.contextPath}/cart/main" title="장바구니">
		                            <i class="fa-solid fa-cart-shopping c-p100"></i>
		                            <span class="header-menu-text">장바구니</span>
		                        </a>
	                        </div>
	                        <div class="me-15 center">
		                        <a class="link" href="${pageContext.request.contextPath}/member/mypage" title="마이페이지">
		                            <i class="fa-solid fa-user c-p100"></i>
		                            <span class="header-menu-text">마이페이지</span>
		                        </a>
	                        </div>
	                        <div class="center">
		                        <a class="link logout" href="${pageContext.request.contextPath}/member/logout" title="로그아웃">
		                            <i class="fa-solid fa-right-from-bracket c-p100"></i>
		                            <span class="header-menu-text">로그아웃</span>
		                        </a>
	                        </div>
                        </c:if>
                        <!-- 로그인 x -->
                        <c:if test="${sessionScope.memberId == null}">
	                        <div class="me-15 center">
		                        <a class="link" href="${pageContext.request.contextPath}/member/join" title="회원가입">
		                            <i class="fa-solid fa-user c-p100"></i>
		                            <span class="header-menu-text">회원가입</span>
		                        </a>
	                        </div>
	                        <div class="center">
		                        <a class="link" href="${pageContext.request.contextPath}/member/login" title="로그인">
		                            <i class="fa-solid fa-right-to-bracket c-p100"></i>
		                            <span class="header-menu-text center">로그인</span>
		                        </a>
	                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </header>
        <aside class="side-menu">
            <div class="container-1000">
                <div class="flex right member-menu pt-30 pe-100 me-30 pb-20">
                    <!-- 로그인 전 -->
                    <c:if test="${sessionScope.memberId == null}">
                    	<div>
	                        <h4><a class="link pe-20" href="${pageContext.request.contextPath}/member/login" style="border-right: 1px solid #22201e;">로그인</a></h4>
	                    </div>
	                    <div>
	                        <h4><a class="link ps-20" href="${pageContext.request.contextPath}/member/join">회원가입</a></h4>
	                    </div>
                    </c:if>
                    
                    <!-- 로그인 후 -->
                    <c:if test="${sessionScope.memberId != null}">
	                    <div>
	                        <h4><a class="link pe-20" href="${pageContext.request.contextPath}/cart/main" style="border-right: 1px solid #22201e;">장바구니</a></h4>
	                    </div>
	                    <div>
	                        <h4><a class="link ps-20 pe-20" href="${pageContext.request.contextPath}/member/mypage" style="border-right: 1px solid #22201e;">마이페이지</a></h4>
	                    </div>
	                    <div>
	                        <h4><a class="link ps-20 logout" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></h4>
	                    </div>
                    </c:if>
                </div>
                <div class="flex center">
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/all">
                                <i class="fa fa-solid fa-border-all"></i>
                                <h3 class="category-text">전체</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/tag1">
                                <i class="fa fa-light fa-face-smile"></i>
                                <h3 class="category-text">피부</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/tag2">
                                <i class="fa fa-light fa-weight-scale"></i>
                                <h3 class="category-text">다이이트</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="flex center">
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/tag3">
                                <i class="fa fa-light fa-venus"></i>
                                <h3 class="category-text">여성</h3>	
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/tag4">
                                <i class="fa fa-sharp fa-light fa-bolt-lightning"></i>
                                <h3 class="category-text">활력</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/tag5">
                                <i class="fa fa-thin fa-mars"></i>
                                <h3 class="category-text">남성</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="flex center mb-20">
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/tag6">
                                <i class="fa fa-light fa-eye"></i>
                                <h3 class="category-text">눈</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/tag7">
                                <i class="fa fa-light fa-tooth"></i>
                                <h3 class="category-text">치아</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="${pageContext.request.contextPath}/categori/tag8">
                                <i class="fa fa-light fa-bone"></i>
                                <h3 class="category-text">관절/뼈</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="flex">
                    <div class="flex ps-100 ms-30 w-50">
                        <h2><a class="link" href="${pageContext.request.contextPath}/qa/list">QnA</a></h2>
                    </div>
                    <div class="flex right pe-100 me-30 w-50">
                        <a class="link-social" href="#">
                            <i class="fa-brands fa-square-facebook custom-size social-icon me-10"></i>
                        </a>
                        <a class="link-social" href="#">
                            <i class="fa-brands fa-instagram custom-size social-icon me-10"></i>
                        </a>
                        <a class="link-social" href="#">
                            <img class="social-icon" width="23px" height="23px" src="${pageContext.request.contextPath}/static/image/katalk.png">
                        </a>
                    </div>
                </div>
            </div>
        </aside>
        <section class="container-1000 flex">
        	<div class="admin-menu w-20">
                <div class="flex-box flex-vertical">
                    <div class="p-10">
                        <a class="link" href="${pageContext.request.contextPath}/admin">
                        	<h2 class="c-p100">관리자 메뉴</h2>
                        </a>
                    </div>
                    <div class="p-10">
                        <a href="${pageContext.request.contextPath}/admin/member/list" class="link">회원 목록</a>
                    </div>
                    <div class="p-10">
                        <a href="${pageContext.request.contextPath}/admin/productManage/list" class="link">상품 관리</a>
                    </div>
                    <div class="p-10">
                        <a href="${pageContext.request.contextPath}/admin/sell/list" class="link">판매 내역</a>
                    </div>
                    <div class="p-10">
                        <a href="${pageContext.request.contextPath}/admin/mainImg/list" class="link">메인 관리</a>
                    </div>
                    <div class="p-10">
                        <a href="${pageContext.request.contextPath}/qa/list" class="link">QnA 게시판</a>
                    </div>
               	</div>
        	</div>
            <article class="w-80">