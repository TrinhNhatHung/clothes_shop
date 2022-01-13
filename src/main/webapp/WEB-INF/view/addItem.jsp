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
	href="${contextPath}/resources/assets/css/login.css">
<link rel="stylesheet"
	<%-- href="${contextPath}/resources/assets/css/productdetail.css">
<link rel="stylesheet" --%>
	href="${contextPath}/resources/assets/css/reponsive1.css">
<link rel="icon"
	href="${contextPath}/resources/assets/img/logo/main.png"
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

.input-size {
	height: 38px;
	padding: 6px 12px 6px 12px;
	box-sizing: border-box;
	margin-right: 10px
}

.font-size-lable {
	font-size: 18px;
}

select {
	height: 40px;
	width: 100px;
	font-size: 18px;
	border-radius: 4px;
}
</style>

<style>
a.link-in-btn {
	display: block;
	text-align: center;
	color: white;
	text-decoration: none
}

a.link-in-btn:hover {
	color: black
}
</style>


<body style="background-color: #edf1f5;">
	<!-- HEADER -->
	<%@ include file="header.jsp"%>
	<!-- MAIN -->

	<div class="container mb-18">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link" aria-current="page"
				href="${contextPath }/purchase">Tổng quan</a></li>
			<li class="nav-item"><a class="nav-link " aria-current="page"
				href="${contextPath }/purchase">Người dùng</a></li>
			<li class="nav-item  active"><a class="nav-link active"
				aria-current="page" href="${contextPath }/admin/items">Sản phẩm</a></li>
			<li class="nav-item"><a class="nav-link " aria-current="page"
				href="${contextPath }/admin/orders">Đơn hàng</a></li>
		</ul>

		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link" aria-current="page"
				href="${contextPath }/admin/items">Tất cả sản phẩm</a></li>


			<c:choose>
				<c:when test="${item.id > 0}">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="${contextPath }/admin/items/add">Thêm sản phẩm</a></li>

					<li class="nav-item active"><a class="nav-link active"
						aria-current="page" href="">Cập nhật sản phẩm</a></li>
				</c:when>

				<c:otherwise>
					<li class="nav-item active"><a class="nav-link active"
						aria-current="page" href="${contextPath }/admin/item/add">Thêm
							sản phẩm</a></li>
				</c:otherwise>
			</c:choose>

		</ul>
		<form:form action="save" modelAttribute="item" method="POST" enctype="multipart/form-data">
			<div class="container rounded bg-white mt-5 mb-5">
				<div class="row">
					<div class="col-md-4 border-right">
						<div
							class="d-flex flex-column align-items-center text-center p-3 py-5">
							<img class="mt-5" alt="Ảnh sản phẩm" id="output"
								style="width: 300px; min-height: 300px; border: 1px solid; object-fit: contain;"
								src="${item.linkImage}"> <input type="file" name="imageFile"
								style="font-size: 15px; margin: 15px 0"
								onchange="loadFile(event)">
							<form:input path="image" type="hidden" value="${item.image}" />
							<c:if test="${item.id > 0}">
								<span class="font-weight-bold font-size-lable">Mã sản
									phẩm: <span class="text-black-50 font-size-lable">${item.id}</span>
									<form:input path="id" type="hidden" value="${item.id}" />
								</span>
							</c:if>
							<span> </span>
						</div>
					</div>
					<div class="col-md-8 border-right">
						<div class="p-3 py-5">
							<div
								class="d-flex justify-content-between align-items-center mb-3">
								<h4 class="text-right" style="font-size: 24px">Thông tin
									sản phẩm</h4>
							</div>
							<div class="row mt-2">
								<div class="col-md-12">
									<label class="labels font-size-lable">Tên</label>
									<form:input type="text" class="form-control input-size"
										placeholder="Tên" path="name" value="" />
									<form:errors path="name" class="text-danger h4" />
								</div>

							</div>
							<div class="row mt-3">
								<div class="col-md-6">
									<label for="itemGroup" class="font-size-lable">Loại
										hàng</label> <br> <select name="itemGroupId" id="itemGroup"
										class="bg-light">
										<c:forEach items="${itemGroups }" var="itemGroup">
											<c:choose>
												<c:when test="${itemGroupCurrent == itemGroup.name}">
													<option value="${itemGroup.id }" selected>${itemGroup.name }</option>
												</c:when>
												<c:otherwise>
													<option value="${itemGroup.id }">${itemGroup.name }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-6">
									<label class="labels font-size-lable">Giảm giá(%)</label>
									<form:input type="number" class="form-control input-size"
										path="discount" placeholder="Giảm giá" value="" />
									<form:errors path="discount" class="text-danger h4" />
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-6">
									<label class="labels font-size-lable">Giá mua</label>
									<form:input type="number" class="form-control input-size"
										path="inPrice" placeholder="Giá mua" value="" />
									<form:errors path="inPrice" class="text-danger h4" />
								</div>
								<div class="col-md-6">
									<label class="labels font-size-lable">Giá bán</label>
									<form:input type="number" class="form-control input-size"
										value="" path="outPrice" placeholder="Giá bán" />
									<form:errors path="outPrice" class="text-danger h4" />
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-2">
									<label class="labels"></label> <br>
									<div style="margin-top: 12px;" class="font-size-lable">Số
										lượng</div>
								</div>

								<c:choose>
									<c:when test="${itemSizes != null}">
										<c:forEach items="${itemSizes }" var="itemSizes">
											<div class="col-md-2">
												<label class="labels font-size-lable">${itemSizes.id.sizeId }</label>
												<input type="hidden" name="sizeId"
													value="${itemSizes.id.sizeId }"> <input
													name="quantity" type="text" class="form-control input-size"
													placeholder="" value="${itemSizes.quantity}">
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach items="${sizes}" var="size">
											<div class="col-md-2">
												<label class="labels font-size-lable">${size.id }</label> <input
													type="hidden" name="sizeId" value="${size.id }"> <input
													name="quantity" type="text" class="form-control input-size"
													placeholder="" value="">
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="labels font-size-lable">Mô tả</label>
									<form:textarea path="description"
										class="form-control col-md-12" rows="3" />
									<!-- <textarea name="description" id="description"
										class="form-control col-md-12" rows="3"></textarea> -->
								</div>
							</div>
							<form:input type="hidden" path="status" value="1" />
							<input type="hidden" name="type" value="${type}" />
							<div class="mt-5 text-center">


								<c:choose>
									<c:when test="${item.id > 0}">
										<input class="btn btn-primary profile-button" type="submit"
											style="height: 40px; width: 200px; font-size: 18px;"
											value="Cập nhật sản phẩm"></input>
									</c:when>

									<c:otherwise>
										<input class="btn btn-primary profile-button" type="submit"
											style="height: 40px; width: 200px; font-size: 18px;"
											value="Thêm sản phẩm"></input>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>

				</div>
			</div>
		</form:form>
	</div>


	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>
