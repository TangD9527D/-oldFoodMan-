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
</head>
<body>
<div class="container">
		<p />
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card text-center">
					<div class="card-header">123</div>
					<div class="card-body">
						<h5 class="card-title">讓我看看</h5>
						<form:form class="form" modelAttribute="memberDto"
							method="post">
							<form:input path="memberName"/>
							<form:input path="account"/>
							<form:input path="memberPwd"/>
							<br>
							<input type="submit" name="submit" />
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>