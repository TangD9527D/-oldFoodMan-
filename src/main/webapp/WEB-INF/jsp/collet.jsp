<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h5>you know me ?</h5>

<script>


		$.ajax({
			url : 'http://localhost:8080/oldFoodMan/api/collet',
			contentType : 'application/json ; charset=UTF-8',
			dataType : 'json',
			method : 'post',
			data : dtoJsonString,
			success : function(result) {
				console.log(result)
				var msg_data='';
				$.each(result,function(index,value){
					msg_data+= '<div class="card" style="width: 18rem;">'
					msg_data+= '<img src="...'+ value.coverImage +'" class="card-img-top" alt="...">'	
					msg_data+= '<div class="card-body">'		
					msg_data+= '<h5 class="card-title">'+ value.title +'</h5>'
					msg_data+= '<p class="card-text">'+ value.content  +'</p>'
					msg_data+= '<a href="" class="btn btn-primary">Go somewhere</a>'
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

	})

})
</script>








</body>
</html>