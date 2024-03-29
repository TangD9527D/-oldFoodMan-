<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="menu.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>餐券商城</title>
	<c:set var='contextRoot' value='${pageContext.request.contextPath}'/>
	<link rel='stylesheet' href='${contextRoot}/css/bootstrap.min.css'/>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

</head> 
<body>
	<p>
	
	<div class="container">
		<div style="width:600px;margin:0 auto"> <!-- 廣告輪播 -->
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner">
			
				<div class="carousel-item active">
					<img src="<c:url value='${advertise.product_image}'/>"   data-toggle="modal" data-target="#exampleModal"   id="lookProduct" value="${advertise.product_id}"   width="100px" class="d-block w-100" alt="...">
				</div>
			  <c:forEach var="advertises" items="${advertises}">
				<div class="carousel-item">
					<img src="<c:url value='${advertises.product_image}'/>" data-toggle="modal" data-target="#exampleModal"   id="lookProduct" value="${advertises.product_id}"      width="100px" class="d-block w-100" alt="...">
				</div>
			  </c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-target="#carouselExampleIndicators" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#carouselExampleIndicators" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</button>
		</div>
	</div>
	
	<p>
	<p>

	<div style="border-width:3px;border-top-style:solid;border-color:#FFAC55;padding:5px;">
			<p>
			
	<div style="width:600px;margin:0 auto"> <!-- 搜尋INPUT -->

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">商品搜尋</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" style="text-align:center;" id="enter" placeholder="輸入商品名或種類">
			<button type="button" id="searchProduct">搜尋</button>
		</div>


	</div>  <!-- 商品CARD -->
		<div class="row row-cols-1 row-cols-md-3" id="ajaxCard">
			<c:forEach var="allProducts" items="${allProducts}">
			<c:choose>
				<c:when test="${allProducts.product_stock == 0}">
					
				</c:when>
				<c:otherwise>
					<div class="col mb-4">
					<div class="card h-100">
						<img src="${allProducts.product_image}" class="card-img-top"
							alt="...">
						<div class="card-body">
							<h1 class="card-title">${allProducts.product_name}</h1>
							<p class="card-text">
							<h3>售價:$${allProducts.product_newPrice}</h3>
							<P style="text-decoration: line-through">原價:$${allProducts.product_price}</P>
							尚餘<h5 style="color:red">${allProducts.product_stock}份</h5><BR>
							
							</p>
							<div>
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal" id="lookProduct" value="${allProducts.product_id}">商品詳情</button>
							<button type="button" class="btn btn-primary" onclick="addCart(${allProducts.product_id})" id="addCart">加入購物車</button>
							</div>
						</div>
					</div>
				</div>
				</c:otherwise>
			</c:choose>
				
			</c:forEach>
		</div>
		
		
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">商品資訊</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<p>
					</div>
					<div class="modal-body">
						<div>
							<img src="" width="450px" id="ajaxImg"/>
							<hr>
							<div>
							<p id="pword"> </p>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
	</div>
	
	</div>

	<script>
		function addCart(id){ //商品加入購物車
			$.ajax({                                         
                url:'http://localhost:8080/oldFoodMan/addCart/' + id,
                contentType: 'application/json;charset=UTF-8',
                //dataType: 'json',
                method: 'post',
                success:function(result){
                	 swal("已成功加入購物車!", "You clicked the button!", "success");
                },
                error:function(err){
                	swal("商品已存在購物車!", "You clicked the button!", "error");
                }
            })
		}
		
		$('#enter').keyup(function(event){  //按ENTER即觸發搜尋
			if(event.keyCode === 13){
				
					let inputVal = $('#enter').val();
					if(inputVal==''||inputVal==undefined||inputVal==null){
						$.ajax({
							url: 'http://localhost:8080/oldFoodMan/searchAllProduct',
							type: 'post',
							dataType : "json",
							contentType: 'application/json;charset=UTF-8',
							success : function(data){
								$('#ajaxCard').empty();
								let msg_data = "";
								$.each(data, function(index, value){
									if(value.product_stock <= 0 ){
										console.log('沒了')
									}else{
										msg_data += '<div class="col mb-4"><div class="card h-100">';
										msg_data += '<img src="' + value.product_image + '" class="card-img-top" alt="...">';
										msg_data += '<div class="card-body"><h1 class="card-title">' + value.product_name + '</h1>';
										msg_data += '<p class="card-text"><h3>售價:$' + Number(value.product_price)*Number(value.product_discount) + '</h3>';
										msg_data += '<P style="text-decoration: line-through">原價:$' + value.product_price + '</P>';
										msg_data += '尚餘' + value.product_stock + '份<BR></p>';
										msg_data += '<div>';
										msg_data += '<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal" id="lookProduct" value="' + value.product_id + '">商品詳情</button>';
										msg_data += '<button type="button" class="btn btn-primary" onclick="addCart(' + value.product_id + ')" id="addCart">加入購物車</button>';
										msg_data += '</div></div></div></div>';
									}
									
								
								})
								$('#ajaxCard').append(msg_data);
							},
						})
					}
					
					$.ajax({
						url: 'http://localhost:8080/oldFoodMan/searchProduct/' + inputVal,
						type: 'post',
						dataType : "json",
						contentType: 'application/json;charset=UTF-8',
						success : function(data){
							$('#ajaxCard').empty();
							let msg_data = "";
							
							if(Object.keys(data).length === 0){ //如果data物件為空值則show無此商品照片
								msg_data += '<div><img src="<c:url value="' + 'product_img/noImage/noProductImage3.png' + '"/>"/></div>'
								$('#ajaxCard').append(msg_data);
								return;
							}               	
							
							
							$.each(data, function(index, value){
								if(value.product_stock <= 0 ){
									msg_data += '<div><img src="<c:url value="' + 'product_img/noImage/noProductImage3.png' + '"/>"/></div>'
								}else{
									msg_data += '<div class="col mb-4"><div class="card h-100">';
									msg_data += '<img src="' + value.product_image + '" class="card-img-top" alt="...">';
									msg_data += '<div class="card-body"><h1 class="card-title">' + value.product_name + '</h1>';
									msg_data += '<p class="card-text"><h3>售價:$' + Number(value.product_price)*Number(value.product_discount) + '</h3>';
									msg_data += '<P style="text-decoration: line-through">原價:$' + value.product_price + '</P>';
									msg_data += '尚餘' + value.product_stock + '份<BR></p>';
									msg_data += '<div>';
									msg_data += '<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal" id="lookProduct" value="' + value.product_id + '">商品詳情</button>';
									msg_data += '<button type="button" class="btn btn-primary" onclick="addCart(' + value.product_id + ')" id="addCart">加入購物車</button>';
									msg_data += '</div></div></div></div>';
								}
							
							})
							$('#ajaxCard').append(msg_data);
						},
					})
				
			}
		})
		
		//商品詳情
		$(document).on('click', '#lookProduct', function(){
			let id = $(this).attr('value');
			$.ajax({
				url:'http://localhost:8080/oldFoodMan/updateDiolog/' + id,
				type: 'post',
				dataType: 'json',
				contentType: 'application/json;charset=UTF-8',
				success:function(data){
					
					document.getElementById("pword").innerHTML=(data.product_remark).replaceAll(" ","<br>");
					document.getElementById("ajaxImg").src=data.product_image;
				}
			})
			
			
		})
		
		
		
		$('#searchProduct').click(function(){ //按搜尋按鈕觸發搜尋
			let inputVal = $('#enter').val();
			if(inputVal==''||inputVal==undefined||inputVal==null){
				$.ajax({
					url: 'http://localhost:8080/oldFoodMan/searchAllProduct',
					type: 'post',
					dataType : "json",
					contentType: 'application/json;charset=UTF-8',
					success : function(data){
						$('#ajaxCard').empty();
						let msg_data = "";
						$.each(data, function(index, value){
							console.log(value.product_name);
							
							msg_data += '<div class="col mb-4"><div class="card h-100">';
							msg_data += '<img src="' + value.product_image + '" class="card-img-top" alt="...">';
							msg_data += '<div class="card-body"><h1 class="card-title">' + value.product_name + '</h1>';
							msg_data += '<p class="card-text"><h3>售價:$' + Number(value.product_price)*Number(value.product_discount) + '</h3>';
							msg_data += '<P style="text-decoration: line-through">原價:$' + value.product_price + '</P>';
							msg_data += '尚餘' + value.product_stock + '份<BR></p>';
							msg_data += '<div>';
							msg_data += '<button type="button" onclick="addCart(' + value.product_id + ')" id="addCart">商品詳情</button>';
							msg_data += '<button type="button" onclick="addCart(' + value.product_id + ')" id="addCart">加入購物車</button>';
							msg_data += '</div></div></div></div>';
						
						})
						$('#ajaxCard').append(msg_data);
					},
				})
			}
			
			$.ajax({
				url: 'http://localhost:8080/oldFoodMan/searchProduct/' + inputVal,
				type: 'post',
				dataType : "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data){
					$('#ajaxCard').empty();
					let msg_data = "";
					$.each(data, function(index, value){
						console.log(value.product_name);
						
						msg_data += '<div class="col mb-4"><div class="card h-100">';
						msg_data += '<img src="' + value.product_image + '" class="card-img-top" alt="...">';
						msg_data += '<div class="card-body"><h1 class="card-title">' + value.product_name + '</h1>';
						msg_data += '<p class="card-text"><h3>售價:$' + Number(value.product_price)*Number(value.product_discount) + '</h3>';
						msg_data += '<P style="text-decoration: line-through">原價:$' + value.product_price + '</P>';
						msg_data += '尚餘' + value.product_stock + '份<BR></p>';
						msg_data += '<div>';
						msg_data += '<button type="button" class="btn btn-success" onclick="addCart(' + value.product_id + ')" id="addCart">商品詳情</button>';
						msg_data += '<button type="button" class="btn btn-primary" onclick="addCart(' + value.product_id + ')" id="addCart">加入購物車</button>';
						msg_data += '</div></div></div></div>';
					
					})
					$('#ajaxCard').append(msg_data);
				},
			})
		})
		
	</script>

	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>