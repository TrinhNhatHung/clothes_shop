<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="resources/assets/css/base.css">
<link rel="stylesheet" href="resources/assets/css/main.css">
<link rel="stylesheet" href="resources/assets/css/reponsive1.css">
<link rel="stylesheet" href="resources/assets/css/login.css">
<link rel="icon" href="resources/assets/img/logo/main.png"
	type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous"></script>
</head>
<style>
form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}

/* Mobile & tablet  */
@media ( max-width : 1023px) {
	.custom-btn {
		margin: unset;
	}
}

/* tablet */
@media ( min-width : 740px) and (max-width: 1023px) {
	.btn-blocker {
		display: block;
		width: 100%;
	}
	.show-hide {
		top: 56px;
	}
}

/* mobile */
@media ( max-width : 739px) {
	.btn-blocker {
		display: block;
		width: 100%;
	}
	.show-hide {
		top: 56px;
	}
}
</style>
<body>
	<div class="container">
		<div class="login__form">
			<div class="row">
				<div class="col-sm-12 col-lg-6">
					<form:form action="${pageContext.request.contextPath}/authenticate"
							   method="POST" class="form" id="form-2"
					>
						<h3 class="heading">ĐĂNG NHẬP</h3>
						<a href="" class="form__forgot-password">Bạn quên mật khẩu?</a>
						<div class="form-group">
							<label for="username" class="form-label">Username</label> <input
								id="username" name="username" type="text"
								placeholder="Nhập username" class="form-control">
						</div>

						<div class="form-group matkhau">
							<label for="password" class="form-label">Mật khẩu</label> <input
								id="password" name="password" type="password"
								placeholder="Nhập mật khẩu" class="form-control"> <span
								class="show-hide"><i class="fas fa-eye"
								onclick="myFunction()"></i></span>
						</div>
						<c:if test="${param.error != null}">
							<div class="text-danger h4">Invalid username or password.</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="text-danger h4">You have been logged out.</div>
						</c:if>
						<button type="submit" class="form-submit btn-blocker"
							style="border-radius: unset;">
							ĐĂNG NHẬP <i class="fas fa-arrow-right"
								style="font-size: 16px; margin-left: 10px;"></i>
						</button>
					</form:form>
				</div>
				<div class="col-sm-12 col-lg-6">
					<h3 class="heading">TẠO MỘT TÀI KHOẢN</h3>
					<p class="text-login">Thật dễ dàng tạo một tài khoản. Hãy nhập
						tài khoản của bạn và điền vào mẫu trên trang tiếp theo đế sở hữu một tài khoản :</p>
					<ul>
						<li class="text-login-item"><i class="fas fa-check"></i>
							<p class="text-login">Các sản phẩm mới nhất</p></li>
						<li class="text-login-item"><i class="fas fa-check"></i>
							<p class="text-login">Thanh toán nhanh hơn</p></li>
						<li class="text-login-item"><i class="fas fa-check"></i>
							<p class="text-login">Các sự kiện sắp tới</p></li>
					</ul>
					<a href="${pageContext.request.contextPath}/signup"><button
							class="form-submit btn-blocker custom-btn"
							style="border-radius: unset; margin: unset">
							ĐĂNG KÍ <i class="fas fa-arrow-right"
								style="font-size: 16px; margin-left: 10px;"></i>
						</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	const pass_field = document.querySelector('#password');
	const show_btn = document.querySelector('.fa-eye')
	function myFunction() {
		if (pass_field.type === "password") {
			pass_field.type = "text";
			show_btn.classList.add("hide");
		} else {
			pass_field.type = "password";
			show_btn.classList.remove("hide");
		}
	}
</script>
</html>