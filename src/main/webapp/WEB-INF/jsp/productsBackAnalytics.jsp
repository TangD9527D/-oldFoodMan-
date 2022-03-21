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
			width: 1400px;
			float: right;
			text-align: center;
			
		}
	</style>
	
</head>
<body>
	<div class="body88">
		<div style="width:400px;margin-left:250px;float:left">
			<p>
			<h3>餐券銷售數量總額</h3>
			<canvas id="amount" style="width:100%;max-width:400px"></canvas>
		</div>
		<div style="width:1000px;margin-left:500px">
			<p>
			<h3>當日各銷售額</h3>
			請選擇:<input type="date" id="day" style="text-align:center">
			<p>&nbsp;</p>
			<div id="ajax" style="margin-left:250px">
			<p>&nbsp;</p>
			<canvas id="myChart" style="width:100%;max-width:800px;margin-left:600px"></canvas>
			</div>
		</div>
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
// 							      text: "各餐券銷售數量總額"
							    }
							  }
							});
					}
				})
			}
		})
		$('#day').change(function(){
			var day = $('#day').val();
			let year = day.substr(0,4);
			let month = day.substr(5,2);
			let date = day.substr(8,2);

			
	 		$.ajax({  //當日餐券額統計
				url:'http://localhost:8080/oldFoodMan/findOneDayTime/' + year + "/" + month + "/" + date,
				type:'post',
				success: function(data){
// 					console.log(data);
// 					console.log(data[0])

					$('#myChart').remove();
					$('#ajax').append('<canvas id="myChart" style="width:100%;max-width:600px"></canvas>');
					let proMomey = [];
					let proName = [];
 					$.each(data, function(index, value){
						console.log(value[0]);
						proMomey.push(value[0]);
						proName.push(value[1]);
					})
					new Chart("myChart", {
					  type: "bar",
					  data: {
					    labels: proName,
					    datasets: [{
					      backgroundColor: ["red", "green","blue","orange","brown"],
					      data: proMomey
					    }]
					  },
					  options: {
					    legend: {display: false},
					    title: {
					      display: true,
// 					      text: "當日餐券銷售額"
					    }
					  }
					});
				},
	 			error: function(err){
	 				$('#myChart').remove();
					$('#ajax').append('<canvas id="myChart" style="width:100%;max-width:600px"></canvas>');
					
					new Chart("myChart", {
						  type: "bar",
						  data: {
						    labels: ["無"],
						    datasets: [{
						      backgroundColor: ["red", "green","blue","orange","brown"],
						      
						    }]
						  },
						  options: {
						    legend: {display: false},
						    title: {
						      display: true,
// 						      text: "當日餐券銷售額"
						    }
						  }
						});
	 			}
	 		
			
		})

		})
		
	

	</script>



	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>