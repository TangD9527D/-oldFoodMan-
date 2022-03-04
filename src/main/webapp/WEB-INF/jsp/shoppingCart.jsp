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
</head>
<body>
	<p>
	<div class="container">
	<p>
	
		<!-- dataTable -->
		<table id="tableAjax2" class="table table-striped table-bordered" style="width:100%">
		<tfoot>
            <tr>
                <th colspan="5" style="text-align:right">此頁總價:</th>
                <th></th>
            </tr>
        </tfoot>
		</table>
		
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
			        { data: 'productId.product_name',title: "商品名稱" },
			        { data: 'productId.product_image',title: "圖片",
				          "render": function (data) {
		                                return '<img src="' + data + '" width="50px" />';
		                            },
				    },
				    { data: 'productId.product_price',title: "原價"},
				    { data: 'productPay',title: "折價後"},
			        { data: null,title: "數量",
				    	render: function (data, type, row) {
				              return  '<button type="button" class="btn btn-warning btn-sm"  onclick="increaseOne(' + data.productId.product_id + ')">增加</button> ' +
				                      '<input type="text" value="'+ data.productAmount + '" size="1" onchange="personAuto('+ data.productId.product_id +')"></input>&nbsp' + 
				                      '<button type="button" class="btn btn-danger btn-sm" id="deleteOne"  value="' + data.productId.product_id + '" >減少</button>'
				                      
				              }
			        },
			        
			        { data: 'productNewPay',title: "總價"},
		        ],
		        "lengthMenu": [[10, 20, 30, -1], [10, 20, 30, "All"]],
		        "footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api();
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };
		 
		            // Total over all pages
		            total = api
		                .column( 5 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Total over this page
		            pageTotal = api
		                .column( 5, { page: 'current'} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 5 ).footer() ).html(
		                '$'+pageTotal +'( 總金額 : $'+ total +')'
		            );
		        },
		        
		        
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
		
		//加商品數量
		function increaseOne(id){
			
			$.ajax({
				method:"post",
				url:"http://localhost:8080/oldFoodMan/cart/increaseOne/" + id,
				success:function(data){
					
				}
			})
		}
		
		$(document).on('click', '#deleteOne', function(){  //用一般的.click會有氣泡事件問題
			var id = $(this).attr("value");
			
			$.ajax({
				type : "post",
				url : "http://localhost:8080/oldFoodMan/cart/decreaseOne/" + id,
				success : function(data) {
					
				},
			});
		})
		
		function personAuto(id){
			console.log("ok!!")
		}
		
		
	</script>
	
	

		
		<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>