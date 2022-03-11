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
	<div class="container">
	
	  

		<div class="accordion" id="accordionExample">
		<c:forEach var="forms" items="${forms}">
			<div class="card">
				<div class="card-header" id="heading${forms.orderNumber}">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left" type="button"
							data-toggle="collapse" data-target="#collapse${forms.orderNumber}"
							aria-expanded="true" aria-controls="collapse${forms.orderNumber}" id="Btn_see" value="${forms.orderNumber}">
							<h3>總金額: ${forms.orderTotal}    訂購時間: ${forms.orderTime}</h3></button>
					</h2>
				</div>

				<div id="collapse${forms.orderNumber}" class="collapse"
					aria-labelledby="heading${forms.orderNumber}" data-parent="#accordionExample">
					<div class="card-body">
						${forms.orderNumber}
						
						
					</div>
				</div>
			</div>
		</c:forEach>
			
		</div>

	</div>
	
	<script>
	/*
	$(document).on('click', '#Btn_see', function(){
			var orderNumber = $(this).attr("value");
			$.ajax({
				url:"" + orderNumber,
				type: "post",
				success: function(){
					//寫CONTROLLER和這邊的AJAX新增TABLE到card-body的DIV裡
				}
			})
		})
	*/
	</script>


	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>