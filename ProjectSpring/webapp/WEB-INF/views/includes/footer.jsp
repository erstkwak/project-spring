<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	footer {background-color: #2d2d2d;}
</style>

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
              <a href="#"><i class="fa fa-facebook"></i></a>
              <a href="#"><i class="fa fa-twitter"></i></a>
              <a href="#"><i class="fa fa-instagram"></i></a>
              <a href="#"><i class="fa fa-google-plus"></i></a>
              <a href="#"><i class="fa fa-youtube-play"></i></a>
            </div>
            <div class="input-group" id="subscribe">
              <input type="text" class="form-control subscribe-box" value="" name="subscribe" placeholder="EMAIL ID">
              <span class="input-group-btn">
                <button type="button" class="btn subscribe-button"><i class="fa fa-paper-plane fa-lg"></i></button>
              </span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12 width-50 width-set-50">
          <div class="footer-details">
            <h4>explore</h4>
            <ul class="list-unstyled footer-links">
              <li class="active"><a>링크1</a></li>
              <li><a href="about.html">링크2</a></li>
              <li><a href="rooms.html">링크3</a></li>
              <li><a href="gallery.html">링크4</a></li>
              <li><a href="#">링크5</a></li>
              <li><a href="news.html">링크6</a></li>
              <li><a href="contact.html">링크7</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-6 col-sm-12 col-xs-12">
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
  <!-- 위로 -->
  <a style="display: none;" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
    <span><i aria-hidden="true" class="fa fa-angle-up fa-lg"></i></span>
    <span>위로</span>
  </a>
  </div>
</body>
</html>