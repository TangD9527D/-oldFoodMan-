<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="menu.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的購物車</title>
	<c:set var='contextRoot' value='${pageContext.request.contextPath}'/>
	<link rel='stylesheet' href='${contextRoot}/css/bootstrap.min.css'/>
	
	<!-- CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<style>
    	input::-webkit-outer-spin-button,
    	input::-webkit-inner-spin-button {
        	-webkit-appearance: none;
    	}
    	input[type="number"]{
        	-moz-appearance: textfield;
    	}
	</style>
	
	
</head>
<body>
	<p>
	<div class="container">
	<p>
	
		<!-- dataTable -->
		<table id="tableAjax2" class="table table-striped table-bordered" style="width:100%">
		<tfoot>
            <tr>
                <th colspan="6" style="text-align:right">此頁總價:</th>
                <th></th>
            </tr>
        </tfoot>
        
		</table><br>
		<p></p>
		<div>
			<button type="button" class="btn btn-danger btn-sm" id="selectAll" >全選/取消全選</button>
			<button type="button" class="btn btn-danger btn-sm" id="deleteSelect">多筆刪除</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#BuyModal" id="toBuy" style="float:right" disabled="disabled">去結帳</button>
		</div>
	</div>
	
	<div class="modal fade" id="BuyModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">購買資訊</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div>
					<table class="table" id="ajaxToBuyTable">
						<thead class="thead-light">
							<tr>
								<th scope="col">產品名</th>
								<th scope="col">圖片</th>
								<th scope="col">折扣</th>
								<th scope="col">單價</th>
								<th scope="col">數量</th>
								<th scope="col">總價</th>
							</tr>
						</thead>
						<tbody id="appendTbody">
							
						</tbody>
					</table>
					<div style="text-align:right;margin-right:100px">
					    <h3 id="appendNum"></h3>
						<h3 id="appendPrice"></h3>
					</div>
				</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="Btn_buy" data-dismiss="modal">確定結帳</button>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		$(document).ready( function () {
			$('#tableAjax2').DataTable({
		    	"ajax": {
		    	     "url": "http://localhost:8080/oldFoodMan/shoppingCart",
		    	     "type": "post",
		    	     "dataSrc":""   //不加會報錯
		    	},
		    	
		        "columns": [	                                      
		        	{ data: null,title: "挑選",
			        	render: function(data, type, row){
			        		if(data.productId.product_stock <= 0){
			        			return '<p style="color:red;font-weight:bold">已售罄!<p>';
			        		}
			        		return '<input type="checkbox" id="checkbox' + data.productId.product_id + '" name="checkbox" class="checkboxQuery"></input>'
			        	}	
			        },
			        { data: 'productId.product_name',title: "商品名稱" },
			        { data: 'productId.product_image',title: "圖片",
				          "render": function (data) {
		                                return '<img src="' + data + '" width="50px" />';
		                            },
				    },
				    { data: 'productId.product_price',title: "原價",
			        	render: function(data, type, row){
			        		return '$' + data;
			        	}	
				    },
				    { data: 'productPay',title: "折價後",
			        	render: function(data, type, row){
			        		return '$' + data;
			        	}	
				    },
			        { data: null,title: "數量",
				    	render: function (data, type, row) {
				    		  if(data.productId.product_stock <= 0){
			        			 return '0'
			        		  }
				              return  '<button type="button" class="btn btn-warning btn-sm"  id="upOne"  value="' + data.productId.product_id + '" >增加</button> ' +
				                      '<input type="number" value="'+ data.productAmount + '" class="autoNum" id="'+ data.productId.product_id + '" max="'+ data.productId.product_stock +'" min="1" size="1"></input>&nbsp' + 
				                      '<button type="button" class="btn btn-danger btn-sm" id="deleteOne"  value="' + data.productId.product_id + '" >減少</button>'
				                      
				              }
			        },
			        
			        { data: 'productNewPay',title: "金額",
			        	render: function(data, type, row){
			        		return '$' + data;
			        	}	
			        },
			        { data: null,title: "操作",
			        	render: function(data, type, row){
			        		return '<button type="button" class="btn btn-danger btn-sm" id="deleteFromCart"  value="' + data.productId.product_id + '" >移除</button>'
			        	}	
			        
			        }
		        ],
		        "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
		        "footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api();
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ? i : 0;
		            };
		 
		            // Total over all pages
		            total = api.column( 6 ).data().reduce( function (a, b) {
		                    									return intVal(a) + intVal(b);
		                									}, 0 );
		 
		            // Total over this page
		            pageTotal = api.column( 6, { page: 'current'} ).data().reduce( function (a, b) {
		                    															return intVal(a) + intVal(b);
		                														    }, 0 );
		 
		            // Update footer
		            $( api.column( 6 ).footer() ).html('$'+pageTotal +'( 總金額 : $'+ total +')');
		        },
		        
		        
		        "language": {
		            "lengthMenu": "顯示 _MENU_ 筆商品",
		            "sProcessing": "處理中...",
		            "sZeroRecords": "没有匹配结果",
		            "sInfo": "目前有 _MAX_ 筆商品",
		            "sInfoEmpty": "目前共有 0 筆商品",
		            "sInfoFiltered": " ",
		            "sInfoPostFix": "",
		            "sSearch": "搜尋:",
		            "sUrl": "",
		            "sEmptyTable": "尚未有商品",
		            "sLoadingRecords": "載入商品中...",
		            "sInfoThousands": ",",
		            "oPaginate": {
		                "sFirst": "首頁",
		                "sPrevious": "上一頁",
		                "sNext": "下一頁",
		                "sLast": "末頁"
		            },
		            "order": [[0, "desc"]],
		            "oAria": {
		                "sSortAscending": ": 以升序排列此列",
		                "sSortDescending": ": 以降序排列此列"
		            }
		        }
			})
			
		})
		
		//按鈕加商品數量
		$(document).on('click', '#upOne', function(){  //用一般的.click會有氣泡事件問題
			var id = $(this).attr("value");
			upRow = $(this).closest('tr');
			$.ajax({
				method:"post",
				url:"http://localhost:8080/oldFoodMan/cart/increaseOne/" + id,
				success:function(data){
					$("#tableAjax2").DataTable().row(upRow).data(data).draw(false);
				}
			})
		})
		
		
		//按鈕減商品數量
		$(document).on('click', '#deleteOne', function(){  //用一般的.click會有氣泡事件問題
			var id = $(this).attr("value");
			upRow = $(this).closest('tr');
			$.ajax({
				type : "post",
				url : "http://localhost:8080/oldFoodMan/cart/decreaseOne/" + id,
				success : function(data) {
					$("#tableAjax2").DataTable().row(upRow).data(data).draw(false);
				},
			});
		})
		
		
		//手動輸入更改商品數量
		$(document).on('change', '.autoNum', function(){
			let id = $(this).attr("id");
			var inputVal = $('#'+ id).val();
			if(inputVal==''||inputVal==undefined||inputVal==null){
				$.ajax({
					type : "post",
					url : "http://localhost:8080/oldFoodMan/Cart/findOne/" + id,
					dataType : "json",
					contentType: 'application/json;charset=UTF-8',
					success : function(data){
						$('.autoNum').val(data.productAmount);
					},
				})
				return;
			}
			upRow = $(this).closest('tr');
			console.log(upRow)
			$.ajax({
				type : "post",
				url : "http://localhost:8080/oldFoodMan/cart/psersonAuto/" + id + "/" + inputVal,
				dataType : "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data){
					$('#'+id).val(data.productAmount);
					$("#tableAjax2").DataTable().row(upRow).data(data).draw(false);
				},
			})
		})
		//單筆刪除
		$(document).on('click', '#deleteFromCart', function(){  
			var id = $(this).attr("value");
			dtRow = $(this).closest('tr');
			$.ajax({
				type : "post",
				url : "http://localhost:8080/oldFoodMan/cart/deleteOneProduct/" + id,
				success : function(data) {
					$("#tableAjax2").DataTable().row(dtRow).remove().draw(false);
				},
			});
		})
		//多筆刪除
		$(document).on('click', '#deleteSelect', function(){
			
			swal({
			    title: "Are you sure?",
			    icon: "warning",
			    buttons: true,
			    dangerMode: true
			  }).then(function (isConfirm) {
				  if (isConfirm) {
			            var arr = [];
						var dtRow = [];
						let checkboxes = document.querySelectorAll("[name=checkbox]");
						for (var i = 0; i < checkboxes.length; i++) {
							if (checkboxes[i].checked === true) {
	
								var str = (checkboxes[i].id).substring(8, 10);
								
								arr.push({"productId":str}); //要準備轉JSON
					            
								dtRow.push(str); //用來刪除多筆的陣列
								console.log("dtRow:" + dtRow);
							}
							
						}
						var dtoJsonString = JSON.stringify(arr); //轉Json
							
						console.log(dtoJsonString);
						$.ajax({
							url:'http://localhost:8080/oldFoodMan/Cart/deleteSelected',
			                contentType: 'application/json;charset=UTF-8',
			                method: 'post',
			                data: dtoJsonString,
			                success:function(data){
			                	$.each(dtRow, function(index, value) {
			                		deleteRow = $('#checkbox'+value).closest('tr');
			                		$("#tableAjax2").DataTable().row(deleteRow).remove().draw(false);
			                	});
			                	let checkboxes = document.querySelectorAll("[name=checkbox]");
			                	let max = checkboxes.length;
								if(max == 0){{
									$('#toBuy').attr('disabled','disabled');
								}}
						}
					})
				 }
			})
		})
		
		//多選/取消多選
		$(document).on('click', '#selectAll', function(){ 
 				let checkboxes = document.querySelectorAll("[name=checkbox]");
 				let count = 0;
 				let max = checkboxes.length;
 				for (var i = 0; i < max; i++) {
 					if (checkboxes[i].checked === true && max == 1) {
 						$('#toBuy').attr('disabled','disabled');
 						$("[name=checkbox]").prop("checked",false);
 					}else if(checkboxes[i].checked === true){
 						$('#toBuy').removeAttr('disabled');
 						$("[name=checkbox]").prop("checked",true);
 						count++;
 					}else if(checkboxes[i].checked === false && max == 1){
 						$('#toBuy').removeAttr('disabled');
 						$("[name=checkbox]").prop("checked",true);
 					}else if(checkboxes[i].checked === false){
 						$('#toBuy').attr('disabled','disabled')
 						$("[name=checkbox]").prop("checked",true);
 					}
		
 					if (count === max && max != 1){
 						console.log('test')
 						$("[name=checkbox]").prop("checked",false);
 						$('#toBuy').attr('disabled','disabled')
 					}
 				}
 				
 				
 				
 				
//  				if($("[name=checkbox]").prop("checked")){
//  					$("[name=checkbox]").prop("checked",false);
//  					$('#toBuy').attr('disabled','disabled')
//  				}else{
//  					$("[name=checkbox]").prop("checked",true);
//  					$('#toBuy').removeAttr('disabled');
//  				}
  			})
 		
 		//購買可不可按
		$(document).on('click', '.checkboxQuery', function(){ 
			let checkboxes = document.querySelectorAll("[name=checkbox]");
			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked === true) {
					$('#toBuy').removeAttr('disabled');
					return;
				}else{
					$('#toBuy').attr('disabled','disabled')
				}
			}
			
		})
		
		
		//按下去結帳會先跳確認勾選項目資訊
		$('#toBuy').click(function(){
			var buyArr = [];
			var buyRow = [];
			let checkboxes = document.querySelectorAll("[name=checkbox]");
			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked === true) {

					var str = (checkboxes[i].id).substring(8, 15);
					
					
					buyArr.push({"productId":str}); //要準備轉JSON
					
					buyRow.push(str); //用來刪除多筆的陣列
					
				}
			}
			var dtoJsonString = JSON.stringify(buyArr); //轉Json
			if(dtoJsonString == '[]'){ //如果空則不給按結帳細節
				console.log('請挑轉商品');
				return;	
			}        
			
			
			
			$.ajax({
				url:'http://localhost:8080/oldFoodMan/Cart/toBuy',
                contentType: 'application/json;charset=UTF-8',
                method: 'post',
                data: dtoJsonString,
                success:function(data){
                	$('#appendTbody').empty();
                	$('#appendPrice').empty();
                	$('#appendNum').empty();
                	var msg_data = '';
                	var msg_totalPrice = 0;
                	var msg_num = 0;
                	$.each(data,function(index,value){
                		
                        msg_data += '<tr><td>' + value.productId.product_name + '<input type="hidden" value="' + value.productId.product_id + '" id="confirmProductId" /></td>';
                        msg_data += '<td><img src="' + value.productId.product_image + '" width="50"/></td>';
                        msg_data += '<td>' + Number(value.productId.product_discount)*100 + '%</td>';
                        msg_data += '<td>' + value.productId.product_price + '</td>';
                        msg_data += '<td>' + value.productAmount + '</td>';
                        msg_data += '<td>' + Number(value.productAmount)* (Number(value.productId.product_price)*Number(value.productId.product_discount)) + '</td></tr>';
                         
                        msg_totalPrice += Number(value.productAmount)* (Number(value.productId.product_price)*Number(value.productId.product_discount));
                        msg_num = Number(index);
                	})
                	$('#appendTbody').append(msg_data);
                	$('#appendPrice').append("總價格(Total) : $" + msg_totalPrice);
                	$('#appendNum').append("筆數 : " + (msg_num + 1) + "筆");
                }

			})
		})
		
		//按下確認結帳
		$('#Btn_buy').click(function(){
			var buyArr = [];
			var dtRow = [];
			let tests = document.querySelectorAll("[id=confirmProductId]");
			console.log(tests);
			
			for (var i = 0; i < tests.length; i++) {
				
					var str = (tests[i].value);
					
					buyArr.push({"productId":str}); //要準備轉JSON
		            
					dtRow.push(str); //用來刪除已結帳物品的陣列
				}
			
			var dtoJsonString = JSON.stringify(buyArr); //轉Json
			
			$.ajax({
				url:'http://localhost:8080/oldFoodMan/Cart/confirmBuy',
                contentType: 'application/json;charset=UTF-8',
                method: 'post',
                data: dtoJsonString,
                success:function(data){
                	$.each(dtRow, function(index, value) {
                		deleteRow = $('#checkbox'+value).closest('tr');
                		$("#tableAjax2").DataTable().row(deleteRow).remove().draw(false);
                	});
                	swal("已結帳完成!餐券將於3~5分鐘寄至您於本站註冊之會員信箱!", "You clicked the button!", "success");
                }
			})
		})
			
		
		
		
	</script>
	
	

		
		<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>