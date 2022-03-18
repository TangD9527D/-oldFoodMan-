<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../menu.jsp"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
<style>
.inputBtn {
	line-height: 16px;
	margin-left: 10px;
	margin-right: 2px;
	zoom: 1;
	vertical-align: middle;
}

textarea {
	resize: none;
}
.imgDiv {
	border: 1px solid gray;
	width: 150px;
	height: 100px;
	margin-top: 10px;
}
.shop{
	width:550px;
	border: 1px solid Transparent;
	folat:left;
}

</style>

<meta charset="UTF-8">
<title>新增食記</title>
</head>
<body>
<!-- <div class="form-group row" > -->
<!--     <div class="col-sm-10"> -->
<!--       <button id="fastInput" type="button" class="btn btn-primary">快速輸入</button> -->
<!--     </div> -->
<!--   </div> -->

<div class="container" style="border: 1px solid Transparent;">
<div class="shop"  style="float:left">
	<form:form class="form" action="${contextRoot}/editData" modelAttribute="foodrecord" method="post" enctype="multipart/form-data">
  <form>
		  <form:input type="hidden" path="id" />
		  <form:input type="hidden" path="added" />
		  
		  <div class="form-group row">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">上傳圖片</label>
		    <div class="col-sm-10">
		      <form:input type="file" class="form-control" id="image"  path="productImage" style="width:400px;"></form:input>
		    	<div >
					<img class="imgDiv" style="border:1px solid Transparent"/>
				</div>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">標題</label>
		    <div class="col-sm-10">
		      <form:input type="text" class="form-control" id="title"  path="title" style="width:400px;"></form:input>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="inputPassword3" class="col-sm-2 col-form-label">文章</label>
		    <div class="col-sm-10">
		      <form:textarea type="text" class="form-control" id="content" rows="4"  path="content" style="width:400px;"></form:textarea>
		    </div>
		  </div>
		  
		    <div class="form-group row">
		    <label for="inputPassword3" class="col-sm-2 col-form-label">類型</label>
		    <div class="col-sm-10">
		      <form:select class="form-control" path="shopType" id="shopType" onchange="selectType()" style="width:400px;">
		    				<option value="">請選擇</option>
							<option value="火鍋">火鍋</option>
							<option value="燒烤">燒烤</option>
							<option value="日式">日式</option>
							<option value="美式">美式</option>
							<option value="泰式">泰式</option>
							<option value="小吃">小吃</option>
							<option value="餐酒館">餐酒館</option>
						</form:select>
		    </div>
		  </div>
		  
		   <div class="form-group row">
		    <label for="inputPassword3" class="col-sm-2 col-form-label">適合</label>
		    <div class="col-sm-10">
		      <form:input type="text" class="form-control" id="audience"  path="audience" style="width:400px;"></form:input>
		    </div>
		  </div>
		  
		   <div class="form-group row">
			    <label for="inputPassword3" class="col-sm-2 col-form-label">用餐日</label>
			    <div class="col-sm-10">
			      <form:select class="form-control" path="businessHours" id="day" onchange="selectDay()" style="width:400px;">
			    				<option value="">請選擇</option>
								<option value="星期一">星期一</option>
								<option value="星期二">星期二</option>
								<option value="星期三">星期三</option>
								<option value="星期四">星期四</option>
								<option value="星期五">星期五</option>
								<option value="星期六">星期六</option>
								<option value="星期日">星期日</option>
							</form:select>
			    </div>
			  </div>
