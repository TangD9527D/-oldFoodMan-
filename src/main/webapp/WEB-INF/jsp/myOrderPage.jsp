<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="menu.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購買紀錄</title>
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
							<h3>總金額: $${forms.orderTotal}    訂購時間: ${forms.orderTime}</h3></button>
					</h2>
				</div>
				<p>
				<div id="collapse${forms.orderNumber}" class="collapse"
					aria-labelledby="heading${forms.orderNumber}" data-parent="#accordionExample">
					<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">商品名稱</th>
										<th scope="col">圖片</th>
										<th scope="col">售價</th>
										<th scope="col">數量</th>
									</tr>
								</thead>
								<tbody id="ajaxTable${forms.orderNumber}">
									
								</tbody>
							</table>


						</div>
				</div>
			</div>
		</c:forEach>
			
		</div>

	</div>
	
	<script>
	
	$(document).on('click', '#Btn_see', function(){
			var orderNumber = $(this).attr("value");
			$.ajax({
				url:"http://localhost:8080/oldFoodMan/myorder/" + orderNumber,
				type: "post",
				success: function(data){
					//寫CONTROLLER和這邊的AJAX新增TABLE到card-body的DIV裡
					$('#ajaxTable'+orderNumber).empty();
					var msg_data = "";
					$.each(data, function(index, value){
						
						msg_data += '<tr><td>' + value.detailProductId.product_name + '</td>'
						msg_data += '<td><img src="' + value.detailProductId.product_image + '" width="100" /></td>'
						msg_data += '<td>' + Number(value.detailProductId.product_discount)*Number(value.detailProductId.product_price) + '</td>'
						msg_data += '<td>' + value.detailProductAmount + '</td></tr>'
					})
					
					$('#ajaxTable'+orderNumber).append(msg_data);
					/*
					<tr>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				    </tr>
					*/
				}
			})
		})
	
	</script>


	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>