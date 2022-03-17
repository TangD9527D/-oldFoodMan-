<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backStage/model.jsp" />
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<body>

<button class="typeBtn">最熱門的類型</button>
		
<!-- 				<div id="showMsg" class="card"> -->
<%-- 					<c:forEach var="type" items="${type}"> --%>
<!-- 						<div class="card-header"> -->
<%-- 						<c:out value="${type.shopType}" /><br> --%>
<%-- 						<c:out value="${type.COUNT(*)}" /> --%>
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
<!-- 				</div> -->



<%-- <canvas id="myChart" style="width:100%;max-width:600px"></canvas> --%>

<script>
$(document).on('click','.typeBtn',function(){
	
	$.ajax({
		url : 'http://localhost:8080/oldFoodMan/RecordAnalysis',
		contentType : 'application/json; charset=UTF-8', // 送過去的格式
		dataType : 'json', // 傳回來的
		
	}).done(function(result){
// 		var data = '';
		
// 			var data = '';
			for(var sensorRecord in results)
				{
				console.log("result[sensorRecord]")
				}
		})
		
		
	
})
//最熱門的類型






// 				var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
// 				var yValues = [55, 49, 44, 24, 15];
// 				var barColors = ["red", "green","blue","orange","brown"];
				
// 				new Chart("myChart", {
// 				  type: "bar",
// 				  data: {
// 				    labels: xValues,
// 				    datasets: [{
// 				      backgroundColor: barColors,
// 				      data: yValues
// 				    }]
// 				  },
// 				  options: {
// 				    legend: {display: false},
// 				    title: {
// 				      display: true,
// 				      text: "最熱門的類型"
// 				    }
// 				  }
// 				});
				
</script>

</body>
</html>
