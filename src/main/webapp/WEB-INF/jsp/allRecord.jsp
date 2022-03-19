<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodSearch</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<!-- <link rel="stylesheet" type="text/css" href="./style.css" /> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="shortcut icon" href="/images/favicon.png" />
<!-- 改為老食人小圖 -->

<style>
.allpage {
	width: 70%;
 	height: 100%; 
	margin: 10px auto;
	/* float: left; */
}


/* Optional: Makes the sample page fill the window. */
html {
	height: 100%;
	/* margin: 0;
    padding: 0; */
}

body {
	height: 100%;
	background-color: #fbf3f3;
	padding-bottom: 50px;
}

.footer {
	position: fixed;
	left: 0px;
	bottom: 0px;
	width: 100%;
	height: 50px;
	z-index: 9999;
}


.allrange {
	text-align: justify;
	width: 100%;
	/*   	display: flex;   */
	height: 170%;
	background-image:;
	background-position: center;
}

#range {
	border: 0.5px solid transparent;
	width: 100%;
	text-align: justify;
	justify-content: center;
}

#range1 {
	border: 0.5px solid transparent;
	text-align: justify;
	width: 100%;
	align-items: center;
}

#p1 {
	float: left;
	margin-top: 25px;
	margin-left: 2%;
	background-color: #fbf3f3;
}

#p2 {
	float: left;
	margin-top: 25px;
	margin-left: 2%;
	width: 100%;
	background-color: #fbf3f3;
	overflow: hidden;
	border: 3px solid #E6E6F2;
	box-shadow: 2px 2px 5px #E6E6F2;
}

#box {
	width: 100%;
	padding: 10px;
	height: 150px;
	margin: 10px auto;
}

#p {
	overflow: hidden;
	display: -webkit-box;
	text-overflow: ellipsis;
	-webkit-line-clamp: 2; /*行數*/
	-webkit-box-orient: vertical;
	white-space: normal;
}

#star {
	float: right;
}

#right {
	position: absolute;
	bottom: 3px;
}

#location {
	border: 5px solid #FDE4DE;
	float: right;
	width: 14%;
	margin: 50px auto;
	border-radius: 15px;
}

#location1 {
	float: right;
	width: 100%;
	height: 80%;
	margin: 0.1px auto;
	border-radius: 20PX;
	text-align: justify;
}

#li {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1; /*行數*/
	-webkit-box-orient: vertical;
	white-space: normal;
	text-align: justify;
}

.test1 {
	width: 100%;
	margin: 0px auto;
}

.test2 {
	width: 100%;
	margin: 0px auto;
}

.display {
	display: none;
}

.imgsize {
	width: 13rem;
	height: 14rem;
	display: block;
	margin: 25px auto;
}

.acolor {
	color: black;
	text-decoration: none;
}

.acolor:hover {
	color: orange;
}

.imgsize {
	transform: scale(1);
	transition: all 0.3s ease-in-out;
}

.imgsize:hover {
	transform: scale(1.2, 1.2);
}

.contant {
	padding-bottom: 50px; /*避免文字超出瀏覽器時，內容區塊不會和footer打架*/
}

.spansize {
	font-size: 50px;
}
</style>


</head>
<body>





	<div class="allpage">
		<!--整個頁面的65%-->
		

		<div id="map"></div>


<div>
				<a href="#"
					class="btn btn-outline-secondary">最新文章</a>
			</div>
		<div class="allrange">
			
			<div class="test2">
				<div id="xxx">
					<span id="rangetype" class="btn btn-outline-primary display"></span>

					<div id="range1"></div>

				</div>
			</div>

			<div class="test1">
				<div id="xxx">
					<div id="range" class="">
						<c:forEach var="maps" items="${page.content}">
							<div class="card " style="width: 15rem" id="p2">
								<a
									href="http://localhost:8080/oldFoodMan/viewById?id=${maps.id}"><img
									id="img" src="<c:url value='/getPicture/${maps.id}'/>"
									class="card-img-top imgsize" alt="..."></a>
								<div id="box" class="card-body">
									<a
										href="http://localhost:8080/oldFoodMan/viewById?id=${maps.id} "
										title="${maps.title}" class="acolor"><span id="p"
										class="card-title"
										style="background-color: #FFC2C3; text-align: center">${maps.title}</span></a>
									<h5 id="p" class="card-text">${maps.content}</h5>


									<div id="right">
										<fmt:formatDate pattern="yyyy/MM/dd" value="${maps.added}" />
									</div>

								</div>
							</div>
						</c:forEach>

					</div>

				</div>
			</div>
		</div>
		<!-- 分頁頁碼 -->
		
		<div >
			<div class="pagination">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<c:choose>

						<c:when test="${page.number != pageNumber -1}">

							 <li class="page-item"><a class="page-link" href="${contextRoot}/AllRecord?p=${pageNumber}"><c:out
									value="${pageNumber} "></c:out></a></li>

						</c:when>
						<c:otherwise>
							 <li class="page-item "  aria-current="page"><span class="page-link active1"><c:out value="${pageNumber} " /></span></li>
						</c:otherwise>

					</c:choose>
					<c:if test="${pageNumber != page.totalPages}">
			
			</c:if>
				</c:forEach>

			</div>
</div>

	</div>




</body>
</html>