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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	
		<ul class="pagination pagination-lg justify-content-center">
			<li class="page-item" id="previous"><a class="page-link" id="previousA">Trước</a></li>

			<li class="page-item disabled"><a class="page-link" id="page" href="">${page + 1}</a></li>	
			
			<li class="page-item" id="next" value="${sizePage}"><a class="page-link" id="nextA">Sau</a></li>
		</ul>
	</div>
</body>

<script>
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
	
	urlPre.searchParams.set("page", page.innerHTML - 2)
	urlNext.searchParams.set("page", page.innerHTML)
	console.log(urlPre + " ==== " + urlNext)
	
	document.getElementById("previousA").href = urlPre;
	document.getElementById("nextA").href = urlNext;
</script>

</html>