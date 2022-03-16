<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/png" href="css/1647002131.ico">
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

.spaceBottom {
	height: 120px;
}

.menu {
	box-shadow: -4px 22px 14px -20px #cfcfcf;
}

.tititle {
	margin: 0px auto;
	margin-left: 800px;
}

.modal.left .modal-dialog {
	position: fixed;
	margin: auto;
	width: 320px;
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

.modal.left .modal-body {
	padding: 15px 15px 80px;
}

.modal.left.fade .modal-dialog {
	left: -320px;
	-webkit-transition: opacity 0.3s linear, left 0.3s ease-out;
	-moz-transition: opacity 0.3s linear, left 0.3s ease-out;
	-o-transition: opacity 0.3s linear, left 0.3s ease-out;
	transition: opacity 0.3s linear, left 0.3s ease-out;
}

.modal.left.fade.show .modal-dialog {
	left: 0;
}

.menu7 {
	display: inline;
	line-height: 50px;
	font-size: x-large;
}

.menuLine7 {
	padding-bottom: 2px;
}

.menu_link7 {
	color: rgb(93, 91, 91);
	font-weight: 600;
}

.menu_link7:hover {
	text-decoration: none;
}

.topImg {
	text-align: center
}

.login7 {
	width: 180px;
}
</style>
</head>

<body>
	<div class="container">
		<nav class="navbar fixed-top navbar-light menu"
			style="background-color: #fff2f2">
			<div class="btn btn-demo" data-toggle="modal" data-target="#myModal7">
				<span class="menu7"><img class="menuLine7"
					src="${contextRoot}/css\menuLines.png" width="20px" height="20px">&ensp;Menu</span>
			</div>
			<c:if test="${pageContext.request.userPrincipal == null}">
				<div class="topImg">
					<a class="navbar-brand" href="${contextRoot}/"><img
						src="${contextRoot}/css/logo.png" width="144" height="81" alt=""></a>
				</div>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal != null}">
				<div class="topImg">
					<a class="navbar-brand" href="${contextRoot}/main"><img
						src="${contextRoot}/css/logo.png" width="144" height="81" alt=""></a>
				</div>
			</c:if>
			<div class="login7">
				<ul class="nav justify-content-end">
					<c:if test="${pageContext.request.userPrincipal != null}">
						<li class="nav-item"><a class="nav-link"
							href="${contextRoot}/reviewerMainPage">${member.nickName}</a></li>
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
			</div>
		</nav>
		<!-- Modal -->
		<div class="modal left fade" id="myModal7" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Menu</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><a class="menu_link7"
								href="${contextRoot}/productsPage">餐券商城</a></li>
							<li class="list-group-item"><a class="menu_link7"
								href="${contextRoot}/shoppingCart">我的購物車</a></li>
							<li class="list-group-item"><a class="menu_link7"
								href="${contextRoot}/myOrder">我的訂單</a></li>
							<li class="list-group-item"><a class="menu_link7"
								href="${contextRoot}/productsBackStagePage">商城後台</a></li>
							<li class="list-group-item dropdown"><a
								class="dropdown-toggle menu_link7" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-expanded="false">
									食記 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${contextRoot}/createData">新增食記</a>
									<a class="dropdown-item" href="${contextRoot}/MemberRecordList">個人食記List</a>
									<a class="dropdown-item" href="${contextRoot}/RecordManagement">食記後台</a>
									<a class="dropdown-item" href="${contextRoot}/RecordAnalysis">食記分析</a>
									<a class="dropdown-item" href="${contextRoot}/MsgManagement">留言後台</a>
								</div></li>
							<li class="list-group-item"><a class="menu_link7"
								href="${contextRoot}/ajaxFoodVis">揪團Eat</a></li>
							<li class="list-group-item"><a class="menu_link7"
								href="${contextRoot}/viewMember">帳號test</a></li>
							<li class="list-group-item dropdown"><a
								class="menu_link7 dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-expanded="false">
									食記分類 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#"><button
											class="btn btn-secondary" value="火鍋" onclick="()">火鍋</button></a>
									<a class="dropdown-item" href="#"><button
											class="btn btn-secondary" value="燒烤" onclick="()">燒烤</button></a>
									<a class="dropdown-item" href="#"><button
											class="btn btn-secondary" value="日式" onclick="()">日式</button></a>
								</div></li>
						</ul>
					</div>

				</div>
				<!-- modal-content -->
			</div>
			<!-- modal-dialog -->
		</div>
		<!-- modal -->
		<div class="spaceBottom"></div>
	</div>

	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</body>
</html>