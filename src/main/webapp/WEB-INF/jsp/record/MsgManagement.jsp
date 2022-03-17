<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backStage/model.jsp" />

<!DOCTYPE html>
<html>
<style>
.body06 {
	margin-top: 20px;
	margin-right: 10px;
	width: 1110px;
	float: right;
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<title>食記管理</title>

<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="${contextRoot}/js/jquery.dataTables.min.js"></script>

</head>
<body>
<p>
<div class="body06">
	<div class="container">
	<table id="table_id" class="display">
	    <thead>
	        <tr>
	            <th>刪除</th>
	            <th>留言ID</th>
	        	<th>會員ID</th>
	            <th>食記名稱</th>
	            <th>留言</th>
	            <th>時間</th>
	  
	            
	        </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="msg" items="${MSG}">  
	        <tr>
	            <td><a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteMsg?id=${msg.id}">刪除</a></td>
	            <td><c:out value="${msg.id}"/>
	            <td><c:out value="${msg.member_id.id}"/>
	            <td><a href="${contextRoot}/viewById?id=${msg.record_id.id}"><c:out value="${msg.record_id.title}"/></a>
	            <td><c:out value="${msg.text}"/>
	            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${msg.added}" />
	            
	       
	            
	      
	        </tr>
	         </c:forEach>
	    </tbody>
	</table>
	
	</div>
</div>		
		
		<script>
		$(document).ready(function () {
		    $('#table_id').DataTable();
		});
		
		$('#table_id').DataTable({
			
		    "language": {
		        "processing": "處理中...",
		        "loadingRecords": "載入中...",
		        "lengthMenu": "顯示 _MENU_ 項結果",
		        "zeroRecords": "沒有符合的結果",
		        "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
		        "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
		        "infoFiltered": "(從 _MAX_ 項結果中過濾)",
		        "infoPostFix": "",
		        "search": "搜尋:",
		        "paginate": {
		            "first": "第一頁",
		            "previous": "上一頁",
		            "next": "下一頁",
		            "last": "最後一頁"
		        },
		        "aria": {
		            "sortAscending": ": 升冪排列",
		            "sortDescending": ": 降冪排列"
		        }
	
		    }
		});
		$('#example').DataTable( {
			  "autoWidth": true
			} );
		

		
		</script>

</body>
</html>