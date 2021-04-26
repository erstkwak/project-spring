<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	.blog-block {margin-bottom: 100px;}
</style>

<!-- 캐러셀1 -->
<div id="myCarousel1" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel1" data-slide-to="1"></li>
    <li data-target="#myCarousel1" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/slideimage3.jpg" style="width:100%; height: 500px" alt="First slide">
      <div class="carousel-caption" >
        <a href="/menus/rooms"><span style="font-size: 40px; color: #888888; background-color: white; border-radius: 20px;">&nbsp;캠핑장 위치가 궁금하신가요?&nbsp;</span></a>
      </div>
    </div>
    <div class="item">
      <img src="images/slideimage2.jpg" style="width:100%; height: 500px" alt="Second slide">
      <div class="carousel-caption">
				<a href="/menus/gallery"><span style="font-size: 40px; color: #888888; background-color: white; border-radius: 20px;">&nbsp;이용하신 분들의 후기를 살펴보세요!&nbsp;</span></a>
      </div>
    </div>
    <div class="item">
      <img src="images/slideimage1.jpg" style="width:100%; height: 500px" alt="Third slide">
      <div class="carousel-caption">
				<a href="/menus/news"><span style="font-size: 40px; color: #888888; background-color: white; border-radius: 20px;">&nbsp;캠핑용품은 여기서 구매하세요!&nbsp;</span></a>
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
    <img src="images/icons/left-arrow.png" onmouseover="this.src = 'images/icons/left-arrow-hover.png'" onmouseout="this.src = 'images/icons/left-arrow.png'" alt="left">
  </a>
  <a class="right carousel-control" href="#myCarousel1" data-slide="next">
    <img src="images/icons/right-arrow.png" onmouseover="this.src = 'images/icons/right-arrow-hover.png'" onmouseout="this.src = 'images/icons/right-arrow.png'" alt="left">
  </a>
</div>
<div class="clearfix"></div>

<!-- 제공 서비스 4개 -->
<section class="service-block">
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-sm-3 col-xs-6 width-50">
        <div class="service-details text-center">
          <div class="service-image">
            <img alt="image" class="img-responsive" src="images/icons/tent.png" width="48" height="48">
          </div>
          <h4><a href="/menus/rooms">캠핑장 검색</a></h4>
        </div>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-6 width-50">
        <div class="service-details text-center">
          <div class="service-image">
            <img alt="image" class="img-responsive" src="images/icons/community.png" width="48" height="48">
          </div>
          <h4><a href="/menus/gallery">캠핑 후기</a></h4>
        </div>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
        <div class="service-details text-center">
          <div class="service-image">
            <img alt="image" class="img-responsive" src="images/icons/shop.png" width="48" height="48">
          </div>
          <h4><a href="/menus/news">캠핑용품 구매</a></h4>
        </div>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
        <div class="service-details text-center">
          <div class="service-image">
            <img alt="image" class="img-responsive" src="images/icons/qna.png" width="48" height="48">
          </div>
          <h4><a href="/qna/list">문의 게시판</a></h4>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 갤러리 사진 4개 -->
<section class="gallery-block gallery-front">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        <div class="gallery-image">
          <img class="img-responsive" src="images/gall1.jpg">
          <div class="overlay">
            <a class="info pop example-image-link img-responsive" href="images/gall1.jpg" data-lightbox="example-1"><i class="fa fa-search" aria-hidden="true"></i></a>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        <div class="gallery-image">
          <img class="img-responsive" src="images/gall2.jpg">
          <div class="overlay">
            <a class="info pop example-image-link img-responsive" href="images/gall2.jpg" data-lightbox="example-1"><i class="fa fa-search" aria-hidden="true"></i></a>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        <div class="gallery-image">
          <img class="img-responsive" src="images/gall3.jpg">
          <div class="overlay">
            <a class="info pop example-image-link img-responsive" href="images/gall3.jpg" data-lightbox="example-1"><i class="fa fa-search" aria-hidden="true"></i></a>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        <div class="gallery-image">
          <img class="img-responsive" src="images/gall4.jpg">
          <div class="overlay">
            <a class="info pop example-image-link img-responsive" href="images/gall4.jpg" data-lightbox="example-1"><i class="fa fa-search" aria-hidden="true"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 배너 -->
<section class="vacation-offer-block">
  <div class="vacation-offer-bgbanner">
    <div class="container">
      <div class="row">
        <div class="col-md-5 col-sm-6 col-xs-12">
          <div class="vacation-offer-details">
            <h1>날씨 API 추가할 공간</h1>
            <h4>날씨 API</h4>
            <button type="button" class="btn btn-default">임시 버튼</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 더보기 4 x 2 -->
