<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>OldFoodMan</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="${contextRoot}/">OldFoodMan老食人</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
<!--       <li class="nav-item active"> -->
<%--         <a class="nav-link" href="${contextRoot}/">Home <span class="sr-only">(current)</span></a> --%>
<!--       </li> -->
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/about">關於我們</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/ajaxFoodVis">揪團eat行事曆</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/addFoodVis">新增揪團</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/viewAllVis">查詢揪團</a>
      </li>
    </ul>
  </div>
</nav>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>