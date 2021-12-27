<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/taglib/import.jsp"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<link rel="stylesheet" href="resources/assets/css/login.css">
<link rel="stylesheet" href="resources/assets/css/reponsive1.css">
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
	.show-hide-two {
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
	.show-hide-two {
		top: 56px;
	}
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="registration__form">
			<div class="row">
				<div class="col-sm-12 col-lg-6">
					<form:form
						action="${contextPath}/processSignup"
						modelAttribute="user" method="POST" class="form" id="form-1">
						<h3 class="heading">ĐĂNG KÍ</h3>
						<div class="form-group">
							<label for="username" class="form-label">Username</label>
							<form:input id="username" path="username" type="text"
								placeholder="Username" class="form-control mb-1" />
							<form:errors path="username" class="text-danger h4" />
						</div>
						<div class="form-group">
							<label for="fullname" class="form-label">Tên đầy đủ</label>
							<form:input id="fullname" path="fullname" type="text"
								placeholder="VD: Nguyen Van A" class="form-control mb-1" />
							<form:errors path="fullname" class="text-danger h4" />
						</div>
						<div class="form-group">
							<label for="phone" class="form-label">Số điện thoại</label>
							<form:input id="phone" path="phone" type="text"
								placeholder="0123456789" class="form-control mb-1" />
							<form:errors path="phone" class="text-danger h4" />
						</div>
						<div class="form-group">
							<label for="address" class="form-label">Địa chỉ</label>
							<form:input id="address" path="address" type="text"
								class="form-control mb-1" />
							<form:errors path="address" class="text-danger h4" />
						</div>
						<div class="form-group matkhau">
							<label for="password" class="form-label">Mật khẩu</label>
							<form:input id="password" path="password" type="password"
								placeholder="Nhập mật khẩu" class="form-control mb-1" />
							<span class="show-hide"><i class="fas fa-eye"></i></span>
							<form:errors path="password" class="text-danger h4" />
						</div>

						<div class="form-group matkhau">
							<label for="password_confirmation" class="form-label">Nhập
								lại mật khẩu</label>
							<form:input id="password_confirmation"
								path="passwordConfirmation" placeholder="Nhập lại mật khẩu"
								type="password" class="form-control mb-1" />
							<span class="show-hide-two"><i class="fas fa-eye fa-eye-2"></i></span>
							<form:errors path="passwordConfirmation" class="text-danger h4" />
						</div>
						<div class="form-group">
							<label for="gender" class="form-label">Giới tính</label>
							<div class="mb-1">
								<div class="form-check-inline">
									<form:radiobutton path="gender" class="form-check-input"
										value="Nam" />
									Nam
								</div>
								<div class="form-check-inline">
									<form:radiobutton path="gender" class="form-check-input"
										value="Nữ" />
									Nữ
								</div>
							</div>
							<form:errors path="gender" class="text-danger h4" />
						</div>
						<c:if test="${registrationError != null}">
							<div class="text-danger h4">${registrationError}</div>
						</c:if>
						<button type="submit" class="form-submit btn-blocker"
							style="border-radius: unset;">
							Đăng ký <i class="fas fa-arrow-right"
								style="font-size: 16px; margin-left: 10px;"></i>
						</button>
						<p style="font-size: 16px; margin: 10px 0;">
							Bạn đã có tài khoản? <a href="${contextPath}/login"
								style="color: black; font-weight: bold">Đăng nhập</a>
						</p>
					</form:form>
				</div>
				<div class="col-sm-12 col-lg-6">
					<h3 class="heading">TẠO MỘT TÀI KHOẢN</h3>
					<p class="text-login">Đăng nhập bằng tài khoản sẽ giúp bạn truy
						cập:</p>
					<ul>
						<li class="text-login-item"><i class="fas fa-check"></i>
							<p class="text-login">Một lần đăng nhập chung duy nhất để
								tương tác với các sản phẩm và dịch vụ của MU shop</p></li>
						<li class="text-login-item"><i class="fas fa-check"></i>
							<p class="text-login">Thanh toán nhanh hơn</p></li>
						<li class="text-login-item"><i class="fas fa-check"></i>
							<p class="text-login">Xem lịch sử đặt hàng riêng của bạn</p></li>
						<li class="text-login-item"><i class="fas fa-check"></i>
							<p class="text-login">Xem các sản phẩm mới nhất</p></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	const pass_field = document.querySelector('#password');
	const show_btn = document.querySelector('.fa-eye')
	show_btn.addEventListener("click", function() {
		if (pass_field.type === "password") {
			pass_field.type = "text";
			show_btn.classList.add("hide");
		} else {
			pass_field.type = "password";
			show_btn.classList.remove("hide");
		}
	});
</script>
<script>
	const pass_field2 = document.querySelector('#password_confirmation');
	const show_btn2 = document.querySelector('.fa-eye-2')
	show_btn2.addEventListener("click", function() {
		if (pass_field2.type === "password") {
			pass_field2.type = "text";
			show_btn2.classList.add("hide");
		} else {
			pass_field2.type = "password";
			show_btn2.classList.remove("hide");
		}
	});
</script>
</html>