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
<title>Insert title here</title>
</head>
<body>


<h5>you know me ?</h5>

<div id="range1" class="">
			<c:forEach var="st" items="${st.content}">
				<div class="card" id="p1" style="width: 8cm;">
					<img src="<c:url value='/getPicture/${st.id}'/>"
						style="width: 250px; height: 220px" class="card-img-top" alt="...">
					<div id="box" class="card-body">
						<h3 id="p" class="card-title"
							style="background-color: #ADADAD; text-align: center">${st.title}</h3>
						<h5 id="p" class="card-text">${st.content}</h5>
						<a href="#" class="btn btn-secondary"
							style="position: absolute; bottom: 15px">繼續閱讀</a>
						<div id="right">
							<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss EEEE"
								value="${st.added}" />
						</div>
					</div>
				</div>
			</c:forEach>
		</div>






<script>


// 		$.ajax({
// 			url : 'http://localhost:8080/oldFoodMan/api/collet',
// 			contentType : 'application/json ; charset=UTF-8',
// 			dataType : 'json',
// 			method : 'post',
// 			data : dtoJsonString,
// 			success : function(result) {
// 				console.log(result)
// 				var msg_data='';
// 				$.each(result,function(index,value){
// 					msg_data+= '<div class="card" style="width: 18rem;">'
// 					msg_data+= '<img src="...'+ value.coverImage +'" class="card-img-top" alt="...">'	
// 					msg_data+= '<div class="card-body">'		
// 					msg_data+= '<h5 class="card-title">'+ value.title +'</h5>'
// 					msg_data+= '<p class="card-text">'+ value.content  +'</p>'
// 					msg_data+= '<a href="" class="btn btn-primary">Go somewhere</a>'
// 					msg_data+= '</div>'
// 					msg_data+= '</div>'
// 				})

// 				$('#range1').append(msg_data)

				
// 			},
// 			error : function(err) {
// 				console.log(err)
// 				alert('發生錯誤')
// 			}

// 		})


</script>








</body>
</html>