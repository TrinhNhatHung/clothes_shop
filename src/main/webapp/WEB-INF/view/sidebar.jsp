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
<title>Document</title>

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
	href="${contextPath}/resources/assets/css/productdetail.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/reponsive1.css">
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/style.css">
<link rel="icon"
	href="${contextPath}/resources/assets/img/logo/main.png"
	type="image/x-icon" />

</head>
<body>
	<div class="col-lg-3 col-12 hidden-xs hidden-sm">
		<div class="product__filter">
			<div class="product__filter-price">
				<h4 class="product__filter-heading">
					Khoảng giá <i class="fi-rs-minus"
						onclick="khonghienthidanhsach(1,`khoanggia`)" id="minus-1"></i> <i
						class="fi-rs-plus hidden" id="plus-1"
						onclick="khonghienthidanhsach(1,`khoanggia`)"></i>
				</h4>
				<ul id="khoanggia" class="product__filter-ckeckbox">
					<li class="product__filter-item"><label
						class="form-check-label" for="kg1"> <input type="radio"
							class="form-check-input checkGia" id="kg1" name="optradio"
							value="0-100000" onclick="searchItems('${contextPath}')"><span>Dưới
								100,000đ</span>
					</label></li>
					<li class="product__filter-item"><label
						class="form-check-label" for="kg2"> <input type="radio"
							class="form-check-input checkGia" id="kg2" name="optradio"
							value="100000-200000" onclick="searchItems('${contextPath}')"><span>100,000đ->200,000đ</span>
					</label></li>
					<li class="product__filter-item"><label
						class="form-check-label" for="kg3"> <input type="radio"
							class="form-check-input checkGia" id="kg3" name="optradio"
							value="200000-300000" onclick="searchItems('${contextPath}')"><span>200,000đ->300,000đ</span>
					</label></li>
					<li class="product__filter-item"><label
						class="form-check-label" for="kg4"> <input type="radio"
							class="form-check-input checkGia" id="kg4" name="optradio"
							value="300000-400000" onclick="searchItems('${contextPath}')"><span>300,000đ->400,000đ</span>
					</label></li>
					<li class="product__filter-item"><label
						class="form-check-label" for="kg5"> <input type="radio"
							class="form-check-input checkGia" id="kg5" name="optradio"
							value="400000-100000000" onclick="searchItems('${contextPath}')"><span>Trên 400,000đ</span>
					</label></li>
				</ul>
			</div>
			<div class="product__filter-trademark">
				<h4 class="product__filter-heading">
					Loại sản phẩm<i class="fi-rs-minus"
						onclick="khonghienthidanhsach(2,`loaiSP`)" id="minus-2"></i> <i
						class="fi-rs-plus hidden"
						onclick="khonghienthidanhsach(2,`loaiSP`)" id="plus-2"></i>
				</h4>
				<ul id="loaiSP" class="product__filter-ckeckbox">

					<c:forEach var="itemGroup" items="${itemGroups}">

						<li class="product__filter-item"><label
							class="form-check-label" for="${itemGroup.id}"> <input
								type="radio" class="form-check-input checkGia"
								id="${itemGroup.id}" name="itemGroupRadio"
								value="${itemGroup.name}"  onclick="searchItems('${contextPath}')"><span>${itemGroup.name}</span>
						</label></li>


					</c:forEach>

				</ul>
			</div>

		</div>
	</div>

</body>

<script>

</script>
</html>