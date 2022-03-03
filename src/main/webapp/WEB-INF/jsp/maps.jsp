<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="vis_group_jsp/layout/navbar.jsp" />
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

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>


<link rel="shortcut icon" href="/images/favicon.png" />
<!-- 改為老食人小圖 -->

<style>
#allpage {
	width: 70%;
	height: 70%;
	margin: 20px auto;
	/* float: left; */
}

#map {
	width: 100%;
	height: 100%;
	margin: 5px auto;
	/* float: left; */
}

/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	/* margin: 0;
    padding: 0; */
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
	background: pink;
	text-align: center;
}

#inputdiv {
	width: 100%;
	margin: 5px auto;
}

#inputdivv {
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

#range {
	/* 	justify-content: center; */
	border: 0.5px solid transparent;
	text-align: justify;
	width: 100%;
}

#p1 {
	float: left;
	margin: 15px 15px;
	justify-content: space-between;
	width: 100%;
}

img {
	display: block;
	margin: 25px auto;
}

#box {
	width: 100%;
	padding: 10px;
	height: 200px;
	margin: 10px auto;
}

#p {
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

</style>


</head>
<body>


	<div id="allpage">
		<!--整個頁面的65%-->
		<div id="inputdiv">
			<!--allpage的65%-->
			<input id="input" class="" type="search" placeholder="Search Box"
				value="" />
		</div>
		
		<div id="map"></div>

		<div id="inputdivv">
			<input id="delete-markers" class="btn btn-outline-danger btn-sm"
				type="button" value="DeleteMark" /> <input id="show-markers"
				class="btn btn-outline-secondary btn-sm" type="button"
				value="ShowMark" /> <input id="hide-markers"
				class="btn btn-outline-dark btn-sm" type="button"
				value="HideMark" />
				
			<button id="star" onclick="" class="btn btn-outline-secondary btn-sm">✨收藏地點</button>
		
		</div>

		<div id="range" class="">
			<c:forEach var="maps" items="${page.content}">
				<div class="card" id="p1" style="width: 8cm;">
					<img src="<c:url value='/getPicture/${maps.id}'/>"
						style="width: 250px; height: 220px" class="card-img-top" alt="...">
					<div id="box" class="card-body">
						<h3 class="card-title"
							style="background-color: #5e5e5e; text-align: center">${maps.title}</h3>
						<h5 id="p" class="card-text">${maps.content}</h5>
						<a href="#" class="btn btn-secondary"
							style="position: absolute; bottom: 15px">繼續閱讀</a>
					</div>
				</div>
			</c:forEach>
		</div>
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
     function initAutocomplete() {
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
                     url: "<c:url value="/images/snow.png"/>", //搜尋後所標記的圖片                        
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



     function addMarker(position) {
         const marker = new google.maps.Marker({  // new google地圖  並指定經緯度為資展國際、標記落下彈跳、自訂圖示及標記訊息
             position: { lat: 25.033943646794558, lng: 121.54341199736278 },
             map,
             animation: google.maps.Animation.BOUNCE, //設定圖示顯示樣式為跳躍
             title: "Hello World!",
             icon: "<c:url value="/images/snow.png"/>",
            
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


</body>
</html>