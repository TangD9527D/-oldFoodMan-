<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../menu.jsp"/>
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
					<c:out value="${lastestFoodRecord.title}" />
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
			<img src="<c:url value='/getPicture/${lastestFoodRecord.id}'/>">
		</figure>
		</div>
<!-- 		<div id="likeBar"> -->
<!-- 			<img id="icon" src="images/like.png"> <img id="icon" -->
<!-- 				src="images/chat.png"> <img id="icon" src="images/badoo.png"> -->
<!-- 		</div> -->
		<div id="article">
			<div id="left">
				<div id="title">
					<h3>
						類型:
						<c:out value="${lastestFoodRecord.shopType}" />
					</h3>
					<h4>
						適合:
						<c:out value="${lastestFoodRecord.audience}" />
					</h4>
					<p>
						<c:out value="${lastestFoodRecord.city}" />
						<br>
						<c:out value="${lastestFoodRecord.town}" />
						<br>
						<c:out value="${lastestFoodRecord.shopAddress}" />
						<br> <br> 用餐日<br>
						<c:out value="${lastestFoodRecord.businessHours}" />
						<br> <br> 餐廳<br>
						<c:out value="${foodrecordById.shopName}" />
						<br> <br> 電話<br>
						<c:out value="${lastestFoodRecord.tel}" />
					</p>
				</div>
				<div id="taste">
					<h3>美味</h3>
					<h6 >
						<c:out value="${lastestFoodRecord.tasty}" />
					</h6>
					<h6  style="display: none" id="score"><c:out value="${lastestFoodRecord.gender}" /></h6>
					<img style="width: 50px;" id="tastyId2">
				</div>
				<div id="air">
					<h3>氣氛</h3>
					<h6>
						<c:out value="${lastestFoodRecord.atmosphere}" />
					</h6>
					<h6  style="display: none" id="score1"><c:out value="${lastestFoodRecord.gender1}" /></h6>
					<img style="width: 50px;" id="atmosphereId2">
				</div>
				<div id="cpValue">
					<h3>西批值</h3>
					<h6>
						<c:out value="${lastestFoodRecord.cp}" />
					</h6>
					<h6  style="display: none" id="score2"><c:out value="${lastestFoodRecord.gender2}" /></h6>
					<img style="width: 50px;" id="cpId2">
				</div>
				<div id="share">
				
				
					<h3>分享</h3>
					<div id="shareLL">
						<div class="line-it-button" data-lang="zh_Hant"
							data-type="share-b" data-env="REAL"
							data-url="http://localhost:8080/my-project/viewById?id=${lastestFoodRecord.id}"
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
						<c:out value="${lastestFoodRecord.content}" />
					</p>

					<h6>
						日期:
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
							value="${lastestFoodRecord.added}" />
					</h6>
				</div>


			</div>
		</div>
	</div>

	<script>
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
	
	</script>


</body>
</html>