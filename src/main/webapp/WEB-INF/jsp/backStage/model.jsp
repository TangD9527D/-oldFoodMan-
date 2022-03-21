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
<link rel="shortcut icon" type="image/png" href="${contextRoot}/css/1647002131.ico">
<title>老食人後臺管理系統</title>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #e7e7f3;
}

.menu7 {
	height: 100px;
}

.leftSideMenu {
	width: 250px;
	float: left;
}

.card:hover {
	color: black;
}

.list-group-item{
	font-size: large;
	font-weight: 800;
}

.list-group{
	border: solid 2px black;
}

.modelBottom{
	height: 100px;
	border: 2px solid red;
}
</style>
</head>

<body>
	<!-- Image and text -->
	<nav class="navbar navbar-light menu7 fixed-top"
		style="background-color: #3e3cc2">

		<a class="navbar-brand" href=""> <img id="glass"
			src="${contextRoot}/css/glass.png" width="90px" height="90px"
			class="d-inline-block align-top"><span
			style="text-align: center;"><font size="7"
				style="color: white;">&nbsp;老食人後臺管理系統</font></span>
		</a>
	</nav>
	<div class="modelBottom">

	</div>
	<div class="leftSideMenu position-fixed">
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-header" id="headingOne" style="border-bottom: solid 5px black;">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne"><span style="font-weight: 800; font-size: large;">會員帳號管理</span></button>
					</h5>
				</div>
				<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
					data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group" style="border: solid 2px black;">
							<a href="${contextRoot}/backStage/account"><button type="button"
								class="list-group-item list-group-item-action">會員帳號編輯</button></a>
							<a href="${contextRoot}/backStage/accountAnalysis"><button type="button"
								class="list-group-item list-group-item-action" style="border-top: solid 2px black;">會員數據分析</button></a>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo" style="border-bottom: solid 5px black;">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo"><span style="font-weight: 800; font-size: large;">商城管理</span></button>
					</h5>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
						<a href="${contextRoot}/productsBackStagePage">
							<button type="button"
								class="list-group-item list-group-item-action">商城編輯</button></a>
							<a href="${contextRoot}/productsBackAnalytics">
							<button type="button"
								class="list-group-item list-group-item-action">商城分析</button></a>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingThree" style="border-bottom: solid 5px black;">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree"><span style="font-weight: 800; font-size: large;">揪團管理</span></button>
					</h5>
				</div>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
							<a href="${contextRoot}/viewAllVis"><button type="button"
								class="list-group-item list-group-item-action">揪團編輯</button></a>
							<a href="${contextRoot}/analyzeVis"><button type="button"
								class="list-group-item list-group-item-action" style="border-top: solid 2px black;">揪團數據分析</button></a>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingFour" style="border-bottom: solid 5px black;">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour"><span style="font-weight: 800; font-size: large;">食記&留言管理</span></button>
					</h5>
				</div>
				<div id="collapseFour" class="collapse"
					aria-labelledby="headingFour" data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
							<a href="${contextRoot}/RecordManagement"><button type="button"
								class="list-group-item list-group-item-action">食記編輯</button></a>
							<a href="${contextRoot}/MsgManagement"><button type="button"
								class="list-group-item list-group-item-action">留言編輯</button></a>
							<a href="${contextRoot}/RecordAnalysispage"><button type="button"
								class="list-group-item list-group-item-action" style="border-top: solid 2px black;">食記分析</button></a>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingFive" style="border-bottom: solid 5px black;">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive"><span style="font-weight: 800; font-size: large;">收藏管理</span></button>
					</h5>
				</div>
				<div id="collapseFive" class="collapse"
					aria-labelledby="headingFive" data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
							<a href="${contextRoot}/findAllCollections"><button type="button"
								class="list-group-item list-group-item-action">收藏列表管理</button></a>
							<a href="${contextRoot}/chartBiao"><button type="button"
								class="list-group-item list-group-item-action" style="border-top: solid 2px black;">收藏食記分析</button></a>
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