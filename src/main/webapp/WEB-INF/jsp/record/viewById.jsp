<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#rateLL {
	display: flex;
}

#topTitleLL {
	/* border: solid lightblue thin; */
	width: 700px;
	height: 150px;
	margin: 20px auto 20px auto;
	/* align-items: center;
            justify-content: center; */
}

#mainTitleLL, #rateLL, #arthurLL, #shareLL {
	position: static;
	width: 300px;
	margin: auto;
	text-align: center;
}

#h1{
	position: static;
	width: 800px;
	margin: auto;
	text-align: center;

}

figure {
	/* border: thin #c0c0c0 solid; */
	display: flex;
	flex-flow: column;
	/* padding: 5px; */
	max-width: 450px;
	height: 450px;
	margin: auto;
	overflow: hidden;
}

#likeBar {
	display: flex;
	justify-content: center;
	margin-top:20px;
}

#article {
	display: flex;
	justify-content: center;
	margin: 50px;
}

#left {
	/* border: thin lightblue solid; */
	width: 300px;
}

#right {
	/* border: thin lightblue solid; */
	width: 700px;
}

#taste, #air, #cpValue, #left #share {
	border-top: solid thin lightcoral;
	margin: 15px;
}

#left #title {
	margin: 15px;
}

#right {
	justify-content: center;
}

#articleDinning p {
	width: 500px;
	line-height: 1.5;
}

#articleDinning p::first-letter {
	color: black;
	/* background-color: black; */
	/* border-radius: 2px; */
	/* box-shadow: 3px 3px 0 red; */
	font-size: 250%;
	padding: 6px 3px;
	margin-right: 6px;
	float: left;
}

#articleDinning {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#articleDinning img {
	width: 500px;
	margin: 15px;
}

#articleDinning h6 {
	width: 500px;
	display: flex;
	left: 0;
	margin-top: 5px;
	margin-bottom: 5px;
}

#icon {
	margin: 10px;
	width: 30px;
}
.msg_id{
height:20px;
width:500px;

}

</style>
</head>
<body>
	<br>
	<div id="main">
		<div id="topTitleLL">
			
				<h1 id="h1">
					<c:out value="${foodrecordById.title}" />
				</h1>
		<div id="mainTitleLL">
				<c:out value="${foodrecordById.gender}" />
				<c:out value="${foodrecordById.gender1}" />
				<c:out value="${foodrecordById.gender2}" />
			</div>
			<div id="arthurLL">
				<h5>作者 蘋果馬丁尼 @croissantoffee</h5>
			</div>
			<div id="shareLL">
			<div class="line-it-button" data-lang="zh_Hant" data-type="share-b" data-env="REAL" data-url="http://localhost:8080/my-project/viewById?id=${foodrecordById.id}" data-color="default" data-size="small" data-count="true" data-ver="3" style="display: none;"></div>
<script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
			
<!-- 				<a href=""><img id="icon" title="LINE分享" src="images/LINE_icon.png"></a> -->
				<img id="icon" title="Facebook分享" src="images/facebook.png">
			</div>
		</div>
		<div id="topTitleLL" style="width: 450px; height: 300px;display: flex;justify-content: center; align-items: center;" >
		<figure>
			<img src="<c:url value='/getPicture/${foodrecordById.id}'/>">
		</figure>
		</div>
		<div id="likeBar">
			<img id="icon" src="images/like.png"> <img id="icon"
				src="images/chat.png"> <img id="icon" src="images/badoo.png">
		</div>
		<div id="article">
			<div id="left">
				<div id="title">
					<h3>
						類型:
						<c:out value="${foodrecordById.shopType}" />
					</h3>
					<h4>
						適合:
						<c:out value="${foodrecordById.audience}" />
					</h4>
					<p>
						<c:out value="${foodrecordById.city}" />
						<br>
						<c:out value="${foodrecordById.town}" />
						<br>
						<c:out value="${foodrecordById.shopAddress}" />
						<br> <br> 營業時間<br>
						<c:out value="${foodrecordById.businessHours}" />
						<br> <br> 電話<br>
						<c:out value="${foodrecordById.tel}" />
					</p>
				</div>
				<div id="taste">
					<h3>美味</h3>
					<h6>
						<c:out value="${foodrecordById.tasty}" />
					</h6>
					<img src="imgLL/01.jpg">
				</div>
				<div id="air">
					<h3>氣氛</h3>
					<h6>
						<c:out value="${foodrecordById.atmosphere}" />
					</h6>
					<img src="imgLL/01.jpg">
				</div>
				<div id="cpValue">
					<h3>西批值</h3>
					<h6>
						<c:out value="${foodrecordById.cp}" />
					</h6>
					<img src="imgLL/01.jpg">
				</div>
				<div id="share">
					<h3>分享</h3>
					<img src="imgLL/01.jpg"> <img src="imgLL/01.jpg"> <img
						src="imgLL/01.jpg">
				</div>
			</div>
			<div id="right">
				<div id="articleDinning">
					<p>
						<c:out value="${foodrecordById.content}" />
					</p>

					<h6>
						日期:
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
							value="${foodrecordById.added}" />
					</h6>
					<h6>
						標籤:
						<c:out value="${foodrecordById.tag}" />
					</h6>
				</div>
				<br>
				<br>

				<button id="submitBtn" style="float: right; margin: 5px">發佈</button>
				<input id="myMessage"
					style="width: 500px; border-color: lightgray; float: right; border-radius: 10px;"
					placeholder="留言..."></input> <br>
				<br>
				
				
