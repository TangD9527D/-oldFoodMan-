<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
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
		<div id="mainTitleLL" style="padding:30px" >
				<img style="width: 50px; margin-right:20px" id="tastyId">
				<img style="width: 50px; margin-right:20px" id="atmosphereId">
				<img style="width: 50px; margin-right:20px" id="cpId">
			</div>
			<div id="arthurLL">
		
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
					<h6 >
						<c:out value="${foodrecordById.tasty}" />
					</h6>
					<h6  style="display: none" id="score"><c:out value="${foodrecordById.gender}" /></h6>
					<img style="width: 50px;" id="tastyId2">
				</div>
				<div id="air">
					<h3>氣氛</h3>
					<h6>
						<c:out value="${foodrecordById.atmosphere}" />
					</h6>
					<h6  style="display: none" id="score1"><c:out value="${foodrecordById.gender1}" /></h6>
					<img style="width: 50px;" id="atmosphereId2">
				</div>
				<div id="cpValue">
					<h3>西批值</h3>
					<h6>
						<c:out value="${foodrecordById.cp}" />
					</h6>
					<h6  style="display: none" id="score2"><c:out value="${foodrecordById.gender2}" /></h6>
					<img style="width: 50px;" id="cpId2">
				</div>
				<div id="share">
				
				
					<h3>分享</h3>
					<div id="shareLL">
						<div class="line-it-button" data-lang="zh_Hant"
							data-type="share-b" data-env="REAL"
							data-url="http://localhost:8080/my-project/viewById?id=${foodrecordById.id}"
							data-color="default" data-size="small" data-count="false"
							data-ver="3" style="display: none;"></div>
						<script
							src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js"
							async="async" defer="defer"></script>

						<img id="icon" title="Facebook分享" src="images/facebook.png">
					</div>
					
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

				</div>
				<br>
				<br>

				<button id="submitBtn" style="float: right; margin: 5px">發佈</button>
				<input id="myMessage" style="width: 500px; border-color: lightgray; float: right; border-radius: 10px;"
					placeholder="留言..."></input> <br>
				<br>
				
		
<!--  ---看留言---------------------------------------------------- -->	
				<div id="showMsg" class="card">
					<c:forEach var="msg" items="${msg_page.content}"> 
					<div class="card-header">時間 :<c:out value="${msg.added}" /></div>
					<div class="card-body">
						<p class="card-text">
						<a id="deleteBtn"  onclick="return confirm('確認刪除?')" class="btn btn-primary">刪除</a><br>
						食記ID:<c:out value="${msg.record_id.id}" /><br>
						會員ID:<c:out value="${msg.member_id.id}" /><br>
						<p id="msgId"><c:out value="${msg.id}" /></p><br>
					    <c:out value="${msg.text}" />
						</p>
						
					</div>
					</c:forEach>
				</div>
				
	
<!--  ---看留言---------------------------------------------------- -->

<!--  		<div class="row justify-content-center">  -->
<!--  			<div class="col-9"> -->
<%-- 				<c:forEach var="pageNumber" begin="1" end="${msg_page.totalPages}"> --%>

<%-- 					<c:choose> --%>
<%-- 						<c:when test="${pageNumber-1 != msg_page.number}"> --%>
<%-- 							<a href="${contextRoot}/totalRecord?p=${pageNumber}"><c:out value="${pageNumber}" /> </a> --%>
<%-- 						</c:when> --%>

<%-- 						<c:otherwise> --%>
<%-- 							<c:out value="${pageNumber}"></c:out> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>

<%-- 					<c:if test="${pageNumber != msg_page.totalPages}">|</c:if> --%>

<%-- 				</c:forEach> --%>
<!--  			</div> -->
<!-- 		</div>  -->
<!--  ---Ajax顯示留言---------------------------------------------------- -->
				
				<div id="ajaxMsg" class="card">	
				</div>
<!--  ------------------------------------------------------- -->		

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
					data : dtoJsonString, //送過去的東西
					success : function(result) { //成功送過去後
						 $('#showMsg').remove()
						  $('#ajaxMsg').empty()
					console.log(result);
					var msg_data = '';
					$.each(result, function(index, value){     
						
						msg_data += '<div class="card-header">'+"時間 : "+value.added +'</div>'
						msg_data += '<p class="card-text">'
						msg_data += '<a id="deleteBtn" onclick="return confirm('+"確認刪除?"+')" class="btn btn-primary">'+'刪除'+'</a>'
						msg_data += '<br>'+"會員ID:"+value.member_id
						msg_data += '<br>'+"文章ID:"+value.record_id
						msg_data += '<br>'+"留言ID:"+value.id
			            msg_data += '<br>'+value.text   
			            msg_data += '</p>'
			            msg_data += '<br>'	           
			        })
						$('#ajaxMsg').append(msg_data)
					},
					error : function(err) {
						console.log(err)
						alert('新增留言發生錯誤')
					}
				})
			})
			
			//刪除留言
			$('#deleteBtn').click(function() {		
				
				var msgId=document.getElementById("msgId").innerText; 	  //文章id		
				var typeOf = typeof(msgId);  //目前為字串
// 				alert("msgId = "+msgId);
// 				alert("typeOf = "+typeOf);
				
				$.ajax({
					url : 'http://localhost:8080/oldFoodMan/deleteMsg/'+msgId,
					contentType : 'application/json; charset=UTF-8', // 送過去的格式
					dataType : 'json', // 傳回來的
					method : 'post',
					success : function(result) { //成功送過去後
						 $('#showMsg').remove()
						  $('#ajaxMsg').empty()
					console.log(result);
					var msg_data = '';
					$.each(result, function(index, value){     
						
						msg_data += '<div class="card-header">'+"時間 : "+value.added +'</div>'
						msg_data += '<p class="card-text">'
						msg_data += '<a id="deleteBtn" onclick="return confirm('+"確認刪除?"+')" class="btn btn-primary">'+'刪除'+'</a>'
						msg_data += '<br>'+"會員ID:"+value.member_id
						msg_data += '<br>'+"文章ID:"+value.record_id
						msg_data += '<br>'+"留言ID:"+value.id
			            msg_data += '<br>'+value.text   
			            msg_data += '</p>'
			            msg_data += '<br>'  
			        })
						$('#ajaxMsg').append(msg_data)
					},
					error :function(err){
						console.log(err)
						alert('刪除留言發生錯誤')
					}
				})
			})
		

	//根據評分顯示圖片
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
		})
	</script>




</body>
</html>
