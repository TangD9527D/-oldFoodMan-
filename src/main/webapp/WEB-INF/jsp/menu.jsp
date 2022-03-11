<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/png" href="css/1646984828.ico" >
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<style>
* {
	margin: 0px;
	padding: 0px;
}

.spaceTop {
	width: 100%;
	padding: 0px;
}

.spaceBottom{
	height: 120px;
}

.menu{
	box-shadow: -4px 22px 14px -20px #cfcfcf;
}

.tititle{
	margin: 0px auto;
	margin-left: 800px;
}

.tititle{
	margin: 0px auto;
	margin-left: 800px;
}

.tititle{
	margin: 0px auto;
	margin-left: 800px;
}

.tititle{
	margin: 0px auto;
	margin-left: 800px;
}
</style>
</head>

<body>
	<div class="container">
		<nav class="navbar fixed-top navbar-light menu" style="background-color: #feffee">
			<a class="navbar-brand" href="${contextRoot}/main"><img src="imgDon/noPhoto.png"
				width="30" height="30" alt=""> OldFoodMan</a>
			<ul class="nav justify-content-end">
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/reviewerMainPage">${pageContext.request.userPrincipal.name}</a></li>
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
			<div class="spaceTop">
				<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #feffe200">
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

							<li class="nav-item"><a class="nav-link"
								href="${contextRoot}/productsPage">餐券商城</a></li>

							<li class="nav-item"><a class="nav-link"
								href="${contextRoot}/shoppingCart">我的購物車</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${contextRoot}/myOrder">我的訂單</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${contextRoot}/productsBackStagePage">商城後台</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${contextRoot}/createData">食記</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${contextRoot}/ajaxFoodVis">揪團Eat</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${contextRoot}/viewMember">帳號test</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-expanded="false">
									食記分類 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#"><button
											class="btn btn-secondary" value="火鍋" onclick="collet11()">火鍋</button></a>
									<a class="dropdown-item" href="#"><button
											class="btn btn-secondary" value="燒烤" onclick="collet11()">燒烤</button></a>
									<a class="dropdown-item" href="#"><button
											class="btn btn-secondary" value="日式" onclick="collet11()">日式</button></a>
								</div></li>

						</ul>
					</div>
				</nav>
			</div>

		</nav>
		<div class="spaceBottom"></div>
	</div>
</body>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</html>