<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../menu.jsp" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>揪團美食Eat</title>


<style>
.allpage{
	width:75%;

	margin:10px auto;

}

.active1{
	color:black;

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
    width:40%;
    float:right; 
    position:position;
    top:400px
}

.div04_32 {
	background-color: white;
	width:85%;
	
 	float:left; 
 	margin: 15px auto; 
    padding: 30px;
    box-shadow: 5px 5px 5px gray;
	border-radius: 20px;
    border:2px outset #FDE4DE;
	
}
.div05_32 {
	background-color: white;
	width:85%;
	float:left;
	margin-top: 10px ;
	
	margin-right:100px;
	
    padding: 30px;
    box-shadow: 5px 5px 5px gray;
	border-radius: 20px;
    border:2px outset #F5EDE4;
	background-color:white;
}

.div06_32 {
	background-color: white;
	width:85%;
	float:left;
	margin-top: 30px ;
	margin-bottom:30px;
	
	margin-right:100px;
	
    padding: 30px;
    box-shadow: 5px 5px 5px gray;
	border-radius: 20px;
    border:2px outset #F5EDE4;
	background-color:white;
}

.div05-2{
	height:40px;
	background-color:#FDE4DE;
	/* border-radius: 10px;  */
	text-align:center;
	margin-bottom:10px;
}


#myadd{
	width:90%;
	margin:0 auto;


}

#p{

	overflow:hidden;
	white-space: nowrap;
	text-overflow: ellipsis;


}

#pp{

	overflow:hidden;
	white-space: nowrap;
	text-overflow: ellipsis;


}

#p1{
	float:left;
	margin:2px 2px;


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
color:#B87070; 
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

