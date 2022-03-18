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
<title>Insert title here</title>
<link rel="stylesheet"
	href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">
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

#mainTitleLL, #rateLL, #arthurLL{
	position: static;
	width: 300px;
	margin: auto;
	text-align: center;
}
 #shareLL {
 position: absolute;;
	width: 300px;
	margin: 0px  auto auto auto;
	align: left;
	
 }

#h1 {
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
/* 	max-width: 600px; */
/* 	height: 550px; */
	margin: auto;
	overflow: hidden;
}

#likeBar {
	display: flex;
	justify-content: center;
	margin-top: 20px;
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
	margin: 0px 10px 10px 10px;
	width: 30px;
	align: top;
}

.msg_id {
	height: 20px;
	width: 500px;
}

/* eddie的星星 */
.absolute1 {
	position: fixed;
	top: 490px;
	right:25%;
	width: 25px;
	height: 25px;

}	

/* .test { */
/* 	color: yellow; */
/* } */

button{
	width: 60px;
	margin: 3px;
	background-color: #46A3FF;
	color: white;
}

.text{
	margin: 5px;
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
			<div id="mainTitleLL" style="padding: 30px">
				<img style="width: 50px; margin-right: 20px" id="tastyId"> <img
					style="width: 50px; margin-right: 20px" id="atmosphereId"> <img
					style="width: 50px; margin-right: 20px" id="cpId">
			</div>
			<div id="arthurLL"></div>

		</div>
		<div id="topTitleLL"
			style="width: 600px; height: 500px; display: flex; justify-content: center; align-items: center;">
			<figure>
				<img src="<c:url value='/getPicture/${foodrecordById.id}'/>">
			</figure>
		</div>
		

<!--   霈的星星!!!!! -->

		<div id="likeBar" >
<!-- 			<img id="icon" src="images/like.png"> <img id="icon" -->
<!-- 				src="images/chat.png"> <img id="icon" src="images/badoo.png"> -->
			<div id="range" class="crange absolute1" onclick="likeCollections();">
				<button  class="btn"><i id="test" class="fa-star fa-regular " style="font-size:30px"></i></button>				
			</div>
			<input type="hidden" value="${foodrecordById.id}" id="clot">
		</div>
<!--   霈的星星!!!!! -->



		<div id="article">
			<div id="left">
				<div id="title">
					<h3 style="font-weight:bold;">
						類型:
						<c:out value="${foodrecordById.shopType}" />
					</h3 >
					<h4 style="font-weight:bold;">
						適合:
						<c:out value="${foodrecordById.audience}" />
					</h4>
					<p>
						<c:out value="${foodrecordById.city}" />
						<br>
						<c:out value="${foodrecordById.town}" />
						<br>
						<c:out value="${foodrecordById.shopAddress}" />
						<h5 style="font-weight:bold;"> 用餐日 </h5>
						<c:out value="${foodrecordById.businessHours}" />
						<br> <br>
						<h5 style="font-weight:bold;"> 店名 </h5>
						<c:out value="${foodrecordById.shopName}" />
						<br> <br>
						<h5 style="font-weight:bold;"> 電話 </h5>
						<c:out value="${foodrecordById.tel}" />
					</p>
				</div>
				<div id="taste">
					<h3 style="font-weight:bold;">美味</h3>
					<h6>
						<c:out value="${foodrecordById.tasty}" />
					</h6>
					<h6 style="display: none" id="score">
						<c:out value="${foodrecordById.gender}" />
					</h6>
					<img style="width: 50px;" id="tastyId2">
				</div>
				<div id="air">
					<h3 style="font-weight:bold;">氣氛</h3>
					<h6>
						<c:out value="${foodrecordById.atmosphere}" />
					</h6>
					<h6 style="display: none" id="score1">
						<c:out value="${foodrecordById.gender1}" />
					</h6>
					<img style="width: 50px;" id="atmosphereId2">
				</div>
				<div id="cpValue">
					<h3 style="font-weight:bold;">西批值</h3>
					<h6>
						<c:out value="${foodrecordById.cp}" />
					</h6>
					<h6 style="display: none" id="score2">
						<c:out value="${foodrecordById.gender2}" />
					</h6>
					<img style="width: 50px;" id="cpId2">
				</div>
				<div id="share">


					<h3 style="font-weight:bold;">分享</h3>
					<div id="shareLL">
						<div class="line-it-button" data-lang="zh_Hant"
							data-type="share-b" data-env="REAL"
							data-url="http://localhost:8080/my-project/viewById?id=${foodrecordById.id}"
							data-color="default" data-size="small" data-count="false"
							data-ver="3" style="display: none;"></div>
						<script
							src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js"
							async="async" defer="defer"></script>
						<a href="https://www.instagram.com/oldfoodman/"><img id="icon" title="老食人instagram" src="images/instagram.png"></a>

						
					</div>

				</div>
			</div>
			<div id="right">
				<div id="articleDinning">
					<p>
						<c:out value="${foodrecordById.content}" />
					</p>

					<h6 style="font-weight:bold;">
						日期:
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
							value="${foodrecordById.added}" />
					</h6>

				</div>
				<br> 
				<br> 
				<span style="color: white" id="memberId"><c:out value="${foodrecordById.member_id.id}" /></span>
				<br>
				<span style="display: none; background-color: yellow;" id="RecordId"><c:out value="${foodrecordById.id}" /></span>
				<br>
				
				<div style="margin-bottom:20px">
				<button id="submitBtn" style="float: right; margin: 5px">發佈</button>
				<input id="myMessage"
					style="width: 620px; border-color: lightgray; float: right; border-radius: 10px;"
					placeholder="留言..."></input> <br><br>
					
				</div>

				



		<!--  ---看留言---------------------------------------------------- -->
				
				<div id="showMsg" class="card">
					<c:forEach var="msg" items="${mlbri}">
						<div class="card-header">
							<span>會員ID : <c:out value="${msg.member_id.id}" /></span> 
							<span style="float: right">時間 :<c:out value="${msg.added}" /></span>
						</div>
						<div class="card-body">
								<button class="deleteBtn" id="deleteBtn" onclick="return confirm('確認刪除?')" value="<c:out value="${msg.id}" />">刪除</button>
								<button class="editBtn" id="editBtn" value="<c:out value="${msg.id}" />">修改</button>
								<button style="display: none" class="sendBtn" id="sendBtn" value="<c:out value="${msg.id}" />">送出</button>
								<input class="inputMsg" style="display: none; width: 600px"  type="text" value="<c:out value="${msg.text}" />">
								<div class="text"><c:out value="${msg.text}" />
							<p style="display: none" class="msgId"><c:out value="${msg.id}" />
							<p style="display: none" ><c:out value="${msg.record_id.id}" />
							</div>
						</div>
					</c:forEach>
				</div>

				<!--  ---Ajax顯示留言---------------------------------------------------- -->
				<div id="ajaxMsg" class="card"></div>
				<!--  ------------------------------------------------------- -->

			</div>
		</div>
	</div>

	<script>
	window.onload =(function(){
		var memberId = document.getElementById("memberId").innerText;
		console.log("memberId = "+memberId);
	})
	
	$(document).ready(function(){
		
		//新增留言
		$(document).on('click','#submitBtn',function(){
			var inputText = document.getElementById('myMessage').value; //先抓到Input內的資料， 並給他一個變數
		 		console.log("inputText = "+inputText);
			var dtoObject = {"message" : inputText} //將inputText放到一個物件內 {"Dto的Key": 值(就是前面的inputText)}，這時還是一個物件
				console.log("dtoObject = "+dtoObject);
			var dtoJsonString = JSON.stringify(dtoObject); //將物件轉成JSON。用stringify才能將物件轉成JSON的字串
				console.log("dtoJsonString = "+dtoJsonString);
			var memberId = document.getElementById("memberId").innerText;
			var reocrdId = document.getElementById("RecordId").innerText;	
							console.log("reocrdId = "+reocrdId);
			
			
			$.ajax({
				url : 'http://localhost:8080/oldFoodMan/api/postMessage',
				contentType : 'application/json; charset=UTF-8', // 送過去的格式
				dataType : 'json', // 傳回來的
				method : 'post',
				data : dtoJsonString, //送過去的東西
				
				success : function(result){
					$('#showMsg').remove()
					  $('#ajaxMsg').empty()
					var msg_data = '';
					$.each(result, function(index, value){
						msg_data += '<div id="showMsg" class="card">'
						msg_data += '<div class="card-header">'
						msg_data += '<span>'+"會員ID :"+memberId+'</span>' 
						msg_data += '<span style="float: right">'+"時間 :"+value.added+'</span>'
						msg_data += '</div>'
						msg_data += '<div class="card-body">'
						msg_data += '<button class="deleteBtn" id="deleteBtn" onclick="return confirm('+"確認刪除?"+')" value="' + value.id +'">'+"刪除"+'</button>'
						msg_data += '<button class="editBtn" id="editBtn" value="' + value.id +'">'+"修改"+'</button>'
						msg_data += '<button style="display: none" class="sendBtn" id="sendBtn" value="' + value.id +'">'+"送出"+'</button>'
						msg_data += '<br>'
						msg_data += '<input class="inputMsg" style="display: none; width: 600px" id="' + value.id +'" type="text" value="<c:out value="${msg.text}" />">'				
						msg_data += '<div class="text">'+value.text
// 						msg_data += "留言ID:"+'<p class="msgId">'+value.id
// 						msg_data += '<p>'+"食記ID:"+reocrdId
						msg_data += '</div>'
						msg_data += '</div>'
						msg_data += '</div>'
					})
					$('#ajaxMsg').append(msg_data)
				},
				error : function(err) {
					console.log(err)
					alert('新增留言發生錯誤')
				}
				
			})	
		}) //新增留言end
		
		//顯示留言
		$(document).on('click','.editBtn',function(){
			var msgId = $(this).parent().find('.editBtn').val();  //取得目前的留言id
				console.log("msgId = "+msgId);
			var showInputMsg = $(this).parent().find('.text').text()  //找到目前div標籤內的留言
				console.log("showInputMsg = "+showInputMsg);
			var showSendBtn = $('#sendBtn').show()	     //顯示送出的按鈕
			var showInputMsg = $(this).parent().find('.inputMsg').show() //顯示出目前的留言欄位
			$(this).after(showSendBtn,showInputMsg); //點擊修改後顯示修改的input即送出的按鈕
			
			
			$.ajax({
				url:'http://localhost:8080/oldFoodMan/updateMsg/'+msgId,
				contentType:'application/json; charset=UTF-8', //送過去的格式
				dataType:'JSON',//傳回前端的格式
				method: 'post', //get or post
				
				success : function(result){
					
				},
				error : function(err){
					console.log(err)
					alert('編輯發生錯誤')
				}
			})
		})   //修改留言結束
		
		
		//將更新留言存進資料庫
		$(document).on('click','.sendBtn',function(){
			var msgId = $(this).parent().find('.editBtn').val();  //取得目前的留言id
				console.log("msgId = "+msgId);
			var newText = $(this).parent().find('.inputMsg').val(); //先抓到Input內的資料， 並給他一個變數
				console.log("newText = "+newText);
			var editObject = {"message" : newText} //將inputText放到一個物件內 {"Dto的Key": 值(就是前面的inputText)}，這時還是一個物件
				console.log("editObject = "+editObject);
			var editJsonString = JSON.stringify(editObject); //將物件轉成JSON。用stringify才能將物件轉成JSON的字串
				console.log("editJsonString = "+editJsonString);
			var memberId = document.getElementById("memberId").innerText; 	
				console.log("memberId = "+memberId);
			var reocrdId = document.getElementById("RecordId").innerText;	
				console.log("reocrdId = "+reocrdId);
			
			$.ajax({
				url:'http://localhost:8080/oldFoodMan/saveNewMsg/'+msgId,
				contentType:'application/json; charset=UTF-8', //送過去的格式
				data:editJsonString, //送去server的資料
				dataType:'JSON',
				method:'post',
				
				success : function(result){
						$('#inputMsg').hide()
						$('#sendBtn').hide()
						  $('#showMsg').remove()
						  $('#ajaxMsg').empty()
					console.log(result);
					var msg_data = '';
					$.each(result, function(index, value){
						msg_data += '<div id="showMsg" class="card">'
						msg_data += '<div class="card-header">'
						msg_data += '<span>'+"會員ID :"+memberId+'</span>' 
						msg_data += '<span style="float: right">'+"時間 :"+value.added+'</span>'
						msg_data += '</div>'
						msg_data += '<div class="card-body">'
						msg_data += '<button class="deleteBtn" id="deleteBtn" onclick="return confirm('+"確認刪除?"+')" value="' + value.id +'">'+"刪除"+'</button>'
						msg_data += '<button class="editBtn" id="editBtn" value="' + value.id +'">'+"修改"+'</button>'
						msg_data += '<button style="display: none" class="sendBtn" id="sendBtn" value="' + value.id +'">'+"送出"+'</button>'
						msg_data += '<br>'
						msg_data += '<input class="inputMsg" style="display: none; width: 600px" id="' + value.id +'" type="text" value="<c:out value="${msg.text}" />">'				
						msg_data += '<div class="text">'+value.text
// 						msg_data += "留言ID:"+'<p class="msgId">'+value.id
// 						msg_data += '<p>'+"食記ID:"+reocrdId
						msg_data += '</div>'
						msg_data += '</div>'
						msg_data += '</div>'
					})
					$('#ajaxMsg').append(msg_data)
				},
				error : function(err){
					console.log(err)
					alert('編輯發生錯誤')
				}
			})
			
		}) //更新留言結束
		
		
		//刪除留言
		$(document).on('click','.deleteBtn',function(){
			var msgId = $(this).parent().find('.deleteBtn').val();  //取得目前的留言id
			console.log("msgId = "+msgId);
			
			var memberId = document.getElementById("memberId").innerText; 
			console.log("memberId = "+memberId);
			var reocrdId = document.getElementById("RecordId").innerText;		
			console.log("reocrdId = "+reocrdId);
			
			$.ajax({
				url : 'http://localhost:8080/oldFoodMan/deleteMsg/'+msgId,
				contentType : 'application/json; charset=UTF-8', // 送過去的格式
				dataType : 'json', // 傳回來的
				method : 'post',
				
				success : function(result){
					$('#showMsg').remove()
					  $('#ajaxMsg').empty()
					var msg_data = '';
					$.each(result, function(index, value){
						msg_data += '<div id="showMsg" class="card">'
						msg_data += '<div class="card-header">'
						msg_data += '<span>'+"會員ID :"+memberId+'</span>' 
						msg_data += '<span style="float: right">'+"時間 :"+value.added+'</span>'
						msg_data += '</div>'
						msg_data += '<div class="card-body">'
						msg_data += '<button class="deleteBtn" id="deleteBtn" onclick="return confirm('+"確認刪除?"+')" value="' + value.id +'">'+"刪除"+'</button>'
						msg_data += '<button class="editBtn" id="editBtn" value="' + value.id +'">'+"修改"+'</button>'
						msg_data += '<button style="display: none" class="sendBtn" id="sendBtn" value="' + value.id +'">'+"送出"+'</button>'
						msg_data += '<br>'
						msg_data += '<input class="inputMsg" style="display: none; width: 600px" id="' + value.id +'" type="text" value="<c:out value="${msg.text}" />">'				
						msg_data += '<div class="text">'+value.text
// 						msg_data += "留言ID:"+'<p class="msgId">'+value.id
// 						msg_data += '<p>'+"食記ID:"+reocrdId
						msg_data += '</div>'
						msg_data += '</div>'
						msg_data += '</div>'
					})
					$('#ajaxMsg').append(msg_data)
				},
				error : function(err){
					console.log(err)
					alert('刪除留言發生錯誤')
					}
			})
		})   //刪除留言結束
		

	}) //document.ready
	
	
	
	
	
	
	
	

	function setScore() {
		var score=document.getElementById("score").innerText;  //得到評分1-5
		document.getElementById("tastyId").src="images/scoreImages/"+${'score'}+".png"; 
		}
	function setScore1() {
		var score1=document.getElementById("score1").innerText;  //得到評分1-5
		document.getElementById("atmosphereId").src="images/scoreImages/"+${'score1'}+".png"; 
		}
	function setScore2() {
		var score2=document.getElementById("score2").innerText;  //得到評分1-5
		document.getElementById("cpId").src="images/scoreImages/"+${'score2'}+".png"; 
		}
		setScore()  //呼叫function
		setScore1()  //呼叫function
		setScore2()  //呼叫function
		
	function setScore3() {
		var score=document.getElementById("score").innerText;  //得到評分1-5
		document.getElementById("tastyId2").src="images/scoreImages/"+${'score'}+".png"; 
		}
	function setScore4() {
		var score1=document.getElementById("score1").innerText;  //得到評分1-5
		document.getElementById("atmosphereId2").src="images/scoreImages/"+${'score1'}+".png"; 
		}
	function setScore5() {
		var score2=document.getElementById("score2").innerText;  //得到評分1-5
		document.getElementById("cpId2").src="images/scoreImages/"+${'score2'}+".png"; 
		}
		setScore3()  //呼叫function
		setScore4()  //呼叫function
		setScore5()  //呼叫function


	
	</script>

	<!-- Eddie -->
	<script>
// 	網頁載入分辨是否有資料給予樣式
	$(document).ready(function() {
		
	var record_id = document.getElementById("clot").value;
	
	$.ajax({
		url : 'http://localhost:8080/oldFoodMan/findCollections?record_id='+ record_id,
		contentType : 'application/json ; charset=UTF-8',
	
		method : 'get',
		success : function(data) {
			console.log(data);
//				
			
			if(data.record_id == null ){
				
// 				$("#test").css("color","white");
				$("#test").addClass("fa-star fa-regular ");
				
			}else{
// 				$("#test").css("color","black");
				$("#test").addClass("fa-star fa-solid ");
				
			}

							
		},
		error : function(err) {
			console.log(err)
			alert('發生錯誤')
		}

	})
	})
	</script>


	<script>
	

	function likeCollections() {  //收藏食記

		var record_id = document.getElementById("clot").value;	
	
// 		var dtoObject = {
// 			"likelocations" : inputResName,
// 			"member_id":Member_id,
// 			}
// 		var dtoJsonString = JSON.stringify(dtoObject);	
 					
		$.ajax({
			url : 'http://localhost:8080/oldFoodMan/likeCollections?record_id='+ record_id,
			contentType : 'application/json; charset=UTF-8',
// 			dataType : 'json',
			method : 'post',
// 			data : dtoJsonString,
			
			success : function(data) {
				
				console.log(data.record_id);
				if(data.record_id == null ){
					
// 					$("#test").css("color","black");
					$("#test").addClass("fa-star fa-solid ");
					alert('已收藏成功');
					
				}else{
// 					$("#test").css("color","white");
					$("#test").removeClass("fa-star fa-solid ").addClass('fa-star fa-regular');
					
				}
				
				
				
				
		
			}	

		})
	
		 		
		}
	</script>

	<script>
	
	function deleteCollections() {  //刪除食記

		var record_id = document.getElementById("clot").value;
		
	
// 		console.log(memberId);
// 		var dtoObject = {
// 			"likelocations" : inputResName,
// 			"member_id":Member_id,
// 			}
// 		var dtoJsonString = JSON.stringify(dtoObject);	
// 			console.log(dtoJsonString);		
		$.ajax({
			url : 'http://localhost:8080/oldFoodMan/deleteCollections?record_id='+ record_id,
			contentType : 'application/json; charset=UTF-8',
// 			dataType : 'json',
			method : 'get',
// 			data : dtoJsonString,
			
			success : function(result) {	
				
// 				console.log(result)				
				alert('已刪除收藏');
		
			}	

		})
	
		 		
		}	
	
	</script>




</body>
</html>