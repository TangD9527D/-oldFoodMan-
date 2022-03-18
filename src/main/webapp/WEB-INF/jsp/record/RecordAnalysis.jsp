<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backStage/model.jsp" />
<!DOCTYPE html>

<html>
<style>
.body062 {
	margin-top: 20px;
	margin-right: 10px;
	width: 1250px;
	float: right;
	text-align: center;
/*  	border:3px solid black;  */
 	magin-left:500px;
 	
}


.type{
align-items: center;
height:600px;
margin-left:350px;
width: 600px;
/* border:3px solid blue; */

}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<body>

	<div class="body062">
			<h1>最熱門的類型</h1>	
				
		<div class="type">
			<canvas id="myChart" style="width:100%;max-width:550px"></canvas>
		</div>
	</div>

<script>
$(document).ready(function(){

		
		var jsonData = $.ajax({
        url: 'http://localhost:8080/oldFoodMan/RecordAnalysis',
        dataType: 'json',
      }).done(function (results) {
		console.log(results)
        // 將獲取到的json資料分別存放到兩個陣列中
        var labels = [], data=[];
        for(var sensorRecord in results)
        {
//         	var image = results[sensorRecord]
// 			var ok = image.split(',')[0]
        	console.log("hhh: "+results[sensorRecord])
        	
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
                backgroundColor: [ "#FF6384", "#FF9F40", "#FFCD56", "#4BC0C0", "#36A2EB", "#9966FF", "#C9CBCF" ],
                borderColor: "rgba(0,0,0,0)",
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
})
})








				
</script>

</body>
</html>
