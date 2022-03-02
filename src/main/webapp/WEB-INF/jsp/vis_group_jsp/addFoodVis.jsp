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
<title>新增揪團</title>
</head>
<body>

	<div class="container">
		<p />
		<div class="row justify-content-center">

			<div class="col-9">
				<div class="card">
					<div class="card-header text-white bg-dark ">新增揪團</div>
					<div class="card-body">
						<form:form class="form" action="${contextRoot}/addFoodVis"
							modelAttribute="ofm" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">發起人</label>
									<form:input type="text" path="member_id" class="form-control" />

								</div>
<!-- 								<div class="form-group col-md-6"> -->
<!-- 									<label for="inputEmail4">Email</label> -->
<%-- 									<form:input type="text" path="vis_email" class="form-control" /> --%>

<!-- 								</div> -->
								

							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">日期</label>
									<form:input type="date" path="vis_date" class="form-control" />

								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">時間</label>
									<form:input type="time" path="vis_time" class="form-control" />

								</div>
								

							</div>
							<div class="form-group">
								<label for="inputAddress2">店名</label> 
								<form:input type="text" path="vis_res_name" class="form-control" />
							</div>
							<div class="form-group">
								<label for="inputAddress2">地址</label> 
								<form:input type="text" path="vis_location" class="form-control" />
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">人數上限</label> 
									<form:input type="number" path="vis_num" class="form-control" />
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">備註</label> 
									<form:input type="text" path="vis_condition"  class="form-control" />
								</div>
							</div>
							<input type="submit" name="submit" class="btn btn-outline-dark"
								style="margin-top: 20px">

						</form:form>
					</div>

					


				</div>
			</div>
		</div>
		
	</div>

</body>
</html>