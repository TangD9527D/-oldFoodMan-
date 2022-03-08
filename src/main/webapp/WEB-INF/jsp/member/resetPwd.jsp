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
					<form:form modelAttribute="member"
						action="${contextRoot}/resetPassword" method="POST"
						lass="login_table">
						<div class="mark">
							<span>oldFoodMan</span>
						</div>
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
						<br>
						<div class="pwd_13">
							<label class="lab">密碼:&nbsp;</label> <form:input type="password"
								id="pwd" name="password" path="memberPwd"/>
						</div>
						<button name="submit" type="submit" value="submit"
							class="btn btn-primary">送出</button>
						<br>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>