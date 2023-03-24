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
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
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
            font-size: 45px;
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
        .social {
            vertical-align: middle;
            margin-top: 12px;
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
                            <i class="fa-solid fa-bars fa-2x c-p100 mt-15 menu-btn"></i>
                            <i class="fa-solid fa-xmark fa-2x c-p100 mt-10 close-btn"></i>
                        </div>
                        <div class="w-100 center">
                                <h1 class="c-p100 logo" style="font-size: 50px;">
                                    <a class="link" style="color: #776BFF;" href="/">SEMI</a>
                                </h1>
                        </div>
                    </div>
                    <div class="center w-60">
                        <div class="search-box">
                            <input class="search-input w-100">
                            <button class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </div>
                    <!-- <div class="center w-50">
                        <input type="text" class="form-input-search w-100" style="margin-top: 14px;">
                    </div> -->
                    <div class="right w-15">
                        <a class="link" href="#">
                            <i class="fa-solid fa-cart-shopping custom-size c-p100 pe-30 mt-25"></i>
                        </a>
                        <a class="link" href="/member/login">
                            <i class="fa-solid fa-user custom-size c-p100 mt-25"></i>
                        </a>
                    </div>
                </div>
            </div>
        </header>
        <aside class="side-menu">
            <div class="container-1000 flex">
                <div class=""></div>
                <div class="row w-30">
                    <a class="link" href="#">
                        <div class="row large flex menu-item">
                            <div class="w-85">
                                <div class="font-h2">면역력</div>
                            </div>
                            <div class="w-15 right pe-20">
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </div>
                    </a>
                    <a class="link" href="#">
                        <div class="row large flex menu-item">
                            <div class="w-85">
                                <div class="font-h2">피부</div>
                            </div>
                            <div class="w-15 right pe-20">
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </div>
                    </a>
                    <a class="link" href="#">
                        <div class="row large flex menu-item">
                            <div class="w-85">
                                <div class="font-h2">활력</div>
                            </div>
                            <div class="w-15 right pe-20">
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </div>
                    </a>
                    <a class="link" href="#">
                        <div class="row large flex menu-item">
                            <div class="w-85">
                                <div class="font-h2">헤어</div>
                            </div>
                            <div class="w-15 right pe-20">
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </div>
                    </a>
                    <a class="link" href="#">
                        <div class="row large flex menu-item">
                            <div class="w-85">
                                <div class="font-h2">다이어트</div>
                            </div>
                            <div class="w-15 right pe-20">
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </div>
                    </a>
                    <a class="link" href="#">
                        <div class="row large flex menu-item">
                            <div class="w-85">
                                <div class="font-h2">위</div>
                            </div>
                            <div class="w-15 right pe-20">
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </div>
                    </a>
                    <a class="link" href="#">
                        <div class="row large flex menu-item">
                            <div class="w-85">
                                <div class="font-h2">안티에이징</div>
                            </div>
                            <div class="w-15 right pe-20">
                                <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="w-70"></div>
            </div>
            
        </aside>
        <section>
            <article>