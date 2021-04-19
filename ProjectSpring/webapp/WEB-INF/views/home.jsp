<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<!-- 캐러셀1 -->
<div id="myCarousel1" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel1" data-slide-to="1"></li>
    <li data-target="#myCarousel1" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/banner.png" style="width:100%; height: 500px" alt="First slide">
      <div class="carousel-caption">
        <h1>슬라이드1<br>내용1</h1>
      </div>
    </div>
    <div class="item">
      <img src="images/banner2.png" style="width:100%; height: 500px" alt="Second slide">
      <div class="carousel-caption">
        <h1>슬라이드2<br>내용2</h1>
      </div>
    </div>
    <div class="item">
      <img src="images/banner3.png" style="width:100%; height: 500px" alt="Third slide">
      <div class="carousel-caption">
        <h1>슬라이드3<br>내용3</h1>
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
            <img alt="image" class="img-responsive" src="images/icons/wifi.png">
          </div>
          <h4><a>서비스1</a></h4>
        </div>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-6 width-50">
        <div class="service-details text-center">
          <div class="service-image">
            <img alt="image" class="img-responsive" src="images/icons/key.png">
          </div>
          <h4><a>서비스2</a></h4>
        </div>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
        <div class="service-details text-center">
          <div class="service-image">
            <img alt="image" class="img-responsive" src="images/icons/car.png">
          </div>
          <h4><a>서비스3</a></h4>
        </div>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
        <div class="service-details text-center">
          <div class="service-image">
            <img alt="image" class="img-responsive" src="images/icons/user.png">
          </div>
          <h4><a>서비스4</a></h4>
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
          <img class="img-responsive" src="images/room1.png">
          <div class="overlay">
            <a class="info pop example-image-link img-responsive" href="images/room1.png" data-lightbox="example-1"><i class="fa fa-search" aria-hidden="true"></i></a>
            <p><a>갤러리1</a></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        <div class="gallery-image">
          <img class="img-responsive" src="images/room2.png">
          <div class="overlay">
            <a class="info pop example-image-link img-responsive" href="images/room2.png" data-lightbox="example-1"><i class="fa fa-search" aria-hidden="true"></i></a>
            <p><a>갤러리2</a></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        <div class="gallery-image">
          <img class="img-responsive" src="images/room3.png">
          <div class="overlay">
            <a class="info pop example-image-link img-responsive" href="images/room3.png" data-lightbox="example-1"><i class="fa fa-search" aria-hidden="true"></i></a>
            <p><a>갤러리3</a></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        <div class="gallery-image">
          <img class="img-responsive" src="images/room4.png">
          <div class="overlay">
            <a class="info pop example-image-link img-responsive" href="images/room4.png" data-lightbox="example-1"><i class="fa fa-search" aria-hidden="true"></i></a>
            <p><a>갤러리4</a></p>
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
            <h1>배너</h1>
            <h4>배너 내용</h4>
            <button type="button" class="btn btn-default">버튼</button>
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
              <a><img src="images/category1.png" class="img-responsive" alt="image"></a>
            </div>
          </div>
        </div>
        <div class="side-B">
          <div class="product-desc-side">
            <h3><a>더보기1</a></h3>
            <p>내용1</p>
            <div class="links"><a href="single-blog.html">링크1</a></div>
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="col-md-6 col-sm-12 col-xs-12 remove-padd-left">
        <div class="side-A">
          <div class="product-thumb">
            <div class="image">
              <a><img alt="image" class="img-responsive" src="images/category2.png"></a>
            </div>
          </div>
        </div>
        <div class="side-B">
          <div class="product-desc-side">
            <h3><a>더보기2</a></h3>
            <p>내용2</p>
            <div class="links"><a href="single-blog.html">링크2</a></div>
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="col-md-6 col-sm-12 col-xs-12 remove-padd-right">
        <div class="side-A">
          <div class="product-desc-side">
            <h3><a>더보기3</a></h3>
            <p>내용3</p>
            <div class="links"><a href="single-blog.html">링크3</a></div>
          </div>
        </div>
        <div class="side-B">
          <div class="product-thumb">
            <div class="image txt-rgt">
              <a class="arrow-left"><img src="images/category3.png" class="img-responsive" alt="imaga"></a>
            </div>
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="col-md-6 col-sm-12 col-xs-12 remove-padd-left">
        <div class="side-A">
          <div class="product-desc-side">
            <h3><a>더보기4</a></h3>
            <p>내용4</p>
            <div class="links"><a href="single-blog.html">링크4</a></div>
          </div>
        </div>
        <div class="side-B">
          <div class="product-thumb txt-rgt">
            <div class="image">
              <a class="arrow-left"><img src="images/category4.png" class="img-responsive" alt="imaga"></a>
            </div>
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
              <p>내용1</p>
            </div>
            <div class="blog-view-box">
              <div class="media">
                <div class="media-left">
                  <img src="images/client1.png" class="media-object">
                </div>
                <div class="media-body">
                  <h3 class="media-heading blog-title">제목1</h3>
                  <h5 class="blog-rev">소제목1</h5>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="blog-box">
              <p>내용2</p>
            </div>
            <div class="blog-view-box">
              <div class="media">
                <div class="media-left">
                  <img src="images/client2.png" class="media-object">
                </div>
                <div class="media-body">
                  <h3 class="media-heading blog-title">제목2</h3>
                  <h5 class="blog-rev">소제목2</h5>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="blog-box">
              <p>내용3</p>
            </div>
            <div class="blog-view-box">
              <div class="media">
                <div class="media-left">
                  <img src="images/client3.png" class="media-object">
                </div>
                <div class="media-body">
                  <h3 class="media-heading blog-title">제목3</h3>
                  <h5 class="blog-rev">소제목3</h5>
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
            <img alt="image" class="img-responsive" src="images/blog1.png">
          </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12 side-in-image">
          <div class="event-blog-details">
            <h4><a href="single-blog.html">제목</a></h4>
            <h5>글쓴이 <a><i aria-hidden="true" class="fa fa-heart-o fa-lg"></i>좋아요</a><a><i aria-hidden="true" class="fa fa-comment-o fa-lg"></i>댓글</a></h5>
            <p>내용1</p>
            <p>내용2</p>
            <a class="btn btn-default" href="single-blog.html">더보기</a>
          </div>
        </div>
      </div>
    </div>
    <div class="row offspace-45">
      <div class="view-set-block">
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="event-blog-image">
            <img alt="image" class="img-responsive" src="images/blog2.png">
          </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12 side-in-image">
          <div class="event-blog-details">
            <h4><a href="single-blog.html">제목</a></h4>
            <h5>글쓴이 <a><i aria-hidden="true" class="fa fa-heart-o fa-lg"></i>좋아요</a><a><i aria-hidden="true" class="fa fa-comment-o fa-lg"></i>댓글</a></h5>
            <p>내용1</p>
            <p>내용2</p>
            <a class="btn btn-default" href="single-blog.html">Read More</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>