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
width:80%;

margin:10px auto;

}

#content {
    width:100%;
    overflow:auto;
}

.article {
    width:60%;
    float:left; 
}
.section {
	
    background-color:#ffffff;
    border-radius:5px;
    margin:10px 0;
    padding:20px 26px;
    line-height:2em;
}
.aside {
    width:30%;
    float:right; 
    position:position;
    top:400px
}

.div04_32 {
background-color: white;
	width:100%;
 	float:left; 
 	margin: 50px auto; 
    padding: 30px;
    box-shadow: 5px 5px 5px gray;
	border-radius: 20px;
    border:2px outset gray;
	
}
.div05_32 {
background-color: white;
	width:100%;
	float:left;
	margin-top: 50px ;
	margin-right:100px;
	
    padding: 30px;
    box-shadow: 5px 5px 5px gray;
	border-radius: 20px;
    border:2px outset gray;
	
}

#myadd{
width:90%;
margin:0 auto;


}

#p1{
float:left;
margin:6px 8px;
}
.viewtable{
	width:38%;
	float:right;

}

#myvis{
width:90%;
margin:0 auto;


}

	.btn:hover {
    /* :hover 代表滑鼠移到元素上時的狀態 */ 
    transform: scale(1.05);
  }

  .btn:active {
    /* :active是滑鼠點擊元素的狀態 */
    transform: scale(1);
    box-shadow: inset 0 0 10px 1px rgba(0, 0, 0, .2);
  }


.header1{
color:#deb887;
width:100%;

margin-bottom:5px;
/* border:2px outset gray; */
text-align:center;
}
#table_id{
	
	margin-bottom:15px;
	box-shadow: 2px 2px 10px gray;

}



.fc-unthemed th,
.fc-unthemed td,
.fc-unthemed thead,
.fc-unthemed tbody,
.fc-unthemed .fc-divider,
.fc-unthemed .fc-row,
.fc-unthemed .fc-content, /* for gutter border */
.fc-unthemed .fc-popover,
.fc-unthemed .fc-list-view,
.fc-unthemed .fc-list-heading td {
	border-color: rgb(102, 94, 94);
}

.fc-event{
font-size:20px;
border:2px solid #8F4586;
background:#8F4586;
}
.fc-unthemed td.fc-sat{
/* background :#EBD6D6; */
color:#B87070; 
}
.fc-unthemed td.fc-sun{
/* background :#EBD6D6; */
color:#B87070; 
}
.fc-unthemed td.fc-today {
background: #EBD6D6;
color:#B87070;
}

.testi{
font-size:23px;
color:gray;
float:right;
margin-right:5px;

}

.testi:hover {
font-size:23px;
color:#778899;
font-weight:bolder;
transform: scale(1.05);
}

.testii{
font-size:23px;
color:#8b0000;
float:right;
margin-right:5px;

}

.testii:hover {
/* font-size:23px; */
color:#dc143c;
font-weight:bolder;
transform: scale(1.05);
}

.hover{

}






.tp1{
color:black;
text-decoration:none;
}
.tp1:hover{
font-weight:bolder;
color:#778899;
text-decoration:none;
}

