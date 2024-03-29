<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:set var='contextRoot' value='${pageContext.request.contextPath }'/>
<link rel='stylesheet' href='${contextRoot}/css/bootstrap.min.css'/>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">導覽列</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="${contextRoot}/">Home
						<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="${contextRoot}/FoodAccountPage">我的帳務</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextRoot}/productsPage">餐券商城</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextRoot}/productsBackStagePage">商城後台</a></li>
			</ul>
		</div>
	</nav>


<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>