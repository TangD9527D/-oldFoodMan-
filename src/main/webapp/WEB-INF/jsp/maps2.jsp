<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodSearch</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<!-- <link rel="stylesheet" type="text/css" href="./style.css" /> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="shortcut icon" href="/images/favicon.png" />
<!-- 改為老食人小圖 -->

<style>
.allpage {
	width: 70%;
	height: 100%;
	margin: 10px auto;
	/* float: left; */
}

#map {
	width: 100%;
	height: 68%;
	margin: 5px auto;
	/* float: left; */
}

/* Optional: Makes the sample page fill the window. */
html {
	height: 100%;
	/* margin: 0;
    padding: 0; */
}

body {
	height: 100%;
	background-color: #fbf3f3;
	/* 	background-image:url("http://localhost:8080/oldFoodMan/images/oldfoodman.png"); */
	/* 	background-color: #ffefcd; */
	/* 	border: 1px solid #e6d6b4; */
	/*  	background-image: -o-linear-gradient(bottom, #ffffe6 0%, #ffefcd 100%);  */
	/* /* 	background-image: -moz-linear-gradient(bottom, #ffffe6 0%, #ffefcd 100%); */
	*/
	/* 	background-image: -webkit-linear-gradient(bottom, #ffffe6 0%, #ffefcd 100%);  */
	/* /* 	background-image: -ms-linear-gradient(bottom, #ffffe6 0%, #ffefcd 100%); */
	*/
	/* /* 	background-image: linear-gradient(to bottom, #ffffe6 0%, #ffefcd 100%); */
	*/
	/*  	-webkit-box-shadow: inset 0 1px 0 #ffffff;  */
	/*  	-moz-box-shadow: inset 0 1px 0 #ffffff;  */
	/*  	box-shadow: inset 0 1px 0 #ffffff;  */
	/*  	text-shadow: 0 1px 0 #ffffff;  */
	/* /* 	color: #e6d6b4; */
	*/
}

#description {
	font-family: fantasy;
	font-size: 15px;
	font-weight: 300;
}

#infowindow-content .title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}

.pac-card {
	background-color: #fff;
	border: 0;
	border-radius: 2px;
	box-shadow: 0 1px 4px -1px rgba(0, 0, 0, 0.3);
	margin: 10px;
	padding: 0 0.5em;
	font: 400 18px fantasy, Arial, sans-serif;
	/* overflow: hidden; */
	font-family: fantasy;
	padding: 0;
}

#pac-container {
	padding-bottom: 12px;
	margin-right: 12px;
}

.pac-controls {
	/* display: inline-block; */
	/* padding: 5px 11px; */
	margin: 15px auto;
}

.pac-controls label {
	font-family: fantasy;
	font-size: 13px;
	font-weight: 300;
}

#pac-input {
	background-color: #fff;
	font-family: fantasy;
	font-size: 15px;
	font-weight: 300;
	/* margin-left: 12px;
    padding: 0 11px 0 13px; */
	/* text-overflow: ellipsis; */
	width: 400px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

#title {
	color: #fff;
	background-color: #4d90fe;
	font-size: 25px;
	font-weight: 500;
	padding: 6px 12px;
}

#target {
	width: 345px;
}

#input {
	font-size: 30px;
	font-family: fantasy;
	line-height: 30px;
	width: 100%;
	font-weight: 300px;
	color: black;
	border-radius: 10px;
	background: #FDE4DE;
	text-align: center;
}

.inputdiv {
	width: 100%;
	margin: 5px auto;
}

.inputdivv {
	width: 100%;
	margin: 5px auto;
	float: right;
}

#delete-markers {
	float: right;
}

#show-markers {
	float: right;
}

#hide-markers {
	float: right;
}

.allrange {
	text-align: justify;
	width: 100%;
	/*   	display: flex;   */
	height: 170%;
	background-image:;
	background-position: center;
}

#range {
	border: 0.5px solid transparent;
	width: 100%;
	text-align: justify;
	justify-content: center;
}

#range1 {
	border: 0.5px solid transparent;
	text-align: justify;
	width: 100%;
	align-items: center;
}



#p1 {
	float: left;
	margin-top: 25px;
	margin-left: 2%;
	background-color:#fbf3f3;

}