.tp2{
color:black;
text-decoration:none;
}
.tp2:hover{
font-weight:bolder;
color:#778899;
text-decoration:none;
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
<link rel="stylesheet" href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- <script src="sweetalert2.all.min.js"></script> -->





</head>

<body>
<div class="allpage">
	<div id="content">
	<div class="header1"><i style="font-size:50px" class="fa-solid fa-utensils"></i><span style="font-size:40px">揪團Eat</span></div>
	<article class="article">
<!-- 	<button type="button" id="star" onclick="">test</button> -->
	
	<section class="section">
	<div >
<form:form class="form" action="${contextRoot}/ajaxFoodVis"
							modelAttribute="ofmid" method="post" >
<!-- 							<button type="button" id="checksubmittest"></button> -->
							
<!-- 		行事曆 -->
		<div class="div04_32">
		<div id="example" ></div>
		</div>
		
		<div  class="div05_32">
		<h2>${ofmid.memberName} 參加的揪團Eat</h2>
		<div id="myadd">
		
		
		
  


		</div>
		</div>
		<div  class="div05_32">
		<h2>${ofmid.memberName} 發起的揪團Eat</h2>
		<div id="myvis">
		
		
		
  


		</div>
		</div>
		
		</form:form>
	</div>
	</section>
	</article>
		
<!-- dialog視窗 -->

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
	<form:form class="form" action="${contextRoot}/ajaxFoodVis"
							modelAttribute="ofmid" method="post" >
							
			<div class="form-group col-md-6">
			
				<h4>舉辦者： ${ofmid.memberName}</h4> 

			</div>					
							
							
							
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
					id="vis_num" max="50" min="0" class="form-control" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">備註</label> <input type="text"
					id="vis_condition" class="form-control" >
			</div>
			
			<div class="form-group col-md-6">
				<input type="text"
					id="member_id" value="${ofmid.id}" class="form-control" required>
			</div>
			
		</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" id="checksubmit" class="btn btn btn-info" >確定新增</button>
<!-- 						onclick="confirm('確定送出？'); return insertdata();" -->
					</div>	
							
						</form:form>	
						</form>
					</div>
					
				</div>
			</div>
		</div>
</div>
<aside class="aside">
<section class="section">
<!-- <div class="viewtable"> -->

		<button type="button"  class="btn btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" id="insertData">新增揪團</button>
		<p>
		<c:forEach var="viewallvis" items="${page.content}">
		<div id="table_id" class="card text-center">
  		<h4 class="card-header text-white bg-dark">
    		${viewallvis.vis_res_name}
  		</h4>
  		<div class="card-body">
   		<h5 class="card-title"><i class="fa-regular fa-clock">${viewallvis.vis_date}&nbsp;&nbsp; ${viewallvis.vis_time}</i></h5>
   		
    	<p class="card-text"><i class="fa-solid fa-location-dot">${viewallvis.vis_location}</i></p>
    	<a href="${contextRoot}/findOneVis?id=${viewallvis.vis_id}" id="joinvis" class="btn btn-secondary">加入</a>
  		</div>
  		<div class="card-footer text-muted">
    		建立時間：<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss EEEE"
								value="${viewallvis.added}" />
  </div>
</div>
</c:forEach>
<p>

		
		

<!-- 分頁頁碼 -->
		

		<!-- dialog視窗 -->

		<div class="modal fade" id="exampleModal1" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
					<div class="card-header text-white bg-dark " id="exampleModalLabel">加入揪團</div>
						
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						

			<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">加入原因</label> <input type="text" id="add_condition" name="add_condition"
					class="form-control" required>

			</div>
			
		</div>
		
		<div class="form-row">
			
			<div class="form-group col-md-6">
				<input type="text"
					id="member_id" value="${ofmid.id}" class="form-control" required>
					${viewallvis.vis_res_name}
			</div>
			
		</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn btn-info" onclick="confirm('確定加入？');return addjoin()">加入</button>
						
					</div>	
							
							
						
					</div>
					
				</div>
			</div>
		</div>
		

		
		
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
							 <li class="page-item active"  aria-current="page"><span class="page-link"><c:out value="${pageNumber} " /></span></li>
						</c:otherwise>

					</c:choose>
					<c:if test="${pageNumber != page.totalPages}">
			
			</c:if>
				</c:forEach>

			</div>
</div>
		</section>
		</aside>
		</div>

		</div>
		
		
		
		
		
		<!-- 分頁頁碼 -->

<!-- Swal.fire({ -->
<!--   position: 'top-end', -->
<!--   icon: 'success', -->
<!--   title: 'Your work has been saved', -->
<!--   showConfirmButton: false, -->
<!--   timer: 1500 -->
<!-- }) -->



<!-- <script> -->



<!-- </script> -->


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
							monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],				
							//dayNames: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
							dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],

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
											url : visurl,
											backgroundColor:"#deb887",
											borderColor:"#deb887"
													});

												});

											callback(events);

								}

						});
					}
				});

	},
	
		
	
	
	);
	
	$(document).ready(function viewMyJoindata(){
		var id=document.getElementById('member_id').value;
			
		
		$.ajax({
			url: 'http://localhost:8080/oldFoodMan/getMyJoin?member_id='+id ,
			contentType: 'application/json; charset=UTF-8',			
			method: 'get',
			success: function (result) {
			console.log("result " + result)
				
				var msg_data='';
				$.each(result,function(index,value){
					
						msg_data+= '<div id="p1" class="card" style="width: 7cm;">'
//  					msg_data+= '<img src="...'+ value.uploadPicture +'" class="card-img-top" alt="...">'
					
						msg_data+= '<div class="card-body">'		
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/findOneVisdetail?id='+ value.vis_id +'"><h3 id="p" class="card-title tp2" style="background-color: #faf0e6; text-align: center">'+ value.vis_res_name +'</h3></a>'
						msg_data+= '<h5 ip="p" class="card-text " style=" text-align: center">'+ value.vis_date  + '</h5>'
						msg_data+= '<h5 ip="p" class="card-text" style=" text-align: center">'+ value.vis_time +'</h5>'
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/deleteMyJoinVis?member_id='+value.member_id+'&my_food_vis_id='+value.vis_id+'"><i class="fa-regular fa-trash-can testii" id="testii"></i></a>'
						msg_data+= '</div>'
						msg_data+= '</div>'
						})

						$('#myadd').append(msg_data)
				},
				
			error : function(err) {
					console.log(err)
//  					window.onload=function(){
// 						Swal.fire({
// 							  icon: 'error',
// 							  title: '請登入會員',
// 							  footer: '<a href="http://localhost:8080/oldFoodMan/">返回首頁</a>'
// 							})
						
// 					}
					alert('請登入會員')
					location.href=${contextRoot}/
				}
		
		
		
		});

	})
	
	$(document).ready(function viewMyVisdata(){
		var id=document.getElementById('member_id').value;
	
		
		
	$.ajax({
			url: 'http://localhost:8080/oldFoodMan/getMyVis?member_id='+id ,
			contentType: 'application/json; charset=UTF-8',			
			method: 'get',
			success: function (result) {
			console.log("我的團: " + result)
				
				var msg_data='';
				$.each(result,function(index,value){
					
						msg_data+= '<div id="p1" class="card" style="width: 7cm;">'
					
						msg_data+= '<div class="card-body">'		
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/findOneVisdetail?id='+ value.vis_id +'"><h3 id="p" class="card-title tp1" style="background-color: #faebd7; text-align: center";>'+ value.vis_res_name +'</h3></a>'
						msg_data+= '<h5 ip="p" class="card-text" style=" text-align: center">'+ value.vis_date  +'</h5>'
						msg_data+= '<h5 ip="p" class="card-text" style=" text-align: center">'+ value.vis_time +'</h5>'
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/deleteMyFoodVis?id='+ value.vis_id +'"><i class="fa-regular fa-trash-can testii" id="testii"></i></a>'
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/editFoodVis?id='+ value.vis_id +'"><i class="fa-solid fa-pen-to-square testi"  ></i></a>'

						msg_data+= '</div>'
						msg_data+= '</div>'
						})

						$('#myvis').append(msg_data)
				},
				
			error : function(err) {
					console.log(err)
// 					window.onload=function(){
// 						Swal.fire({
// 							  icon: 'error',
// 							  title: '請登入會員',
// 							  footer: '<a href="http://localhost:8080/oldFoodMan/">返回首頁</a>'
// 							})
						
// 					}
// 					alert('請登入會員')
// 					location.href=${contextRoot}/
				}
		});
	
	})
	
	
	
	
			
