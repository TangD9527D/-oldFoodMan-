<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextRoot}/css/account.css">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Norican&display=swap"
	rel="stylesheet" />
<title>Login</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<style>
.body_13 {
	background-color: #f8eae6;
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

.la2 {
	width: 100px;
	text-align: right;
	float: left;
}

.modal-header {
	background-color: #defaa2e8;
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
							<span id="new_account"> <a
								href="${contextRoot}/forgotMail">忘記密碼</a></span>&emsp;&emsp;
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModal">新增帳號</button>
							&emsp;&emsp; <span id="log_in">
								<button name="submit" type="submit" value="submit"
									class="btn btn-primary">登入</button>
							</span>
						</div>
					</form:form>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title" id="exampleModalLabel">新增帳號</h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form class="form">
										<div class="newPwd_13">
											<label class="la2">姓名:&nbsp;</label> <input type="text"
												id="newName" class="inPut" name="names" />
											<p class="txtP">&nbsp;</p>
										</div>
										<div class="newAccount_13">
											<label class="la2">帳號(email):&nbsp;</label> <input
												type="text" id="newAccount" class="inPut" name="account" />
											<p class="txtP">&nbsp;</p>
										</div>
										<div class="newPwd_13">
											<label class="la2">密碼:&nbsp;</label> <input type="password"
												id="newPwd" class="inPut" name="pwd" />
											<p class="txtP">&nbsp;</p>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">關閉</button>
											<button type="submit" type="submit" class="btn btn-primary"
												data-dismiss="modal" id="newMbr">送出</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
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
	<script>
		$(document).on('click', '#newMbr', function() {

			var memberName = document.getElementById('newName').value;
			var account = document.getElementById('newAccount').value;
			var memberPwd = document.getElementById('newPwd').value;

			var Object = {
				"memberName" : memberName,
				"account" : account,
				"memberPwd" : memberPwd
			}
			var JsonString = JSON.stringify(Object);

			$.ajax({
				url : "http://localhost:8080/oldFoodMan/newMember",
				contentType : "application/json; charset=UTF-8", // 送過去的格式
				method : "post",
				data : JsonString,
				success : function() {
				}

			})
		})
	</script>
</body>
</html>