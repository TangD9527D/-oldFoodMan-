<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<style>
* {
	margin: 0px;
	padding: 0px;
}


</style>
</head>

<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
			table-layout="fixed">
			<a class="navbar-brand" href="${contextRoot}/">OldFoodMan</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/userInfo">User Info</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/admin">Admin</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/newAccount">新增</a></li>

					<li class="nav-item"><a class="nav-link" href="${contextRoot}/productsPage">餐券商城</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextRoot}/productsBackStagePage">商城後台</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextRoot}/shoppingCart">我的購物車</a></li>
						<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/createData">食記</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/productsBackStagePage">商城後台</a></li>
						
						<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/ajaxFoodVis">揪團Eat</a></li>

				</ul>
			</div>
			<ul class="nav justify-content-end">
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/userPage/${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal == null}">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/login">Login</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/logout">Logout</a></li>
				</c:if>
			</ul>

		</nav>
	</div>
</body>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</html>