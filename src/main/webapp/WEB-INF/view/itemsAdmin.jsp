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
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css">
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- link css -->
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/orderList.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/purchase.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/base.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/orderList.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>

<style>
body {
	background: #edf1f5 !important;
}

.nav.nav-tab {
	background-color: white;
	margin: 10px 0px;
	border-radius: 3px;
	display: flex;
	justify-content: space-between !important;
}

.nav.nav-tab .nav-item {
	flex-grow: 1;
	text-align: center;
}

.nav.nav-tab .nav-item.active {
	border-bottom: solid 2px #6c757d;
}

.nav.nav-tab .nav-item .nav-link {
	padding: 10px 0px;
	color: #6c757d;
	font-size: 1.5em
}

.nav.nav-tab .nav-item .nav-link.active {
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

.action-btn {
	height: 35px !important;
	width: 35px !important;
	display: flex !important;
	align-items: center !important;
	justify-content: center !important;
	border-radius: 100% !important
}

.table .title-order th {
	font-size: 1.9em !important;
}

.value-order td h5 {
	font-size: 1.7em !important
}

button.action-btn i.fa {
	font-size: small;
}

</style>

<body>

	<div class="row">
		<div class="side-bar col-2">
			<%@ include file="adminSidebar.jsp"%>
		</div>
		<div class="main-content col-10">
			<%@ include file="adminHeader.jsp"%>
			<div class="container-fluid mb-18">
				<ul class="nav-tab nav justify-content-center shadow rounded">
					<li class="nav-item active"><a class="nav-link active"
						aria-current="page" href="${contextPath }/admin/items">Tất cả
							sản phẩm</a></li>
					<li class="nav-item"><a class="nav-link " aria-current="page"
						href="${contextPath }/admin/items/add">Thêm sản phẩm</a></li>
				</ul>
				<br>
				<div class="row">
					<div class="col-md-12">
						<div class="ca shadow rounded" style="background-color: white;">
							<div class="card-body">
								<h5 class="card-title text-uppercase mb-0">Quản lý đơn hàng</h5>
							</div>
							<div class="table-responsive">
								<table class="table no-wrap user-table mb-0">
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
											<th scope="col" class="border-0 text-uppercase font-medium">Hành
												động</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="item" items="${items}">
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
												<td><span class="text-muted">${item.discount}</span><br></td>
												<td><span class="text-muted"> <c:forEach
															var="itemSize" items="${item.itemSizes}">
															<span>${itemSize.id.sizeId}(${itemSize.quantity});</span>
														</c:forEach>
												</span> <br></td>
												<td class="d-flex">
													<button type="button"
														class="action-btn btn btn-outline-info btn-circle btn-lg btn-circle ml-2"
														onclick="showAdd(${item.id})">
														<i class="fa fa-edit"></i>
													</button>
													<button type="button"
														class="action-btn btn btn-outline-info btn-circle btn-lg btn-circle ml-2"
														onclick="showDelete(${item.id})">
														<i class="fa fa-trash"></i>
													</button>
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

			<c:forEach var="item" items="${items}">

				<div class="modal-shop" id="modal-add-${item.id}">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Cập nhật sản phẩm</h5>
							</div>
							<div class="modal-body">
								<p>Bạn có muốn cập nhập sản phẩm có mã '${item.id}' này
									không ?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									onclick="closeAdd(${item.id})">Đóng</button>
								<button type="button" class="btn btn-primary"
									onclick="updateItem(${item.id})">Cập nhật</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-shop" id="modal-delete-${item.id}">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Xóa sản phẩm</h5>
							</div>
							<div class="modal-body">
								<p>Bạn có muốn xóa sản phẩm có mã '${item.id}' này không ?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									onclick="closeDelete(${item.id})">Đóng</button>
								<button type="button" class="btn btn-primary"
									onclick="deleteItem(${item.id})">Xóa</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<c:if test="${id >= 0}">
				<div class="abcde">
					<div class="alert show showAlert">
						<c:if test="${type == 'add'}">
							<span class="fas fa-check-circle"></span>
							<span class="msg">Thêm sản phẩm thành công!</span>
						</c:if>

						<c:if test="${type == 'update'}">
							<span class="fas fa-check-circle"></span>
							<span class="msg">Cập nhật sản phẩm có mã '${id}' thành
								công!</span>
						</c:if>

						<c:if test="${type == 'delete'}">
							<span class="fas fa-check-circle"></span>
							<span class="msg">Xóa sản phẩm có mã '${id}' thành công!</span>
						</c:if>

						<div class="close-btn">
							<span class="fas fa-times"></span>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>

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

function updateItem(id) {
	window.location = window.location.href.split("?")[0] + "/update?id=" + id;
}

function deleteItem(id) {
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

function searchItems(path) {
	console.log(path+"okok")
	var search = document.getElementById("searchInput").value;
	console.log(path + '/admin/items?name=' + search)
	window.location = path + '/admin/items?name=' + search;
	

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
	
	var url_string = window.location.href
	var urlPre = new URL(url_string);
	var urlNext = new URL(url_string);
	urlPre.searchParams.set("page", parseInt(page.innerHTML) - 1)
	urlNext.searchParams.set("page", parseInt(page.innerHTML) + 1)
	console.log(urlPre + " ==== " + urlNext)
	
	document.getElementById("previousA").href = urlPre;
	document.getElementById("nextA").href = urlNext;
</script>

</html>