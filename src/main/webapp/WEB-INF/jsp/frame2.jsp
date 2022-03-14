<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/png" href="css/1647002131.ico">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Norican&family=Sriracha&display=swap"
	rel="stylesheet">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Insert title here</title>
<style>
.modal.left .modal-dialog {
	position:fixed;
	right: 0;
	margin: auto;
	width: 400px;
	height: 100%;
	-webkit-transform: translate3d(0%, 0, 0);
	-ms-transform: translate3d(0%, 0, 0);
	-o-transform: translate3d(0%, 0, 0);
	transform: translate3d(0%, 0, 0);
}

.modal.left .modal-content {
	height: 100%;
	overflow-y: auto;
}

.modal.right .modal-body {
	padding: 15px 15px 80px;
}

.modal.right.fade .modal-dialog {
	left: -320px;
	-webkit-transition: opacity 0.3s linear, left 0.3s ease-out;
	-moz-transition: opacity 0.3s linear, left 0.3s ease-out;
	-o-transition: opacity 0.3s linear, left 0.3s ease-out;
	transition: opacity 0.3s linear, left 0.3s ease-out;
}

.modal.right.fade.show .modal-dialog {
	right: 0;
}

</style>

</head>

<body>
<div class="container">
	<button type="button" class="btn btn-dark" data-toggle="modal"
							data-target="#exampleModal2">新增帳號</button>
							
	<div class="modal left fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">忘記密碼</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="emailBody">
						<form id="form1">
							<label>信箱:&nbsp;</label> 
							<input type="text" id="emailSend" name="account">
							<button type="button" id="btn77">送出</button>
						</form>
					</div>
				</div>
			</div>
		</div>
</div>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>

</html>