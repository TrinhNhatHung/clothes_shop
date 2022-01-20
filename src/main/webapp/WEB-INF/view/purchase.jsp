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
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/purchase.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/orderList.css">
<link rel="icon"
	href="${contextPath}/resources/assets/img/logo/logomain.png"
	type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous"></script>
</head>
<style>
.nav {
	background-color: white;
	margin: 10px 0px;
	border-radius: 3px;
	display: flex;
	justify-content: space-between !important;
}

.nav .nav-item {
	flex-grow: 1;
	text-align: center;
}

.nav .nav-item.active {
	border-bottom: solid 2px #6c757d;
}

.nav .nav-item .nav-link {
	padding: 10px 0px;
	color: #6c757d;
	font-size: 1.5em
}

.nav .nav-item .nav-link.active {
	color: #212529 !important;
	font-weight: bold;
}

.table .title-order th {
	font-size: 1.3em;
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
	width: 35px !important;
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
	<%@ include file="header.jsp"%>
	<div class="container mb-18">
		<ul class="nav justify-content-center rounded shadow">
			<c:if test='${param["status"] == null}'>
				<li class="nav-item active"><a class="nav-link active"
					aria-current="page" href="${contextPath }/purchase">Tất cả</a></li>
			</c:if>
			<c:if test='${param["status"] != null}'>
				<li class="nav-item"><a class="nav-link " aria-current="page"
					href="${contextPath }/purchase">Tất cả</a></li>
			</c:if>

			<c:forEach items="${orderStatuses }" var="orderStatus">
				<c:if test='${param["status"] == orderStatus.id}'>
					<li class="nav-item active"><a class="nav-link active"
						aria-current="page"
						href="${contextPath }/purchase?status=${orderStatus.id}">${orderStatus.status }</a></li>
				</c:if>
				<c:if test='${param["status"] != orderStatus.id}'>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="${contextPath }/purchase?status=${orderStatus.id}">${orderStatus.status }</a></li>
				</c:if>
			</c:forEach>
		</ul>
		<div class="row mb-3">
			<div class="col-md-12">
				<div class="ca rounded shadow" style="background-color: white;">
					<div class="card-body">
						<h4 class="card-title text-uppercase mb-0">Đơn hàng của tôi</h4>
					</div>
					<div class="table-responsive">
						<table
							class="table table-striped table-hover no-wrap user-table mb-0">
							<thead>
								<tr class="title-order">
									<th scope="col" class="border-0 text-uppercase font-medium">Mã
										DH</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Địa
										chỉ giao</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Tên
										người nhận</th>
									<th scope="col" class="border-0 text-uppercase font-medium">SĐT
										người nhận</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Ngày
										đặt</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Tình
										trạng</th>
									<th scope="col" class="border-0 text-uppercase font-medium"></th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${orders }" var="order">
									<tr class="value-order">
										<td class="column-cell"><a class="anchor"
											href="${contextPath }/purchase/order/${order.id}">
												<h5 class="font-medium mb-0">${order.id}</h5>
										</a></td>
										<td class="column-cell"><a class="anchor-grey"
											href="${contextPath }/purchase/order/${order.id}"> <span
												class="text-muted">${order.address }</span><br>
										</a></td>
										<td class="column-cell"><a class="anchor-grey"
											href="${contextPath }/purchase/order/${order.id}"> <span
												class="text-muted">${order.receiverName }</span><br>
										</a></td>
										<td class="column-cell"><a class="anchor-grey"
											href="${contextPath }/purchase/order/${order.id}"><span
												class="text-muted">${order.receiverPhone }</span><br></a></td>
										<td class="column-cell"><a class="anchor-grey"
											href="${contextPath }/purchase/order/${order.id}"><span
												class="text-muted">${order.createAt}</span><br></a></td>
										<td class="column-cell"><a class="anchor-grey"
											href="${contextPath }/purchase/order/${order.id}"><span
												class="text-muted">${order.status.status}</span><br></a></td>
										<td class="column-cell"><form:form
												action="${contextPath }/purchase/deliveryConfirm"
												method="POST">
												<input type="hidden" name="url" value="purchase">
												<input type="hidden" name="orderId" value="${order.id }">
												<c:if test="${order.status.id == 2 }">
													<button type="submit" title="Xác nhận giao hàng"
														class="btn btn-outline-info btn-circle btn-lg btn-circle ml-1">
														<i class="fa fa-check"></i>
													</button>
												</c:if>
												<c:if test="${order.status.id != 2 }">
													<button type="submit" disabled="disabled"
														title="Xác nhận giao hàng"
														class="btn btn-outline-info btn-circle btn-lg btn-circle ml-1">
														<i class="fa fa-check"></i>
													</button>
												</c:if>
											</form:form></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test="${size == 0 }">
							<div class="no-result">Không tìm thấy kết quả</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${param.confirm != null}">
		<div class="abcde"
			style="position: absolute; top: 10px; right: 2px; width: 500px">
			<div class="alert show showAlert">
				<c:if test="${param.confirm == 'success'}">
					<span class="fas fa-check-circle"></span>
					<span class="msg">Xác nhận giao hàng thành công</span>
				</c:if>

				<c:if test="${param.confirm == 'fail'}">
					<span class="fas fa-check-circle"></span>
					<span class="msg">Xác nhận giao hàng thất bại</span>
				</c:if>

				<div class="close-btn">
					<span class="fas fa-times"></span>
				</div>
			</div>
		</div>
	</c:if>
</body>
<script type="text/javascript">
	setTimeout(function() {
		$('.alert').removeClass("show");
		$('.alert').addClass("hide");
	}, 5000);

	$('.close-btn').click(function() {
		$('.alert').removeClass("show");
		$('.alert').addClass("hide");
	});
</script>
</html>