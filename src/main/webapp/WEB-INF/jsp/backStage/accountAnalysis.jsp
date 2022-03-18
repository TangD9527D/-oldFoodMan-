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
<title>Insert title here</title>
<c:set var='contextRoot' value='${pageContext.request.contextPath }'/>
<link rel='stylesheet' href='${contextRoot}/css/bootstrap.min.css'/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<style>
.city7{
	position: absolute;
	top: 150px;
	left: 350px;
	border: 2px solid red;
	height: 500px;
	width: 500px;
}

.date7{
	position: absolute;
	top: 150px;
	right: 100px;
	border: 2px solid rgb(0, 119, 255);
	height: 500px;
	width: 500px;
}
</style>
</head>

<body>
	<div class="city7">
		<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
	</div>
	<div class="date7">

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
			"#b91d47",
			"#00aba9",
			"#2b5797",
			"#e8c3b9",
			"#1e7145",
			"#2e7145"
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

		

	});

</script>
</body>

</html>