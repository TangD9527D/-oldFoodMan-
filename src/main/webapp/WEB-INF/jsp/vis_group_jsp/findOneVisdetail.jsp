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
<title>揪團資料</title>
</head>
<body>

<div class="container">
		<p />
		<div class="row justify-content-center">

			<div class="col-6">
				<div class="card">
					<div class="card-header text-white bg-dark ">揪團資訊</div>
					<div class="card-body">
						<form:form class="form" action="${contextRoot}/findOneVis"
							modelAttribute="ofm"   method="post">
							<h2>開團者： ${ofmid.memberName}</h2>
							<form:input type="hidden" path="vis_id"/>
							<form:input type="hidden" path="added"/>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">日期</label>
									<input type="date" value="${ofm.vis_date}" disabled class="form-control" />
 	
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">時間</label>
									<input type="time" value="${ofm.vis_time}" disabled class="form-control" />

								</div>
								

							</div>
							<div class="form-group">
								<label for="inputAddress2">店名</label> 
								<input type="text" value="${ofm.vis_res_name}" disabled class="form-control" />
							</div>
							<div class="form-group">
								<label for="inputAddress2">地址</label> 
								<input type="text" value="${ofm.vis_location}" disabled class="form-control" />
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">人數上限</label> 
									<input type="number" value="${ofm.vis_num}" disabled  class="form-control" />
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">備註</label> 
									<input type="text" value
									="${ofm.vis_condition}" disabled class="form-control" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="inputAddress2">參加者</label> 
								<c:forEach var="joinofm" items="${joinofm}">
								<input type="text" value="${joinofm.memberName}" disabled class="form-control" />
									</c:forEach>
							</div>
						
						</form:form>
						
					</div>
				</div>
			</div>
			
		</div>
		

		</div>
		<!-- dialog視窗 -->
<div>
		<div >
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
					<div class="card-header text-white bg-dark " id="exampleModalLabel">揪團資訊</div>
						
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
<!-- 							<div class="form-row"> -->
<!-- 			<div class="form-group col-md-6"> -->
<!-- 				<label for="inputEmail4">發起人</label> <input id="vis_name" -->
<!-- 					type="text" class="form-control " required> -->
<!-- 			</div> -->
<!-- 			<div class="form-group col-md-6"> -->
<!-- 				<label for="inputEmail4">Email</label> <input id="vis_email" -->
<!-- 					type="text" class="form-control" required> -->

<!-- 			</div> -->
<!-- 		</div> -->
							<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">日期</label> <input type="date" id="vis_date"
					class="form-control" required>

			</div>
			<div class="form-group col-md-6">
				<label for="inputEmail4">時間</label> <input type="time" id="vis_time"
					class="form-control" required>

			</div>


		</div>
		<div class="form-group">
			<label for="inputAddress2">店名</label> <input type="text"
				id="vis_res_name" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="inputAddress2">地址</label> <input type="text"
				id="vis_location" class="form-control" required>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">人數上限</label> <input type="number"
					id="vis_num" class="form-control" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">備註</label> <input type="text"
					id="vis_condition" class="form-control" >
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">memberid</label> <input type="text"
					id="member_id" class="form-control" required>
			</div>
		</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn btn-info" onclick="confirm('確定送出？'); return insertdata();">確定新增</button>
						
					</div>	
							
							
						</form>
					</div>
					
				</div>
			</div>
		</div>
</div>
</div>
</body>
</html>