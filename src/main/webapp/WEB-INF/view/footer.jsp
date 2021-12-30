<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/taglib/import.jsp"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
<!-- FOOTER -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-6 col-lg-3">
					<img src="${contextPath}/resources/assets/img/logo/logomain.png" alt="" width="100px"
						height="100px"
						style="border-radius: 50%; border: 3px solid #000; margin-bottom: 20px;">
					<ul class="footer__list">
						<li class="footer__item">
							<p>
								<i class="fas fa-search-location footer__item-icon"></i> Ho Chi
								Minh, Viet Nam
							</p>
						</li>
						<li class="footer__item">
							<p>
								<i class="fas fa-phone-square-alt footer__item-icon"></i> Phone:
								<a href="tel:0123456789">0123456789</a>
							</p>
						</li>
						<li class="footer__item">
							<p>
								<i class="fas fa-envelope-square footer__item-icon"></i> Email:
								<a href="mailto:abc@gmail.com">abc@gmail.com</a>
							</p>
						</li>
						<li><a href="https://www.facebook.com/tien.nquyen.77"><i class="fab fa-facebook"
								style="font-size: 24px; margin-right: 10px"></i></a> <a href="https://www.facebook.com/tien.nquyen.77"><i
								class="fab fa-instagram"
								style="font-size: 24px; margin-right: 10px; color: pink;"></i></a> <a
							href="https://www.facebook.com/tien.nquyen.77"><i class="fab fa-youtube"
								style="font-size: 24px; margin-right: 10px; color: red;"></i></a> <a
							href="https://www.facebook.com/tien.nquyen.77"><i class="fab fa-twitter"
								style="font-size: 24px; margin-right: 10px"></i></a></li>
					</ul>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3">
					<div
						style="display: flex; justify-content: space-between; cursor: pointer; margin-bottom: 8px;"
						data-toggle="collapse" data-target="#demo2">
						<h3 class="footer__heading">Thông tin của chúng tôi</h3>
						<i class="fas fa-chevron-down checkdl1"></i>
					</div>
					<ul class="footer__list collapse show" id="demo2">
						<li class="footer__item"><a href="https://www.google.com/maps/d/u/0/viewer?ie=UTF8&t=h&oe=UTF8&msa=
						0&mid=17C-Xb8xJ3cWzD-WkplbhFN83FZI&ll=16.074903430040692%2C108.15500790031243&z=17"
							class="footer__item--link">Cơ sở 1: 54 Nguyễn Lương Bằng, Hoà Khánh Bắc, Liên Chiểu, Đà Nẵng
							</a></li>
						<li class="footer__item"><a href="https://www.google.com/maps/d/u/0/viewer?ie=UTF8&t=h&oe=UTF8&msa=
						0&mid=17C-Xb8xJ3cWzD-WkplbhFN83FZI&ll=16.074903430040692%2C108.15500790031243&z=17"
							class="footer__item--link">Cơ sở 2: 41 Đ. Lê Duẩn, Hải Châu 1, Hải Châu, Đà Nẵng</a></li>
					</ul>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3">
					<div
						style="display: flex; justify-content: space-between; cursor: pointer; margin-bottom: 8px;"
						data-toggle="collapse" data-target="#demo1">
						<h3 class="footer__heading">Chính sách</h3>
						<i class="fas fa-chevron-down checkdl1"></i>
					</div>
					<ul class="footer__list collapse show" id="demo1">
						<li class="footer__item"><a href=""
							class="footer__item--link">Chính sách bảo hành</a></li>
						<li class="footer__item"><a href=""
							class="footer__item--link">Chính sách đổi trả</a></li>
						<li class="footer__item"><a href=""
							class="footer__item--link">Chính sách thanh toán</a></li>
						<li class="footer__item"><a href=""
							class="footer__item--link">Chính sách giao nhận hàng</a></li>
						<li class="footer__item"><a href=""
							class="footer__item--link">Chính sách bảo mật</a></li>
					</ul>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3">
					<div
						style="display: flex; justify-content: space-between; cursor: pointer; margin-bottom: 8px;"
						data-toggle="collapse" data-target="#demo">
						<h3 class="footer__heading">Hỗ trợ chung</h3>
						<i class="fas fa-chevron-down checkdl1"></i>
					</div>
					<ul class="footer__list collapse show" id="demo">
						<li class="footer__item"><a href="${contextPath}"
							class="footer__item--link">Trang chủ</a>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer__bottom">
			<p class="footer__text">© Bản quyền thuộc về MU Shop</p>
		</div>
	</footer>
	<div id="go-to-top">
		<a class="btn-gototop"><i class="fas fa-arrow-up"></i></a>
	</div>
	<!-- end footer -->
</body>
</html>