<!--  ---老師範例的查看留言法---------------------------------------------------- -->

		<div class="container">
		<p />
		<c:forEach var="msg" items="${msg_page.content}">
			<div class="row justify-content-center">
				<div class="col-9">
				
					<div class="card">
						<div class="card-header">
							回覆時間
						
						</div>
						<div class="card-body">
					    <c:out value="${msg.text}" />
						</div>
						<div align="right">
							編輯
							刪除
						</div>
					</div>
					
				</div>
			</div>
			</c:forEach>
	



<!--  -------------借放------------------------------------------ -->
<!-- <p /> -->
<%-- 					<c:forEach var="recordMessage" items="${page.content}"> --%>
<!-- 						<div class="row justify-content-center"> -->
<!-- 							<div class="col-9"> -->
<!-- 								<div class="card"> -->
<!-- 									<div class="card-header"> -->
<!-- 										回覆時間 -->
<%-- 										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" --%>
<%-- 											value="${recordMessage.added}" /> --%>
<!-- 									</div> -->
<!-- 									<div class="card-body"> -->
<%-- 										<c:out value="${recordMessage.text}" /> --%>
<!-- 									</div> -->
<!-- 									<div align="right"> -->
<%-- 										<a href="${contextRoot}/editMessage?id=${recordMessage.id}">編輯</a> --%>
<!-- 										<a onclick="return confirm('確認刪除?')" -->
<%-- 											href="${contextRoot}/deleteMessage?id=${recordMessage.id}">刪除</a> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>

		
<!--  ----以下為將table表格用each的方式印出的body部分-------------------------------------------------------------------------------- -->
				
				<br><br>
				<div>
					<table class="msg_table" id="list_table_json">
						<thead>
							<tr>
							<th>留言</th>
							</tr>
						</thead>
					</table>
					
				</div>
<!-- ----------------------------------------------------------------------------------------------------------- -->
		</div>
	</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#submitBtn').click(function() { //監聽submitBtn這個按鈕，當Click的時候進行CallBack Function

				var inputText = document.getElementById('myMessage').value; //先抓到Input內的資料， 並給他一個變數
								console.log("inputText = "+inputText);
				var dtoObject = {"message" : inputText} //將inputText放到一個物件內 {"Dto的Key": 值(就是前面的inputText)}，這時還是一個物件
								console.log("dtoObject = "+dtoObject);
				var dtoJsonString = JSON.stringify(dtoObject); //將物件轉成JSON。用stringify才能將物件轉成JSON的字串
								console.log("dtoJsonString = "+dtoJsonString);

				$.ajax({
					url : 'http://localhost:8080/oldFoodMan/api/postMessage',
					contentType : 'application/json; charset=UTF-8', // 送過去的格式
					dataType : 'json', // 傳回來的
					method : 'post',
					data : dtoJsonString, //送過去的東新
					success : function(result) { //成功送過去後
// 						$('#list_table_json tr td').remove()
						console.log(result);
<!-- ---------以下為將table表格用each的方式印出----------------------------------------------------------------------------------------- -->						
// 						var msg_data = ''; //msg_data先設為空的，待會才能放資料進去
// 						$.each(result, function(index, value) {
// 							//由於回傳是Json的陣列，一次會回傳一筆，所以用Jquery each的方法
// 							//result是一個陣列，funcion為一個callback
// 							//function中的index表示要回傳的第幾筆，可以不用，但是一定要寫index
// 							//value表示回傳的值

// 							   msg_data += '<tr>'
// 						       msg_data += '<td style="background-color:#F0F0F0; width: 500px;">' + value.added + '</td>'
// 						       msg_data += '<tr>'
// 						       msg_data += '<td id="msg_id">' + value.text +'</td>'
// 						       msg_data += '<tr>'
// 						       msg_data += '<td id="msg_id">' + value.text +'</td>'
						      
// 						       msg_data += '<tr>'
// 						})
// 						$('#list_table_json').append(msg_data) //想要把東西加到list_table_json內，msg_data為要加進去的東西
<!-- ----------------------------------------------------------------------------------------------------------- -->					

					},
					error : function(err) {
						console.log(err)
						alert('發生錯誤')
					}

				})

			})

		})
	</script>




</body>
</html>