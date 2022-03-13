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
	<div style="border: 2px; border-style: solid;  border-color: black; width: 755px;">
		<div style="background-color: #fbf3f3; width: 750px;">
			<img src="${contextRoot}/css\logo.png" style="height: 117px; width: 208px;"><font size="7">&emsp;oldFoodMan(老食人)</font>
		<br>
		</div>
		<h4>您好:</h4>	
		<h4>如果不是您申請忘記密碼，請忽略此信件</h4>
		<br>
		<h4>若您忘記密碼請點以下連結</h4>
		<h4><a href="http://localhost:8080/oldFoodMan/resetPassword/7">請點連結</a></h4>
		<br>
		<h4>祝你使用愉快!!</h4>	
		<h4>老食人團隊敬上</h4>	
	</div>
</body>

</html>