// 		新增揪團窗格			
		function insertdata() {

			var inputResName = document.getElementById('vis_res_name').value;
			var inputDate = document.getElementById('vis_date').value;

			var inputTime = document.getElementById('vis_time').value;
			var inputLocation = document.getElementById('vis_location').value;
			var inputNum = document.getElementById('vis_num').value;
			var inputCondition = document.getElementById('vis_condition').value;
			var Member_id=document.getElementById('member_id').value;
			var dtoObject = {
				"vis_res_name" : inputResName,
				"vis_date" : inputDate,
				"vis_time" : inputTime,
				"vis_location" : inputLocation,
				"vis_num" : inputNum,
				"vis_condition" : inputCondition,
				"member_id": Member_id
			}
			var dtoJsonString = JSON.stringify(dtoObject);
			
			if(inputDate==""|| inputTime==""|| inputResName==""){

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
					
					location.reload();		
					
				},
				error : function(err) {
					console.log(err)
					alert('發生錯誤')
				}

			})
		}
		
	}

	
	
	
	
	
	document.getElementById("checksubmit").addEventListener("click",function(){
		var inputResName = document.getElementById('vis_res_name').value;
		var inputDate = document.getElementById('vis_date').value;
		var inputTime = document.getElementById('vis_time').value;
		var inputLocation = document.getElementById('vis_location').value;
		var inputNum = document.getElementById('vis_num').value;
		var Member_id=document.getElementById('member_id').value;
		
		if(inputDate==""|| inputTime==""|| inputResName==""){
			console.log(inputDate)
			Swal.fire(
					  '請輸入完整資料',
					  ' ',
					  'error'
					)
	
		}else if(inputDate!=""|| inputTime!=""|| inputResName!=""){
			
			Swal.fire(
				  '新增成功',
				  '返回頁面',
				  'success'
				).then((value) => {
					insertdata();
				})
				
			}
		});
	
// 	document.getElementById("testii").addEventListener("click",function(){
		
// 		Swal.fire(
// 				  '新增成功',
// 				  '返回頁面',
// 				  'success'
// 				)
		
		
// 	});
	
</script>


</body>

</html>