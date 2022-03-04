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
            <form>
                <div class="newPwd_13">
                    <label for="names" class="la1">姓名:&nbsp;</label>
                    <input type="text" id="names" class="inPut" name="names" value="${member.account}" >
                    <p class="txtP">&nbsp;${member.memberName}</p>
                </div>
                <div class="gender_13">
                    <label class="la1">性別:&nbsp;</label>
                    <label class="labGnd"><input type="radio" name="gender" id="gender" value="male">男</label>
                    <label class="labGnd"><input type="radio" name="gender" id="gender" value="female">女</label>
                    <p class="txtP">&nbsp;</p>
                </div>
                <div class="phone_13">
                    <label for="phone" class="la1">電話:&nbsp;</label>
                    <input type="text" id="phone" class="inPut" name="phone">
                    <p class="txtP">&nbsp;</p>
                </div>
                <div class="newAccount_13">
                    <label for="account" class="la1">帳號(email):&nbsp;</label>
                    <input type="text" id="account" class="inPut" name="account">
                    <p class="txtP">&nbsp;</p>
                </div>
                <div class="newPwd_13">
                    <label for="pwd" class="la1">密碼:&nbsp;</label>
                    <input type="password" id="pwd" class="inPut" name="pwd">
                    <p class="txtP">&nbsp;</p>
                </div>
                <div class="nickName_13">
                    <label for="nickName" class="la1">用戶名稱:&nbsp;</label>
                    <input type="text" id="nickName" class="inPut" name="nickName">
                    <p class="txtP">&nbsp;</p>
                </div>
                <div class="birth_13">
                    <label for="pwd" class="la1">生日:&nbsp;</label>
                    <label ><input type="date" name="birth" value="?/?/?" class="inPutsb"></label>
                    <p class="txtP">&nbsp;</p>
                </div>
                <div class="city_13">
                    <label for="city" class="la1">居住城市:&nbsp;</label>
                    <input type="text" id="city" class="inPut" name="city">
                    <p class="txtP">&nbsp;</p>
                </div>
                <div class="sub">
                    <input type="submit" value="送出" class="inPut">
                    <input type="reset" value="清除" class="inPut">
                </div>
            </form>
        </fieldset>
        <!-- </div> -->
    </div>

</body>
</html>