<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../menu.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>食記總表</title>
</head>
<body>
<div class="container">

<table class="table">
  <thead class="thead-dark">
  
    <tr>
      <th scope="col">#ID</th>
      <th scope="col">食記</th>
      <th scope="col">時間</th>
      <th scope="col">餐廳</th>
      <th scope="col">城市</th>
      <th scope="col">營業時間</th>
      <th scope="col">圖片</th>
      <th scope="col">美味</th>
      <th scope="col">氣氛</th>
      <th scope="col">西批值</th>
       <th scope="col">編輯</th>
      <th scope="col">刪除</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="foodRecord" items="${page.content}">  
    <tr>
    
	  <td scope="row">
	  <td><a href="${contextRoot}/viewById?id=${foodRecord.id}"><c:out value="${foodRecord.title}"/></a>
      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${foodRecord.added}" /></td>
	  <td><c:out value="${foodRecord.shopName}"/>
	  <td><c:out value="${foodRecord.city}"/>
	  <td><c:out value="${foodRecord.businessHours}"/>
	  <td><img width="80" height="70" src="<c:url value='/getPicture/${foodRecord.id}'/>"></td>
	  <td><c:out value="${foodRecord.gender}"/>
	  <td><c:out value="${foodRecord.gender1}"/>
	  <td><c:out value="${foodRecord.gender2}"/>
	  <td><a href="${contextRoot}/editData?id=${foodRecord.id}">編輯</a></td>
	  <td><a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteData?id=${foodRecord.id}">刪除</a></td>
	  </c:forEach>
  </tbody>
</table>

<div class="row justify-content-center">
			<div class="col-9">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<c:choose>
						<c:when test="${pageNumber-1 != page.number}">
							<a href="${contextRoot}/totalRecord?p=${pageNumber}"><c:out value="${pageNumber}" /> </a>
						</c:when>

						<c:otherwise>
							<c:out value="${pageNumber}"></c:out>
						</c:otherwise>
					</c:choose>

					<c:if test="${pageNumber != page.totalPages}">|</c:if>

				</c:forEach>
			</div>
		</div>



</div>

</body>
</html>