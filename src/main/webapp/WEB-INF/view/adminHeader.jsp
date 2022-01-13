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
<style>
button.button-hidden {
	border: none;
	background-color: white;
	outline: none
}

form.logout {
	margin-right: 0px;
}

i.icon {
	color: #000000
}

i.icon:hover {
	color: #dc3545;
}

.logo {
	height: 55px
}
</style>
<body>
	<div class="overlay hidden"></div>
	<!-- mobile menu -->
	<div class="mobile-main-menu">
		<div class="drawer-header">
			<a href="">
				<div class="drawer-header--auth">
					<div class="_object">
						<img src="" alt="">
					</div>
					<div class="_body">
						Đăng nhập <br>Nhận nhiều ưu đãi hơn
					</div>
				</div>
			</a>
		</div>
		<ul class="ul-first-menu">
			<li><a href="${contextPath }/login">Đăng nhập</a></li>
			<li><a href="${contextPath }/signup">Đăng kí</a></li>
		</ul>
		<div class="la-scroll-fix-infor-user">
			<div class="la-nav-menu-items">
				<div class="la-title-nav-items">
					<strong>Danh mục</strong>
				</div>
				<ul class="la-nav-list-items">
					<li class="ng-scope"><a href="" class="active">Trang
							chủ</a></li>
					<li class="ng-scope"><a href="">Giới thiệu</a></li>
					<li class="ng-scope"><a href="">Tin tức</a></li>
					<li class="ng-scope"><a href="">Liên hệ</a></li>
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
			<div class="header-main clearfix">
				<div class="row">
					<div class="col-lg-3 col-100-h">
						<div id="trigger-mobile" class="visible-sm visible-xs">
							<i class="fas fa-bars"></i>
						</div>
						<div class="logo">
							<a href="${contextPath}"> <img class="logo"
								src="${contextPath}/resources/assets/img/logo/logomain.png"
								alt="">
							</a>
						</div>
						<div class="mobile_cart visible-sm visible-xs">
							<a href="${contextPath }/cart" class="header__second__cart--icon">
								<i class="fas fa-shopping-cart"></i> <span
								id="header__second__cart--notice"
								class="header__second__cart--notice">${amountInCart }</span>
							</a>
						</div>
					</div>
					<div class="col-lg-6 m-auto pdt15">
						
					</div>
					<div class="col-3 m-auto hidden-sm hidden-xs">
						<div class="item-car clearfix d-flex align-items-center">
						
							<security:authorize access="isAuthenticated()">
								<form:form action="${contextPath }/logout" method="POST"
									class="header__second__cart--icon logout">
									<button class="button-hidden" type="submit"
										data-toggle="tooltip" data-placement="bottom"
										title="Đăng xuất">
										<i class="fas fa-sign-out-alt icon"></i>
									</button>
								</form:form>
							</security:authorize>
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