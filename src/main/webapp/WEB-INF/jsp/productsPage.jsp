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
</head> 
<body>
	<p>
	
	<div class="container">  
		<div style="width:600px;margin:0 auto"> <!-- 廣告輪播 -->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<c:url value='product_img/2022/03/12/7dc262c0-702f-4f92-ae7a-7fcc90a98bf3.jpg'/>" width="100px" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='product_img/2022/03/12/d7bf5f4e-3f52-41b7-a863-7523496fb5c7.jpg'/>" width="100px" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='product_img/2022/03/12/ea982f9b-7001-46e9-bb47-d0004ecb838c.jpg'/>" width="100px" class="d-block w-100" alt="...">
				</div>
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
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${allProducts.product_image}" class="card-img-top"
							alt="...">
						<div class="card-body">
							<h1 class="card-title">${allProducts.product_name}</h1>
							<p class="card-text">
							<h3>售價:$${allProducts.product_newPrice}</h3>
							<P style="text-decoration: line-through">原價:$${allProducts.product_price}</P>
							尚餘${allProducts.product_stock}份<BR>
							${allProducts.product_remark}!<br>
							</p>
							<div>
							<button type="button" onclick="addCart(${allProducts.product_id})" id="addCart">商品詳情</button>
							<button type="button" onclick="addCart(${allProducts.product_id})" id="addCart">加入購物車</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
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
                	alert('已成功加入購物車!!')
           
                },
                error:function(err){
                    console.log(err);
                    alert('購物車已有此商品!!');
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
									console.log(value.product_name);
									
									msg_data += '<div class="col mb-4"><div class="card h-100">';
									msg_data += '<img src="' + value.product_image + '" class="card-img-top" alt="...">';
									msg_data += '<div class="card-body"><h1 class="card-title">' + value.product_name + '</h1>';
									msg_data += '<p class="card-text"><h3>售價:$' + Number(value.product_price)*Number(value.product_discount) + '</h3>';
									msg_data += '<P style="text-decoration: line-through">原價:$' + value.product_price + '</P>';
									msg_data += '尚餘' + value.product_stock + '份<BR>' + value.product__remark + '!<br></p>';
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
								msg_data += '尚餘' + value.product_stock + '份<BR>' + value.product__remark + '!<br></p>';
								msg_data += '<div>';
								msg_data += '<button type="button" onclick="addCart(' + value.product_id + ')" id="addCart">商品詳情</button>';
								msg_data += '<button type="button" onclick="addCart(' + value.product_id + ')" id="addCart">加入購物車</button>';
								msg_data += '</div></div></div></div>';
							
							})
							$('#ajaxCard').append(msg_data);
						},
					})
				
			}
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
							msg_data += '尚餘' + value.product_stock + '份<BR>' + value.product__remark + '!<br></p>';
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
						msg_data += '尚餘' + value.product_stock + '份<BR>' + value.product__remark + '!<br></p>';
						msg_data += '<div>';
						msg_data += '<button type="button" onclick="addCart(' + value.product_id + ')" id="addCart">商品詳情</button>';
						msg_data += '<button type="button" onclick="addCart(' + value.product_id + ')" id="addCart">加入購物車</button>';
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