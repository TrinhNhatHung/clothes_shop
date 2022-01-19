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
	href="${contextPath}/resources/assets/css/productdetail.css">
<link rel="stylesheet"
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
a.link-in-btn {
	display: block; 
	text-align: center;
	color : white;
	text-decoration:  none
}

a.link-in-btn:hover {
	color : black
}

button {
	outline :none !important
}
</style>


<body>
	<!-- HEADER -->
	<%@ include file="header.jsp"%>
	<!-- MAIN -->
	<div class="container">
		<div class="product__detail">
			<div class="row product__detail-row">
				<div class="col-lg-6 col-12 daonguoc">

					<div id="main-img" style="cursor: pointer;">
						<img src="${item.linkImage}" class="big-img" alt="ảnh chính"
							id="img-main" xoriginal="./assets/img/product/ult1.jpg">
						<div class="sale-off sale-off-2" id="div-discount">
							<span class="sale-off-percent" id="span-discount">${item.discount}%</span>
							<span class="sale-off-label">GIẢM</span>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-12">
					<div class="product__name">
						<h2>${item.name}</h2>
					</div>
					<div class="status-product">
						Trạng thái: <b id="status">${status}</b>
					</div>
					<div class="infor-oder">
						Loại sản phẩm: <b>${item.itemGroup.name}</b>
					</div>
					<div class="product__price">
						<h2>
							<script type="text/javascript">
								var newOutPrice = ${item.outPrice} * (100 - ${item.discount}) / 100;
								document.write(newOutPrice)
							</script>
							đ
						</h2>
					</div>

					<div class="price-old" id="old-price">
						Giá gốc:
						<del>${item.outPrice}đ</del>
						<span class="discount">(-${item.discount}%)</span>
					</div>


					<div class="product__size d-flex" style="align-items: center;">
						<div class="title" style="font-size: 16px; margin-right: 10px;">
							Kích thước:</div>
						<div class="select-swap">
							<c:forEach var="size" items="${sizes}">
								<div class="swatch-element" data-value="${size.key}">
									<input type="radio" class="variant-1" id="${size.key}"
										name="mau" value="${size.key}"
										onclick="checkSize('${size.value}')"> <label
										for="${size.key}" class="sd"><span>${size.key}</span></label>
								</div>
							</c:forEach>

						</div>
					</div>
					<div class="product__wrap">
						<div class="product__amount">
							<label for="">Số lượng: </label> <input type="button" value="-"
								class="control" onclick="tru()" id="cong"> <input
								type="text" value="1" class="text-input" id="text_so_luong"
								onkeypress='validate(event)'> <input type="button"
								value="+" class="control" onclick="cong()">
						</div>

					</div>
					<div class="product__shopnow">
						<button class="shopnow">
							<a class="link-in-btn" href="${contextPath }/cart">Mua ngay</a>
						</button>
						<security:authorize access='hasRole("CUSTOMER")'>
							<button class="add-cart" >Thêm vào giỏ</button>
						</security:authorize>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product__describe">
		<div class="container">
			<h2 class="product__describe-heading">Mô tả</h2>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-11">
					<h3 class="name__product">${item.name}</h3>
					<h3>Thông số kĩ thuật:</h3>
					<p>${item.description}</p>
				</div>
			</div>
		</div>
	</div>



	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>
</body>

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