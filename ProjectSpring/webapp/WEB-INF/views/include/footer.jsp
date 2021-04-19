<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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