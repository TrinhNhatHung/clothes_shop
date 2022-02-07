<%@page import="java.time.LocalDateTime"%>
<%@page import="com.shop.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/taglib/import.jsp"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/base.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/main.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/product.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/productdetail.css">
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
	background: #edf1f5 !important;
}

.info {
	background-color: #23B7E5;
	color: white
}

.info-dark {
	background-color: #1FA4CE;
	color: white
}

.success {
	background-color: #2ecc71;
	color: white
}

.success-dark {
	background-color: #29B766;
	color: white
}

.warning {
	background-color: #F39C12;
	color: white
}

.warning-dark {
	background-color: #DA8C10;
	color: white
}

.danger {
	background-color: #e74c3c;
	color: white
}

.danger-dark {
	background-color: #D04436;
	color: white
}

.board {
	height: 106px
}

.col {
	padding: 0px !important;
}

.col-10, .col-9 {
	display: flex;
	flex-direction: column;
	justify-content: center
}

.col-2, .col-3 {
	padding: 0px !important;
	display: flex;
	justify-content: center;
	align-items: center;
}

.board-icon {
	font-size: 2em
}

.btn {
	background-color: #000 !important;
	color: #fff !important
}

.btn:hover {
	background-color: #333333 !important;
	color: #fff !important
}

.form {
	display: flex;
	justify-content: flex-end;
}

.form .pick-time {
	width: 180px
}

.board .text-lv1 {
	font-size: 3.5em !important
}

.board .text-lv2 {
	font-size: 1.4em !important;
	font-weight: 500
}

.board .text-lv3 {
	font-size: 1.3em !important
}

.table .title-order th {
	font-size: 1.45em !important;
}

.value-order {
	font-size: 1.4em !important
}

.anchor {
	text-decoration: none;
	color: #000000;
	display: inline-block;
	height: 100%;
	width: 100%
}

.anchor:hover {
	text-decoration: none;
	color: #000000;
}

.anchor-grey {
	text-decoration: none;
	color: #6c757d;
	display: inline-block;
	height: 100%;
	width: 100%
}

.anchor-grey:hover {
	text-decoration: none;
	color: #6c757d;
}

.column-cell {
	vertical-align: middle !important;
}

button.btn {
	height: 35px !important;
	width: 60px !important;
	display: flex;
	justify-content: center;
	align-items: center;
}

button.btn i.fa {
	font-size: small;
}

