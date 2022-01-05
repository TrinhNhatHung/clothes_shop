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
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/base.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/main.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/reponsive1.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/style.css">
<link rel="icon"
	href="${contextPath}/resources/assets/img/logo/logomain.png"
	type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous"></script>
</head>
<style>
body {
	background: #edf1f5;
}

.header-order-detail {
	background-color: white;
	margin: 10px 0px;
	border-radius: 3px;
	display: flex;
	justify-content: space-between !important;
	padding: 10px;
    align-items: center
}

.header-right {
	font-size: 1.5em;
}

.header-right span {
	font-weight: bold;
}

.continue a {
	color: #000000;
	font-size: 20px;
	font-weight: 500;
	vertical-align: middle;
}

.continue a:hover {
	text-decoration: none;
}

.sliderbar {
    background-color: white;
    padding: 10px 0px
}

.slider-footer {
	border-top: solid 1px #e4e4e4;
}

.row-sliderbar {
	border-top: solid 0.5px #f2f2f2;
    border-bottom: solid 0.5px #f2f2f2;
    padding: 15px 0px;
    margin: 0px 20px;

}

.row-sliderbar-footer {
    margin: 20px 0;
}

.notice {
    position: absolute;
    background-color: #d9121f;
    color: var(--white-color);
    padding: 1px 6px;
    font-size: 10px;
    border-radius: 50%;
    top: -8px;
    left: 108px;
}

.fi-rs-angle-left {
    font-size: 16px !important;
    font-weight: 600;
}

.col-2 span {
    font-size: 16px;
}
.col-5 span {
    font-size: 16px;
}
.col-3 img {
    position: relative;
    height: 100px;
    width: 100px
}

.summary {
    border-bottom: 1px solid #000;
    padding: 10px 5px;
}
.summary-heading {
    display: flex;
    justify-content: space-between;
}

.total {
	font-size: 1.5em
}

.item-name {
	text-decoration: none;
	color : #000000
}

.item-name:hover {
	text-decoration: none
}
</style>
<body>
	<%@ include file="header.jsp"%>

	<div class="container mb-18">
		<div class="header-order-detail">
			<div class="continue">
				<a href="${contextPath }/purchase"> <i class="fi-rs-angle-left"></i>
					Trở lại
				</a>
			</div>
			<div class="header-right">ID đơn hàng. ${order.id } - <span>${order.status.status }</span></div>
		</div>
		<div class="sliderbar">
			<div class="sliderbar-content">
				<c:forEach items="${order.orderDetails }" var="orderDetail">
					<div class="row row-sliderbar">
						<div class="col-3">
							<a href="${contextPath }/item-detail/${orderDetail.item.id}"><img src="${orderDetail.item.linkImage }" alt="" width="80%"></a>
							<span class="notice">${orderDetail.quantity }</span>
						</div>
						<div class="col-5">
							<a class="item-name" href="${contextPath }/item-detail/${orderDetail.item.id}"><h5>${orderDetail.item.name }</h5></a>
						</div>
						<div class="col-2">
							<span>SL: ${orderDetail.quantity }</span>
						</div>
						<div class="col-2">
							<span>${orderDetail.price * orderDetail.quantity }đ</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="slider-footer">
				<div class="total">
					<div class="row row-sliderbar-footer">
						<div class="col-2">
							<span>Tổng cộng:</span>
						</div>
						<div class="col-2 text-right">
							<span>${totalBill }đ</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>