<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯食記</title>

<script
	src="https://cdn.tiny.cloud/1/30adfco0hwtspaphkuspihs4pvm92w232kl2zllm251svqf1/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
<style>
textarea {
	resize: none;
}

.lab {
	width: 150px;
	float: left;
	text-align: right;
	font-size: 18px;
	margin-right: 20px;
}

.st1 {
	width: 1000px;
	/* border-bottom: 2px dashed lightgray; */
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.sform1 {
	width: 1000px;
	/* border: 2px solid black; */
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
	font-size: 18px;
	padding: 10px;
}

.sform2 {
	width: 1000px;
	/* border: 2px solid black; */
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
	font-size: 18px;
}

.sinputData {
	width: 600px;
}

input {
	font-size: 18px;
}

legend {
	font-weight: 900;
}

.link-top {
	width: 1000px;
	height: 2px;
	margin: auto;
	padding-top: 20px;
	border-top: 2px solid #626264;
}

.inputBtn {
	line-height: 16px;
	margin-left: 10px;
	margin-right: 2px;
	zoom: 1;
	vertical-align: middle;
}

.btn {
	width: 1000px;
	margin: auto;
}

.sendBtn {
	float: right;
	padding-left: 10px;
	padding-right: 10px;
	margin-left: 20px;
}

#inputID {
	width: 500px;
	margin: auto;
}

.imgDiv {
	border: 1px solid gray;
	width: 150px;
	height: 100px;
	margin: 10px auto auto auto;
}
</style>
</head>

<body>

	<form:form class="form" action="${contextRoot}/editData" modelAttribute="foodrecord" method="post">
	<form class="sform2">
		<br>
		<div class="container">
			<form class="sform1">
				
				<div class="st1">
						<label class="lab">上傳圖片:</label>
						<form:input path="productImage" type='file' />
						<div>
							<img class="imgDiv" />
						</div>
					</div>
				
				<form:input type="hidden" path="id" />
				<form:input type="hidden" path="added" />

				<div class="st1">
						<label class="lab">標題:</label>
						<form:input path="title" type="text"></form:input>
					</div>

				<div class="st1">
					<label class="lab">內文:</label>
					<form:textarea path="content" cols="800" rows="4" id="inputID" />
				</div>


				<p class="link-top"></p>
				
				<legend>店家資訊</legend>
			<div class="st1">
				<label class="lab">店名:</label>
				<form:input path="shopName" type="text"></form:input>
			</div>
			<div class="st1">
				<label class="lab">類型:</label>
				<form:select path="shopType" id="type" onchange="selectType()">
					<option value="">請選擇</option>
					<option value="火鍋">火鍋</option>
					<option value="燒烤">燒烤</option>
					<option value="日式">日式</option>
					<option value="西式">美式</option>
					<option value="泰式">泰式</option>
					<option value="小吃">小吃</option>
					<option value="餐酒館">餐酒館</option>
					<option value="居酒屋">居酒屋</option>
					<option value="早午餐">早午餐</option>
			
				</form:select>
			</div>
			<div class="st1">
				<label class="lab">適合:</label>
				<form:input path="audience" type="text"></form:input>
			</div>

			<div class="st1">
				<label class="lab">價格區間:</label>
				<form:select path="priceScope" id="price" onchange="selectPrice()">
					<option value="">請選擇</option>
					<option value="$   0-500元">$ 0-500元</option>
					<option value="$$   501-1000元">$$ 501-1000元</option>
					<option value="$$$   1001-3000元">$$$ 1001-3000元</option>
					<option value="$$$$   3000以上">$$$$ 3000以上</option>
				</form:select>
			</div>

			<div class="st1">
				<label class="lab">城市:</label>
				<div id="twzipcode"></div>
			</div>

			<div class="st1">
				<label class="lab">地址:</label>
				<form:input path="shopAddress" type="text"></form:input>
				<br>
			</div>
			<div class="st1">
				<label class="lab">電話:</label>
				<form:input path="tel" type="text"></form:input>
				<br>
			</div>
			<div class="st1">
				<label class="lab">用餐日:</label>
				<form:select path="businessHours" id="day" onchange="selectDay()">
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
					
					
					

				</form>
				<br>
				<p class="link-top"></p>


				<div class="st2">
					<label class="lab">美味:</label>
					<form:input path="tasty" type="text" id="inputID"></form:input>
					<input class="inputBtn" type="radio" name="gender" value="5">5
					<input class="inputBtn" type="radio" name="gender" value="4">4
					<input class="inputBtn" type="radio" name="gender" value="3">3
					<input class="inputBtn" type="radio" name="gender" value="2">2
					<input class="inputBtn" type="radio" name="gender" value="1">1
				</div>
				<br>
				<div class="st2">
					<label class="lab">氣氛:</label>
					<form:input path="atmosphere" type="text" id="inputID"></form:input>
					<input class="inputBtn" type="radio" name="gender1" value="5">5
					<input class="inputBtn" type="radio" name="gender1" value="4">4
					<input class="inputBtn" type="radio" name="gender1" value="3">3
					<input class="inputBtn" type="radio" name="gender1" value="2">2
					<input class="inputBtn" type="radio" name="gender1" value="1">1
				</div>
				<br>
				<div class="st2">
					<label class="lab">西批值:</label>
					<form:input path="cp" type="text" id="inputID"></form:input>
					<input class="inputBtn" type="radio" name="gender2" value="5">5
					<input class="inputBtn" type="radio" name="gender2" value="4">4
					<input class="inputBtn" type="radio" name="gender2" value="3">3
					<input class="inputBtn" type="radio" name="gender2" value="2">2
					<input class="inputBtn" type="radio" name="gender2" value="1">1
				</div>
				<br>


				<div class="btn">
					<input class="sendBtn" type="submit" value="新增">
				</div>
			</form>
		</div>
		</form>
	</form:form>






	<script>
		tinymce
				.init({
					selector : 'textarea',
					plugins : 'advlist autolink lists link image charmap print preview hr anchor pagebreak',
					toolbar_mode : 'floating',
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
				$('img').attr('src', e.target.result);
			};

			// 使用 readAsDataURL 將圖片轉成 Base64
			fr.readAsDataURL(file);
		});

		//營業日
		function selectDay() {
			var yearM = document.getElementById("day").value;
			let spMonth = document.getElementById("selectDay");
			let Month = spMonth.innerHTML = yearM + " 月 ";
		}
	</script>
</body>
</html>