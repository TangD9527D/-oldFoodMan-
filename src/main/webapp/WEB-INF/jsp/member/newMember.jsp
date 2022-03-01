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
        <fieldset class="field_13">
            <legend>
                <h1>新增帳號</h1>
            </legend>
            <form:form class="form" action="${contextRoot}/newMember" modelAttribute="member" method="post">
                <div class="newPwd_13">
                    <form:label class="la1" path="memberName">姓名:&nbsp;</form:label>
                    <form:input type="text" id="names" class="inPut" name="names" path="memberName"/>
                </div>
                <div class="newAccount_13">
                    <form:label class="la1" path="account">帳號(email):&nbsp;</form:label>
                    <form:input type="text" id="account" class="inPut" name="account" path="account"/>
                </div>
                <div class="newPwd_13">
                    <form:label class="la1" path="memberPwd">密碼:&nbsp;</form:label>
                    <form:input type="password" id="pwd" class="inPut" name="pwd" path="memberPwd"/>
                </div>
                <div class="sub">
                    <input name="submit" type="submit" value="送出" class="inPut">
                </div>
            </form:form>
        </fieldset>
        <!-- </div> -->
    </div>

</body>
</html>