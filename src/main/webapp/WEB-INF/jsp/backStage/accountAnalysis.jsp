<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="model.jsp" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>會員數據分析</title>
<c:set var='contextRoot' value='${pageContext.request.contextPath }'/>
<link rel='stylesheet' href='${contextRoot}/css/bootstrap.min.css'/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<style>
.date7{
	position: absolute;
	top: 250px;
	left: 350px;
	height: 300px;
	width: 500px;
}

.city7{
	position: absolute;
	top: 150px;
	right: 100px;
	/* border: 2px solid rgb(0, 119, 255); */
	height: 500px;
	width: 500px;
}
</style>
</head>

<body>
	<div class="date7">
		<canvas id="myChart2" style="width:100%;max-width:600px"></canvas>
	</div>
	<div class="city7">
		<canvas id="myChart" style="width:100%;max-width:500px"></canvas>
	</div>
<script>

	$(document).ready( function () {

		$.ajax({
			url: 'http://localhost:8080/oldFoodMan/backStage/countCity',
			dataType: 'json',
			type:'post',
		}).done(function (results) {
			console.log(results)
			// 將獲取到的json資料分別存放到兩個陣列中
			 labels = [], data = [];
			for (var sensorRecord in results) {
				var image = results[sensorRecord]
				console.log(image);
				var ok = image.split(',')[0];
				console.log(ok);


				labels.push(ok);
				data.push(image.split(',')[1])
				
			}

			var barColors = [
				"#AE0000",
				"#D200D2",
				"#6C6C6C",
				"#F00078",
				"#8600FF",
				"#2828FF",
				"#0072E3",
				"#00CACA",
				"#02DF82",
				"#00DB00",
				"#8CEA00",
				"#C4C400",
				"#D9B300",
				"#FF8000",
				"#F75000",
				"#804040",
				"#804040",
				"#408080",
				"#5A5AAD",
				"#8F4586",
				"#ECECFF",
				"#272727"
			];

		new Chart("myChart", {
			type: "doughnut",
			data: {
				labels: labels,
				datasets: [{
					backgroundColor: barColors,
					data: data
				}]
			},
			options: {
				title: {
					display: true,
					text: "各縣市使用人數"
				}
			}
		});
		})

		$.ajax({
			url: 'http://localhost:8080/oldFoodMan/backStage/countYrMth',
			dataType: 'json',
			type:'post',
		}).done(function (data) {
			console.log(data)
			var xValues = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"];
			var yValues = [];
			var barColors = ["#ADADAD", "#FF2D2D","#FF79BC","#FF77FF","#BE77FF","#9393FF","#80FFFF","#79FF79","#FFDC35","#B87070","#6FB7B7","#9999CC"];
			
			for (var months in data) {
				var mth = data[months]
				var mths = mth.split(',')[1];
				console.log(mths)
				yValues.push(mths)
			}
			

			new Chart("myChart2", {
				type: "bar",
				data: {
					labels: xValues,
					datasets: [{
						backgroundColor: barColors,
						data: yValues
					}]
				},
				options: {
					legend: { display: false },
					title: {
						display: true,
						text: "2022各月創辦人數"
					}
				}
			});
		})

	});

</script>
</body>

</html>