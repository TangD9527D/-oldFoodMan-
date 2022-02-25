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
							modelAttribute="ofm" method="post">
							<form:input type="hidden" path="vis_id"/>
							<form:input type="hidden" path="added"/>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">發起人</label>
									<input type="text" value="${ofm.vis_name}" disabled class="form-control" />

								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label>
									<input type="text" value="${ofm.vis_email}" disabled class="form-control" />

								</div>
								

							</div>
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
									<input type="text" value="${ofm.vis_condition}" disabled class="form-control" />
								</div>
							</div>
							
							
						</form:form>
					</div>
				</div>
			</div>

		</div>
		</div>

</body>
</html>