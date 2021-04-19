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

<style>
  .uploadPreview {width: 100%; background-color: #A2A2A2;}
  .uploadPreview ul {display: flex; flex-flow: row; justify-content: center; align-items: center;}
  .uploadPreview ul li {list-style: none; padding: 10px; align-content: center; text-align: center;}
  .uploadPreview ul li img {width: 100px;}
  .uploadPreview ul li span {color: white;}
  #article-body {font-size: 18px;}
  .form-control {font-size: 16px;}
</style>

<!-- 페이지 소개 이미지 -->
<section class="image-head-wrapper" style="background-image: url('/img/qnabanner.jpg');">
	<div class="inner-wrapper">
		<h1 style="font-size: 30px;">Q&A 게시판</h1>
	</div>
</section>
<div class="clearfix"></div>

<div id="wrap">
  <div id="article-body">
  <section class="blog" id="main">
    <div class="container">
      <div class="row">
        <div class="col-md-10 col-sm-10 col-xs-12">

<form action="/qna/registerProc" method="post">
  <div class="form-group">
    <label for="p_title">제목</label>
    <input class="form-control" name='p_title' id="p_title" placeholder="제목을 입력하세요.">
  </div>
  <div class="form-group">
    <label for="p_content">내용</label>
    <textarea class="form-control" rows="10" name='p_content' id="p_content" placeholder="내용을 입력하세요."></textarea>
  </div>
  <div class="form-group">
    <label for="mem_id">작성자</label>
    <input class="form-control" name='mem_id' id="mem_id" value="test" readonly>
  </div>
  <div class="form-group">
    <label for="uploadFile">파일 첨부</label>
    <input type="file" class="form-control-file" name="uploadFile" id="uploadFile" multiple>
  </div>
  <div class="uploadPreview">
    <ul></ul>
  </div>
  <div style="text-align: center;">
    <button class="btn btn-dark btn-lg" type="submit">글쓰기</button>&nbsp;
    <button class="btn btn-dark btn-lg" type="button" id="golist">목록</button>
  </div>
</form>

</div>
	<!-- 사이드 메뉴 -->
  <aside class="col-md-2 col-sm-2 col-xs-12">
    <div class="blog-list" id="side-menu">
      <h4>사이드 메뉴</h4>
      <ul>
        <li><a href="#">사이드메뉴 1</a></li>
        <li><a href="#">사이드메뉴 2</a></li>
        <li><a href="#">사이드메뉴 3</a></li>
        <li><a href="#">사이드메뉴 4</a></li>
        <li><a href="#">사이드메뉴 5</a></li>
        <li><a href="#">사이드메뉴 6</a></li>
        <li><a href="#">사이드메뉴 7</a></li>
      </ul>
      <div class="clearfix"> </div>
    </div>
  </aside>
</div>
</div>
</section>

<!-- 푸터 -->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12 width-set-50">
				<div class="footer-details">
					<h4>Get in touch</h4>
					<ul class="list-unstyled footer-contact-list">
					<li>
						<i class="fa fa-map-marker fa-lg"></i>
						<p>701 Old York Drive Richmond USA.</p>
					</li>
					<li>
						<i class="fa fa-phone fa-lg"></i>
						<p><a href="tel:+1-202-555-0100"> +1-202-555-0100</a></p>
					</li>
					<li>
						<i class="fa fa-envelope-o fa-lg"></i>
						<p><a href="mailto:demo@info.com"> demo@info.com</a></p>
					</li>
				</ul>
				<div class="footer-social-icon">
					<a href="#"><i class="bi bi-facebook"></i></a>
					<a href="#"><i class="bi bi-twitter"></i></a>                           
					<a href="#"><i class="bi bi-instagram"></i></a>
					<a href="#"><i class="bi bi-google"></i></a>
					<a href="#"><i class="bi bi-youtube"></i></a>
				</div>
				<div class="input-group" id="subscribe">
					<input type="text" class="form-control subscribe-box" value="" name="subscribe" placeholder="이메일 주소 입력">
						<span class="input-group-btn">
							<button type="button" class="btn subscribe-button"><i class="bi bi-arrow-right-square"></i></button>
						</span>
					</div>
				</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12 width-50 width-set-50">
						<div class="footer-details">
							<h4>explore</h4>
							<ul class="list-unstyled footer-links">
								<li><a href="index.html">Home</a></li>
								<li><a href="about.html">About</a></li>
								<li><a href="rooms.html">Rooms</a></li>
								<li><a href="gallery.html">Gallery</a></li>
								<li><a href="#">Dinning</a></li>
								<li> <a href="news.html">News</a></li>
								<li> <a href="contact.html">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="footer-details">
							<h4>Now On Instagram</h4>
							<div class="row">
								<div class="instagram-images">
									<div id="instafeed"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<div class="copyright">
				&copy; 2017 All right reserved. Designed by <a href="http://www.themevault.net/" target="_blank">ThemeVault.</a>
			</div>
		</div>
	</footer>
</div>
<!-- 위로 버튼 -->
<div>
	<a style="display: none;" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
		<span><i aria-hidden="true" class="bi bi-arrow-up"></i></span>
	</a>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/instafeed.min.js"></script>
<script src="/js/custom.js"></script>
<script src="/js/lightbox-plus-jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</body>
</html>

<script>
  $(document).ready(function(e) {

    // [이벤트] 폼 전송 시 첨부 파일 정보 같이 전송
    var form = $('form');
    $('button[type="submit"]').on('click', function(e) {
        e.preventDefault();
        var str = '';
        $('.uploadPreview ul li').each(function(i, obj) {
            var obj = $(obj);
            str += "<input type='hidden' name='attachList[" + i + "].a_filename' value='" + obj.data("filename") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_uuid' value='" + obj.data("uuid") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_savepath' value='" + obj.data("path") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_isimage' value='" + obj.data("type") + "'>";
        })
        form.append(str).submit();
    });

    // [이벤트] 폼 태그에 첨부 파일 유효성 검사 후 목록에 추가
    $('input[type="file"]').change(function(e) {
      var formData = new FormData();
      var inputFileList = $('input[name="uploadFile"]');
      var files = inputFileList[0].files;
      for (var i = 0; i < files.length; i++) {
        if (!checkFileExtension(files[i].name, files[i].size)) {
          return false;
        }
        formData.append('uploadFile', files[i]);
      }

      // [Ajax] 파일 업로드 후 미리보기에 표시
      $.ajax({
        url : '/uploadAjaxAction'
        , processData : false
        , contentType : false
        , data : formData
        , type : 'post'
        , dataType : 'json'
        , success : function(result) {
            showUploadPreview(result);
          }
      });
    });

    // [이벤트] 삭제 버튼 클릭
    $('.uploadPreview').on('click', 'button', function(e) {
      var targetFile = $(this).data('file');
      var targetLi = $(this).closest('li');
      var type = $(this).data('type');
      if (confirm('첨부파일을 삭제하시겠습니까?')) {
        $.ajax({
          url : '/deleteFile'
          , data : {fileName : targetFile, type : type}
          , dataType : 'text'
          , type : 'post'
          , success : function(result) {
              targetLi.remove();
            }
        });
      }
    });

    // [함수] 파일 첨부 시 유효성 검사
    var regex = new RegExp("(.*?)\.(exe|zip|alz)$");
    var uploadMaxSize = 10485760; // 10MB
    function checkFileExtension(fileName, fileSize) {
      if (fileSize > uploadMaxSize) {
        alert('10MB보다 작은 크기의 파일만 업로드 가능합니다.');
        return false;
      }
      if (regex.test(fileName)) {
        alert('exe, zip, alz 확장자를 가진 파일은 업로드할 수 없습니다.');
        return false;
      }
      return true;
    }

    // [함수] 미리보기에 표시
    function showUploadPreview(uploadPreviewArr) {
      if (!uploadPreviewArr || uploadPreviewArr.length == 0) {
        return;
      }
      var uploadPreviewUl= $('.uploadPreview ul');
      var str = '';
      $(uploadPreviewArr).each(function(i, obj) {
        if (obj.a_isimage) {
          var fileSavePath = encodeURIComponent(obj.a_savepath + "/s_" + obj.a_uuid + "_" + obj.a_filename);
          str += "<li data-path='" + obj.a_savepath + "' data-uuid='" + obj.a_uuid + "' data-filename='" + obj.a_filename + "' data-type='" + obj.a_isimage + "'>";
          str += "  <div>";
          str += "    <span>" + obj.a_filename + "</span>";
          str += "    <button type='button' data-file=\'" + fileSavePath + "\' data-type='image' class='btn'><i class='bi bi-trash'></i></button><br>";
          str += "    <img src='/display?a_filename=" + fileSavePath + "'>";
          str += "  </div>";
          str += "</li>";
        }
        else {
          var fileSavePath = encodeURIComponent(obj.a_savepath + "/" + obj.a_uuid + "_" + obj.a_filename);
          var fileSlashChange = fileSavePath.replace(new RegExp(/\\/g), "/");
          str += "<li data-path='" + obj.a_savepath + "' data-uuid='" + obj.a_uuid + "' data-filename='" + obj.a_filename + "' data-type='" + obj.a_isimage + "' >";
          str += "  <div>"
          str += "    <span>" + obj.a_filename + "</span>";
          str += "    <button type='button' data-file=\'" + fileSavePath + "\' data-type='file' class='btn'><i class='bi bi-trash'></i></button><br>";
          str += "    <img src='/img/attach.png'>";
          str += "  </div>";
          str += "</li>";
        }
      });
      uploadPreviewUl.append(str);
    }
    
    $('#golist').on('click', function(e) {
      self.location = '/qna/list';
    });

  });
</script>