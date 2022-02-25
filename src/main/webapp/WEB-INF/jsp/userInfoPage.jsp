<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userInfo</title>
<style>
.outside {
	background-color: rgba(252, 113, 0, 0.9);
	height: 1000px;
}
</style>
</head>
<body>
<div class="container">
            <div class="outside">
			<h2>User Info Page</h2>
			<h3>
				Welcome : <span><c:out value="${pageContext.request.userPrincipal.name}"></c:out></span>
			</h3>
			<b>This is protected page!</b>

			<c:if test="${userInfo != null}">
				<div>
					<c:out value="${userInfo}"></c:out>
				</div>
			</c:if>
		</div>

        </div>

      
</body>
</html>