#p2 {
	float: left;
	margin-top: 25px;
	margin-left: 2%;
	width: 100%;
	background-color:#fbf3f3;
	overflow:hidden;
	border: 3px solid #E6E6F2 ;
	box-shadow: 2px 2px 5px #E6E6F2;

}



#box {
	width: 100%;
	padding: 10px;
	height: 150px;
	margin: 10px auto;
}

#p {
	font-size:20px;
	line-height:0.7cm;
	overflow: hidden;
	display: -webkit-box;
	text-overflow: ellipsis;
	-webkit-line-clamp: 2; /*行數*/
	-webkit-box-orient: vertical;
	white-space: normal;
}

#star {
	float: right;
}

#right {
	position: absolute;
	bottom: 3px;
	color:	#ADADAD;
}

#location {
	border: 5px solid #FDE4DE;
	float: right;
	width: 14%;
	margin: 50px auto;
	border-radius: 15px;
}

#location1 {
	float: right;
	width: 100%;
	height: 80%;
	margin: 0.1px auto;
	border-radius: 20PX;
	text-align: justify;
}

#li {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1; /*行數*/
	-webkit-box-orient: vertical;
	white-space: normal;
	text-align: justify;
}

.test1 {
	width: 100%;
	margin: 0px auto;
}

.test2 {
	width: 100%;
	margin: 0px auto;
}

.display {
	display: none;
}
.imgsize{

width: 13rem; 
height: 14rem;
display: block;
margin: 25px auto;

}

.acolor{

color:black;
text-decoration:none;

}
.acolor:hover{

color:orange;


}

.imgsize 
{

transform:scale(1);transition: all 0.3s ease-in-out;

}

.imgsize:hover{

transform:scale(1.2,1.2);

}
.spantime{

/* background-color:#FA92B1; */

}



</style>


</head>
<body>
	

		
	<div id="location">
		<h4 style="text-align: center; padding-top: 20px">
			收藏的地點<i class="fa-regular fa-star"></i>
		</h4>
		<hr style="color: #FDE4DE; border: 5px solid #FDE4DE">
		<div id="location1"></div>

		<form:form class="form" action="${contextRoot}/main"
			modelAttribute="member" method="post">
			<div class="form-group col-md-6">
				<input type="hidden" id="member_id2" value="${member.id}"
					class="form-control" required>
			</div>
		</form:form>

		<input type="hidden" id="member_id" value="${member_id}"
			class="form-control" required>

	</div>

	<div class="allpage">
		<!--整個頁面的65%-->
		<div class="inputdiv">
			<!--allpage的65%-->
			<input id="input" class="btn btn-secondary" type="search"
				placeholder="Search Food & record" />
		</div>

		<div id="map"></div>

		<div class="inputdivv">
			<input id="delete-markers" class="btn btn-outline-danger btn-sm"
				type="button" value="DeleteMark" /> <input id="show-markers"
				class="btn btn-outline-secondary btn-sm" type="button"
				value="ShowMark" /> <input id="hide-markers"
				class="btn btn-outline-dark btn-sm" type="button" value="HideMark" />

			<button id="star" onclick="" class="btn btn-outline-secondary btn-sm">
				<i class="fa-solid fa-star"></i>收藏地點
			</button>

			<!--  -->

		</div>


		<div class="allrange">
			<div><a href="http://localhost:8080/oldFoodMan/main" class="btn btn-outline-secondary">最新文章</a></div>
			<div class="test2">
				<div id="xxx">
					<span id="rangetype" class="btn btn-outline-primary display"></span>

					<div id="range1"></div>

				</div>
			</div>

			<div class="test1">
				<div id="xxx">
					<div id="range" class="">
						<c:forEach var="maps" items="${page.content}">
							<div class="card " style="width:15rem" id="p2">
								<a   
									href="http://localhost:8080/oldFoodMan/viewById?id=${maps.id}"  ><img
									id="img" src="<c:url value='/getPicture/${maps.id}'/>"
									 class="card-img-top imgsize"
									alt="..."></a>
								<div id="box" class="card-body">
									<a	href="http://localhost:8080/oldFoodMan/viewById?id=${maps.id} " title="${maps.title}" class="acolor"><span id="p" class="card-title"
										style="background-color: #FFC2C3; text-align: center">${maps.title}</span></a>
									<h5 id="p" class="card-text">${maps.content}</h5>
									

									<div id="right">
										<span class="spantime">上傳時間:&nbsp&nbsp&nbsp&nbsp&nbsp</span><fmt:formatDate pattern="yyyy/MM/dd" value="${maps.added}" />
									</div>

								</div>
							</div>
						</c:forEach>

					</div>

				</div>
			</div>
		</div>
		<!-- 分頁頁碼 -->

		<div>
			<!-- 			<div class="pagination"
			> -->
			<%-- 				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>

			<%-- 					<c:choose> --%>

			<%-- 						<c:when test="${page.number != pageNumber -1}"> --%>

			<!-- 							<li class="page-item"><a class="page-link" -->
			<%-- 								href="${contextRoot}/main?p=${pageNumber}"><c:out --%>
			<%-- 										value="${pageNumber} "></c:out></a></li> --%>

			<%-- 						</c:when> --%>
			<%-- 						<c:otherwise> --%>
			<!-- 							<li class="page-item active" aria-current="page"><span -->
			<%-- 								class="page-link"><c:out value="${pageNumber} " /></span></li> --%>
			<%-- 						</c:otherwise> --%>

			<%-- 					</c:choose> --%>
			<%-- 					<c:if test="${pageNumber != page.totalPages}"> --%>

			<%-- 					</c:if> --%>
			<%-- 				</c:forEach> --%>

			<!-- 			</div> -->
		</div>

		<footer class="pt-3 mt-4 text-muted border-top">
      <div style="margin:50px;">&copy; 2022</div>
    </footer>
	
	</div>




	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->

	<!--放置google 金鑰 -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYVCE1KOn8S2V58aPcTnKPSyJ7FqeIcRo&callback=initAutocomplete&libraries=places&v=weekly"
		async>
	</script>

	<script>
	 let map;
     let markers = [];
