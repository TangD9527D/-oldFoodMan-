<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="model.jsp" />
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>

.body77 {
	margin-top: 15px;
	width: 1250px;
	float: right;
	text-align: center;
	margin-bottom: 5px;
}

</style>
</head>

<body>
	<div class="body77">
		<div class="container">
			<table id="account7" class="table table-striped table-bordered" style="width: 100%">
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
						<td><button type="button" class="btn btn-danger" id="deleteMbr" value="${member.id}">刪除</button>
						</td>
					</tr>
	
				</c:forEach>
			</table>
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
			Swal.fire({
				title: '確定要刪除?',
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '確認刪除!!',
				cancelButtonText: '取消'
			}).then((result) => {
				if (result.isConfirmed) {
					Swal.fire(
						'刪除成功!',
						'success'
					)

					var id = $(this).attr("value");
					dtRow = $(this).closest('tr');
					$.ajax({
						type: "post",
						url: "http://localhost:8080/oldFoodMan/backStage/mbrDelete/" + id,
						success: function (result) {
							$("#account7").DataTable().row(dtRow).remove().draw(false);
						},
					});

				}
			})

		
		})
	</script>

</body>

</html>