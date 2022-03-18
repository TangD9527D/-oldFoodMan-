<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../backStage/model.jsp" />
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
			margin-top: 30px;
			margin-left: 320px;
 			width: 450px; 
 			float: left; 
/*  			font-size:40px; */
/* 			text-align: center; */
		}
	</style>
	
</head>
<body>

	<div class="body88">
		<h3>開團次數最多前三名店家</h3>
		<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
	</div>
	<div class="body88">
	<h3>開團次數最多前三名會員</h3>
	<canvas id="myVisTop3" style="width:100%;max-width:600px"></canvas>
	</div>
	
	<script>

$(document).ready(function drawLineChart() {
	

	
	var jsonData = $.ajax({
        url: 'http://localhost:8080/oldFoodMan/api/viewAllAnalyze',
        dataType: 'json',
      }).done(function (results) {
		console.log(results)
        // 將獲取到的json資料分別存放到兩個陣列中
        var labels = [], data=[];
        for(var sensorRecord in results)
        {
        	var image = results[sensorRecord]
			var ok = image.split(',')[0]
        	console.log("hhh: "+results[sensorRecord])
        	
            labels.push(results[sensorRecord].split(',')[0]);
            data.push(results[sensorRecord].split(',')[1]);
        }

        // 設定圖表的資料
        var tempData = {
          labels : labels,
          datasets : [{
              label: "店名",
                fill: true,
                lineTension: 0.1,
                backgroundColor: [ "#b91d47", "#336699", "#e8c3b9", "orange", "brown" ],
                borderColor: "white",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgba(75,192,192,1)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: data,
                spanGaps: false,
          }]
        };

        // 獲取所選canvas元素的內容
        var ctx = document.getElementById("myChart");
        //設定圖表高度
//         ctx.height=20;                                  
        // 初始化一個新的雷達圖
        var myLineChart = new Chart(ctx, {
            type: 'doughnut', 
            data: tempData,
            options: {
            	 title: {
            	      display: true,
//             	      text: "開團次數最多前三名店家",
            	      
            	    },
                maintainAspectRatio: true,
            }
        });
      });
})






</script>
<script>

$(document).ready(function drawLineChart() {
	

	
	var jsonData = $.ajax({
        url: 'http://localhost:8080/oldFoodMan/api/viewVisMemberAnalyze',
        dataType: 'json',
      }).done(function (results) {
		console.log(results)
        // 將獲取到的json資料分別存放到兩個陣列中
        var labels = [], data=[];
        for(var sensorRecord in results)
        {
        	var image = results[sensorRecord]
			var ok = image.split(',')[0]
        	console.log("hhh: "+ok)
        	
            labels.push(results[sensorRecord].split(',')[0]);
            data.push(results[sensorRecord].split(',')[2]);
        }

        // 設定圖表的資料
        var tempData = {
          labels : labels,
          datasets : [{
              label: "店名",
                fill: true,
                lineTension: 0.1,
                backgroundColor: [ "#00aba9", "#e8c3b9", "#b91d47", "orange", "brown" ],
                borderColor: "white",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgba(75,192,192,1)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: data,
                spanGaps: false,
          }]
        };

        // 獲取所選canvas元素的內容
        var ctx = document.getElementById("myVisTop3");
        //設定圖表高度
//         ctx.height=20;                                  
        // 初始化一個新的雷達圖
        var myLineChart = new Chart(ctx, {
            type: 'doughnut', 
            data: tempData,
            options: {
            	 title: {
            	      display: true,
//             	      text: "開團次數最多前三名會員",
            	      
            	    },
                maintainAspectRatio: true,
            }
        });
      });
})


</script>	
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>