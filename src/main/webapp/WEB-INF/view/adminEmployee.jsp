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

.font-medium {
	font-size: 1.7em !important;
}

.table-row {
	font-size: 1.6em !important;
}

button.action-btn {
	height: 35px !important;
	width: 35px !important;
	display: flex;
	justify-content: center;
	align-items: center;
}

button.action-btn i.fa {
	font-size: small;
}

li.active {
	background-color: #253544 !important;
	border: none
}

li.page-item.active a.page-link {
	background-color: #253544 !important;
	border: none
}

button.btn-search {
	background-color: #000;
	color: #fff;
	font-size: 1.1em;
	width: 80px !important;
	height: 30px !important
}

button.btn-search:hover {
	color: #fff;
	background-color: #383838;
	font-size: 1.1em
}

.form-search {
	display: flex
}

.form-control {
	height: 30px !important;
	width: 120px !important
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
	background-color: #fff !important
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

.no-result {
	color: gray;
	text-align: center;
	background: #edf1f5;
	margin-top: 10px;
	padding: 15px 0px;
	font-size: 1.6em;
}

.alert .msg {
	padding: 0 48px !important;
	font-size: 18px !important;
	color: #1c974d !important;
	display: flex !important;
	margin: auto 0 !important;
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
				<ul class="nav-tab nav justify-content-center shadow rounded">
					<li class="nav-item active"><a class="nav-link active"
						aria-current="page" href="${contextPath }/admin/employee">Tất
							cả nhân viên</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="${contextPath }/admin/employee/add">Thêm nhân viên</a></li>
				</ul>
				<div class="row">
					<div class="col-md-12">
						<div class="ca rounded shadow" style="background-color: white;">
							<div class="card-body d-flex justify-content-between">
								<h5 class="card-title text-uppercase mb-0">Nhân viên</h5>
								<form:form class="form-search"
									action="${contextPath }/admin/employee" method="GET">
									<input class="form-control mr-3" type="text" name="searchText"
										value='<%=request.getParameter("searchText") == null ? "" : request.getParameter("searchText")%>'>
									<select class="form-control mr-3" name="field">
										<option value="username"
											<%="username".equals(request.getParameter("field")) ? "selected" : ""%>>Theo
											username</option>
										<option value="fullname"
											<%="fullname".equals(request.getParameter("field")) ? "selected" : ""%>>Theo
											tên</option>
										<option value="phone"
											<%="phone".equals(request.getParameter("field")) ? "selected" : ""%>>Theo
											SĐT</option>
									</select>
									<button type="submit" class="btn btn-search mr-3">Tìm
										kiếm</button>
								</form:form>
							</div>
							<div class="table-responsive">
								<table
									class="table table-striped table-hover no-wrap user-table mb-0">
									<thead>
										<tr class="title-order">
											<th scope="col"
												class="border-0 text-uppercase font-medium pl-4">Tài
												khoản</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Họ
												Tên</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Giới
												tính</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Số
												điện thoại</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Địa
												chỉ</th>
											<th scope="col" class="border-0 text-uppercase font-medium">Khả
												dụng</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="user" items="${users}">
											<tr class="value-order">
												<td class="pl-4">
													<h5 class="table-row">${user.username}</h5>
												</td>
												<td><span class="text-muted table-row">${user.fullname}</span><br>
												</td>
												<td><span class="text-muted table-row">${user.gender}</span><br></td>
												<td><span class="text-muted table-row">${user.phone}</span><br></td>
												<td><span class="text-muted table-row">${user.address}</span><br></td>
												<td><span class="text-muted table-row">${user.enable}</span><br></td>
												<td class="d-flex">
													<c:if test="${user.enable }">
														<button type="button" title="Cập nhật"
															class="action-btn btn btn-outline-info btn-circle btn-lg btn-circle mr-2"
															onclick="showUpdate('${user.username }')">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button" title="Xóa"
															class="action-btn btn btn-outline-info btn-circle btn-lg btn-circle"
															onclick="showDelete('${user.username }')">
															<i class="fa fa-trash"></i>
														</button>
													</c:if>
													<c:if test="${!user.enable }">
														<button type="button" disabled title="Cập nhật"
															class="action-btn btn btn-outline-info btn-circle btn-lg btn-circle mr-2"
															onclick="showUpdate('${user.username }')">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button" disabled title="Xóa"
															class="action-btn btn btn-outline-info btn-circle btn-lg btn-circle"
															onclick="showDelete('${user.username }')">
															<i class="fa fa-trash"></i>
														</button>
													</c:if>
												</td>
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
			<div class="container mt-3">
				<ul class="pagination pagination-lg justify-content-center">
					<%
						String field = request.getParameter("field");
						String searchText = request.getParameter("searchText");
						String url = "";
						url += field == null ? "" : ("&field=" + field);
						url += searchText == null ? "" : ("&searchText=" + searchText);
					%>
					<li class="page-item" id="previous"><a class="page-link"
						href="${contextPath }/admin/employee?page=${previousPage}<%=url %>"
						id="previousA">Trước</a></li>

					<c:forEach var="i" begin="1" end="${totalPage }">
						<c:if test="${currentPage == i}">
							<li class="page-item active"><a class="page-link" id="page"
								href="${contextPath }/admin/employee?page=${i }<%=url %>">${i }</a></li>
						</c:if>
						<c:if test="${currentPage != i}">
							<li class="page-item"><a class="page-link" id="page"
								href="${contextPath }/admin/employee?page=${i }<%=url %>">${i }</a></li>
						</c:if>
					</c:forEach>

					<li class="page-item" id="next"><a class="page-link"
						href="${contextPath }/admin/employee?page=${nextPage}<%=url %>"
						id="nextA">Sau</a></li>
				</ul>
				<c:forEach var="user" items="${users}">
					<div class="modal-shop" id="modal-delete-${user.username}">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Xóa nhân viên</h5>
								</div>
								<div class="modal-body">
									<p>Bạn có muốn xóa nhân viên '${user.fullname }' không ?</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										onclick="closeDelete('${user.username}')">Đóng</button>
									<form:form
										action="${contextPath }/admin/employee/delete/${user.username }"
										method="GET">
										<button type="submit" class="btn btn-primary">Xoá</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-shop" id="modal-update-${user.username}">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Cập nhật nhân viên</h5>
								</div>
								<div class="modal-body">
									<p>Bạn có muốn cập nhật nhân viên '${user.fullname }' không
										?</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										onclick="closeUpdate('${user.username}')">Đóng</button>
									<form:form
										action="${contextPath }/admin/employee/update/${user.username }"
										method="GET">
										<button type="submit" class="btn btn-primary">Cập
											nhật</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:if test="${param.username != null}">
					<div class="abcde"
						style="position: absolute; top: 10px; right: 2px; width: 500px">
						<div class="alert show showAlert">
							<c:if test="${param.type == 'add'}">
								<span class="fas fa-check-circle"></span>
								<span class="msg">Thêm nhân viên thành công!</span>
							</c:if>

							<c:if test="${param.type == 'update'}">
								<span class="fas fa-check-circle"></span>
								<span class="msg">Cập nhật thành công!</span>
							</c:if>

							<c:if test='${param.type == "delete"}'>
								<span class="fas fa-check-circle"></span>
								<span class="msg">Xóa nhân viên thành công!</span>
							</c:if>

							<div class="close-btn">
								<span class="fas fa-times"></span>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
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

	function showDelete(id) {
		console.log("========= : " + id)
		document.getElementById("modal-delete-" + id).classList.add("show");
	}

	function closeDelete(id) {
		console.log("========= : " + id)
		document.getElementById("modal-delete-" + id).classList.remove("show");
	}

	function showUpdate(id) {
		console.log("========= : " + id)
		document.getElementById("modal-update-" + id).classList.add("show");
	}

	function closeUpdate(id) {
		console.log("========= : " + id)
		document.getElementById("modal-update-" + id).classList.remove("show");
	}
</script>
</html>