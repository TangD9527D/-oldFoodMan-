<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

<style>







</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<div>
		<canvas class="chart" id="myChart" style="width: 10%; height: 50%;"></canvas>
	</div>


	

	<script>
	$(document).ready(
		function drawLineChart() {

			
			//使用Ajax獲取json資料
			var jsonData = $
					.ajax(
							{
								url : 'http://localhost:8080/oldFoodMan/chartsAllCollections',
								dataType : 'json',
							})
					.done(
							function(results) {
								console.log(results)
								// 將獲取到的json資料分別存放到兩個陣列中
								var labels = [], data = [];
								for ( var Collections in results) {
									
									console.log(results[Collections].split(',')[0])
									console.log(results[Collections].split(',')[1])
									console.log(results[Collections].split(',')[2])
									
									labels.push((results[Collections].split(',')[0]));
									data.push((results[Collections].split(',')[2]));
									
									
								}
							console.log(data)
								// 設定圖表的資料
								var tempData = {
									labels : labels,
									datasets : [ {
										label : "區域",
										fill : true,
										lineTension : 1,
										backgroundColor : ["rgba(75,192,192,0.4)","red","pink","yellow","blue"],
										borderColor : "rgba(75,192,192,1)",
										borderCapStyle : 'butt',
										borderDash : [],
										borderDashOffset : 0.0,
										borderJoinStyle : 'miter',
										pointBorderColor : "rgba(75,192,192,1)",
										pointBackgroundColor : "#fff",
										pointBorderWidth : 1,
										pointHoverRadius : 5,
										pointHoverBackgroundColor : "rgba(75,192,192,1)",
										pointHoverBorderColor : "rgba(220,220,220,1)",
										pointHoverBorderWidth : 2,
										pointRadius : 1,
										pointHitRadius : 10,
										data : data,
										spanGaps : false,
									} ]
								};

								// 獲取所選canvas元素的內容
								var ctx = document.getElementById("myChart");
								//設定圖表高度
								ctx.height = 50;
								// 初始化一個新的雷達圖
								var myLineChart = new Chart(ctx, {
									type : 'bar',
									data : tempData,
									options : {
										maintainAspectRatio : true,
										beginAtZero:true,
									}
								});
							});
		})
	</script>









</body>
</html>