//      $(document).ready(
    window.onload = function initAutocomplete() {
         map = new google.maps.Map(document.getElementById("map"), {
             center: { lat: 25.033943646794558, lng: 121.54341199736278 },//設立資展國際中心為地圖中心點
             zoom: 19, //數字越大，街道越明顯
             mapTypeId: "roadmap", //顯示默認的路線圖視圖。這是默認的地圖類型。
         });       

         var location = { lat: 25.033943646794558, lng: 121.54341199736278 };

              document
             .getElementById("show-markers")
             .addEventListener("click", showMarkers);
         document
             .getElementById("hide-markers")
             .addEventListener("click", hideMarkers);
         document
             .getElementById("delete-markers")
             .addEventListener("click", deleteMarkers);
         // Adds a marker at the center of the map.
         addMarker(location);



         // Create the search box and link it to the UI element.
         const input = document.getElementById("input");
         const searchBox = new google.maps.places.SearchBox(input);

         // map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
         // Bias the SearchBox results towards current map's viewport.
         map.addListener("bounds_changed", () => {  //邊界改變
             searchBox.setBounds(map.getBounds());
         });

         let markers = [];

         // Listen for the event fired when the user selects a prediction and retrieve
         // more details for that place.
         searchBox.addListener("places_changed", () => { // 地點改變
             const places = searchBox.getPlaces();

             if (places.length == 0) {
                 return;
             }

             // Clear out the old markers.
             markers.forEach((marker) => {
                 marker.setMap(null);
             });
             markers = [];

             // For each place, get the icon, name and location.
             const bounds = new google.maps.LatLngBounds();

             places.forEach((place) => {
                 if (!place.geometry || !place.geometry.location) {
                     console.log("Returned place contains no geometry");
                     return;
                 }

                 const icon = {
                     url: "<c:url value='/images/snow.png'/>", //搜尋後所標記的圖片                        
                     size: new google.maps.Size(71, 71),
                     anchor: new google.maps.Point(20, 34),  //標記點的偏移度
                     scaledSize: new google.maps.Size(60, 60),//圖片大小
                 };

                 // Create a marker for each place.
                 markers.push(
                     new google.maps.Marker({
                         map,
                         icon,
                         title: place.name,
                         position: place.geometry.location,
                         // draggable: true,
                         animation: google.maps.Animation.BOUNCE,
                     })
                 );
                 if (place.geometry.viewport) {
                     // Only geocodes have viewport.
                     bounds.union(place.geometry.viewport);
                 } else {
                     bounds.extend(place.geometry.location);
                 }
             });
             map.fitBounds(bounds);
         });
     }
