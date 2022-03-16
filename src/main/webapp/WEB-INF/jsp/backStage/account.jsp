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
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
<!-- jQuery -->
<script type="text/javascript" charset="utf8"
	src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
	
</script>
<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
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
	width: 400px;
	height: 830px;
	background-color: #fcfcff;
}

.card, .cardbody {
	background-color: #fcfcff;
	color: black;
}

.card-header {
	border-bottom: solid 3px black;
}

.card:hover {
	color: black;
}

.list-group-item {
	font-weight: 700;
}

.body77 {
	height: 865px;
	width: 1200px;
	border: 3px solid red;
	float: right;
	text-align: center;
}
</style>
</head>

<body>
	<!-- Image and text -->
	<nav class="navbar navbar-light menu7"
		style="background-color: #3e3cc2">

		<a class="navbar-brand" href=""> <img id="glass"
			src="${contextRoot}/css/glass.png" width="90px" height="90px"
			class="d-inline-block align-top"><span
			style="text-align: center;"><font size="7"
				style="color: white;">&nbsp;老食人後臺管理系統</font></span>
		</a>
	</nav>
	<div class="body77">
			<table id="account7" class="table"
				style="width: 100%">
				<thead class="thead-dark">
					<tr>
						<th>會員姓名</th>
						<th>電話</th>
						<th>帳號</th>
						<th>暱稱</th>
						<th>城市</th>
						<th>創辦日期</th>
						<th>修改/刪除</th>
					</tr>
				</thead>
				<c:forEach items="${mb}" var="member">

					<tr>
						<td>${member.memberName}</td>
						<td>${member.phone}</td>
						<td>${member.account}</td>
						<td>${member.nickName}</td>
						<td>${member.city}</td>
						<td>${member.createDate}</td>
						<td><button type="button" class="btn btn-danger" id="deleteMbr" value="${member.id}">刪除</button></td>
					</tr>

				</c:forEach>
			</table>
		</div>
	<div class="leftSideMenu">
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne">會員帳號管理</button>
					</h5>
				</div>
				<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
					data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
							<button type="button"
								class="list-group-item list-group-item-action">會員帳號編輯</button>
							<button type="button"
								class="list-group-item list-group-item-action">會員數據分析</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">商城管理</button>
					</h5>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
							<button type="button"
								class="list-group-item list-group-item-action">商城編輯</button>
							<button type="button"
								class="list-group-item list-group-item-action">商城數據分析</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingThree">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							揪團管理</button>
					</h5>
				</div>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
							<button type="button"
								class="list-group-item list-group-item-action">揪團編輯</button>
							<button type="button"
								class="list-group-item list-group-item-action">揪團數據分析</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingFour">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">
							Collapsible Group Item #3</button>
					</h5>
				</div>
				<div id="collapseFour" class="collapse"
					aria-labelledby="headingFour" data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
							<button type="button"
								class="list-group-item list-group-item-action">Dapibus
								ac facilisis in</button>
							<button type="button"
								class="list-group-item list-group-item-action">Morbi
								leo risus</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingFive">
					<h5 class="mb-0">
						<button class="btn  collapsed" type="button" id="77"
							data-toggle="collapse" data-target="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive">
							Collapsible Group Item #3</button>
					</h5>
				</div>
				<div id="collapseFive" class="collapse"
					aria-labelledby="headingFive" data-parent="#accordionExample">
					<div class="card-body">
						<div class="list-group">
							<button type="button"
								class="list-group-item list-group-item-action">Dapibus
								ac facilisis in</button>
							<button type="button"
								class="list-group-item list-group-item-action">Morbi
								leo risus</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		
		//table
		$(document).ready(function() {

			$('#account7').DataTable({
				"lengthMenu" : [ 10, 20 ],
				"language" : {
					"processing" : "處理中...",
					"loadingRecords" : "載入中...",
					"lengthMenu" : "顯示 _MENU_ 項結果",
					"zeroRecords" : "沒有符合的結果",
					"info" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
					"infoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
					"infoFiltered" : "(從 _MAX_ 項結果中過濾)",
					"infoPostFix" : "",
					"search" : "搜尋:",
					"paginate" : {
						"first" : "第一頁",
						"previous" : "上一頁",
						"next" : "下一頁",
						"last" : "最後一頁"
					},
					"aria" : {
						"sortAscending" : ": 升冪排列",
						"sortDescending" : ": 降冪排列"
					}
				}
			});
		})
		
		//刪除
		$(document).on('click', '#deleteMbr', function(){  //用一般的.click會有氣泡事件問題
			if(confirm("確認要刪除嗎?")){
				alert("已經刪除！");
			}else{
				alert("已經取消刪除!");
				return;
			}
			var id = $(this).attr("value");
			dtRow = $(this).closest('tr');
			$.ajax({
				type : "post",
				url : "http://localhost:8080/oldFoodMan/backStage/mbrDelete/" + id,
				success : function(result) {
					$("#account7").DataTable().row(dtRow).remove().draw(false);
				},
			});
		})
	</script>

</body>

</html>