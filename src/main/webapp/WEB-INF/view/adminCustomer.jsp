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
	background: #edf1f5;
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
			<div class="container-fluid mb-18 mt-4">
				<div class="row">
					<div class="col-md-12">
						<div class="ca rounded shadow" style="background-color: white;">
							<div class="card-body d-flex justify-content-between">
								<h5 class="card-title text-uppercase mb-0">Khách hàng</h5>
								<form:form class="form-search"
									action="${contextPath }/admin/customer" method="GET">
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
											<th scope="col" class="border-0 text-uppercase font-medium"></th>
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
												<td>
													<button type="button"
														class="btn btn-outline-info btn-circle btn-lg btn-circle"
														onclick="showListItem()">
														<i class="fa fa-info"></i>
													</button>
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
			<div class="container">
				<ul class="pagination pagination-lg justify-content-center">
					<%
						String field = request.getParameter("field");
						String searchText = request.getParameter("searchText");
						String url = "";
						url += field == null ? "" : ("&field=" + field);
						url += searchText == null ? "" : ("&searchText=" + searchText);
					%>
					<li class="page-item" id="previous"><a class="page-link"
						href="${contextPath }/admin/customer?page=${previousPage}<%=url %>"
						id="previousA">Trước</a></li>

					<c:forEach var="i" begin="1" end="${totalPage }">
						<c:if test="${currentPage == i}">
							<li class="page-item active"><a class="page-link" id="page"
								href="${contextPath }/admin/customer?page=${i }<%=url %>">${i }</a></li>
						</c:if>
						<c:if test="${currentPage != i}">
							<li class="page-item"><a class="page-link" id="page"
								href="${contextPath }/admin/customer?page=${i }<%=url %>">${i }</a></li>
						</c:if>
					</c:forEach>

					<li class="page-item" id="next"><a class="page-link"
						href="${contextPath }/admin/customer?page=${nextPage}<%=url %>"
						id="nextA">Sau</a></li>
				</ul>
			</div>
		</div>
	</div>

</body>

<script>
	function goToPage(page, event) {
		event.preventDefault()
		let field = $
		{
			parameter["field"]
		}
		;
		let searchText = $
		{
			parameter["searchText"]
		}
		;
		let url = $
		{
			contextPath
		}
		+"/admin/customer?page=" + page;
		if (field != "null") {
			url += "&field=" + field;
		}

		if (searchText != "null") {
			url += "&searchText=" + searchText;
		}
		console.log(url);
		let target = event.target;
		target.href = url;
		console.log(target);
		//target.click();
	}
</script>
</html>