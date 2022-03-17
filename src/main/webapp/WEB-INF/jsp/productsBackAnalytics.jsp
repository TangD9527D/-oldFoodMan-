<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="backStage/model.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商城後台</title>
	<c:set var='contextRoot' value='${pageContext.request.contextPath }'/>
	<link rel='stylesheet' href='${contextRoot}/css/bootstrap.min.css'/>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<style>
		.body88 {
			margin-top: 20px;
			margin-right: 10px;
			width: 1110px;
			float: right;
			text-align: center;
		}
	</style>
	
</head>
<body>
	<div class="body88">
		<canvas id="amount" style="width:100%;max-width:400px"></canvas>
		<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
	</div>

	<script>
		$.ajax({  //餐券數量統計
			url:'http://localhost:8080/oldFoodMan/productAnalytics',
			type:'post',
			success:function(data){
				let proName = [];
				$.each(data, function(index, value){
					proName.push(value.product_name);
				})
				
				
				$.ajax({
					url:'http://localhost:8080/oldFoodMan/findProductAmount',
					type:'post',
					success: function(datas){
						console.log(datas);
						new Chart("amount", {
							  type: "pie",
							  data: {
							    labels: proName,
							    datasets: [{
							      backgroundColor: [ "red", "green", "blue", "orange", "brown" ],
							      data: datas
							    }]
							  },
							  options: {
							    title: {
							      display: true,
							      text: "各餐券銷售數量"
							    }
							  }
							});
					}
				})
			}
		})
		
		
		
		
	

	</script>



	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>