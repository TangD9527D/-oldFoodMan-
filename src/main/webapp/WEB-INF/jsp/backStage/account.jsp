<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #e7e7f3;
}

.menu7{
	height: 100px;
}

.leftSideMenu{
	width: 400px;
	height: 865px;
	background-color: #fcfcff;
}

.card, .cardbody{
	background-color: #fcfcff;
	color: black;
}

.card:hover{
	color: black;
}
</style>
</head>

<body>
		<!-- Image and text -->
		<nav class="navbar navbar-light menu7" style="background-color: #3e3cc2">
			
			<a class="navbar-brand" href=""> <img id="glass"
				src="${contextRoot}/css/glass.png" width="90px"
				height="90px" class="d-inline-block align-top"><span style="text-align: center;"><font size="7" style="color: white;">&nbsp;老食人後臺管理系統</font></span>
			</a>
		</nav>
		<div class="leftSideMenu">
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn" type="button" data-toggle="collapse" data-target="#collapseOne"
								aria-expanded="false" aria-controls="collapseOne">會員帳號管理</button>
						</h5>
					</div>
		
					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">
							<div class="list-group">
								<button type="button" class="list-group-item list-group-item-action">會員帳號編輯</button>
								<button type="button" class="list-group-item list-group-item-action">會員數據分析</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn  collapsed" type="button" data-toggle="collapse"
								data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								商城管理</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
						<div class="card-body">
							<div class="list-group">
								<button type="button" class="list-group-item list-group-item-action">商城編輯</button>
								<button type="button" class="list-group-item list-group-item-action">商城數據分析</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn  collapsed" type="button" data-toggle="collapse"
								data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								揪團管理</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
						<div class="card-body">
							<div class="list-group">
								<button type="button" class="list-group-item list-group-item-action">揪團編輯</button>
								<button type="button" class="list-group-item list-group-item-action">揪團數據分析</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFour">
						<h5 class="mb-0">
							<button class="btn  collapsed" type="button" data-toggle="collapse"
								data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
								Collapsible Group Item #3</button>
						</h5>
					</div>
					<div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
						<div class="card-body">
							<div class="list-group">
								<button type="button" class="list-group-item list-group-item-action">Dapibus ac facilisis in</button>
								<button type="button" class="list-group-item list-group-item-action">Morbi leo risus</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFive">
						<h5 class="mb-0">
							<button class="btn  collapsed" type="button" data-toggle="collapse"
								data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
								Collapsible Group Item #3</button>
						</h5>
					</div>
					<div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
						<div class="card-body">
							<div class="list-group">
								<button type="button" class="list-group-item list-group-item-action">Dapibus ac facilisis in</button>
								<button type="button" class="list-group-item list-group-item-action">Morbi leo risus</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>

</html>