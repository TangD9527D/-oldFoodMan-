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
	<!-- dialog -->
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	
	<!-- CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
</head>
<body>
	<p>
	<div class="container">
	<p>
	<!-- 新增對話框 -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" id="insertData">新增產品</button>
		
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">產品資訊</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<p>
						<button type="button" class="btn btn-primary" id="autoInsert">一鍵輸入</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">編號:</label> 
								<input type="text" class="form-control" id="product_number" name="product_number">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">品名:</label>
								<input type="text" class="form-control" name="product_name" id="product_name"/>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">類型:</label> 
								<select id="product_category">
									<option>燒烤</option>
									<option>火鍋</option>
									<option>小吃</option>
									<option>異國</option>
								</select>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">庫存:</label>
								<input type="text" class="form-control" name="product_stock" id="product_stock"/>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">折扣:</label> 
								<input type="text" class="form-control" name="product_discount" id="product_discount">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">原價:</label> 
								<input type="text" class="form-control" name="product_price" id="product_price">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">圖片:</label> 
								<input type="file" class="form-control" name="product_image" id="product_image">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">備註:</label> 
								<input type="text" class="form-control" name="product_remark" id="product_remark">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="Btn_add" data-dismiss="modal">確定新增</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 修改對話框 -->
		<div class="modal fade" id="UpdateModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">修改資料</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">編號:</label> 
								<input type="text" class="form-control" id="Uproduct_number" name="Uproduct_number">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">品名:</label>
								<input type="text" class="form-control" name="Uproduct_name" id="Uproduct_name"/>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">類型:</label> 
								<select id="Uproduct_category">
									<option>燒烤</option>
									<option>火鍋</option>
									<option>小吃</option>
									<option>異國</option>
								</select>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">庫存:</label>
								<input type="text" class="form-control" name="Uproduct_stock" id="Uproduct_stock"/>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">折扣:</label> 
								<input type="text" class="form-control" name="Uproduct_discount" id="Uproduct_discount">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">原價:</label> 
								<input type="text" class="form-control" name="Uproduct_price" id="Uproduct_price">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">圖片:</label> 
								<input type="file" class="form-control" name="Uproduct_image" id="Uproduct_image">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">備註:</label> 
								<input type="text" class="form-control" name="Uproduct_remark" id="Uproduct_remark">
							</div>
							<div class="form-group">
								
								<input type="hidden" id="Uproduct_id" value=""/>
							</div>
							
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="Btn_update" data-dismiss="modal">確定修改</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- dataTable -->
		<table id="tableAjax" class="table table-striped table-bordered" style="width:100%"></table>
		<img src=""/>
	</div>
	
	<script>
		$(document).ready( function () {
			var table = $('#tableAjax').DataTable({
		    	"ajax": {
		    	     "url": "http://localhost:8080/oldFoodMan/shoppingCart",
		    	      "type": "POST",
		    	      "dataSrc":""   //不加會報錯
		    	},
		    	
		        "columns": [	                                      
			        { data: '',title: "品名" },
			        { data: '',title: "類型"},
			        { data: '',title: "圖片",
			          "render": function (data) {
	                                return '<img src="' + data + '" width="100px" />';
	                            }
			        },
			        { data: '',title: "售價" },
			        { data: null ,title: "操作功能",  // 這邊是欄位
			            render: function (data, type, row) {
			              return '<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#UpdateModal" onclick="updateDialog(' + data.product_id + ')">編輯</button> ' +
			                      '<button type="button" class="btn btn-danger btn-sm" id="deleteOne"  value="' + data.product_id + '" >刪除</button>'
			                      
			              }
			        }
		        ],
		        "lengthMenu": [[10, 20, 30, -1], [10, 20, 30, "All"]],
		        "language": {
		            "lengthMenu": "顯示 _MENU_ 筆資料",
		            "sProcessing": "處理中...",
		            "sZeroRecords": "没有匹配结果",
		            "sInfo": "目前有 _MAX_ 筆資料",
		            "sInfoEmpty": "目前共有 0 筆紀錄",
		            "sInfoFiltered": " ",
		            "sInfoPostFix": "",
		            "sSearch": "搜尋:",
		            "sUrl": "",
		            "sEmptyTable": "尚未有資料紀錄存在",
		            "sLoadingRecords": "載入資料中...",
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
		
		
		
		
	</script>
	
	

		
		<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>