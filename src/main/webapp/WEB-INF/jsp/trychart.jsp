<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Chart.js</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>

.chart{

width:80;

}



</style>
</head>
<body>

	<div>
		<canvas calss="chart" id="myChart"></canvas>
	</div>


	


	<script>
		const labels = [ 'January', 'February', 'March', 'April', 'May',
				'June', ];

		const data = {
			labels : labels,
			datasets : [ {
				label : 'My First dataset',
				backgroundColor : 'rgb(255, 99, 132)',
				borderColor : 'rgb(255, 99, 132)',
				data : [ 0, 10, 5, 2, 20, 30, 45 ],
			} ]
		};

		const config = {
			type : 'line',
			data : data,
			options : {}
		};
	</script>


<script>
		const myChart = new Chart(document.getElementById('myChart'), config);
	</script>

</body>
</html>