</body>

<script>
var loadFile = function(event) {
	var image = document.getElementById('output');
	console.log("IMAGE: " + image)
	image.src = URL.createObjectURL(event.target.files[0]);
};
</script>

<script type="text/javascript">

var discount = document.getElementById("span-discount");
if(discount.innerHTML === '0%'){
	console.log("00000000");
	document.getElementById("div-discount").hidden = true;
	document.getElementById("old-price").hidden = true;
}

function checkSize(quantity){
    console.log("aaa")
    var type = document.getElementsByName("mau");
    var status = document.getElementById("status");
    type.forEach( e => {
    	if(e.checked)
        {
            var val = e.value;
            if(quantity > 0){
            	status.innerHTML = "Còn " + quantity;
            } else {
            	status.innerHTML = "Hết hàng"
            }
            console.log(val + " - " + quantity);
        }
    })
    
}

function hienthi(id, name) {
    $(`#${name}`).toggle('slow');
    $(`.cong${id}`).toggleClass('hidden');
    $(`.tru${id}`).toggleClass('hidden');
}

function cong() {
    var value = document.getElementById(`text_so_luong`).value
    document.getElementById(`text_so_luong`).value = parseInt(value) + 1;
}
function tru() {
    var value = document.getElementById(`text_so_luong`).value
    if (parseInt(value) > 1) {
        document.getElementById(`text_so_luong`).value = parseInt(value) - 1;
    }

}


function validate(evt) {
    var theEvent = evt || window.event;

    // Handle paste
    if (theEvent.type === 'paste') {
        key = event.clipboardData.getData('text/plain');
    } else {
        // Handle key press
        var key = theEvent.keyCode || theEvent.which;
        key = String.fromCharCode(key);
    }
    var regex = /[0-9]|\./;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault) theEvent.preventDefault();
    }
}

</script>

</html>