<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Norican&family=Sriracha&display=swap" rel="stylesheet">
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-color: #fbf3f3;
}

.left {
	position: absolute;
	top: 220px;
	left: 100px;
	/* border: 2px solid red; */
	width: 600px;
	height: 300px;
}

.right {
	position: absolute;
	top: 120px;
	right: 200px;
	border: 5px solid #444444;
	width: 500px;
	height: 500px;
	border-radius: 30px;
}

.login_13 {
	margin: 30px auto;
	width: 450px;
	height: 300px;
}

.formLogin {
	font-weight: 900;
	font-size: x-large;
	/* background-color: red; */
	text-align: center;
}

#account, #pwd {
	font-size: xx-large;
}

.under_13 {
	float: right;
	padding-right: 50px;
	font-weight: 900;
}

.new_act {
	color: blue;
	text-decoration: underline
}

.lab {
	width: 120px;
	float: left;
	text-align: right;
}

.login_fail {
	font-size: larger;
	color: rgb(255, 0, 0);
	font-weight: 600;
}

.mark {
	font-family: 'Norican', cursive;
	text-align: center;
	background-color: #fbf3f3;
}

.la2 {
	width: 100px;
	text-align: right;
	float: left;
}

.login_title {
	margin: 10px auto;
	border-bottom: solid 2px #444444;
	width: 450px;
	font-size: xx-large;
	font-weight: 700;
}

.lab{

}
</style>
</head>
<div class="container">
	<div class="left">
		<div class="mark">
			<h1 class="display-1">
				<img src="${contextRoot}/css/oldFoodMan06.png"
					style="width: 100px; height: 100px;">&nbsp;oldFoodMan
			</h1>
			<br>
			<h3 class="h2" style="font-family: 'Sriracha', cursive;">old
				foodMan know the food,</h3>
			<h3 class="h2" style="font-family: 'Sriracha', cursive;">old
				people know the world.</h3>
		</div>
	</div>
	<div class="right">
		<div class="login_title">
			忘記密碼
		</div>
		<div class="login_13 container">
			<form:form modelAttribute="member" action="${contextRoot}/resetPassword" method="POST" lass="login_table">
				<form:input style="display: none;" path="id" />
				<form:input style="display: none;" path="memberName" />
				<form:input style="display: none;" path="phone" />
				<form:input style="display: none;" path="account" />
				<form:input style="display: none;" path="nickName" />
				<form:input style="display: none;" path="birth" />
				<form:input style="display: none;" path="city" />
				<form:input style="display: none;" path="createDate" />
				<form:input style="display: none;" path="fileNames" />
				<form:input style="display: none;" path="authProvider" />
				<div class="pwd_13">
					<h3>請輸入新密碼:</h3>
					<form:input type="password" id="pwd" name="password" path="memberPwd" />
				</div>
				<p>&nbsp;</p>
				<div style="width: 450px;">
				<button name="submit" type="submit" value="submit" class="btn btn-primary">送出</button>
				</div>
			</form:form>
		</div>

	</div>
</div>
</body>
</html>