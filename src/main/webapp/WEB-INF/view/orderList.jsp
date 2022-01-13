<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/taglib/import.jsp"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MU Shop</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- link css -->
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/orderList.css">


</head>
<style>
.overflow-address {
	display: inline-block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100px
}
</style>

<body>

	<div class="container-fluid mb-18">
		<div class="row">
			<div class="col-md-12">
				<div class="ca rounded shadow" style="background-color: white;">
					<div class="card-body">
						<h5 class="card-title text-uppercase mb-0">Quản lý đơn hàng</h5>
					</div>
					<div class="table-responsive">
						<table class="table table-hover table-striped no-wrap user-table mb-0">
							<thead>
								<tr class="title-order">
									<th scope="col"
										class="border-0 text-uppercase font-medium pl-4">Mã</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Họ
										Tên</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Số
										điện thoại</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Địa
										chỉ giao</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Ngày
										đặt</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Tình
										trạng</th>
									<th scope="col" class="border-0 text-uppercase font-medium">Hành
										động</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="order" items="${orders}">
									<tr class="value-order">
										<td class="pl-4">
											<h5>${order.id}</h5>
										</td>
										<td>
											<h5 class="font-medium mb-0">${order.receiverName}</h5>
										</td>
										<td><span class="text-muted">${order.receiverPhone}</span><br></td>
										<td><span class="text-muted overflow-address">${order.address}</span><br></td>
										<td><span class="text-muted">${order.createAt}</span><br></td>
										<td><span class="text-muted">${order.status.status}</span><br></td>

										<td>
											<button type="button"
												class="btn btn-outline-info btn-circle btn-lg btn-circle"
												onclick="showListItem(${order.id})">
												<i class="fa fa-info"></i>
											</button> <c:choose>
												<c:when test="${order.status.status == 'Chờ xác nhận'}">
													<button type="button"
														class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"
														onclick="showAdd(${order.id})">
														<i class="fa fa-check"></i>
													</button>
													<button type="button"
														class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"
														onclick="showDelete(${order.id})">
														<i class="fa fa-trash"></i>
													</button>
												</c:when>
												<c:otherwise>
													<button type="button"
														class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"
														disabled
														onclick="showAdd(${order.id})">
														<i class="fa fa-check"></i>
													</button>
													<button type="button"
														class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"
														disabled
														onclick="showDelete(${order.id})">
														<i class="fa fa-trash"></i>
													</button>
												</c:otherwise>
											</c:choose>


										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>


</html>