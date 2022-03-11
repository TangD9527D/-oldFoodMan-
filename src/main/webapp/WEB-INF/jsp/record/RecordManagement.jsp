<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>食記管理</title>

<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="${contextRoot}/js/jquery.dataTables.min.js"></script>

</head>
<body>
<p>
<div class="container">

<table id="table_id" class="display">
    <thead>
        <tr>
            <th>刪除</th>
        	<th>會員ID</th>
            <th>食記ID</th>
            <th>標題</th>
            <th>時間</th>
            <th>餐廳</th>
            <th>城市</th>
            <th>類型</th>
            <th>圖片</th>
            <th>美味</th>
            <th>氣氛</th>
            <th>西批值</th>
            
        </tr>
    </thead>
    <tbody>
    <c:forEach var="foodRecord" items="${page.content}">  
        <tr>
            <td><a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteData?id=${foodRecord.id}">刪除</a></td>
            <td><c:out value="${foodRecord.member_id.id}"/>
            <td><c:out value="${foodRecord.id}"/>
            <td><c:out value="${foodRecord.title}"/>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${foodRecord.added}" />
            <td><c:out value="${foodRecord.shopName}"/>
            <td><c:out value="${foodRecord.city}"/>
            <td><c:out value="${foodRecord.shopType}"/>
            <td><img width="80" height="70" src="<c:url value='/getPicture/${foodRecord.id}'/>">
            <td><c:out value="${foodRecord.gender}"/>
            <td><c:out value="${foodRecord.gender1}"/>
            <td><c:out value="${foodRecord.gender2}"/>
            
      
        </tr>
         </c:forEach>
    </tbody>
</table>

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
		        "info": "共 _TOTAL_ 項",
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
		
		
		</script>

</body>
</html>