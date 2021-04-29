<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="keywords"    content="캠핑, 캠핑장, 캠핑장 찾기, 캠핑 후기, 캠핑 커뮤니티, 캠핑용품, 캠핑용품 구입">
	<meta name="description" content="캠핑장 위치 검색, 캠핑 후기 공유, 캠핑용품 쇼핑 등의 서비스를 제공하는 캠핑 관련 커뮤니티입니다.">
	<meta name="robots"      content="all">
	<meta name="author"      content="팀 프로젝트: 곽대희, 송현우, 이동준, 최성완 (가나다 순)">
	<meta name="date"        content="2021-04-30T09:00+09:00"> 
  <title>GoCamping :: 캠핑장 위치 검색, 캠핑 후기 공유, 캠핑용품 구입 등 캠핑 관련 커뮤니티</title>
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/fonts/antonio-exotic/stylesheet.css">
  <link rel="stylesheet" href="/css/lightbox.min.css">
  <link rel="stylesheet" href="/css/responsive.css">
  <style>
  	.cl-effect-10 a {font-size: 16px;}
  
  	.dropdown {font-size: 16px; position: relative; display: inline-block; }
  	.dropdown-content {list-style: none; display: none; position: absolute; background-color: black; right:0px; min-width: 120px; }
	.dropdown-content a { color: black; padding: 8px 12px; text-decoration: none; display: block; }
	.dropdown:hover .dropdown-content { display: block; }
  </style>
  <script src="/js/jquery.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/lightbox-plus-jquery.min.js"></script>
  <script src="/js/instafeed.min.js"></script>
  <script src="/js/custom.js"></script>
</head>
<body>
  <div id="page">
    <div class="top-header">
      <div class="container">
        <div class="row">
          <div class="col-md-6"></div>
          <div class="col-md-6">
            <div class="social-grid">
              <ul class="list-unstyled text-right" style="color: white;">
                <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                <li><a href="https://twitter.com/?lang=ko"><i class="fa fa-twitter"></i></a></li>
                <li><a href="https://kr.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a></li>
                <br><br>
                <c:choose>
                  <c:when test="${isLogOn == true and not empty login}">
                  	<li style="font-size: 16px;">${login.mem_name} 님</li>
                    <li><a href="/logout">로그아웃</a></li>
                    <li><a href="/mypage">마이페이지</a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="/login">로그인</a></li>
                    <li><a href="/join">회원가입</a></li>
                  </c:otherwise>
                </c:choose>
                <c:if test="${isLogOn == true and login.mem_id=='admin'}">
                <li class="dropdown" >
				  관리자
				  <ul class="dropdown-content">
				    <li><a href="/admin">상품관리</a></li>
				    <li><a href="/memberList">회원관리</a></li>
				  </ul>
                  </li>
                </c:if>
                <li><a href="#">장바구니</a></li>
                <li><a href="/notice/list">공지사항</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <header class="header-container">
      <div class="container">
        <div class="top-row">
          <div class="row">
            <div class="col-md-2 col-sm-6 col-xs-6">
              <div id="logo">
                <a href="/"><span>고&nbsp;</span>캠핑</a>
              </div>
            </div>
            <div class="col-sm-6 visible-sm">
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
                <div class="collapse navigation navbar-collapse navbar-ex1-collapse remove-space">
                  <ul class="list-unstyled nav1 cl-effect-10">
                    <li><a data-hover="소개" href="/menus/about"><span>소개</span></a></li>
                    <li><a data-hover="캠핑장 검색" href="/menus/camplocation"><span>캠핑장 검색</span></a></li>
                    <li><a data-hover="캠핑 후기" href="/PBoard/List?page=1&perPageNum=20"><span>캠핑 후기</span></a></li>
                    <!-- <li><a data-hover="메뉴" href="/menus/dinning"><span>메뉴</span></a></li> -->
                    <li><a data-hover="캠핑용품 구매" href="/shopping"><span>캠핑용품 구매</span></a></li>
                    <li><a data-hover="문의하기" href="/qna/list"><span>문의하기</span></a>
                    </li>
                  </ul>
                </div>
              </nav>
            </div>
            <div class="col-md-2  col-sm-4 col-xs-12 hidden-sm">
              <!-- <div class="text-right"><button type="button" class="book-now-btn">임시 버튼</button></div> -->
            </div>
          </div>
        </div>
      </div>
      
    </header>
      </div>