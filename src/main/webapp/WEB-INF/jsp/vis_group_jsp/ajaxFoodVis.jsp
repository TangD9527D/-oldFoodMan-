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


<style>
.allpage{
width:85%;
margin:10px auto;

}
.div04_32 {
	width:50%;
	float:right;
}

#table_id{
	width:50%;


}

</style>



<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<script
	src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>


<!-- jQuery v1.9.1 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<!-- Moment.js v2.20.0 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.0/moment.min.js"></script>
<!-- FullCalendar v3.8.1 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.css"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.print.css"
	rel="stylesheet" media="print">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<script>
var tdate=new Date();

	$(document).ready(function fullcalendar(){
		$("#example").fullCalendar(
							{// 參數設定[註1]
											
							header : { // 頂部排版
												
							left : "prev,next today", // 左邊放置上一頁、下一頁和今天
							center : "title", // 中間放置標題
							right : "month,basicWeek,basicDay" // 右邊放置月、周、天
							},
											
							defaultDate : tdate, // 起始日期
							weekends : true, // 顯示星期六跟星期日
							editable : true, // 啟動拖曳調整日期
							events : function(start, end,timezone, callback) {
								$.ajax({
										url : 'http://localhost:8080/oldFoodMan/api/getFoodVis',
										contentType : 'application/json; charset=UTF-8',
										dataType : 'json',
										method : 'get',
										success : function(result) {
										console.log("2:"+ result)

										var events = [];
										$.each(result,function(index,value) {
											var newDate = new Date(Date.parse(value.vis_date))
											var idt = value.vis_id
											console.log("id:"+ idt)
											var date = moment(newDate).format('YYYY-MM-DD')
											var visurl = "http://localhost:8080/oldFoodMan/findOneVis?id="+ value.vis_id

											console.log(visurl)
											events.push({
											title : value.vis_res_name,
											start : date,
											url : visurl
													});

												});

											callback(events);

								}

						});
					}
				});

			}
					
		);
	
// 	//ajax使用分頁show data
// 	$(document)
// 	.ready(function viewdata(){
// 		$.ajax({
// 			url: 'http://localhost:8080/oldFoodMan/api/getFoodVisByPage',
// 			contentType: 'application/json; charset=UTF-8',
// 			dataType: 'json',
// 			method: 'get',
// 			success: function (result) {
// 			console.log("result " + result)
// 				var msg_data = '';
// 				$.each(result, function (index, value) {
// 					msg_data += '<tr>'
// 					msg_data += '<td class="table-light">' + value.vis_date + '</td>'
// 					msg_data += '<td class="table-light">' + value.vis_time + '</td>'
// 					msg_data += '<td class="table-light">' + value.vis_res_name + '</td>'
// 					msg_data += '<td class="table-light">' + value.vis_location + '</td>'
// 					msg_data += '<td class="table-light">' + value.vis_num + '</td>'
// 					msg_data += '<td class="table-light">' + value.vis_condition + '</td>'
// 						msg_data += '<tr>'

// 				})

// 				$('#trid1').append(msg_data)

// 			},
// 			error: function (err) {
// 				console.log(err)
// 				alert('發生錯誤')
// 			}

// 		})
		
		
		
// 	}
// 	);
	
			
// 		新增揪團窗格			
		function insertdata() {
// 			var inputName = document.getElementById('vis_name').value;
			var inputResName = document.getElementById('vis_res_name').value;
			var inputDate = document.getElementById('vis_date').value;
// 			var inputEmail = document.getElementById('vis_email').value;
			var inputTime = document.getElementById('vis_time').value;
			var inputLocation = document.getElementById('vis_location').value;
			var inputNum = document.getElementById('vis_num').value;
			var inputCondition = document.getElementById('vis_condition').value;
			var Member_id=document.getElementById('member_id').value;
			var dtoObject = {
// 				"vis_name" : inputName,
				"vis_res_name" : inputResName,
				"vis_date" : inputDate,
// 				"vis_email" : inputEmail,
				"vis_time" : inputTime,
				"vis_location" : inputLocation,
				"vis_num" : inputNum,
				"vis_condition" : inputCondition,
				"member_id": Member_id
			}
			var dtoJsonString = JSON.stringify(dtoObject);
			
			if(inputDate==""|| inputTime==""|| inputResName==""){
// 				$("#vis_name").addClass("is-invalid")
// 				$("#vis_date").addClass("is-invalid")
// 				$("#vis_time").addClass("is-invalid")
// 				$("#vis_res_name").addClass("is-invalid")
				
				alert("尚有欄位未輸入!!");
				
				return ;
		
			
			}else {
				
			$.ajax({
				url : 'http://localhost:8080/oldFoodMan/api/postFoodVis',
				contentType : 'application/json; charset=UTF-8',
				dataType : 'json',
				method : 'post',
				data : dtoJsonString,
				success : function(data) {
					 location.reload()					
					
				},
				error : function(err) {
					console.log(err)
					alert('發生錯誤')
				}

			})
		}
		
	}