.btnadd{
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#febbbb+0,fe9090+46,ff6868+100 */
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ffffff+0,f1f1f1+50,e1e1e1+51,f6f6f6+100;White+Gloss+%231 */
background: #ffffff; /* Old browsers */
background: -moz-linear-gradient(top,  #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0 ); /* IE6-9 */


font-weight:bolder;

}

.btnadd:hover{
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ffeded+32,edcece+51,edcece+61,edcece+73,fde4de+100 */
background: #ffeded; /* Old browsers */
background: -moz-linear-gradient(-45deg,  #ffeded 32%, #edcece 51%, #edcece 61%, #edcece 73%, #fde4de 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(-45deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(135deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffeded', endColorstr='#fde4de',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */



}

.btncen{
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#f2f6f8+0,d8e1e7+50,b5c6d0+51,e0eff9+100;Grey+Gloss+%232 */
background: #f2f6f8; /* Old browsers */
background: -moz-linear-gradient(top,  #f2f6f8 0%, #d8e1e7 50%, #b5c6d0 51%, #e0eff9 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #f2f6f8 0%,#d8e1e7 50%,#b5c6d0 51%,#e0eff9 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #f2f6f8 0%,#d8e1e7 50%,#b5c6d0 51%,#e0eff9 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f6f8', endColorstr='#e0eff9',GradientType=0 ); /* IE6-9 */

}

.btncen:hover{
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#e0eff9+0,b5c6d0+51,f2f6f8+99 */
background: #e0eff9; /* Old browsers */
background: -moz-linear-gradient(top,  #e0eff9 0%, #b5c6d0 51%, #f2f6f8 99%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #e0eff9 0%,#b5c6d0 51%,#f2f6f8 99%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #e0eff9 0%,#b5c6d0 51%,#f2f6f8 99%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e0eff9', endColorstr='#f2f6f8',GradientType=0 ); /* IE6-9 */


}
.pink{

/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ffeded+32,edcece+51,edcece+61,edcece+73,fde4de+100 */
background: #ffeded; /* Old browsers */
background: -moz-linear-gradient(-45deg,  #ffeded 32%, #edcece 51%, #edcece 61%, #edcece 73%, #fde4de 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(-45deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(135deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffeded', endColorstr='#fde4de',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */



}

.addpinkbtn{
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#f2f6f8+0,d8e1e7+50,b5c6d0+51,e0eff9+100;Grey+Gloss+%232 */
background: rgb(242,246,248); /* Old browsers */
background: -moz-linear-gradient(top,  rgba(242,246,248,1) 0%, rgba(216,225,231,1) 50%, rgba(181,198,208,1) 51%, rgba(224,239,249,1) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  rgba(242,246,248,1) 0%,rgba(216,225,231,1) 50%,rgba(181,198,208,1) 51%,rgba(224,239,249,1) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  rgba(242,246,248,1) 0%,rgba(216,225,231,1) 50%,rgba(181,198,208,1) 51%,rgba(224,239,249,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f6f8', endColorstr='#e0eff9',GradientType=0 ); /* IE6-9 */






}

.joinhead{

background: #ffeded; /* Old browsers */
background: -moz-linear-gradient(-45deg,  #ffeded 32%, #edcece 51%, #edcece 61%, #edcece 73%, #fde4de 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(-45deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(135deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffeded', endColorstr='#fde4de',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
}

.joinheadn{
color:black;
font-weight:bolder;
font-size:35px;

}

.tjoinhead{
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#fff4f4+0,e0a3a3+50,dda8a8+51,fcf0ef+100 */
background: rgb(255,244,244); /* Old browsers */
background: -moz-linear-gradient(45deg,  rgba(255,244,244,1) 0%, rgba(224,163,163,1) 50%, rgba(221,168,168,1) 51%, rgba(252,240,239,1) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(45deg,  rgba(255,244,244,1) 0%,rgba(224,163,163,1) 50%,rgba(221,168,168,1) 51%,rgba(252,240,239,1) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(45deg,  rgba(255,244,244,1) 0%,rgba(224,163,163,1) 50%,rgba(221,168,168,1) 51%,rgba(252,240,239,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fff4f4', endColorstr='#fcf0ef',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */





}
.vishead{

background: #ffeded; /* Old browsers */
background: -moz-linear-gradient(-45deg,  #ffeded 32%, #edcece 51%, #edcece 61%, #edcece 73%, #fde4de 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(-45deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(135deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffeded', endColorstr='#fde4de',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
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
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

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
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>




</head>

<body>
<div class="allpage">
	<div id="content">
	<h3 class="header1 fw-bold font-weight-bold" ><i style="font-size:30px" class="fa-solid fa-utensils"></i> &nbsp;<span style="font-size:30px">揪團美食Eat</span></h3>
	<hr>
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
		
		<div  class="div05_32" >
		<div  class="div05-2">
		<h3 class="joinhead" ><span class="joinheadn">${ofmid.memberName}</span> 參加 <i class="fa-solid fa-user-plus " style="color:#eb5b59"></i></h3>
		</div>
		
		<div id="myadd">
		
		
		
  


		</div>
		
		</div>
		<div  class="div06_32">
		 <div class="div05-2" >
    		<h3 class="tjoinhead"><span class="joinheadn">${ofmid.memberName}</span> 發起 <i class="fa-solid fa-calendar-plus" style="color:#a13b3a"></i></h3>
  		</div>
	
	
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
							
			<div class="form-group col-md-9">
			
				<h4><i class="fa-solid fa-user-group"></i>舉辦者：${ofmid.memberName}</h4> 

			</div>					
							
							
							
			<div class="form-row">
						
			<div class="form-group col-md-6">
			
				<label for="inputEmail4">日期</label> <input type="text" id="vis_date"
					 class="form-control" required>

			</div>
			<div class="form-group col-md-6">
				<label for="inputEmail4">時間</label> <input type="time" id="vis_time"
					class="form-control timepicker" required>

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
				<label for="inputEmail4">希望人數</label> <input type="number"
					id="vis_num" max="50" min="0" class="form-control" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">備註</label> <input type="text"
					id="vis_condition" class="form-control" >
			</div>
			
			<div class="form-group col-md-6">
				<input type="hidden"
					id="member_id" value="${ofmid.id}" class="form-control" required>
			</div>
			
		</div>
						<div class="modal-footer">
						<button type="button" class="btn btncen"
							data-dismiss="modal">Close</button>
						<button type="button" id="checksubmit" class="btn btn btnadd " >確定新增</button>
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

		<button type="button"  class="btn btn  btn-lg btnadd" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" id="insertData"><i class="fa-solid fa-circle-plus"></i> 新增揪團</button>
		<p>
		<c:forEach var="viewallvis" items="${page.content}">
		<div id="table_id" class="card text-center">
  		<h4 style="font-weight:bolder" class="card-header text-dark pink">
    		${viewallvis.vis_res_name}
  		</h4>
  		<div class="card-body">
   			<h5 class="card-title"><i class="fa-regular fa-clock">${viewallvis.vis_date}&nbsp;&nbsp; ${viewallvis.vis_time}</i></h5>
   		
    		<p class="card-text"><i class="fa-solid fa-location-dot">${viewallvis.vis_location}</i></p>
<%--     	<a href="${contextRoot}/findOneVis?id=${viewallvis.vis_id}"  style="font-weight:bolder;width:120px;height:40px;border-radius:20px" id="joinvis"   class="btn pink" >加入</a> --%>
  			<input type="button" onclick="location.href='${contextRoot}/findOneVis?id=${viewallvis.vis_id}'"  value="加入" style="font-weight:bolder;width:120px;height:40px;border-radius:20px" id="joinvis" class="btn pink"/>
  		
  		
  		</div>
  		<div class="card-footer text-muted">
    		建立時間：<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss EEEE"
								value="${viewallvis.added}" /> 
								
  		</div>
<%--   <input id="mymid'${viewallvis.member_id}'" class="conf" type=text value="${viewallvis.member_id}"/> --%>
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
					<div class="card-header text-white bg-dark " id="exampleModalLabel">編輯揪團資訊</div>
						
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
										<div class="modal-body">
						<form>
	<form:form class="form" action="${contextRoot}/ajaxFoodVis"
							modelAttribute="ofmid" method="post" >
							
			<div class="form-group col-md-9">
			
				<h4><i class="fa-solid fa-user-group"></i>舉辦者：${ofmid.memberName}</h4> 

			</div>					
							
							
							
			<div class="form-row">
						
			<div class="form-group col-md-6">
			
				<label for="inputEmail4">日期</label> 
				
				<input type="hidden" id="vis_idedit"
					 class="form-control" required>
				<input type="hidden" id="member_idedit"
					 class="form-control" required>
					 
				<input type="text" id="vis_dateedit"
					 class="form-control" required>

			</div>
			<div class="form-group col-md-6">
				<label for="inputEmail4">時間</label> <input type="time" id="vis_timeedit"
					class="form-control timepicker" required>

			</div>


		</div>
		<div class="form-group">
			<label for="inputAddress2">店名</label> <input type="text"
				id="vis_res_nameedit" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="inputAddress2">地址</label> <input type="text"
				id="vis_locationedit" class="form-control" required>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">希望人數</label> <input type="number"
					id="vis_numedit" max="50" min="0" class="form-control" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">備註</label> <input type="text"
					id="vis_conditionedit" class="form-control" >
			</div>
			
			<div class="form-group col-md-6">
				<input type="hidden"
					id="member_id" value="${ofmid.id}" class="form-control" required>
			</div>
			
		</div>
						<div class="modal-footer">
						<button type="button" class="btn btncen"
							data-dismiss="modal">Close</button>
						<button type="button" id="editbutton"  class="btn btn btnadd " >送出</button>
<!-- 						onclick="confirm('確定送出？'); return insertdata();" -->
					</div>	
							
						</form:form>	
						</form>
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
							 <li class="page-item "  aria-current="page"><span class="page-link active1"><c:out value="${pageNumber} " /></span></li>
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
    <footer class="pt-3 mt-4 text-muted border-top">
      <div style="margin:50px;">&copy; 2022</div>
    </footer>
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
							dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],

							defaultDate : tdate, // 起始日期
							weekends : true, // 顯示星期六跟星期日
							editable : true, // 啟動拖曳調整日期
							
							events : function(start, end,timezone, callback) {
								var events = [];
								$.ajax({
										url : 'http://localhost:8080/oldFoodMan/api/getFoodVis',
										contentType : 'application/json; charset=UTF-8',
										dataType : 'json',
										method : 'get',
										success : function(result) {
										console.log("2:"+ result)
										
										
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
											backgroundColor:"#FDE4DE",
											borderColor:"#FDE4DE",
											textColor: 'black'
													});

												});

										callback(events);

								}

						});
								
								var id=document.getElementById('member_id').value;
								$.ajax({
									url: 'http://localhost:8080/oldFoodMan/getMyJoin?member_id='+id ,
									contentType: 'application/json; charset=UTF-8',
									dataType : 'json',
									method : 'get',
									
									success: function (result) {
									console.log("result " + result)
										var events = [];
										
										$.each(result,function(index,value) {
											var newDate = new Date(Date.parse(value.vis_date))
//												var idt = value.vis_id
//												console.log("id:"+ idt)
											var date = moment(newDate).format('YYYY-MM-DD')
//												var visurl = "http://localhost:8080/oldFoodMan/findOneVis?id="+ value.vCis_id

												console.log("嘿嘿")
											events.push({
											title : value.vis_res_name,
											start : date,
//												url : visurl,
											backgroundColor:"#FDE4DE",
											borderColor:"#FDE4DE",
											textColor: 'black'
													});

												});

												
// 										callback(events);
												
										},
										
									error : function(err) {
											console.log(err)
												window.onload=function(){
													Swal.fire({
														  icon: 'error',
														  title: '請登入會員',
														  footer: '<a href="http://localhost:8080/oldFoodMan/">返回首頁</a>'
														})
												
												}
											alert('請登入會員')
											location.href=${contextRoot}/
										}
								
								
								
								});			

								
								
					}
				});

	},
		
	);
	
	$(document).ready(function fullcalendar2(){
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
								var id=document.getElementById('member_id').value;
								$.ajax({
									url: 'http://localhost:8080/oldFoodMan/getMyJoin?member_id='+id ,
									contentType: 'application/json; charset=UTF-8',
									dataType : 'json',
									method : 'get',
									
									success: function (result) {
									console.log("result " + result)
										var events = [];
										
										$.each(result,function(index,value) {
											var newDate = new Date(Date.parse(value.vis_date))
//												var idt = value.vis_id
//												console.log("id:"+ idt)
											var date = moment(newDate).format('YYYY-MM-DD')
//												var visurl = "http://localhost:8080/oldFoodMan/findOneVis?id="+ value.vCis_id

												console.log("嘿嘿")
											events.push({
											title : value.vis_res_name,
											start : date,
//												url : visurl,
											backgroundColor:"#FDE4DE",
											borderColor:"#FDE4DE",
											textColor: 'black'
													});

												});

												
												
												callback(events);
										},
										
									error : function(err) {
											console.log(err)
												window.onload=function(){
													Swal.fire({
														  icon: 'error',
														  title: '請登入會員',
														  footer: '<a href="http://localhost:8080/oldFoodMan/">返回首頁</a>'
														})
												
												}
											alert('請登入會員')
											location.href=${contextRoot}/
										}
								
								
								
								});	

								
								
					}
				});

	});
	
	

	
	
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
					
						msg_data+= '<div id="p1" class="card" style="width: 4.6cm;">'
						msg_data+= '<div class="card-body">'		
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/findOneVisdetail?id='+ value.vis_id +' " ><h3 id="pp" class="card-title tp2" style="background-color: #faf0e6; font-size:21px ;text-align: center">'+ value.vis_res_name +'</h3></a>'
						msg_data+= '<h5 ip="p" class="card-text " style=" text-align: center">'+ value.vis_date  + '</h5>'
						msg_data+= '<h5 ip="p" class="card-text" style=" text-align: center">'+ value.vis_time +'</h5>'
// 						msg_data+= '<p id="isnull">'+value.vis_id+'</p>'
						msg_data+= '<a type="submit" id="deletemyjoin" value='+value.vis_id+' "><i class="fa-regular fa-trash-can testii" ></i></a>'
						msg_data+= '</div>'
						msg_data+= '</div>'
					})

						$('#myadd').append(msg_data)
				},
				
			error : function(err) {
					console.log(err)

					Swal.fire({
							icon: 'error',
							title: '請登入會員',
						    footer: '<a href="http://localhost:8080/oldFoodMan/">返回首頁</a>'
							}).then((result) => {
								location.reload();
							})
					
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
					
						msg_data+= '<div id="p1" class="card" style="width: 4.6cm;">'
					
						msg_data+= '<div class="card-body">'		
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/findOneVisdetail?id='+ value.vis_id +'"><h3 id="p" class="card-title tp1" style="background-color: #faebd7;font-size:21px ; text-align: center"; >'+ value.vis_res_name +'</h3></a>'
						msg_data+= '<h5 id="p" class="card-text" style=" text-align: center">'+ value.vis_date  +'</h5>'
						msg_data+= '<h5 id="p" class="card-text" style=" text-align: center">'+ value.vis_time +'</h5>'
// 						msg_data+= '<p id="isnull">'+value.vis_id+'</p>'
						msg_data+= '<a type="submit" id="deleteMyFoodVis" value='+value.vis_id+' "><i class="fa-regular fa-trash-can testii" ></i></a>'	
						msg_data+= '<a type="button" onclick="editVisView('+value.vis_id+');"  data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo" id="geteditdata"><i class="fa-solid fa-pen-to-square testi"  ></i></a>'
						
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
// 				async:false
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

	function editVisView(id){
// 		var id=document.getElementById('geteditid').value;
// 		console.log("別鬧: "+id);
		$.ajax({
			url : 'http://localhost:8080/oldFoodMan/editFoodVisview?id='+ id ,
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			method : 'get',
			
			success : function(data) {
				
				$('#vis_idedit').val(data.vis_id)
				$('#vis_dateedit').val(data.vis_date);
				$('#vis_timeedit').val(data.vis_time);
				$('#vis_locationedit').val(data.vis_location);
				$('#vis_res_nameedit').val(data.vis_res_name);
				$('#vis_numedit').val(data.vis_num);
				$('#vis_conditionedit').val(data.vis_condition);
				$('#member_idedit').val(data.member_id);
				
						
				
			},
			error : function(err) {
				console.log(err)
				alert('發生錯誤')
			}

		})
		
		
		
		
		
	}
	
	function editsubmit() {

		var updateVisId = document.getElementById('vis_idedit').value;
		var updateResName = document.getElementById('vis_res_nameedit').value;
		var updateDate = document.getElementById('vis_dateedit').value;

		var updateTime = document.getElementById('vis_timeedit').value;
		var updateLocation = document.getElementById('vis_locationedit').value;
		var updateNum = document.getElementById('vis_numedit').value;
		var updateCondition = document.getElementById('vis_conditionedit').value;
		var updateMember_id=document.getElementById('member_idedit').value;
		
		var dtoObject = {

			"vis_res_name" : updateResName,
			"vis_date" : updateDate,
			"vis_time" : updateTime,
			"vis_location" : updateLocation,
			"vis_num" : updateNum,
			"vis_condition" : updateCondition,
			"member_id": updateMember_id
		}
		var dtoJsonString = JSON.stringify(dtoObject);
		
		if(updateDate==""|| updateTime==""|| updateResName==""){

			alert("尚有欄位未輸入!!");
			
			return ;
	
		
		}else {
			
		$.ajax({
			url : 'http://localhost:8080/oldFoodMan/editFoodVis?id=' + updateVisId ,
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			method : 'post',
			async:false,
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
	
	document.getElementById("editbutton").addEventListener("click",function(){
		var updateVisId = document.getElementById('vis_idedit').value;
		var updateResName = document.getElementById('vis_res_nameedit').value;
		var updateDate = document.getElementById('vis_dateedit').value;

		var updateTime = document.getElementById('vis_timeedit').value;
		var updateLocation = document.getElementById('vis_locationedit').value;
		var updateNum = document.getElementById('vis_numedit').value;
		var updateCondition = document.getElementById('vis_conditionedit').value;
		var updateMember_id=document.getElementById('member_idedit').value;
		if(updateDate==""|| updateTime==""|| updateResName==""){
			
			Swal.fire(
					  '請輸入完整資料',
					  ' ',
					  'error'
					)
	
		}else if(updateDate!=""|| updateTime!=""|| updateResName!=""){	
			Swal.fire(
				  '修改成功',
				  '返回頁面',
				  'success'
				).then((value) => {
					editsubmit();
				})
				
		}
		});
	
	
	
	$(document).on('click', '#deletemyjoin', function (){  //用一般的.click會有氣泡事件問題
		var id = $(this).attr("value");

		$.ajax({
			type : "get",
			url : "http://localhost:8080/oldFoodMan/deleteMyJoinVis?my_food_vis_id="+id,
			success : function(data) {
				Swal.fire({
					  title: '確定取消參加此團?',
					  text: "",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '確定取消參加'
					}).then((result) => {
					  if (result.isConfirmed) {
					    Swal.fire({
					    title:'已刪除!',
					    text:'',
					    icon:'success'
					       
					    }).then((result) => {
							location.reload();
						})
					    
					  }else{
						  return ;
					  }
					})
				
			},
		});
	})
	
		$(document).on('click', '#deleteMyFoodVis', function (){  //用一般的.click會有氣泡事件問題
		var id = $(this).attr("value");

		$.ajax({
			type : "get",
			url : "http://localhost:8080/oldFoodMan/deleteMyFoodVis?id="+id,
			success : function(data) {
				Swal.fire({
					  title: '確定刪除此團?',
					  text: "",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '確定取消揪團',
					  closeOnConfirm: true

					}).then((result) => {
					  if (result.isConfirmed) {
					    Swal.fire({
					    title:'已刪除!',
					    text:'',
					    icon:'success'
					       
					    }).then((result) => {
							location.reload();
						})
					    
					  }else{
						  return ;
					  }
					})
				
			},
		});
	})
	

	
	
	
	
</script>

<script>
  $( function() {
    $( "#vis_date" ).datepicker({ 
    	minDate: 0, maxDate: "+30D",
    	dateFormat: 'yy-mm-dd',
    	appendText : "(西元年-月-日)",
    
    
    });
  } );
  
  $( function() {
	    $( "#vis_dateedit" ).datepicker({ 
	    	minDate: 0, maxDate: "+30D",
	    	dateFormat: 'yy-mm-dd',
	    	appendText : "(西元年-月-日)",
	    
	    
	    });
	    
// 	    $(".timepicker").timepicker({
// 	        timeFormat: "h:mm p", // 時間隔式
// 	        interval: 30, //時間間隔
// 	        minTime: "06", //最小時間
// 	        maxTime: "23:55pm", //最大時間
// 	        defaultTime: "06", //預設起始時間
// 	        startTime: "01:00", // 開始時間
// 	        dynamic: true, //是否顯示項目，使第一個項目按時間順序緊接在所選時間之後
// 	        dropdown: true, //是否顯示時間條目的下拉列表
// 	        scrollbar: false //是否顯示捲軸
// 	      });
	  } );
  

  </script>
  
  
 <script>
//  var confCount = 0;
// 	 $('.conf').each(function(){     
// 	    confCount++; 
//  });
	 
//  var id= document.getElementById("mymid'+myid+'").value;
//  var myid=document.getElementById("member_id").value;
  
//  console.log("幾個ID: "+confCount)
//  if(id == myid){
// 	 console.log("ha: "+id)
// 	 $('#joinvis').attr('disabled','disabled')
	 
//  }
 

 </script> 
 
 
</body>

</html>