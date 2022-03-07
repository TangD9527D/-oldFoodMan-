<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Norican&display=swap"
	rel="stylesheet">
<title>Login</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<style>
.body_13 {
	background-image: url("images/44737597.jpg");
}

.out_div_13 {
	margin: 200px auto;
	width: 1000px;
	height: 500px;
	border: solid 15px rgb(165, 88, 241);
	background-color: rgba(248, 158, 56, 0.924);
}

.login_13 {
	margin: 90px auto;
	width: 500px;
	height: 300px;
	border: inset 5px #000000;
	border-radius: 3%;
}

.account_13 {
	margin-top: 30px;
	font-weight: 900;
	font-size: x-large;
	/* background-color: red; */
}

.pwd_13 {
	font-size: x-large;
	font-weight: 900;
	/* background-color: red; */
}

#account, #pwd {
	font-size: x-large;
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
	font-size: xx-large;
	font-family: 'Norican', cursive;
	border-radius: 6px 6px 0px 0px;
	border-bottom: black 3.5px solid;
	text-align: center;
}
</style>
</head>

<body class="body_13">
	<div class="container">
		<div class="outside">
			<div class="out_div_13">
				<div class="login_13">
					<form:form action="/oldFoodMan/j_spring_security_check"
						method="POST" lass="login_table">
						<div class="mark">
							<span>oldFoodMan</span>
						</div>
						<div class="account_13">
							<label class="lab">帳號:&nbsp;</label> <input type="text"
								id="account" name="account">
						</div>
						<br>
						<div class="pwd_13">
							<label class="lab">密碼:&nbsp;</label> <input type="password"
								id="pwd" name="password">
						</div>
						<!-- /login?error=true -->
						<c:if test="${param.error == 'true'}">
							<span class="login_fail">Login Failed!!!</span>
						</c:if>
						<br>
						<div class="under_13">
							<span id="new_account"><a href="${contextRoot}/newAccount">新增帳號</a></span>&emsp;&emsp;<span
								id="log_in">
								<button name="submit" type="submit" value="submit"
									class="btn btn-primary">登入</button>
							</span>
						</div>
					</form:form>
				</div>
				<div>
					<h4>
						<a href="${contextRoot}/oauth2/authorization/google">Sign-in
							Google</a>
					</h4>
				</div>
			</div>
		</div>
	</div>
</body>

</html>