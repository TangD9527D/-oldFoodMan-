<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<div id="out">
	<form id="form">
	<label>帳號:&nbsp;</label> 
	<input type="text" id="account" name="account">
	<button type="button" id="btn">送出</button>
	</form>
	</div>
	<script>
	$(document).on('click', '#btn', function(){ 
		var email = $("#account").val();
		console.log(email);
		$("#form").remove();
		$.ajax({
			method:"post",
			url:"http://localhost:8080/oldFoodMan/mail/" + email,
			success:function(data){
				$("#out").append(data);
			}
		})
	})
	</script>
</body>
</html>