//      )



     function addMarker(position) {
         const marker = new google.maps.Marker({  // new google地圖  並指定經緯度為資展國際、標記落下彈跳、自訂圖示及標記訊息
             position: { lat: 25.033943646794558, lng: 121.54341199736278 },
             map,
             animation: google.maps.Animation.BOUNCE, //設定圖示顯示樣式為跳躍
             title: "Hello World!",
             icon: "<c:url value='/images/snow.png'/>",
            
         });

         markers.push(marker);
     }

     // Sets the map on all markers in the array.
     function setMapOnAll(map) {	
         for (let i = 0; i < markers.length; i++) {
             markers[i].setMap(map);
         }
     }

     // Removes the markers from the map, but keeps them in the array.
     function hideMarkers() {
         setMapOnAll(null);
     }

     // Shows any markers currently in the array.
     function showMarkers() {
         
         setMapOnAll(map);
     }

     // Deletes all markers in the array by removing references to them.
     function deleteMarkers() {
         hideMarkers();
         markers = [];
     }     
	       
    </script>
	<!--收藏地點方法 -->
	<script>
	var Member_id=document.getElementById('member_id').value;
 		function insertlocation() {

			var inputResName = document.getElementById('input').value;
			
			console.log(input);
			console.log(Member_id);
			var dtoObject = {
				"likelocations" : inputResName,
				"member_id":Member_id,
				}
			var dtoJsonString = JSON.stringify(dtoObject);	
				console.log(dtoJsonString);
			
				
				
				
			$.ajax({
				url : 'http://localhost:8080/oldFoodMan/locations',
				contentType : 'application/json; charset=UTF-8',
				dataType : 'json',
				method : 'post',
				data : dtoJsonString,
				
				success : function(result) {	
					
					console.log(result)				
															
					var msg_data='';
					$.each(result,function(index,value){
						
						msg_data = '<button onclick="deletelike('+value.id +')" class="btn"><li id="li" class="list-group-item list-group-item-info">'+ inputResName +'</li></button>'
						
					})
				
				
					
					$('#location1').append(msg_data)	
			
				},
				error : function(err) {
				console.log(err)
				alert('發生錯誤')
				}

			})
		
 		 		
 		}
 		
 		var Member_id2=document.getElementById('member_id2').value;
 		console.log("ID: "+Member_id2)
 			$.ajax({
 				url : 'http://localhost:8080/oldFoodMan/likeloc?member_id='+ Member_id2,
 				contentType : 'application/json ; charset=UTF-8',
 				dataType : 'json',
 				method : 'get',
// 	 			data : dtoJsonString,
 				success : function(result) {
 				
 					var msg_data='';
 					$.each(result,function(index,value){
 						msg_data += '<button onclick="deletelike('+value.id +')" class="btn"><li id="li" class="list-group-item list-group-item-info" style="">'+ value.likelocations +'</li></button>'
 					})

 					$('#location1').append(msg_data)

 					
 				},
 				error : function(err) {
 					console.log(err)
 					alert('發生錯誤')
 				}

 			})
 			
 			
 			function deletelike(id) { //刪除收藏地點

		// 			var record_id = document.getElementById("clot").value;

		$.ajax({
					url : 'http://localhost:8080/oldFoodMan/deleteSchedule?schedule_id='
							+ id,
					contentType : 'application/json; charset=UTF-8',
					method : 'get',
					success : function(result) {
						console.log(member_id2)
						alert('已成功刪除');
						location.reload();
					}

				})

	}
</script>
	<!--綁定按鍵sweetalert2並執行收藏地點方法 -->
	<script>

document.getElementById("star").addEventListener("click",function(){
	  swal("Good job!", "已經收藏此地點!", "success").then(insertlocation());
	});
	


</script>
	<script>

