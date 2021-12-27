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
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/main.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/style.css">
</head>
<body>
	<div class="overlay hidden"></div>
	<!-- mobile menu -->
	<div class="mobile-main-menu">
		<div class="drawer-header">
			<a href="">
				<div class="drawer-header--auth">
					<div class="_object">
						<img src="./assets/img/product/giayxah2.jpg" alt="">
					</div>
					<div class="_body">
						Đăng nhập <br>Nhận nhiều ưu đãi hơn
					</div>
				</div>
			</a>
		</div>
		<ul class="ul-first-menu">
			<li><a href="">Đăng nhập</a></li>
			<li><a href="" class="abc">Đăng kí</a></li>
		</ul>

		</ul>
		<div class="la-scroll-fix-infor-user">
			<div class="la-nav-menu-items">
				<div class="la-title-nav-items">
					<strong>Danh mục</strong>
				</div>
				<ul class="la-nav-list-items">
					<li class="ng-scope"><a href="./index.html" class="active">Trang
							chủ</a></li>
					<li class="ng-scope"><a href="./intro.html">Giới thiệu</a></li>
					<li class="ng-scope"><a href="./news.html">Tin tức</a></li>
					<li class="ng-scope"><a href="./contact.html">Liên hệ</a></li>
				</ul>
			</div>
		</div>
		<ul class="mobile-support">
			<li>
				<div class="drawer-text-support">Hỗ trợ</div>
			</li>
			<li><i class="fas fa-phone-square-alt footer__item-icon">HOTLINE:
			</i> <a href="tel:19006750">19006750</a></li>
			<li><i class="fas fa-envelope-square footer__item-icon">Email:
			</i> <a href="mailto:support@sapo.vn">support@gmail.vn</a></li>
		</ul>
	</div>


	<!-- header -->
	<header class="header">
		<div class="container">
			<div class="top-link clearfix hidden-sm hidden-xs">
				<div class="row">
					<div class="col-6 social_link">
						<div class="social-title">Theo dõi:</div>
						<a href=""><i class="fab fa-facebook"
							style="font-size: 24px; margin-right: 10px"></i></a> <a href=""><i
							class="fab fa-instagram"
							style="font-size: 24px; margin-right: 10px; color: pink;"></i></a> <a
							href=""><i class="fab fa-youtube"
							style="font-size: 24px; margin-right: 10px; color: red;"></i></a> <a
							href=""><i class="fab fa-twitter"
							style="font-size: 24px; margin-right: 10px"></i></a>
					</div>
					<div class="col-6 login_link">
						<ul class="header_link right m-auto">
							<li><a href="${pageContext.request.contextPath}/login"><i
									class="fas fa-sign-in-alt mr-3"></i>Đăng nhập</a></li>
							<li><a href="${pageContext.request.contextPath}/signup"><i
									class="fas fa-user-plus mr-3" style="margin-left: 10px;"></i>Đăng
									kí</a></li>
						</ul>

					</div>
				</div>
			</div>
			<div class="header-main clearfix">
				<div class="row">
					<div class="col-lg-3 col-100-h">
						<div id="trigger-mobile" class="visible-sm visible-xs">
							<i class="fas fa-bars"></i>
						</div>
						<div class="logo">
							<a href=""> <img
								src="${contextPath}/resources/assets/img/logo/logomain.png"
								alt="">
							</a>
						</div>
						<div class="mobile_cart visible-sm visible-xs">
							<a href="./cart.html" class="header__second__cart--icon"> <i
								class="fas fa-shopping-cart"></i> <span
								id="header__second__cart--notice"
								class="header__second__cart--notice">3</span>
							</a> <a href="./listlike.html" class="header__second__like--icon">
								<i class="far fa-heart"></i> <span
								id="header__second__like--notice"
								class="header__second__like--notice">3</span>
							</a>
						</div>
					</div>
					<div class="col-lg-6 m-auto pdt15">
						<form class="example">
							<input type="text" class="input-search" placeholder="Tìm kiếm.."
								name="search" id="searchInput">
							<button type="button" class="search-btn"
								onclick="searchItems('${contextPath}')">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
					<div class="col-3 m-auto hidden-sm hidden-xs">
						<div class="item-car clearfix">
							<a href="./cart.html" class="header__second__cart--icon"> <i
								class="fas fa-shopping-cart"></i> <span
								id="header__second__cart--notice"
								class="header__second__cart--notice">3</span>
							</a>
						</div>
						<div class="item-like clearfix">
							<a href="./listlike.html" class="header__second__like--icon">
								<i class="far fa-heart"></i> <span
								id="header__second__like--notice"
								class="header__second__like--notice">3</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</header>
	<!-- end header -->
</body>
<script>
	
</script>
</html>