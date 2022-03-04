<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextRoot}/css/account.css">
</head>
<body class="body_13">
    <div class="out_side_13">
		<form:form method='POST' modelAttribute="member" action="${contextRoot}/editMember" enctype="multipart/form-data">
			<fieldset class="field_13">
				<legend>
					<h1>編輯帳號</h1><form:input style="display: none;" path="id" />
				</legend>
				<div>
					<form:input id="memberImage" path="memberImage" type="file" class="inPut" />
				</div>
				<div class="newPwd_13">
					<label for="names" class="la1">姓名:&nbsp;</label> 
					<form:input type="text" id="names" class="inPut" path="memberName" name="names"/>
					<p class="txtP">&nbsp;</p>
				</div>
				<div class="phone_13">
					<label for="phone" class="la1">電話:&nbsp;</label> <form:input type="text"
						id="phone" class="inPut" path="phone" name="phone" value="${member.phone}"/>
					<p class="txtP">&nbsp;</p>
				</div>
				<div class="newAccount_13">
					<label for="account" class="la1">帳號(email):&nbsp;</label> <form:input
						type="text" id="account" path="account" class="inPut" name="account" value="${member.account}"/>
					<p class="txtP">&nbsp;</p>
				</div>
				<div class="newPwd_13">
					<label for="pwd" class="la1">密碼:&nbsp;</label> <form:input
						type="password" id="pwd" path="memberPwd" class="inPut" name="pwd" value="${member.memberPwd}"/>
					<p class="txtP">&nbsp;</p>
				</div>
				<div class="nickName_13">
					<label for="nickName" class="la1">用戶名稱:&nbsp;</label> <form:input
						type="text" id="nickName" path="nickName" class="inPut" name="nickName" value="${member.nickName}"/>
					<p class="txtP">&nbsp;</p>
				</div>
				<div class="birth_13">
					<label for="pwd" class="la1">生日:&nbsp;</label> <label><form:input
						type="date" name="birth" path="birth" class="inPutsb" value="${member.birth}"/></label>
					<p class="txtP">&nbsp;</p>
				</div>
				<div class="city_13">
					<label for="city" class="la1">居住城市:&nbsp;</label> <form:input
						type="text" id="city" class="inPut" path="city" name="city" value="${member.city}"/>
					<p class="txtP">&nbsp;</p>
				</div>
				<div class="sub">
					<input type="submit" name="submit" value="送出" class="inPut">
				</div>
			</fieldset>
		</form:form>
		<!-- </div> -->
    </div>

</body>
</html>