</div>
  
  
  <div class="shop" style="float:left">
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">店名</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" id="shopName"  path="shopName" style="width:400px;"></form:input>
    </div>
  </div>
  
  
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">價格區間</label>
    <div class="col-sm-10">
      <form:select class="form-control" path="priceScope" id="price" onchange="selectPrice()" style="width:400px;">
    				<option value="">請選擇</option>
					<option value="$   0-500元">$ 0-500元</option>
					<option value="$$   501-1000元">$$ 501-1000元</option>
					<option value="$$$   1001-3000元">$$$ 1001-3000元</option>
					<option value="$$$$   3000以上">$$$$ 3000以上</option>
				</form:select>
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">城市</label>
    <div class="col-sm-10">
      <div id="twzipcode"></div>
    </div>
  </div>
  
   <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">地址</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" id="shopAddress"  path="shopAddress" style="width:400px;"></form:input>
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">電話</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" id="tel"  path="tel" style="width:400px;"></form:input>
    </div>
  </div>
  </div>
  
  
  <div class="shop" style="float:left">
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">美味</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" path="tasty" id="tasty" style="width:400px;" ></form:input>
        <input class="inputBtn" type="radio" name="gender" value="5" checked="checked">5
		<input class="inputBtn" type="radio" name="gender" value="4">4
		<input class="inputBtn" type="radio" name="gender" value="3">3
		<input class="inputBtn" type="radio" name="gender" value="2">2
		<input class="inputBtn" type="radio" name="gender" value="1">1
    </div>
  </div>
  
   <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">氣氛</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" path="atmosphere" id="atmosphere" style="width:400px;"></form:input>
        <input class="inputBtn" type="radio" name="gender1" value="5" checked="checked">5
		<input class="inputBtn" type="radio" name="gender1" value="4">4
		<input class="inputBtn" type="radio" name="gender1" value="3">3
		<input class="inputBtn" type="radio" name="gender1" value="2">2
		<input class="inputBtn" type="radio" name="gender1" value="1">1
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">西批值</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" path="cp" id="cp" style="width:400px;"></form:input>
        <input class="inputBtn" type="radio" name="gender2" value="5" checked="checked">5
		<input class="inputBtn" type="radio" name="gender2" value="4">4
		<input class="inputBtn" type="radio" name="gender2" value="3">3
		<input class="inputBtn" type="radio" name="gender2" value="2">2
		<input class="inputBtn" type="radio" name="gender2" value="1">1
    </div>
  </div>
  
  </div>
  
  

  <div class="form-group row">
    <div class="col-sm-10 offset-sm-2">
      <div class="form-check">
     

      </div>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">送出</button>
    </div>
  </div>
  </form>
  </form:form>

</div>


	<script>

	//快速輸入
	$("#fastInput").click(function(){  
        $("#title").val("[食記] 台北 教父牛排 Danny's Steakhouse");
        $("#content").val("久聞牛排教父鄧有葵的大名已久，可一直也沒什麼心思想吃，其實我很少會上牛排館吃牛排，因為我總認為牛排這種食物，只要食材本身好，廚師的手藝倒是其次。而且台灣中上價位的牛排館所使用的無非也是美國牛，美國牛去美福或Costco都能買到，回家後用平底鍋煎一下或烤箱烤一下，佐點海鹽沾著吃，一點也不輸外面一客一兩千的牛排。尤其吃過日本近江牛的美味後，美國牛的味道已經滿足不了我了。不過既然朋友想嘗試看看牛排教父的牛排，那便約來一試，嘗嘗也好。");
        $("#shopName").val("教父牛排 Danny's Steakhouse");
        var type=$("#shopType").val("西式");
        console.log(type); 
        $("#audience").val("朋友");
        $("#price").val("$$$   1001-3000元");
//         $("select[name='city']").val("台北市");
//         console.log($("div > select[name]='city'")); 
//         $("#twzipcode[name='town']").val("中山區");
        $("#shopAddress").val("樂群三路58號");
        $("#tel").val("02-8501-1838");
        $("#day").val("星期三");
        $("#tasty").val("細緻滑嫩，入口即化");
        $("#atmosphere").val("高貴華麗，香氣四溢，非常乾淨");
        $("#cp").val("價格較高，不能常常來");

//          var city =$("select[name='city']").text(); //看全部的城市.
//         $("select[name='city']").attr("value","台北市");
// 		    var city =$("#twzipcode option:first").text();

//          console.log(city); 
    });
	



		//郵遞區號
		$("#twzipcode").twzipcode({
			zipcodeIntoDistrict : true, // 郵遞區號自動顯示在區別選單中
// 			css : [ "city form-control", "town form-control" ], // 自訂 "城市"、"地別" class 名稱 
			countyName : "city", // 自訂城市 select 標籤的 name 值
			districtName : "town" // 自訂區別 select 標籤的 name 值
		});

		//上傳圖片
		$('input').on('change', function(e) {
			const file = this.files[0];

			const fr = new FileReader();
			fr.onload = function(e) {
				$('.imgDiv').attr('src', e.target.result);
			};

			// 使用 readAsDataURL 將圖片轉成 Base64
			fr.readAsDataURL(file);
		});
		
		//類型
		function selectType() {
			var shopType = document.getElementById("shopType").value;
// 			let selectType = document.getElementById("selectType");
		}

		//價格區間
		function selectPriceType() {
			var price = document.getElementById("price").value;
// 			let selectPrice = document.getElementById("selectPrice");
		}
		

		//營業日
		function selectDay() {
			var day = document.getElementById("day").value;
// 			let selectDay = document.getElementById("selectDay");
// 			let Month = spMonth.innerHTML = yearM + " 月 ";
		}
	</script>



</body>
</html>