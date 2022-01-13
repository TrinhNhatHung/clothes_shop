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
<title>MU Shop</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- link font chữ -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
<!-- link icon -->
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css">
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- link css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

</head>

<style>
.side-bar {
	background-color: #253544;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	height: 100vh
}

.main-content {
	padding-left: 0px !important;
	padding-right: 0px !important;
	justify-content: flex-start;
	overflow-y: scroll;
	height: 100vh
}

.admin-cast {
	width: 100%;
	height: 55px;
	background-color: #374F65;
	display: flex;
	align-items: center;
}

.admin-cast a {
	color: #fff;
	text-decoration: none;
	font-size: 2em;
	margin-left: 15%
}

.side-bar .nav-sidebar {
	width: 100%;
}

.side-bar .nav-sidebar li.nav-item a.nav-link {
	padding-left: 15%;
	color: #A1A1A1;
	text-decoration: none;
	font-size: 1.4em;
	height: 100%;
	display: flex;
	align-items: center
}

.side-bar .nav-sidebar li.nav-item a.nav-link.active {
	color: #fff !important
}

.side-bar .nav-sidebar li.nav-item a.nav-link:hover {
	color: #fff;
	background-color: #3498DB
}

i.nav-icon {
	width: 14px !important;
}

.admin-info {
	width: 100%;
	padding-left: 15%;
	display: flex;
	align-items: center
}

.admin-info img {
	height: 43px;
	width: 43px
}

.admin-info .username {
	color: #fff;
	margin: 0px;
	font-size: 1.5em !important;
	font-weight: 500
}

.admin-info .role {
	color: #A1A1A1;
	margin: 0px
}
</style>
<body>
	<div class="admin-cast">
		<a href="${contextPath }/admin">Admin</a>
	</div>
	<div class="admin-info mt-3 mb-3">
		<div class="mr-3">
			<img alt="" src="${contextPath }/resources/assets/img/logo/admin-avatar.png">
		</div>
		<div>
			<p class="username">
				<security:authentication property="principal.username" />
			</p>
			<p class="role">Administrator</p>
		</div>
	</div>
	<ul class="nav flex-column nav-sidebar">
		<c:set var="overview" value='${url == "" ? "active" : ""}' />
		<c:set var="customer" value='${url == "customer" ? "active" : ""}' />
		<c:set var="employee" value='${url == "employee" ? "active" : ""}' />
		<c:set var="item" value='${url == "items" ? "active" : ""}' />
		<c:set var="order" value='${url == "orders" ? "active" : ""}' />
		<li class="nav-item"><a class='nav-link ${overview }'
			href="${contextPath }/admin"><i
				class='fas fa-th-large mr-3 nav-icon'></i>Tổng quan</a></li>
		<li class="nav-item"><a class="nav-link ${customer }"
			href="${contextPath }/admin/customer"><i
				class="fas fa-user-alt mr-3 nav-icon"></i>Khách hàng</a></li>
		<li class="nav-item"><a class="nav-link ${employee }"
			href="${contextPath }/admin/employee"><i
				class="fas fa-user-tie mr-3 nav-icon"></i>Nhân viên</a></li>
		<li class="nav-item"><a class="nav-link ${item }"
			href="${contextPath }/admin/items"><i
				class="fas fa-tshirt mr-3 nav-icon"></i>Mặt hàng</a></li>
		<li class="nav-item"><a class="nav-link ${order }"
			href="${contextPath }/admin/orders"><i
				class="fas fa-file-invoice-dollar mr-3 nav-icon"></i>Đơn hàng</a></li>
	</ul>
</body>

<script>
	
</script>
</html>