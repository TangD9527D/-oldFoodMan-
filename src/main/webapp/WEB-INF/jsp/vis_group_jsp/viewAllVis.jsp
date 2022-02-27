<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>揪團eat</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#table_id').DataTable({
			"bPaginate": false, // 顯示換頁
	  		"searching": false, // 顯示搜尋
	  		"info":	false, // 顯示資訊
	  		"fixedHeader": true, // 標題置頂	
				
			});
			
		});
	</script>

	<div class="container">
		<p />

		<h1>所有揪團eat</h1>
		<table id="table_id" class="table table-hover" >
        <thead class="thead-dark">
            <tr>
<!--                 <th>發起人</th> -->
<!--                 <th>E-mail</th> -->
                <th>日期</th>
                <th>時間</th>
                <th>店名</th>
                <th>地址</th>
                <th>人數</th>
                <th>備註</th>
                <th>操作</th>
            </tr>
        </thead>
        <c:forEach var="viewallvis" items="${page.content}">
        <tbody>
            <tr>
<%--                 <td class="table-light">${viewallvis.vis_name}</td> --%>
<%--                     <td class="table-light">${viewallvis.vis_email}</td> --%>
                    <td class="table-light">${viewallvis.vis_date}</td>
                    <td class="table-light">${viewallvis.vis_time}</td>
                    <td class="table-light">${viewallvis.vis_res_name}</td>
                    <td class="table-light">${viewallvis.vis_location}</td>
                    <td class="table-light">${viewallvis.vis_num}</td>
                    <td class="table-light">${viewallvis.vis_condition}</td>
                        <td class="table-light"><a
							href="${contextRoot}/editFoodVis?id=${viewallvis.vis_id}"><input
								type="submit" value="編輯" class="btn btn-secondary"></a> <a
							href="${contextRoot}/deleteFoodVis?id=${viewallvis.vis_id}"><input
								type="submit" value="刪除" class="btn btn-danger"
								onclick="return confirm('確定是否刪除？');"></a></td>
                            
            
            </tr>
        </tbody>
    </c:forEach>
    </table>

		<div class="row justify-content-center">
			<div class="col-9">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<c:choose>
						<c:when test="${page.number != pageNumber -1}">

							<a href="${contextRoot}/viewAllVis?p=${pageNumber}"><c:out
									value="${pageNumber} "></c:out></a>

						</c:when>
						<c:otherwise>
							<c:out value="${pageNumber} " />
						</c:otherwise>

					</c:choose>
					<c:if test="${pageNumber != page.totalPages}">
			|
			</c:if>
				</c:forEach>

			</div>
		</div>

	</div>

</body>
</html>