<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../menu.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="/js/jquery-3.6.0.min.js"></script>
<style>
#container{
	display:flex;
	flex-wrap:wrap;
	justify-content: space-evenly;
}

</style>
</head>
<img src="${contextRoot}/imgLemon/header561_72.jpg" class="img-fluid" alt="...">
<div id="container">
	<c:forEach var='member' items='${members}'>

		<div class="card" style="width: 300px; border: 0; margin: 5px;">
			<img src="<c:url value='/getPictureLemon/${member.id}' />"
				class="card-img-top" style="height: 300px;" alt="...">
			<div class="card-body">
				<h5 class="card-title"><c:out value="${member.reviewersetting.reviewer_title}" /></h5>
				<p class="card-text">
					<c:out value="${member.reviewersetting.reviewer_subtitle}" />
				</p>
				<a href="getreviewer/${member.id}" class="btn btn-primary">Read More</a>
			</div>
		</div>

	</c:forEach>
</div>

<body>

</body>
</html>