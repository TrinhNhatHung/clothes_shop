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
<link rel="stylesheet" href="resources/assets/css/base.css">
<link rel="stylesheet" href="resources/assets/css/main.css">
<link rel="stylesheet" href="resources/assets/css/pay.css">
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
	.summary {
		display: block;
	}
}

/* tablet */
@media ( min-width : 740px) and (max-width: 1023px) {
}

/* mobile */
@media ( max-width : 739px) {
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="wrap">
			<div class="container">
				<form:form action="${contextPath }/buy" method="POST"
					modelAttribute="order">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="main">
								<div class="main-header">
									<a href="">
										<h1>MU SHOP</h1>
									</a>
								</div>
								<div class="main-content">
									<div class="main-title">
										<h2>Thông tin giao hàng</h2>
									</div>
									<br>
									<div class="fieldset">
										<div class="fieldset-address form-group">
											<label for="diachi" class="form-label" for="">Địa chỉ</label>
											<input id="diachi" name="address" type="text"
												class="form-control" value="${user.address}"> <span
												class="form-message"></span>
										</div>
										<div class="fieldset-name form-group">
											<label for="hoten" class="form-label" for="">Họ tên</label> <input
												id="hoten" name="receiverName" type="text"
												class="form-control" value="${user.fullname}"> <span
												class="form-message"></span>
										</div>
										<div class="fieldset-phone form-group">
											<label for="sdt" class="form-label" for="">Số điện
												thoại</label> <input id="sdt" name="receiverPhone" type="text"
												class="form-control" value="${user.phone}"> <span
												class="form-message"></span>
										</div>

									</div>
								</div>
								<div class="main-footer">
									<div class="continue">
										<a href="${contextPath }/cart"> <i
											class="fi-rs-angle-left"></i> Giỏ hàng
										</a>
									</div>
									<c:if test="${size != 0 }">
										<div class="pay">
											<button type="submit" class="btn-pay form-submit">Thanh
												toán</button>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-12 hidden-sm hidden-xs"
							style="background-color: #f3f3f3;">
							<div class="sliderbar">
								<div class="sliderbar-header">
									<h2>Thông tin đơn hàng</h2>
								</div>
								<div class="sliderbar-content">
									<c:forEach items="${carts }" var="cart">
										<input type="hidden" name="carts" value="${cart.item.id }">
										<div class="row row-sliderbar">
											<div class="col-4">
												<img src="${cart.item.linkImage }" alt="" width="80%">
												<span class="notice">${cart.quantity }</span>
											</div>
											<div class="col-6">
												<h5>${cart.item.name }</h5>
											</div>
											<div class="col-2">
												<span>${cart.item.outPrice * cart.quantity * (100 - cart.item.discount)/ 100 }đ</span>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="slider-footer">
									<div class="total">
										<div class="row row-sliderbar-footer">
											<div class="col-6">
												<span>Tổng cộng:</span>
											</div>
											<div class="col-6 text-right">
												<span>${totalBill }đ</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<div id="go-to-top">
		<a class="btn-gototop"><i class="fas fa-arrow-up"></i></a>
	</div>
</body>
<script src="resources/assets/js/validator.js"></script>
<script src="resources/assets/js/main.js"></script>

</html>