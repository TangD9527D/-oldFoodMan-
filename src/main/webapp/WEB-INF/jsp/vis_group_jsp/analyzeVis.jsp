<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>揪團eat</title>
<link rel="stylesheet" href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">



<link rel="stylesheet" type="text/css" href="${contextRoot}/css/jquery.dataTables.min.css">

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" charset="utf8" src="${contextRoot}/js/jquery.dataTables.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<div class="container">
		<p />
		<div>
		<canvas id="myChart" width="100%" height="100%"></canvas>
		</div>

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

        // 將獲取到的json資料分別存放到兩個陣列中
        var labels = [], data=[];
        for(var sensorRecord in results)
        {
            labels.push(new Date(results[sensorRecord].vis_date).formatMMDDYYYY());
            data.push(results[sensorRecord].member_id);
        }

        // 設定圖表的資料
        var tempData = {
          labels : labels,
          datasets : [{
              label: "店名",
                fill: true,
                lineTension: 0.1,
                backgroundColor: "rgba(75,192,192,0.4)",
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
        ctx.height=9;                                  
        // 初始化一個新的雷達圖
        var myLineChart = new Chart(ctx, {
            type: 'line', 
            data: tempData,
            options: {
                maintainAspectRatio: true,
            }
        });
      });
})






</script>
			

</body>
</html>