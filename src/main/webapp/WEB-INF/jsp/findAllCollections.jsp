<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="backStage/model.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>收藏食記</title>
<link rel="stylesheet"
	href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">



<link rel="stylesheet" type="text/css"
	href="${contextRoot}/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="${contextRoot}/js/jquery.dataTables.min.js"></script>
<style>

.size{
	margin-top: 10px;
	margin-right: 120px;
	width: 1110px;
	float: right;
	text-align: center;
}


</style>
</head>
<body>

	<div class="size">
		<div class="container">
			<p />

			<h1>所有會員收藏的食記</h1>
			<table id="table_id" class="table table-hover">

				<thead class="thead-dark">
					<tr>
						<th>會員</th>
						<th>食記標題</th>
						<th>地區</th>
						<th>店名</th>
						<th>地址</th>
						<th>類型</th>
						<th>新增時間</th>
						<th>操作</th>
					</tr>
				</thead>

				<tbody>


					<c:forEach var="collections" items="${list}">

						<tr>

							<td class="table-light">${collections.member_id.memberName}</td>
							<td class="table-light">${collections.record_id.title}</td>
							<td class="table-light">${collections.record_id.city}</td>
							<td class="table-light">${collections.record_id.shopName}</td>
							<td class="table-light">${collections.record_id.shopAddress}</td>
							<td class="table-light">${collections.record_id.shopType}</td>

							<td class="table-light"><fmt:formatDate
									pattern="yyyy/MM/dd HH:mm:ss EEEE"
									value="${collections.record_id.added}" /></td>


							<td class="table-light">
								<!-- 							 <a --> <%-- 							href="${contextRoot}/deleteCollections?record_id=${collections.record_id}"><input --%>
								<!-- 								type="submit" value="刪除" class="btn btn-danger" -->
								<!-- 								onclick="return confirm('確定是否刪除？');"></a></td> -->
						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

	</div>

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});

		$('#table_id').DataTable({
			"language" : {
				"processing" : "處理中...",
				"loadingRecords" : "載入中...",
				"lengthMenu" : "顯示 _MENU_ 項結果",
				"zeroRecords" : "沒有符合的結果",
				"info" : "共 _TOTAL_ 項",
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
	</script>




</body>
</html>