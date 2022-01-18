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

.input-size {
	height: 38px !important;
	padding: 6px 12px 6px 12px;
	box-sizing: border-box;
	margin-right: 10px
}

.font-size-lable {
	font-size: 18px;
}

a.link-in-btn {
	display: block;
	text-align: center;
	color: white;
	text-decoration: none
}

a.link-in-btn:hover {
	color: black
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

.form-control {
	font-size: 16px !important;
}
</style>

<body>
	<div class="row">
		<div class="side-bar col-2">
			<%@ include file="adminSidebar.jsp"%>
		</div>
		<div class="main-content col-10">
			<%@ include file="adminHeader.jsp"%>
			<div class="container-fluid">
				<ul class="nav-tab nav justify-content-center">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="${contextPath }/admin/employee">Tất cả nhân viên</a></li>
					<c:if test='${type == "add" }'>
						<li class="nav-item active"><a class="nav-link active"
							aria-current="page" href="${contextPath }/admin/employee/add">Thêm
								nhân viên</a></li>
					</c:if>
					<c:if test='${type == "update" }'>
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="${contextPath }/admin/employee/add">Thêm nhân viên</a></li>
						<li class="nav-item active"><a class="nav-link active" aria-current="page"
							>Cập nhật nhân viên</a></li>
					</c:if>

				</ul>
				<c:if test='${type == "add" }'>
					<c:set var="formUrl" value="admin/employee/save" />
				</c:if>
				<c:if test='${type == "update" }'>
					<c:set var="formUrl" value="admin/employee/saveUpdate" />
				</c:if>
				<form:form action="${contextPath }/${formUrl }"
					modelAttribute="user" method="POST">
					<div class="container rounded bg-white mt-5 mb-5">
						<div class="row">
							<div class="col border-right">
								<div class="p-3 py-5">
									<div
										class="d-flex justify-content-between align-items-center mb-3">
										<h4 class="text-right" style="font-size: 24px">Thông tin
											nhân viên</h4>
									</div>
									<div class="row mt-2">
										<div class="col-md-6">
											<label class="labels font-size-lable">Tài khoản</label>
											<form:input type="text" class="form-control input-size"
												placeholder="Username" path="username" />
											<form:errors path="username" class="text-danger h4" />
										</div>
										<div class="col-md-6">
											<label for="itemGroup" class="font-size-lable">Họ tên</label>
											<form:input type="text" class="form-control input-size"
												placeholder="Họ tên" path="fullname" />
											<form:errors path="fullname" class="text-danger h4" />
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-6">
											<label class="labels font-size-lable">Số điện thoại</label>
											<form:input type="text" class="form-control input-size"
												path="phone" placeholder="Số điện thoại" />
											<form:errors path="phone" class="text-danger h4" />
										</div>
										<div class="col-md-6">
											<label class="labels font-size-lable">Địa chỉ</label>
											<form:input type="text" class="form-control input-size"
												path="address" placeholder="Địa chỉ" />
											<form:errors path="address" class="text-danger h4" />
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-6">
											<label class="labels font-size-lable">Mật khẩu</label>
											<form:input type="password" class="form-control input-size"
												path="password" placeholder="Mật khẩu" />
											<form:errors path="password" class="text-danger h4" />
										</div>
										<div class="col-md-6">
											<label class="labels font-size-lable">Xác nhận mật
												khẩu</label>
											<form:input type="password" class="form-control input-size"
												path="passwordConfirmation" placeholder="Xác nhận mật khẩu" />
											<form:errors path="passwordConfirmation"
												class="text-danger h4" />
										</div>
									</div>

									<div class="row mt-3">
										<div class="col-md-6">
											<label class="labels font-size-lable mr-3">Giới tính</label>
											<form:radiobutton path="gender" class="ml-3" value="Nam" />
											Nam
											<form:radiobutton path="gender" class="ml-3" value="Nữ" />
											Nữ
											<form:errors path="gender" class="text-danger h4" />
										</div>
									</div>
									<c:if test="${registrationError != null}">
										<div class="text-danger h4">${registrationError}</div>
									</c:if>
									<form:input type="hidden" path="enable" value="true" />
									<div class="mt-5 text-center">
										<c:if test='${type == "add" }'>
											<input class="btn btn-primary profile-button" type="submit"
												style="height: 40px; width: 200px; font-size: 18px;"
												value="Thêm nhân viên"></input>
										</c:if>
										<c:if test='${type == "update" }'>
											<input class="btn btn-primary profile-button" type="submit"
												style="height: 40px; width: 200px; font-size: 18px;"
												value="Cập nhật nhân viên"></input>
										</c:if>
									</div>
								</div>
							</div>

						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

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