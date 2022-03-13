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
<link href="https://fonts.googleapis.com/css2?family=Norican&family=Sriracha&display=swap" rel="stylesheet">
<title>Insert title here</title>
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

.googleLogin {
	position: absolute;
	bottom: 60px;
	right: 0px;
	width: 450px;
	margin: 0px auto;
	font-weight: 700;
	font-size: larger;
}

.googleImg {
	position: relative;
	top: 10px;
	left: 50px;
}

.modal.left .modal-dialog {
	position:fixed;
	top: 0;
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
				登入&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span
					style="font-size: small; text-align: left;">*為必填資訊</span>
			</div>
			<div class="login_13">
				<form:form action="/oldFoodMan/j_spring_security_check"
					method="POST" lass="login_table">

					<div class="formLogin">
						<div style="font-size: large; text-align: left;">&emsp;&emsp;信箱*</div>
						<input type="text" id="account" name="account"> <span>&nbsp;</span>
					</div>
					<br>
					<div class="formLogin">
						<div style="font-size: large; text-align: left;">&emsp;&emsp;密碼*</div>
						<input type="password" id="pwd" name="password"> <span>&nbsp;</span>
					</div>
					<!-- /login?error=true -->
					<c:if test="${param.error == 'true'}">
						<span class="login_fail">Login Failed!!!</span>
					</c:if>
					<br>
					<div class="under_13">
						<span id="new_account" data-toggle="modal"
						data-target="#exampleModal2">忘記密碼?</span>&emsp;&emsp;
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-dark" data-toggle="modal"
							data-target="#exampleModal">新增帳號</button>
						&emsp;&emsp; <span id="log_in">
							<button name="submit" type="submit" value="submit"
								class="btn btn-dark">登入</button>
						</span>
					</div>
				</form:form>
			</div>
			<div class="googleLogin">
				<span>——————————or——————————</span>
				<div class="googleImg">
					<a href="${contextRoot}/oauth2/authorization/google"><img
						src="${contextRoot}/css/google.png" width="300px" height="60px"></a>
				</div>
			</div>
		</div>

		<div class="modal left fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">新增帳號</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form class="form">
							<p></p>
							<div class="newPwd_13">
								<label class="la2">姓名:&nbsp;</label> <input type="text"
									id="newName" class="inPut" name="names" />
								<p class="txtP">&nbsp;</p>
							</div>
							<div class="newAccount_13">
								<label class="la2">信箱:&nbsp;</label> <input
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

		<div class="modal left fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">新增帳號</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="form">
							<label>帳號:&nbsp;</label> 
							<input type="text" id="account" name="account">
							<button type="button" id="btn77">送出</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
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

		$(document).on('click', '#btn77', function(){ 
		var email = $("#account").val();
		console.log(email);
		$("#form").remove();
		$.ajax({
			method:"post",
			url:"http://localhost:8080/oldFoodMan/mail/" + email,
			success:function(data){
				$("#out").append(data);
			}
		})
	})
	</script>
</body>

</html>