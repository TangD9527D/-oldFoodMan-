<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <jsp:include page="../backStage/model.jsp" /> --%>
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

$(document).ready(function drawLineChart() {
	
	Date.prototype.formatMMDDYYYY = function() {
        return (this.getMonth() + 1) +
        "/" +  this.getDate() +
        "/" +  this.getFullYear();
    }
	
	
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
        	console.log("hhh: "+ok)
        	
            labels.push(results[sensorRecord].split(',')[0]);
            data.push(results[sensorRecord].split(',').pop());
        }

        // 設定圖表的資料
        var tempData = {
          labels : labels,
          datasets : [{
              label: "店名",
                fill: true,
                lineTension: 0.1,
                backgroundColor: [ "#B87070", "	#0066FF", "#FF8888", "orange", "brown" ],
                borderColor: "rgba(75,192,192,1)",
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
            type: 'pie', 
            data: tempData,
            options: {
                maintainAspectRatio: true,
            }
        });
      });
})






</script>
			
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>