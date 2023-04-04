<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" type="text/css" href="/static/css/load.css">
	    <!-- font awsome 아이콘 -->
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	    <!-- tabler 아이콘 -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/test.css">
	    <!-- jquery cdn -->
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
        .search-box {
            margin-top: 8px;
        }
        .custom-size {
            font-size: 25px;
        }
        .menu-btn,
        .close-btn {
            font-size: 40px;
            margin-top: 3px;
            cursor: pointer;
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
        .fa-right-to-bracket {
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
    </script>
    <title>SEMI</title>
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
                            <h1 class="c-p100 logo" style="font-size: 50px;">
                                <a class="link" style="color: #776BFF;" href="/">SEMI</a>
                            </h1>
                        </div>
                    </div>
                    <div class="center w-55">
                        <div class="search-box">
                            <input class="search-input w-100">
                            <button class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </div>
                    <!-- <div class="center w-50">
                        <input type="text" class="form-input-search w-100" style="margin-top: 14px;">
                    </div> -->
                    <div class="right w-20 flex">
                    	<%-- <c:if test="${sessionScope.memberLevel == 'admin'}"> --%>
                    		<div class="me-15 center">
                    			<a class="link" href="/admin" title="관리자 메인">
	                            	<i class="fa-solid fa-wrench c-p100"></i>
	                            	<span class="header-menu-text">관리</span>
	                        	</a>
                    		</div>
                        <%-- </c:if> --%>
                        <%-- <c:if test="${sessionScope.memberId != null}"> --%>
	                        <div class="me-15 center">
		                        <a class="link" href="/cart/main" title="장바구니">
		                            <i class="fa-solid fa-cart-shopping c-p100"></i>
		                            <span class="header-menu-text">장바구니</span>
		                        </a>
	                        </div>
	                        <!-- <div class="me-15 center">
		                        <a class="link" href="/member/join" title="마이페이지">
		                            <i class="fa-solid fa-user c-p100"></i>
		                            <span class="header-menu-text">마이페이지</span>
		                        </a>
	                        </div> -->
	                        <!-- <div class="center">
		                        <a class="link" href="/member/login" title="로그아웃">
		                            <i class="fa-solid fa-right-from-bracket c-p100"></i>
		                            <span class="header-menu-text">로그아웃</span>
		                        </a>
	                        </div> -->
                        <%-- </c:if> --%>
                        <%-- <c:if test="${sessionScope.memberId == null}"> --%>
	                        <div class="me-15 center">
		                        <a class="link" href="/member/join" title="회원가입">
		                            <i class="fa-solid fa-user c-p100"></i>
		                            <span class="header-menu-text">회원가입</span>
		                        </a>
	                        </div>
	                        <div class="center">
		                        <a class="link" href="/member/login" title="로그인">
		                            <i class="fa-solid fa-right-to-bracket c-p100"></i>
		                            <span class="header-menu-text center">로그인</span>
		                        </a>
	                        </div>
                        <%-- </c:if> --%>
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
	                        <h4><a class="link pe-20" href="/member/login" style="border-right: 1px solid #22201e;">로그인</a></h4>
	                    </div>
	                    <div>
	                        <h4><a class="link ps-20" href="/member/join">회원가입</a></h4>
	                    </div>
                    </c:if>
                    
                    <!-- 로그인 후 -->
                    <c:if test="${sessionScope.memberId != null}">
	                    <div>
	                        <h4><a class="link pe-20" href="/cart/main" style="border-right: 1px solid #22201e;">장바구니</a></h4>
	                    </div>
	                    <div>
	                        <h4><a class="link ps-20 pe-20" href="/member/mypage" style="border-right: 1px solid #22201e;">마이페이지</a></h4>
	                    </div>
	                    <div>
	                        <h4><a class="link ps-20" href="/member/logout">로그아웃</a></h4>
	                    </div>
                    </c:if>
                </div>
                <div class="flex center">
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-solid fa-border-all"></i>
                                <h3 class="category-text">전체</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-light fa-face-smile"></i>
                                <h3 class="category-text">피부</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-light fa-weight-scale"></i>
                                <h3 class="category-text">다이이트</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="flex center">
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-light fa-venus"></i>
                                <h3 class="category-text">여성</h3>	
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-sharp fa-light fa-bolt-lightning"></i>
                                <h3 class="category-text">활력</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-thin fa-mars"></i>
                                <h3 class="category-text">남성</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="flex center mb-20">
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-light fa-eye"></i>
                                <h3 class="category-text">눈</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-light fa-tooth"></i>
                                <h3 class="category-text">치아</h3>
                            </a>
                        </div>
                    </div>
                    <div class="w-33 flex center">
                        <div class="w-40 category">
                            <a class="link" href="#">
                                <i class="fa fa-light fa-bone"></i>
                                <h3 class="category-text">관절/뼈</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="flex">
                    <div class="flex ps-100 ms-30 w-50">
                        <h2><a class="link" href="#">QnA</a></h2>
                    </div>
                    <div class="flex right pe-100 me-30 w-50">
                        <a class="link-social" href="#">
                            <i class="fa-brands fa-square-facebook custom-size social-icon me-10"></i>
                        </a>
                        <a class="link-social" href="#">
                            <i class="fa-brands fa-instagram custom-size social-icon me-10"></i>
                        </a>
                        <a class="link-social" href="#">
                            <img class="social-icon" width="23px" height="23px" src="/static/image/katalk.png">
                        </a>
                    </div>
                </div>
            </div>
        </aside>
        <section class="container-1000 flex">
        	<div class="admin-menu w-20">
                <div class="flex-box flex-vertical">
                    <div class="p-10">
                        <a class="link" href="/admin">
                        	<h2 class="c-p100">관리자 메뉴</h2>
                        </a>
                    </div>
                    <div class="p-10">
                        <a href="/admin/member/list" class="link">회원 목록</a>
                    </div>
                    <div class="p-10">
                        <a href="/admin/productManage/list" class="link">상품 관리</a>
                    </div>
                    <div class="p-10">
                        <a href="/admin/mainImg/list" class="link">메인 관리</a>
                    </div>
                    <div class="p-10">
                        <a href="#" class="link">QnA 게시판</a>
                    </div>
               	</div>
        	</div>
            <article class="w-80">