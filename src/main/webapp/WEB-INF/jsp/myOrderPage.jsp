<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="menu.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購買紀錄</title>
	<c:set var='contextRoot' value='${pageContext.request.contextPath}'/>
	<link rel='stylesheet' href='${contextRoot}/css/bootstrap.min.css'/>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head> 
<body>

	<c:set var="pagenum" scope="session" value="${pagenum}"/>
	
	<div class="container" >


		<p>
		<div>
		<button class="btn btn-outline-secondary" id="before">上一頁</button>
		<input type="text" value="1" disabled size="1" id="pageNumber" style="text-align:center"/>
		<button class="btn btn-outline-secondary" id="after">下一頁</button>
		總筆數 : <input type="text" value="${counts}" disabled size="1" style="text-align:center;"/>
		總頁數 : <input type="text" value="${pagenum+1}" disabled size="1" style="text-align:center;"/>
	<!-- <input type="text" style="text-align:center;margin-left:433px;height:33px;" id="enter" placeholder="輸入金額或時間" size="20" >
			<button type="button" id="searchOrder" class="btn btn-info">搜尋</button> 
	-->	
		</div>
		<p>
		<p style="margin-left:80px" id="ajaxRemind"></p>
		<div class="accordion" id="accordionExample">
		
			
		</div>

	</div>
	
	<script>
	
	$(document).on('click', '#Btn_see', function(){
			var orderNumber = $(this).attr("value");
			$.ajax({
				url:"http://localhost:8080/oldFoodMan/myorder/" + orderNumber,
				type: "post",
				success: function(data){
					//寫CONTROLLER和這邊的AJAX新增TABLE到card-body的DIV裡
					$('#ajaxTable'+orderNumber).empty();
					var msg_data = "";
					$.each(data, function(index, value){
						msg_data += '<tr><td>' + value.detailProductId.product_name + '</td>'
						msg_data += '<td><img src="' + value.detailProductId.product_image + '" width="100" /></td>'
						msg_data += '<td>' + Number(value.detailProductId.product_discount)*Number(value.detailProductId.product_price) + '</td>'
						msg_data += '<td>' + value.detailProductAmount + '</td>'
						msg_data += '<td><button type="button" class="btn btn-info" value="' + value.detailId + '" id="mailCoupon" />餐券寄送</td></tr>'
					})
					
					$('#ajaxTable'+orderNumber).append(msg_data);
					/*
					<tr>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				    </tr>
					*/
				}
			})
		})
		
		$(document).ready( function () {
			$.ajax({
				url: 'http://localhost:8080/oldFoodMan/myOrderPage/' + 1,
				method:"post",
				success: function(data){
					let msg_data = "";
					$('#accordionExample').empty();
					$.each(data, function(index, value){
						msg_data += '<div class="card">';
						
						msg_data += '<div class="card-header" id="heading' + value.orderNumber + '">';
						msg_data += '<h2 class="mb-0">';
						if(index == 0){
							console.log("哈哈");
							msg_data += '<h3 style="color:red">New!</h3>'
						}
						msg_data += '<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse' + value.orderNumber + '" aria-expanded="true" aria-controls="collapse' + value.orderNumber + '" id="Btn_see" value="' + value.orderNumber + '">';
						msg_data += '<h3>訂單編號:' + value.orderNumber + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;總金額: $' + value.orderTotal + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂購時間: ' + value.orderTime + '</h3></button></h2></div><p>';

						
						msg_data += '<div id="collapse' + value.orderNumber + '" class="collapse" aria-labelledby="heading' + value.orderNumber + '" data-parent="#accordionExample">';
						msg_data += '<div class="card-body"><table class="table table-hover"><thead><tr><th scope="col">商品名稱</th><th scope="col">圖片</th><th scope="col">售價</th><th scope="col">數量</th><th scope="col">操作</th></tr></thead>';
						msg_data += '<tbody id="ajaxTable' + value.orderNumber + '"></tbody></table></div></div></div>';
						

						
					})
					$('#accordionExample').append(msg_data);
				}
			})
		})
		
		
		
		
		$('#before').click(function(){
			let oldpage = $('#pageNumber').val();
			if(oldpage == 1){
				$(this).attr('class','btn btn-outline-danger')
				return;
			}
			$('#after').attr('class','btn btn-outline-secondary')
			$(this).attr('class','btn btn-outline-secondary')
			$('#pageNumber').val(Number(oldpage) - Number(1));
			let newpage = $('#pageNumber').val();
			$.ajax({
				url: 'http://localhost:8080/oldFoodMan/myOrderPage/' + newpage,
				method:"post",
				success: function(data){
					let msg_data = "";
					$('#accordionExample').empty();
					$.each(data, function(index, value){
						msg_data += '<div class="card">';
						msg_data += '<div class="card-header" id="heading' + value.orderNumber + '">';
						msg_data += '<h2 class="mb-0">';
						msg_data += '<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse' + value.orderNumber + '" aria-expanded="true" aria-controls="collapse' + value.orderNumber + '" id="Btn_see" value="' + value.orderNumber + '">';
						msg_data += '<h3>訂單編號:' + value.orderNumber + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;總金額: $' + value.orderTotal + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂購時間: ' + value.orderTime + '</h3></button></h2></div><p>';
						msg_data += '<div id="collapse' + value.orderNumber + '" class="collapse" aria-labelledby="heading' + value.orderNumber + '" data-parent="#accordionExample">';
						msg_data += '<div class="card-body"><table class="table table-hover"><thead><tr><th scope="col">商品名稱</th><th scope="col">圖片</th><th scope="col">售價</th><th scope="col">數量</th><th scope="col">操作</th></tr></thead>';
						msg_data += '<tbody id="ajaxTable' + value.orderNumber + '"></tbody></table></div></div></div>';
						

						
					})
					$('#accordionExample').append(msg_data);
				}
			})
		})
		
		$('#after').click(function(){
			let oldpage = $('#pageNumber').val();
			if(oldpage > ${pagenum}){
				$(this).attr('class','btn btn-outline-danger')
				
				return;
			}
			$('#before').attr('class','btn btn-outline-secondary')
			$(this).attr('class','btn btn-outline-secondary')
			$('#pageNumber').val(Number(oldpage) + Number(1));
			let newpage = $('#pageNumber').val();
			$.ajax({
				url: 'http://localhost:8080/oldFoodMan/myOrderPage/' + newpage,
				method:"post",
				success: function(data){
					let msg_data = "";
					$('#accordionExample').empty();
					$.each(data, function(index, value){
						msg_data += '<div class="card">';
						msg_data += '<div class="card-header" id="heading' + value.orderNumber + '">';
						msg_data += '<h2 class="mb-0">';
						msg_data += '<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse' + value.orderNumber + '" aria-expanded="true" aria-controls="collapse' + value.orderNumber + '" id="Btn_see" value="' + value.orderNumber + '">';
						msg_data += '<h3>訂單編號:' + value.orderNumber + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;總金額: $' + value.orderTotal + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂購時間: ' + value.orderTime + '</h3></button></h2></div><p>';
						msg_data += '<div id="collapse' + value.orderNumber + '" class="collapse" aria-labelledby="heading' + value.orderNumber + '" data-parent="#accordionExample">';
						msg_data += '<div class="card-body"><table class="table table-hover"><thead><tr><th scope="col">商品名稱</th><th scope="col">圖片</th><th scope="col">售價</th><th scope="col">數量</th><th scope="col">操作</th></tr></thead>';
						msg_data += '<tbody id="ajaxTable' + value.orderNumber + '"></tbody></table></div></div></div>';
						

						
					})
					$('#accordionExample').append(msg_data);
				}
			})
		})
		
		$(document).on('click', '#mailCoupon', function(){
			let detailId = $(this).attr('value');
			
			let proName = $(this).parent().prev().prev().prev().prev().text();
			
			$.ajax({
				url: 'http://localhost:8080/oldFoodMan/remailCoupon/' + detailId +"/" + proName,
				type: 'post',
				success: function(data){
					swal("補寄完成!餐券將於3~5分鐘寄至您於本站註冊之會員信箱!", "You clicked the button!", "success");
				}
			})
		})
		
		
		
		/*
		$('#searchOrder').click(function(){
			let inputVal = $('#enter').val();
			$.ajax({
				url: 'http://localhost:8080/oldFoodMan/searchOrder/' + inputVal,
				type: 'post',
				success: function(data){
					let msg_data = "";
					$('#accordionExample').empty();
					
					if(Object.keys(data).length === 0){ //如果data物件為空值則show無此購物紀錄
						msg_data += '<div><img src="<c:url value="' + 'product_img/noImage/NoResult.jpg' + '"/>"/></div>'
						$('#accordionExample').append(msg_data);
						return;
					}      
					
					
					$.each(data, function(index, value){
						msg_data += '<div class="card">';
						msg_data += '<div class="card-header" id="heading' + value.orderNumber + '">';
						msg_data += '<h2 class="mb-0">';
						msg_data += '<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse' + value.orderNumber + '" aria-expanded="true" aria-controls="collapse' + value.orderNumber + '" id="Btn_see" value="' + value.orderNumber + '">';
						msg_data += '<h3>訂單編號:' + value.orderNumber + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;總金額: $' + value.orderTotal + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂購時間: ' + value.orderTime + '</h3></button></h2></div><p>';
						msg_data += '<div id="collapse' + value.orderNumber + '" class="collapse" aria-labelledby="heading' + value.orderNumber + '" data-parent="#accordionExample">';
						msg_data += '<div class="card-body"><table class="table table-hover"><thead><tr><th scope="col">商品名稱</th><th scope="col">圖片</th><th scope="col">售價</th><th scope="col">數量</th></tr></thead>';
						msg_data += '<tbody id="ajaxTable' + value.orderNumber + '"></tbody></table></div></div></div>';
					
					})
					$('#accordionExample').append(msg_data);
				}
			
			})
		})
		*/
		/* 要+這個要在寫上頁下頁那些的更動，先不做
		$('#dda').change(function(){
			let date = $('#dda').val();
			let year = date.substr(0,4);
			let month = date.substr(5,2);
			let day = date.substr(8,2);
			
			$.ajax({
				url: 'http://localhost:8080/oldFoodMan/searchOrderBydate/' + year + '/' + month + '/' + day,
				type: 'post',
				success: function(data){
					let msg_data = "";
					$('#accordionExample').empty();
					
					if(Object.keys(data).length === 0){ //如果data物件為空值則show無此購物紀錄
						msg_data += '<div><img src="<c:url value="' + 'product_img/noImage/NoResult.jpg' + '"/>"/></div>'
						$('#accordionExample').append(msg_data);
						return;
					}      
					
					
					$.each(data, function(index, value){
						msg_data += '<div class="card">';
						msg_data += '<div class="card-header" id="heading' + value.orderNumber + '">';
						msg_data += '<h2 class="mb-0">';
						msg_data += '<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse' + value.orderNumber + '" aria-expanded="true" aria-controls="collapse' + value.orderNumber + '" id="Btn_see" value="' + value.orderNumber + '">';
						msg_data += '<h3>訂單編號:' + value.orderNumber + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;總金額: $' + value.orderTotal + ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂購時間: ' + value.orderTime + '</h3></button></h2></div><p>';
						msg_data += '<div id="collapse' + value.orderNumber + '" class="collapse" aria-labelledby="heading' + value.orderNumber + '" data-parent="#accordionExample">';
						msg_data += '<div class="card-body"><table class="table table-hover"><thead><tr><th scope="col">商品名稱</th><th scope="col">圖片</th><th scope="col">售價</th><th scope="col">數量</th></tr></thead>';
						msg_data += '<tbody id="ajaxTable' + value.orderNumber + '"></tbody></table></div></div></div>';
					
					})
					$('#accordionExample').append(msg_data);
				}
			
			})
		})
		*/
	</script>


	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>