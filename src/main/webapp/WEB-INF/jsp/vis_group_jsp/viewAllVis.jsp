<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backStage/model.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>揪團eat</title>
<link rel="stylesheet" href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">



<link rel="stylesheet" type="text/css" href="${contextRoot}/css/jquery.dataTables.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
	
<!-- jQuery -->
	<script type="text/javascript" charset="utf8"
	src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
	
	</script>
<!-- DataTables -->
	<script type="text/javascript" charset="utf8"
	src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
	
	
<style>
.bsize{
	margin-top: 10px;
	margin-right: 120px;
	width: 1110px;
	float: right;
	text-align: center;
}


</style>
</head>
<body>
	

	<div class=" bsize">
		
	<div class="container">
		<h4>所有揪團eat</h4>
		<table id="table_id" class="table table-hover " >

        <thead class="thead-dark">
            <tr>
              	
                <th>日期</th>
                <th>時間</th>
                <th>店名</th>
                <th>地址</th>
                <th>需要人數</th>
                <th>新增時間</th>
                <th>操作</th>
            </tr>
        </thead>
        
        <tbody>
        
 		
        <c:forEach var="viewallvis" items="${list}" >
         
            <tr>	
   					
   					
                    <td class="table-light">${viewallvis.vis_date}</td>                   
                    <td class="table-light">${viewallvis.vis_time}</td>
                    <td class="table-light">${viewallvis.vis_res_name}</td>
                    <td class="table-light">${viewallvis.vis_location}</td>
 					<td class="table-light">${viewallvis.vis_num}</td>
 					<td class="table-light"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss EEEE"
								value="${viewallvis.added}" /></td>
                        <td class="table-light">
<%--                         <a href="${contextRoot}/findOneVisdetail?id=${viewallvis.vis_id}"><input --%>
<!-- 								type="submit" value="查看" class="btn btn-info"></a> -->
							
							<a href="${contextRoot}/editFoodViss?id=${viewallvis.vis_id}"><input
								type="submit" value="編輯" class="btn btn-secondary"></a> <a
							href="${contextRoot}/deleteFoodVis?id=${viewallvis.vis_id}"><input
								type="submit" value="刪除" class="btn btn-danger"
								onclick="return confirm('確定是否刪除？');"></a></td>
			
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