<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="/images/icons/favicon.png">
  <title>GoCamping :: 캠핑 커뮤니티</title>
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/fonts/antonio-exotic/stylesheet.css">
  <link rel="stylesheet" href="/css/lightbox.min.css">
  <link rel="stylesheet" href="/css/responsive.css">
  <style>
  	.cl-effect-10 a {font-size: 16px;}
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
                <li><a><i class="fa fa-facebook"></i></a></li>
                <li><a><i class="fa fa-twitter"></i></a></li>
                <li><a><i class="fa fa-linkedin"></i></a></li>
                <li><a><i class="fa fa-instagram"></i></a></li>
                <br><br>
                <c:choose>
                  <c:when test="${isLogOn == true and not empty login}">
                    ${login.mem_name} 님
                    <li><a href="/logout">로그아웃</a></li>
                    <li><a href="/mypage">마이페이지</a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="/login">로그인</a></li>
                    <li><a href="/join">회원가입</a></li>
                  </c:otherwise>
                </c:choose>
                <c:if test="${isLogOn == true and login.mem_id=='admin'}">
                  관리자로 로그인 하셨습니다
                  <li><a href="/admin">관리자</a></li>
                </c:if>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">사이트맵</a></li>
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
                <a href="/"><span>고 </span>캠핑</a>
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
                <div class="collapse navigation navbar-collapse navbar-ex1-collapse remove-space">
                  <ul class="list-unstyled nav1 cl-effect-10">
                    <li><a data-hover="소개" href="/menus/about"><span>소개</span></a></li>
                    <li><a data-hover="캠핑장 검색" href="/menus/rooms"><span>캠핑장 검색</span></a></li>
                    <li><a data-hover="캠핑 후기" href="/menus/gallery"><span>캠핑 후기</span></a></li>
                    <li><a data-hover="메뉴" href="/menus/dinning"><span>메뉴</span></a></li>
                    <li><a data-hover="캠핑용품 구매" href="/menus/news"><span>캠핑용품 구매</span></a></li>
                    <li><a data-hover="Q&A" href="/qna/list"><span>Q&A</span></a>
                    </li>
                  </ul>
                </div>
              </nav>
            </div>
            <div class="col-md-2  col-sm-4 col-xs-12 hidden-sm">
              <div class="text-right"><button type="button" class="book-now-btn">임시 버튼</button></div>
            </div>
          </div>
        </div>
      </div>
    </header>