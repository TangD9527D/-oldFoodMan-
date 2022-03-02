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
	height: 350px;
	margin: auto;
	/* align-items: center;
            justify-content: center; */
}

#mainTitleLL, #rateLL, #arthurLL, #shareLL {
	position: static;
	width: 300px;
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
</style>
</head>
<body>

	<div id="main">
		<div id="topTitleLL">
			<div id="mainTitleLL">
				<h1>
					<c:out value="${lastestFoodRecord.title}" />
				</h1>

				<c:out value="${foodrecordById.gender}" />
				<c:out value="${foodrecordById.gender1}" />
				<c:out value="${foodrecordById.gender2}" />
			</div>

			<div id="arthurLL">
				<h5>作者 蘋果馬丁尼 @croissantoffee</h5>
			</div>
			<div id="shareLL">
				<img id="icon" src="images/LINE_icon.png"> <img id="icon"
					src="images/instagram.png"> <img id="icon"
					src="images/facebook.png">
			</div>
		</div>
		<figure>
			<img src="imgLL/02.jpg">
		</figure>
		<div id="likeBar">
			<img id="icon" src="images/like.png"> <img id="icon"
				src="images/chat.png"> <img id="icon" src="images/badoo.png">
		</div>
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
						<br> <br>
						<c:out value="${lastestFoodRecord.town}" />
						<br>
						<c:out value="${lastestFoodRecord.shopAddress}" />
						<br> <br> 營業時間<br>
						<c:out value="${lastestFoodRecord.businessHours}" />
						<br> <br> 電話<br>
						<c:out value="${lastestFoodRecord.tel}" />
					</p>
				</div>
				<div id="taste">
					<h3>美味</h3>
					<h6>
						<c:out value="${lastestFoodRecord.tasty}" />
					</h6>
					<img src="imgLL/01.jpg">
				</div>
				<div id="air">
					<h3>氣氛</h3>
					<h6>
						<c:out value="${lastestFoodRecord.atmosphere}" />
					</h6>
					<img src="imgLL/01.jpg">
				</div>
				<div id="cpValue">
					<h3>西批值</h3>
					<h6>
						<c:out value="${lastestFoodRecord.cp}" />
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
						<c:out value="${lastestFoodRecord.content}" />
					</p>

					<h6>
						日期:
						<c:out value="${lastestFoodRecord.added}" />
					</h6>
					<h6>
						標籤:
						<c:out value="${lastestFoodRecord.tag}" />
					</h6>
				</div>

				<div class="card">
					<h5 class="card-header">Featured</h5>
					<div class="card-body">
						<h5 class="card-title">Special title treatment</h5>
						<p class="card-text">With supporting text below as a natural
							lead-in to additional content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>