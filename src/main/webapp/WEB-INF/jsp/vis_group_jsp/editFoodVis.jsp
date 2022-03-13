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
<title>修改揪團資料</title>
<style>
.pink{

/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ffeded+32,edcece+51,edcece+61,edcece+73,fde4de+100 */
background: #ffeded; /* Old browsers */
background: -moz-linear-gradient(-45deg,  #ffeded 32%, #edcece 51%, #edcece 61%, #edcece 73%, #fde4de 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(-45deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(135deg,  #ffeded 32%,#edcece 51%,#edcece 61%,#edcece 73%,#fde4de 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffeded', endColorstr='#fde4de',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

font-weight:bolder

}

</style>
</head>
<body>
<div class="container">
  <main>
    <div class="py-5 text-center">
<!--       <img class="d-block mx-auto mb-4" src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
      <header class="pb-3 mb-4 border-bottom">
     
       <div>
        <h1 class=" fw-bold font-weight-bold ">編輯揪團美食Eat</h1>
        </div>
     
    </header>
      
    </div>
		<p />
		<div class="row justify-content-center">

			<div class="col-9">
				<div class="card">
					<h3 class="card-header text-dark bg-dark pink ">我的揪團</h3>
					<div class="card-body">
						<form:form class="form" action="${contextRoot}/editFoodVis"
							modelAttribute="ofm" method="post">
							<form:input type="hidden" path="vis_id"/>
							<form:input type="hidden" path="added"/>
							<form:input type="hidden" path="member_id"/>
<!-- 							<div class="form-row"> -->
<!-- 								<div class="form-group col-md-6"> -->
<!-- 									<label for="inputEmail4">發起人</label> -->
<%-- 									<form:input type="text" path="vis_name" class="form-control" /> --%>

<!-- 								</div> -->
<!-- 								<div class="form-group col-md-6"> -->
<!-- 									<label for="inputEmail4">Email</label> -->
<%-- 									<form:input type="text" path="vis_email" class="form-control" /> --%>

<!-- 								</div> -->
								

<!-- 							</div> -->
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
									<label for="inputEmail4">希望人數</label> 
									<form:input type="number" path="vis_num" class="form-control" />
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">備註</label> 
									<form:input type="text" path="vis_condition"  class="form-control" />
								</div>
							</div>
							
							<input type="submit" name="submit" class="btn btn-outline-dark" value="送出"
								style="margin-top: 20px">
						</form:form>
					</div>
				</div>
			</div>

		</div>
 
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2021 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>
<div class="container">

		</div>

</body>
</html>