</script>


</head>

<body>
	
	

<div class="allpage">
	
	

		<div id="example" class="div04_32"></div>
	

<!-- 	<div class="container"> -->
		<p />
		
<!-- dialog視窗 -->
<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" id="insertData">新增揪團</button>
		<div >
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
					<div class="card-header text-white bg-dark " id="exampleModalLabel">揪團資訊</div>
						
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
<!-- 							<div class="form-row"> -->
<!-- 			<div class="form-group col-md-6"> -->
<!-- 				<label for="inputEmail4">發起人</label> <input id="vis_name" -->
<!-- 					type="text" class="form-control " required> -->
<!-- 			</div> -->
<!-- 			<div class="form-group col-md-6"> -->
<!-- 				<label for="inputEmail4">Email</label> <input id="vis_email" -->
<!-- 					type="text" class="form-control" required> -->

<!-- 			</div> -->
<!-- 		</div> -->
							<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">日期</label> <input type="date" id="vis_date"
					class="form-control" required>

			</div>
			<div class="form-group col-md-6">
				<label for="inputEmail4">時間</label> <input type="time" id="vis_time"
					class="form-control" required>

			</div>


		</div>
		<div class="form-group">
			<label for="inputAddress2">店名</label> <input type="text"
				id="vis_res_name" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="inputAddress2">地址</label> <input type="text"
				id="vis_location" class="form-control" required>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">人數上限</label> <input type="number"
					id="vis_num" class="form-control" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">備註</label> <input type="text"
					id="vis_condition" class="form-control" >
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">memberid</label> <input type="text"
					id="member_id" class="form-control" required>
			</div>
		</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn btn-info" onclick="confirm('確定送出？'); return insertdata();">確定新增</button>
						
					</div>	
							
							
						</form>
					</div>
					
				</div>
			</div>
		</div>
</div>
<div>
		<h1>最新揪團eat</h1>
		
		<c:forEach var="viewallvis" items="${page.content}">
		<div id="table_id" class="card text-center">
  		<h4 class="card-header">
    		${viewallvis.vis_res_name}
  		</h4>
  		<div class="card-body">
   		<h5 class="card-title">日期：${viewallvis.vis_date} 時間：${viewallvis.vis_time}</h5>
    	<p class="card-text">${viewallvis.vis_location}</p>
    	<a href="${contextRoot}/findOneVis?id=${viewallvis.vis_id}" class="btn btn-primary">加入</a>
  		</div>
  		<div class="card-footer text-muted">
    		2 days ago
  </div>
</div>
</c:forEach>
		
		

<!-- 分頁頁碼 -->
		<div >
			<div class="pagination">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<c:choose>

						<c:when test="${page.number != pageNumber -1}">

							 <li class="page-item"><a class="page-link" href="${contextRoot}/ajaxFoodVis?p=${pageNumber}"><c:out
									value="${pageNumber} "></c:out></a></li>

						</c:when>
						<c:otherwise>
							 <li class="page-item active" aria-current="page"><span class="page-link"><c:out value="${pageNumber} " /></span></li>
						</c:otherwise>

					</c:choose>
					<c:if test="${pageNumber != page.totalPages}">
			
			</c:if>
				</c:forEach>

			</div>
		</div>
</div>
	</div>










<!-- </div> -->
</body>

</html>