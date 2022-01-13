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
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/orderList.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous"></script>
</head>

<style>
.normal-text {
	text-transform: lowercase;
    font-weight: 100;
    font-size: smaller;
    color : #6c757d
}

body {
	background: #edf1f5 !important;
}
</style>
<body>

	<!-- HEADER -->
	<%@ include file="header.jsp"%>
	<br>
	<%@ include file="orderList.jsp"%>

	<div class="container">

		<ul class="pagination pagination-lg justify-content-center">
			<li class="page-item" id="previous"><a class="page-link"
				id="previousA">Trước</a></li>

			<li class="page-item disabled"><a class="page-link" id="page"
				href="">${page}</a></li>

			<li class="page-item" id="next" value="${sizePage}"><a
				class="page-link" id="nextA">Sau</a></li>
		</ul>
	</div>

	<c:if test="${id >= 0}">
		<div class="abcde">
			<div class="alert show showAlert">
				<c:if test="${type == 'add'}">
					<span class="fas fa-check-circle"></span>
					<span class="msg">Xác nhận đơn hàng có mã '${id}' thành
						công!</span>
				</c:if>
				<c:if test="${type == 'delete'}">
					<span class="fas fa-check-circle"></span>
					<span class="msg">Hủy đơn hàng có mã '${id}' thành công!</span>
				</c:if>

				<div class="close-btn">
					<span class="fas fa-times"></span>
				</div>
			</div>
		</div>
	</c:if>

	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>


	<c:forEach var="order" items="${orders}">
		<div class="modal-shop" id="modal-list-${order.id}">

			<div class="context">
				<div class="container mb-18">
					<div class="row">
						<div class="col-md-12">
							<div class="ca rounded shadow" style="background-color: white;">
								<span class="close" id="close-list-item"
									onclick="closeListItem(${order.id})"><i
									class="fa fa-close icon-close"></i></span>
								<div class="card-body">
									<h5 class="card-title text-uppercase mb-0">Quản lý đơn
										hàng  <span class="normal-text">( ${order.address })</span></h5>
								</div>
								<div class="table-responsive">
									<table class="table no-wrap user-table mb-0">

										<thead>
											<tr class="title-order">
												<th scope="col"
													class="border-0 text-uppercase font-medium pl-4">Mã ĐH</th>
												<th scope="col" class="border-0 text-uppercase font-medium">Tên
												</th>
												<th scope="col" class="border-0 text-uppercase font-medium">SL
												</th>
												<th scope="col" class="border-0 text-uppercase font-medium">Giá</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="orderDetail" items="${order.orderDetails}">
												<tr class="value-order">
													<td class="pl-4">
														<h5>${orderDetail.id.orderId}</h5>
													</td>
													<td>
														<h5 class="font-medium mb-0">${orderDetail.item.name}</h5>
													</td>
													<td><span class="text-muted">${orderDetail.quantity}</span><br></td>
													<td><span class="text-muted">${orderDetail.price}</span><br></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal-shop" id="modal-add-${order.id}">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Xác nhận đơn hàng</h5>
					</div>
					<div class="modal-body">
						<p>Bạn có muốn xác nhận đơn hàng có mã '${order.id}' này không
							?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							onclick="closeAdd(${order.id})">Đóng</button>
						<button type="button" class="btn btn-primary"
							onclick="addOrder(${order.id})">Xác nhận</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal-shop" id="modal-delete-${order.id}">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Xóa đơn hàng</h5>
					</div>
					<div class="modal-body">
						<p>Bạn có muốn xóa đơn hàng có mã '${order.id}' này không ?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							onclick="closeDelete(${order.id})">Đóng</button>
						<button type="button" class="btn btn-primary"
							onclick="deleteOrder(${order.id})">Xóa</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>



</body>

<script>

	
    setTimeout(function () {
        $('.alert').removeClass("show");
        $('.alert').addClass("hide");
    }, 5000);
	
	$('.close-btn').click(function () {
	    $('.alert').removeClass("show");
	    $('.alert').addClass("hide");
	});
	
	function addOrder(id) {
		window.location = window.location.href.split("?")[0] + "/add/" + id;
	}
	
	function deleteOrder(id) {
		window.location = window.location.href.split("?")[0] + "/delete/" + id; 
	}

	function showListItem(id) {
		console.log("========= : " + id)
		document.getElementById("modal-list-"+id).classList.add("show")
	}

	function closeListItem(id) {
		console.log("========= : " + id)
		document.getElementById("modal-list-"+id).classList.remove("show")
	}

	function closeAdd(id) {
		console.log("========= : " + id)
		document.getElementById("modal-add-"+id).classList.remove("show")
	}

	function showAdd(id) {
		console.log("========= : " + id)
		document.getElementById("modal-add-"+id).classList.add("show")
	}

	function closeDelete(id) {
		console.log("========= : " + id)
		document.getElementById("modal-delete-"+id).classList.remove("show")
	}

	function showDelete(id) {
		console.log("========= : " + id)
		document.getElementById("modal-delete-"+id).classList.add("show")
	}
	
	var previous = document.getElementById("previous");
	var next = document.getElementById("next");
	var page = document.getElementById("page");
	if(page.innerHTML == '1'){
		console.log("a")
		previous.className = "page-item disabled";
	} else{
		previous.className = "page-item";
	}
	
	if(page.innerHTML == next.value){
		console.log("b")
		next.className = "page-item disabled";
	} else{
		next.className = "page-item";
	}
	
	var path = window.location;
	
	var url_string = window.location.href.split('?')[0]
	var urlPre = new URL(url_string);
	var urlNext = new URL(url_string);
	urlPre.searchParams.set("page", parseInt(page.innerHTML) - 1)
	urlNext.searchParams.set("page", parseInt(page.innerHTML) + 1)
	console.log(urlPre + " ==== " + urlNext)
	
	document.getElementById("previousA").href = urlPre;
	document.getElementById("nextA").href = urlNext;
</script>

</html>