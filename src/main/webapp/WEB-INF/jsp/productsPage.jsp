<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="menu.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>餐券商城</title>
	<c:set var='contextRoot' value='${pageContext.request.contextPath}'/>
	<link rel='stylesheet' href='${contextRoot}/css/bootstrap.min.css'/>
</head> 
<body>
	<p>
	<div class="container">
		<div class="row row-cols-1 row-cols-md-3">
			<c:forEach var="allProducts" items="${allProducts}">
			<div class="col mb-4">
				<div class="card h-100">
					<img src="${allProducts.product_image}"  class="card-img-top" alt="...">
					<div class="card-body">
						<h1 class="card-title">${allProducts.product_name}</h1>
						<p class="card-text">
						<h3>售價:$${allProducts.product_newPrice}</h3><br>
						<h4 style="text-decoration:line-through">原價:$${allProducts.product_price}</h4>
						限時優惠!!${allProducts.product_remark}!!<br>
						</p>
						
						<input type="button" value='加入購物車'/>
						
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>




	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>