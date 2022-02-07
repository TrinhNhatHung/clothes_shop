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
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/purchase.css">
<link rel="icon"
	href="${contextPath}/resources/assets/img/logo/logomain.png"
	type="image/x-icon" />
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/orderList.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous"></script>
</head>

<style>
body {
	background: #edf1f5 !important;
}

.font-medium {
	font-size: 1.7em !important;
}

.table-row {
	font-size: 1.6em !important;
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
			<div class="container mb-18 mt-4">
				<div class="row">
					<div class="col-md-12">
						<div class="ca rounded shadow" style="background-color: white;">
							<div class="card-body d-flex justify-content-between">
								<h5 class="card-title text-uppercase mb-0">Loại hàng -
									${itemGroup.name }</h5>
								<select style="width: 120px" class="select-itGr form-control" onchange="changeItGr(event)">
									<c:forEach items="${itemGroups}" var="itemGroup">
										<c:if test="${itemGroup.id == currentItemGroup.id }">
											<option value="${itemGroup.id }" selected="selected">${itemGroup.name }</option>
										</c:if>
										<c:if test="${itemGroup.id != currentItemGroup.id }">
											<option value="${itemGroup.id }">${itemGroup.name }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="table-responsive">
								<table
									class="table table-striped table-hover no-wrap user-table mb-0">
									<thead>
										<tr class="title-order">
											<th scope="col"
												class="border-0 text-uppercase font-medium pl-4">Mã</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Tên</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Loại</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Giá
												bán</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Giá
												mua</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Giảm
												giá</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Tình
												trạng</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach var="item" items="${currentItemGroup.items}">
											<tr class="value-order">
												<td class="pl-4">
													<h5>${item.id}</h5>
												</td>
												<td>
													<h5 class="font-medium mb-0 overflow-address">${item.name}</h5>
												</td>
												<td><span class="text-muted">${item.itemGroup.name}</span><br></td>
												<td><span class="text-muted">${item.outPrice}</span><br></td>
												<td><span class="text-muted">${item.inPrice}</span><br></td>
												<td><span class="text-muted">${item.discount}%</span><br></td>
												<td><span class="text-muted"> <c:forEach
															var="itemSize" items="${item.itemSizes}">
															<span>${itemSize.id.sizeId}(${itemSize.quantity});</span>
														</c:forEach>
												</span> <br></td>

											</tr>
										</c:forEach>

									</tbody>
								</table>
								<c:if test="${size == 0 }">
									<div class="no-result">Không có mặt hàng nào</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
 function changeItGr(event){
	 let value = event.target.value;
	 window.location.href = '${contextPath}/admin/category/' + value;
 }
</script>

</html>