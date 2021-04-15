<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>GoCamping :: 캠핑 커뮤니티</title>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/fonts/antonio-exotic/stylesheet.css">
	<link rel="stylesheet" href="/css/lightbox.min.css">
	<link rel="stylesheet" href="/css/responsive.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" >	
	<style>
		* {font-family:'Noto Sans KR', sans-serif;}
		.cl-effect-10 a:hover {text-decoration: none; color: black;}
		#reservBtn {padding-top: 12px;}
		#top-menu {font-size: 40px; padding-top: 5px;}
		#logo > a {font-size: 40px; text-decoration: none;}
		#logo a span {font-size: 32px;}
		#wrapper {text-align: center; font-size: 16px;}
		#wrapper a {text-decoration: none; color: black;}
		#searchSelectTag {width: 200px;}
		#keywordInput {width: 200px;}
		#test {display: flex; justify-content: center; align-items: center;}
		#pagingDiv {display: flex; justify-content: center; align-items: center;}
		#pagingDiv ul li {list-style: none; display: inline-block;}
		#pagingDiv li.active a {color: #fff; background: #343A40; border-color: #343A40;}
		#main {padding-top: 30px;}
		#snsBtn {color: #ffffff;}
		th {text-align: center;}
		th:nth-child(1) {width: 100px;}
		th:nth-child(2) {width: 200px;}
		th:nth-child(3) {width: 100px;}
		th:nth-child(4) {width: 100px;}
		th:nth-child(5) {width: 100px;}
		td:nth-child(2) {text-align: left;}
		footer {background-color: #2d2d2d;}
		#side-menu a {text-decoration: none; color: black;}
	</style>
</head>
<body>
	<div id="page">
		<!-- 소셜 아이콘 링크 -->
		<div class="top-header" style="background-color: #2d2d2d">
			<div class="container">
				<div class="row">
					<div class="col-md-6"></div>
					<div class="col-md-6">
						<div class="social-grid">
							<ul class="list-unstyled text-right" id="snsBtn">
								<li><a href="#"><i class="bi bi-facebook"></i></a></li>
								<li><a href="#"><i class="bi bi-twitter"></i></a></li>
								<li><a href="#"><i class="bi bi-linkedin"></i></a></li>
								<li><a href="#"><i class="bi bi-instagram"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 헤더 -->
		<header class="header-container">
			<div class="container">
				<div class="top-row">
					<div class="row">
						<div class="col-md-2 col-sm-6 col-xs-6">
							<div id="logo">
								<a href="/"><span>Go</span>Camping</a>
							</div>                       
						</div>
						<div class="col-sm-6 visible-sm">
							<div class="text-right"><button type="button" class="book-now-btn">예약하기</button></div>
						</div>
						<div class="col-md-8 col-sm-12 col-xs-12 remove-padd">
							<nav class="navbar navbar-default">
								<div class="navbar-header page-scroll">
									<button data-target=".navbar-ex1-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
								</div>
								<div class="collapse navigation navbar-collapse navbar-ex1-collapse remove-space" id="top-menu">
									<ul class="list-unstyled nav1 cl-effect-10">
										<li><a data-hover="메뉴1" href="#"><span>메뉴1</span></a></li>
										<li><a data-hover="메뉴2" href="#"><span>메뉴2</span></a></li>
										<li><a data-hover="메뉴3" href="#"><span>메뉴3</span></a></li>
										<li><a data-hover="메뉴4" href="#"><span>메뉴4</span></a></li>
										<li><a data-hover="메뉴5" href="#"><span>메뉴5</span></a></li>
										<li><a data-hover="메뉴6" href="#"><span>메뉴6</span></a></li>
										<li><a data-hover="메뉴7" href="#"><span>메뉴7</span></a></li>
									</ul>
								</div>
							</nav>
						</div>
						<div class="col-md-2  col-sm-4 col-xs-12 hidden-sm">
							<div id="reservBtn" class="text-right"><button type="button" class="book-now-btn">예약하기</button></div>
						</div>
					</div>
				</div>
			</div>
		</header>
