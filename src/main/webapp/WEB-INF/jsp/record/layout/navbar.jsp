<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css"  rel="stylesheet"/>
<meta charset="UTF-8">
<title>食記</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}


</style>
</head>
<body>
<div class="container">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
			table-layout="fixed">
 <a class="navbar-brand" href="${contextRoot}/">OldFoodMan</a>
<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/createData">新增食記</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/totalRecord">食記總表</a>
      </li>

   
    </ul>
  </div>
</nav>
  </div>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>