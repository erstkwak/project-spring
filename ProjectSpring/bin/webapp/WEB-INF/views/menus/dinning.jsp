<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<section class="image-head-wrapper" style="background-image: url('/images/banner2.jpg');">
  <div class="inner-wrapper">
    <h1>dinning</h1>
  </div>
</section>
<div class="clearfix"></div>

<section class="blog">
  <div class="container">
    <div class="row">
      <div class="col-md-9 col-sm-8 col-xs-12">
        <h2 class="blog-title-head">Lorem Ipsum Dolor Sit amet</h2>
        <p class="user-info">Posted by <a>Admin</a> in <a>General</a> | <a>10 Comments</a></p>
        <div class="blog-image-single margin-top-small">
          <img src="/images/banner2.png" class="img-responsive">
        </div>
        <p class="blog-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
          ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
          voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet,
          consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
          enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do </p>
        <div class="clearfix"></div>
        <div class="single-bottom comment-form">
          <h3>Leave your Comment</h3>
          <form action="#" method="post">
            <input type="text" class="form-control" name="Name" placeholder="Name">
            <input type="email" class="form-control" name="Email" placeholder="Email">
            <textarea class="form-control" name="Message" placeholder="Message Here...."></textarea>
            <input type="submit" class="submit-btn" value="Send">
          </form>
        </div>
      </div>
      <aside class="col-md-3 col-sm-4 col-xs-12">
        <div class="blog-list">
          <h4>Categories</h4>
          <ul>
            <li><a><i class="fa fa-caret-right"> </i>Lorem Ipsum is simply</a></li>
            <li><a><i class="fa fa-caret-right"> </i>Contrary to popular belief</a></li>
            <li><a><i class="fa fa-caret-right"> </i>It is a long established</a></li>
            <li><a><i class="fa fa-caret-right"> </i>There are many variations</a></li>
            <li><a><i class="fa fa-caret-right"> </i>But I must explain to you</a></li>
            <li><a><i class="fa fa-caret-right"> </i>At vero eos et accusamus</a></li>
            <li><a><i class="fa fa-caret-right"> </i>On the other hand</a></li>
          </ul>
          <div class="clearfix"> </div>
        </div>
        <div class="blog-list">
          <h4>Archives List</h4>
          <ul>
            <li><a><i class="fa fa-caret-right"> </i>July (15)</a></li>
            <li><a><i class="fa fa-caret-right"> </i>Oct (20)</a></li>
            <li><a><i class="fa fa-caret-right"> </i>November (8)</a></li>
            <li><a><i class="fa fa-caret-right"> </i>December (25)</a></li>
            <li><a><i class="fa fa-caret-right"> </i>August (9)</a></li>
            <li><a><i class="fa fa-caret-right"> </i>July (15)</a></li>
            <li><a><i class="fa fa-caret-right"> </i>Mar (25)</a></li>
          </ul>
        </div>
        <div class="blog-list1">
          <h4>Popular Posts</h4>
          <div class="blog-list-top">
            <div class="blog-img">
              <a><img class="img-responsive" src="/images/Home/img1.jpg" alt=""></a>
            </div>
            <div class="blog-text">
              <p><a>Lorem ipsum dolor sit amet, consectetuer</a></p>
              <span class="link">
                Sep 14, 2016
              </span>
            </div>
            <div class="clearfix"> </div>
          </div>
          <div class="blog-list-top">
            <div class="blog-img">
              <a><img class="img-responsive" src="/images/Home/img3.jpg" alt=""></a>
            </div>
            <div class="blog-text">
              <p><a>Lorem ipsum dolor sit amet, consectetuer</a></p>
              <span class="link">
                Sep 14, 2016
              </span>
            </div>
            <div class="clearfix"> </div>
          </div>

          <div class="blog-list-top">
            <div class="blog-img">
              <a><img class="img-responsive" src="/images/Home/img4.jpg" alt=""></a>
            </div>
            <div class="blog-text">
              <p><a>Lorem ipsum dolor sit amet, consectetuer</a></p>
              <span class="link">
                Sep 14, 2016
              </span>
            </div>
            <div class="clearfix"> </div>
          </div>

          <div class="blog-list-top">
            <div class="blog-img">
              <a><img class="img-responsive" src="/images/Home/img5.jpg" alt=""></a>
            </div>
            <div class="blog-text">
              <p><a>Lorem ipsum dolor sit amet, consectetuer</a></p>
              <span class="link">
                Sep 14, 2016
              </span>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
      </aside>
    </div>
  </div>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>