<section class="resort-overview-block">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-sm-12 col-xs-12 remove-padd-right">
        <div class="side-A">
          <div class="product-thumb">
            <div class="image">
              <a><img src="images/campingitem1.jpg" class="img-responsive" alt="image" width="280px" height="280px"></a>
            </div>
          </div>
        </div>
        <div class="side-B">
          <div class="product-desc-side">
            <h3><a href="/menus/news">텐트, 침낭 구입</a></h3>
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="col-md-6 col-sm-12 col-xs-12 remove-padd-left">
        <div class="side-A">
          <div class="product-thumb">
            <div class="image">
							<a><img src="images/campingitem2.jpg" class="img-responsive" alt="image" width="280px" height="280px"></a>
            </div>
          </div>
        </div>
        <div class="side-B">
          <div class="product-desc-side">
            <h3><a href="/menus/news">버너, 랜턴, 화로 구입</a></h3>
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="col-md-6 col-sm-12 col-xs-12 remove-padd-right">
        <div class="side-A">
          <div class="product-desc-side">
            <h3><a href="/menus/news">취사도구, 소품 구입</a></h3>
          </div>
        </div>
        <div class="side-B">
          <div class="product-thumb">
            <div class="image txt-rgt">
             <a><img src="images/campingitem3.jpg" class="img-responsive" alt="image" width="280px" height="280px"></a>            </div>
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="col-md-6 col-sm-12 col-xs-12 remove-padd-left">
        <div class="side-A">
          <div class="product-desc-side">
            <h3><a href="/menus/news">간식거리 구입</a></h3>
          </div>
        </div>
        <div class="side-B">
          <div class="product-thumb txt-rgt">
            <div class="image">
              <a><img src="images/campingitem4.jpg" class="img-responsive" alt="image" width="280px" height="280px"></a></div>
          </div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</section>


<!-- 캐러셀2 -->
<section class="blog-block-slider">
  <div class="blog-block-slider-fix-image">
    <div id="myCarousel2" class="carousel slide" data-ride="carousel">
      <div class="container">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel2" data-slide-to="1"></li>
          <li data-target="#myCarousel2" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <div class="blog-box">
              <p>캠핑장 검색 서비스를 통해 좋은 캠핑장을 찾았습니다 !</p>
            </div>
            <div class="blog-view-box">
              <div class="media">
                <div class="media-left">
                  <img src="images/icons/person.png" width="80px" height="80px" class="media-object">
                </div>
                <div class="media-body">
                  <h3 class="media-heading blog-title">김지성</h3>
                  <h5 class="blog-rev">부산시 남구</h5>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="blog-box">
              <p>캠핑 하기 전에 캠핑 후기를 읽고 많은 도움을 받았어요 !</p>
            </div>
            <div class="blog-view-box">
              <div class="media">
                <div class="media-left">
                  <img src="images/icons/person.png" width="80px" height="80px" class="media-object">
                </div>
                <div class="media-body">
                  <h3 class="media-heading blog-title">서지석</h3>
                  <h5 class="blog-rev">부산시 동래구</h5>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="blog-box">
              <p>캠핑할 때 필요한 물건들을 한 번에 구입가능해서 편리했어요 !</p>
            </div>
            <div class="blog-view-box">
              <div class="media">
                <div class="media-left">
                  <img src="images/icons/person.png" width="80px" height="80px" class="media-object">
                </div>
                <div class="media-body">
                  <h3 class="media-heading blog-title">김지훈</h3>
                  <h5 class="blog-rev">부산시 수영구</h5>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="clearfix"></div>
</section>

<!-- 포스트 -->
<section class="blog-block">
  <div class="container">
    <div class="row offspace-45">
      <div class="view-set-block">
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="event-blog-image">
            <img alt="image" class="img-responsive" src="images/campreview1.jpg" width="600px" height="300px">
          </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12 side-in-image">
          <div class="event-blog-details">
            <h4><a href="menus/gallery">캠핑 후기입니다 ...</a></h4>
            <h5> jihoon143 <a><i aria-hidden="true" class="fa fa-heart-o fa-lg"></i>좋아요</a><a><i aria-hidden="true" class="fa fa-comment-o fa-lg"></i>댓글</a></h5>
            <p>이 캠핑장 추천합니다.</p>
            <p>주변이 쾌적하고 한적해서 힐링 됐어요 ! ...</p>
            <a class="btn btn-default" href="menus/gallery">자세히</a>
          </div>
        </div>
      </div>
    </div>
    <div class="row offspace-45">
      <div class="view-set-block">
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="event-blog-image">
            <img alt="image" class="img-responsive" src="images/campreview2.jpg" width="600px" height="300px">
          </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12 side-in-image">
          <div class="event-blog-details">
            <h4><a href="menus/gallery">캠핑 후기 올립니다</a></h4>
            <h5>lee2532 <a><i aria-hidden="true" class="fa fa-heart-o fa-lg"></i>좋아요</a><a><i aria-hidden="true" class="fa fa-comment-o fa-lg"></i>댓글</a></h5>
            <p>여기 괜찮네요.</p>
            <p>처음 가본 곳인데 마음에 듭니다. 특히 ...</p>
            <a class="btn btn-default" href="menus/gallery">자세히</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>