// //網頁接值
// 		$(document).ready(function() {	
// 			$.ajax({
// 					url : 'http://localhost:8080/oldFoodMan/likeloc',
// 					contentType : 'application/json ; charset=UTF-8',
// 					dataType : 'json',
// 					method : 'get',
// 					success : function(result){
// 						console.log("rs: "+result)
// 						var msg_data='';
// 						$.each(result,function(index,value){
			
// 							msg_data+= '<h5>'+value.likelocations +'</h5>'
				
// 						})
// 						$('#location1').append(msg_data.likelocations)

					
// 					},
// 					error : function(err) {
// 						console.log(err)
// 						alert('發生錯誤')
// 					}		
		
// 				});
		
// 			})

$("#input").bind("keypress", {}, keypressInBox);

function keypressInBox(e) {
var code = (e.keyCode ? e.keyCode : e.which);
if (code == 13) { //Enter keycode
	$("#range").addClass("display");
	$("#rangetype").removeClass("display");
	collet11();	
}

}

</script>
	<!-- 	模糊搜尋站內食記的方法   -->
	<script>

		function collet11(){		
			
			var inputResName = document.getElementById('input').value;
			
			

				$.ajax({
						url : 'http://localhost:8080/oldFoodMan/collet?shopType='+inputResName ,
						contentType : 'application/json ; charset=UTF-8',
						dataType : 'json',
						method : 'get',

						success : function(result) {
							console.log(result)
						var msg_data='';
					
							console.log(result)
							
				$.each(result,function(index,value){
						msg_data+= '<div id="p1" class="card " style="width:15rem"" >'
//  					msg_data+= '<img id="img" src="...'+ value.uploadPicture +'" class="card-img-top" alt="...">'
						console.log(value.uploadPicture)
						var image = value.uploadPicture
						var ok = image.split('.').pop()
						console.log(ok)
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/viewById?id='+ value.id +'"><img id="img"  src=" <c:url value="'+'http://localhost:8080/oldFoodMan/images/' + value.id +'.'+ ok +'"/>"  class="card-img-top imgsize" alt="..."></a>'
						msg_data+= '<div id="box" class="card-body">'		
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/viewById?id='+ value.id +'"<span id="p" class="card-title" style="background-color: #FFCBB3; text-align: center">'+ value.title +'</span></a>'
						msg_data+= '<h5 id="p" class="card-text">'+ value.content  +'</h5>'
						msg_data+= '</div>'
						msg_data+= '</div>'
						})
						
						let strObj=new String(["您所搜尋有關於 [ "]);
						let strObj1=new String(["  ] 的食記,"]);
						$('#rangetype').append(strObj +inputResName + strObj1 )
						$('#range1').append(msg_data)

		
						},
						error : function(err) {
							console.log(err)
							alert('發生錯誤')
						}

				})

	}
		
		
function collet22(){		
			
			var inputResName = document.getElementById('bt1').attr;
			var inputResName = document.getElementById('bt2').attr;
			var inputResName = document.getElementById('bt3').attr;
				$.ajax({
						url : 'http://localhost:8080/oldFoodMan/collet?shopType='+inputResName ,
						contentType : 'application/json ; charset=UTF-8',
						dataType : 'json',
						method : 'get',

						success : function(result) {
							console.log(result)
						var msg_data='';
				$.each(result,function(index,value){
						msg_data+= '<div id="p1" class="card" style="width: 8cm;">'
						msg_data+= '<img id="img" src="/getPicture/'+ value.id +' style="width: 250px; height: 220px" class="card-img-top" alt="..."/>"'
						msg_data+= '<div id="box1" class="card-body">'		
						msg_data+= '<h3 id="p" class="card-title" style="background-color: #FFCBB3; text-align: center">'+ value.title +'</h3>'
						msg_data+= '<h5 id="p" class="card-text">'+ value.content  +'</h5>'
						msg_data+= '<a href="http://localhost:8080/oldFoodMan/viewById?id='+ value.id +'" class="btn btn-primary" ><c:out value="繼續閱讀..."/></a>'
						msg_data+= '</div>'
						msg_data+= '</div>'
						})

						$('#range1').append(msg_data)

		
						},
						error : function(err) {
							console.log(err)
							alert('發生錯誤')
						}

				})

	}



</script>
	<script>

	
	

	





</script>


</body>
</html>