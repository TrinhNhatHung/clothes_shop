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
	href="${contextPath}/resources/assets/img/logo/main.png"
	type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- HEADER -->
	<%@ include file="header.jsp"%>
	<!-- MAIN -->
	<div class="product">
		<div class="container">
			<div class="row">


				<%@ include file="sidebar.jsp"%>



				<div class="col-lg-9 col-12">
					<div class="sort-wrap row">
						<div class="sort-left col-12 col-lg-6">
							<h1 class="coll-name">Tất cả sản phẩm</h1>
						</div>
						<div class="sort-right col-12 col-lg-6">
							<div class="sortby">
								<label for="">Sắp xếp theo:</label>
								<div class="dropdown">
									<button type="button" class="btn btn-dark dropdown-toggle"
										data-toggle="dropdown">Giá</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" id="sort1">Giá: Tăng dần</a> <a
											class="dropdown-item" id="sort2">Giá: Giảm dần</a>
									</div>
								</div>
							</div>
							<div class="sortby2 hidden" style="float: right;">
								<div class="dropdown">
									<button class="btn btn-dark dropdown-toggle" id="filter">
										Lọc sản phẩm</button>
								</div>
							</div>
						</div>
					</div>



					<div class="row row-product" id="products">
						<c:forEach var="item" items="${items}">


							<div class="col-lg-4 col-md-6 col-12 mb-20"
								style="margin-bottom: 20px">
								<a href="./ProductDetail.html" class="product__new-item">
									<div class="card" style="width: 100%">
										<div>
											<img class="card-img-top"
												src="${contextPath}/resources/assets/img/product/${item.image}.jpg"
												alt="Card image cap">
											<form action="" class="hover-icon hidden-sm hidden-xs">
												<input type="hidden"> <a href="./pay.html"
													class="btn-add-to-cart" title="Mua ngay"> <i
													class="fas fa-cart-plus"></i>
												</a>
											</form>
										</div>
										<div class="card-body">
											<h5 class="card-title custom__name-product">${item.name}</h5>
											<div class="product__price">
												<p class="card-text price-color product__price-old">
													${item.outPrice}đ</p>
												<p class="card-text price-color product__price-new">
													<script type="text/javascript">
														var newOutPrice = ${item.outPrice} * (100 - ${item.discount}) / 100;
														document.write(newOutPrice)
													</script>
													đ
												</p>
											</div>

											<div class="sale-off">
												<span class="sale-off-percent">${item.discount}%</span> <span
													class="sale-off-label">GIẢM</span>
											</div>
										</div>
									</div>
								</a>
							</div>

						</c:forEach>
					</div>

					<!-- pagination -->
					<div class="loadmore">
						<%@ include file="pagination.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<h1>${sizePage}</h1>
	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>

</body>

<script>
	function setSearch() {
		var url_string = window.location.href
		var url = new URL(url_string);
		var price = url.searchParams.get("price");
		var itemGroup = url.searchParams.get("itemGroup");
		var search = url.searchParams.get("search");
		var ele = document.getElementsByName('optradio');
		console.log("======")
		for (i = 0; i < ele.length; i++) {
			if (ele[i].value == price){
				ele[i].checked = true
			}
		}
		
		var ele = document.getElementsByName('itemGroupRadio');
		console.log("======")
		for (i = 0; i < ele.length; i++) {
			if (ele[i].value == itemGroup){
				ele[i].checked = true
			}
		}
		document.getElementById("searchInput").value = search;
	}
	
	setSearch();

	function searchItems(path) {
		console.log(path)
		var ele = document.getElementsByName('optradio');
		var price;
		console.log("======")
		for (i = 0; i < ele.length; i++) {
			if (ele[i].checked) {
				price = ele[i].value
				console.log(price)
			}
		}

		var ele = document.getElementsByName('itemGroupRadio');
		var itemGroup;
		console.log("======")
		for (i = 0; i < ele.length; i++) {
			if (ele[i].checked) {
				itemGroup = ele[i].value
			}
		}

		var search = document.getElementById("searchInput").value;
		var param = ""
		if (price == null) {
			price = ''
		}
		if (itemGroup == null) {
			itemGroup = ''
		}
		console.log(location.href + '?price=' + price + '&itemGroup='
				+ itemGroup)
		window.location = path + '/search?price=' + price + '&itemGroup='
				+ itemGroup + '&search=' + search;
		

	}
	
	var url_string = window.location.href
	var urlAsc = new URL(url_string);
	var urlDesc = new URL(url_string);
	urlAsc.searchParams.set("sort", "asc");
	urlDesc.searchParams.set("sort", "desc");
	
	console.log(urlAsc + " =+= " + urlDesc)
	document.getElementById("sort1").href = urlAsc;
	document.getElementById("sort2").href = urlDesc;
	
</script>

</html>