.no-result {
	color: gray;
	text-align: center;
	background: #edf1f5;
	margin-top: 10px;
	padding: 15px 0px;
	font-size: 1.6em;
}
</style>
<body>
	<div class="row">
		<div class="side-bar col-2">
			<%@ include file="adminSidebar.jsp"%>
		</div>
		<div class="main-content col-10">
			<%@ include file="adminHeader.jsp"%>
			<div class="container-fluid mb-18 mt-4">
				<div class="row">
					<div class="board col success ml-3 mr-3 row">
						<div class="col-10">
							<h5 class="text-lv1">${totalOrder }</h5>
							<span class="text-uppercase text-lv2">Đơn hàng mới</span> <span
								class="text-lv3"></span>
						</div>
						<div class="col-2 success-dark">
							<i class="fas fa-shopping-cart board-icon"></i>
						</div>
					</div>
					<div class="board col info ml-3 mr-3 row">
						<div class="col-10">
							<h5 class="text-lv1">${totalIncome }</h5>
							<span class="text-uppercase text-lv2">Lợi nhuận</span> <span
								class="text-lv3"></span>
						</div>
						<div class="col-2 info-dark">
							<i class="fas fa-chart-bar board-icon"></i>
						</div>
					</div>
					<div class="board col warning ml-3 mr-3 row">
						<div class="col-10">
							<h5 class="text-lv1">${totalRevenue }</h5>
							<span class="text-uppercase text-lv2">Tổng doanh thu</span> <span
								class="text-lv3"></span>
						</div>
						<div class="col-2 warning-dark">
							<i class="far fa-money-bill-alt board-icon"></i>
						</div>
					</div>
					<div class="board col danger ml-3 mr-3 row">
						<div class="col-10">
							<h5 class="text-lv1">${totalNewUser }</h5>
							<span class="text-uppercase text-lv2">Khách hàng mới</span> <span
								class="text-lv3"></span>
						</div>
						<div class="col-2 danger-dark">
							<i class="far fa-user board-icon"></i>
						</div>
					</div>
				</div>
				<br>
				<form:form class="form mt-3" action="${contextPath }/admin"
					method="GET">
					<input style="height: 33px" type="month"
						class="form-control pick-time" name="time">
					<button class="btn ml-4" type="submit">Áp dụng</button>
				</form:form>
				<br>
				<div class="row mt-3 mb-3">
					<div class="col-md-12">
						<div class="ca rounded shadow" style="background-color: white;">
							<div class="card-body">
								<h4 class="card-title text-uppercase mb-0">Đơn hàng</h4>
							</div>
							<div class="table-responsive">
								<table
									class="table table-striped table-hover no-wrap user-table mb-0">
									<thead>
										<tr class="title-order">
											<th scope="col" class="border-0 text-uppercase font-medium">Mã
												ĐH</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Khách
												hàng</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Tổng
												tiền</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Tình
												trạng</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Ngày
												đặt</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders }" var="order">
											<tr class="value-order">
												<td class="column-cell"><a class="anchor">
														<h5 class="font-medium mb-0">${order.id}</h5>
												</a></td>
												<td class="column-cell"><a class="anchor-grey">
														<span class="text-muted">${order.customer.username }</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey">
														<span class="text-muted">${order.totalMoney } đ</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"><span
														class="text-muted">${order.status.status }</span><br></a></td>
												<td class="column-cell"><a class="anchor-grey"><span
														class="text-muted">${order.createAt}</span><br></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${sizeOrders == 0 }">
									<div class="no-result">Không tìm thấy kết quả</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row mt-3 mb-3">
					<div class="col-md-12">
						<div class="ca rounded shadow" style="background-color: white;">
							<div class="card-body">
								<h4 class="card-title text-uppercase mb-0">Khách mua hàng</h4>
							</div>
							<div class="table-responsive">
								<table
									class="table table-striped table-hover no-wrap user-table mb-0">
									<thead>
										<tr class="title-order">
											<th scope="col" class="border-0 text-uppercase font-medium">Tài
												khoản</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Họ
												tên</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Giới
												tính</th>
											<th scope="col" class="border-0 text-uppercase font-medium">SĐT</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Số
												đơn hàng</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Tổng
												tiền thanh toán</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${userDtos }" var="userDto">
											<tr class="value-order">
												<td class="column-cell"><a class="anchor">
														<h5 class="font-medium mb-0">${userDto.username}</h5>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${userDto.fullname }</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${userDto.gender }</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"><span
														class="text-muted">${userDto.phone }</span><br></a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${userDto.orderQuantityByTime }</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${userDto.totalMoneyByTime } đ</span><br>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${sizeCustomers == 0 }">
									<div class="no-result">Không tìm thấy kết quả</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row mt-3 mb-3">
					<div class="col-md-12">
						<div class="ca rounded shadow" style="background-color: white;">
							<div class="card-body">
								<h4 class="card-title text-uppercase mb-0">Mặt hàng bán
									được</h4>
							</div>
							<div class="table-responsive">
								<table
									class="table table-striped table-hover no-wrap user-table mb-0">
									<thead>
										<tr class="title-order">
											<th scope="col" class="border-0 text-uppercase font-medium">Mã
												mặt hàng</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Tên
												mặt hàng</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Giá</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Loại
												hàng</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Số
												lượng bán được</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${itemDtos }" var="itemDto">
											<tr class="value-order">
												<td class="column-cell"><a class="anchor">
														<h5 class="font-medium mb-0">${itemDto.itemId}</h5>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${itemDto.name }</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${itemDto.price } đ</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"><span
														class="text-muted">${itemDto.itemGroup }</span><br></a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${itemDto.soldQuantityByTime }</span><br>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${sizeItems == 0 }">
									<div class="no-result">Không tìm thấy kết quả</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row mt-3 mb-3">
					<div class="col-md-12">
						<div class="ca rounded shadow" style="background-color: white;">
							<div class="card-body">
								<h4 class="card-title text-uppercase mb-0">Doanh số theo
									nhân viên</h4>
							</div>
							<div class="table-responsive">
								<table
									class="table table-striped table-hover no-wrap user-table mb-0">
									<thead>
										<tr class="title-order">
											<th scope="col" class="border-0 text-uppercase font-medium">Mã
												nhân viên</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Tên
												nhân viên</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Số
												hóa đơn</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Doanh
												thu</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${employeeDtos }" var="employeeDto">
											<tr class="value-order">
												<td class="column-cell"><a class="anchor">
														<h5 class="font-medium mb-0">${employeeDto.username}</h5>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${employeeDto.fullname }</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${employeeDto.orderQuantity }</span><br>
												</a></td>
												<td class="column-cell"><a class="anchor-grey"> <span
														class="text-muted">${employeeDto.revenue } đ</span><br>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${sizeEmployees == 0 }">
									<div class="no-result">Không tìm thấy kết quả</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<br>
			</div>
		</div>
	</div>
</body>
</html>