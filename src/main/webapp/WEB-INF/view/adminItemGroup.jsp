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
body {
	background: #edf1f5 !important;
}

.font-medium {
	font-size: 1.7em !important;
}

.table-row {
	font-size: 1.6em !important;
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
.form-control {
	width: 300px !important;
	height: 35px !important;
	font-size: 1.6em!important
}
.list-group .list-group-item {
	font-size: 1.5em;
	font-weight: 500;
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
								<h5 class="card-title text-uppercase mb-0">Loại hàng</h5>
							</div>
							<div class="table-responsive">
								<div class="list-group">
									<c:forEach items="${itemGroups }" var="itemGroup">
										<a href="${contextPath }/admin/category/${itemGroup.id}"
											class="list-group-item list-group-item-action">${itemGroup.name }</a>
									</c:forEach>
									<div class="list-group-item list-group-item-action"
										title="Thêm loại hàng" onclick="showAdd()">
										<i class="fas fa-plus mr-2"></i> Thêm loại hàng
									</div>
								</div>
								<c:if test="${size == 0 }">
									<div class="no-result">Không tìm thấy kết quả</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-shop" id="modal-add">
		<div class="modal-dialog">
			<form:form action="${contextPath }/admin/addItemGroup" method="POST">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Thêm loại hàng</h5>
					</div>
					<div class="modal-body d-flex">
						<input name="itemGroupName" type="text" class="form-control" placeholder="Tên loại hàng.." required="required">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							onclick="closeAdd()">Đóng</button>
						<button type="submit" class="btn btn-primary">Thêm</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>

<script type="text/javascript">
	function closeAdd() {
		document.getElementById("modal-add").classList.remove("show")
	}

	function showAdd() {
		document.getElementById("modal-add").classList.add("show")
	}
</script>

</html>