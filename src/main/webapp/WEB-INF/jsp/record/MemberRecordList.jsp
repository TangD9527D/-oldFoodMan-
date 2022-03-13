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
<title>會員食記List</title>
</head>
<body>
<div class="container">
<h1>會員食記List</h1>




<table class="table">
  <thead class="thead-dark">
  
    <tr>
      <th style="display: none" scope="col" >照片</th>
      <th style="display: none" scope="col" >城市</th>
      <th style="display: none" scope="col" >標題</th>
      <th style="display: none" scope="col" >修改</th>
      <th style="display: none" scope="col" >刪除</th>

    </tr>
  </thead>
  <tbody>
  	<c:forEach var="mfl" items="${mfl}">
  		<tr>
  			<td><img width="180px" height="150px" src="<c:url value='/getPicture/${mfl.id}'/>"></td>
  			<td><c:out value="${mfl.city}"/></td>
  			<td style="height:10px"><a href="${contextRoot}/viewById?id=${mfl.id}"><c:out value="${mfl.title}"/></a><br>
  				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${mfl.added}" /><br>
  				<c:out value="${mfl.shopType}"/><br>
  				<c:out value="${mfl.content}"/>
  			</td>
			<td><a href="${contextRoot}/editData?id=${mfl.id}">編輯</a></td>
	 	    <td><a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteData2?id=${mfl.id}">刪除</a></td>

  	
  		</tr>
  	</c:forEach>
  
<%--   <c:forEach var="mfl" items="${mfl}">   --%>
<!--     <tr> -->
    
<%-- 	  <td scope="row"><c:out value="${mfl.id}"/> --%>
<%-- 	  <td><c:out value="${mfl.member_id.id}"/> --%>
<%-- 	  <td><c:out value="${mfl.title}"/> --%>
<%--       <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${mfl.added}" /></td> --%>
<%-- 	  <td><c:out value="${mfl.shopName}"/> --%>
<%-- 	  </c:forEach> --%>
  </tbody>
</table>




</div>

</body>
</html>