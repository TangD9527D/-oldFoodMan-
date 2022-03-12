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
<link rel="stylesheet" href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<div class="container">
		<p />
		
		 <div class="container py-4">
    <header class="pb-3 mb-4 border-bottom">
     
       <div>
        <h1 class=" fw-bold font-weight-bold">揪團資訊</h1>
        </div>
     
    </header>

<form:form class="form" action="${contextRoot}/findOneVis" modelAttribute="ofm"  method="post" >

    <form:input type="hidden"  path="vis_id"/>
<form:input type="hidden"  path="added"/>
 </form:form>
    

    <div class="row align-items-md-stretch">
    

    <div class="col-md-6">
    
        <div class="h-100 p-5 bg-light border rounded-3">
         <h2 class="display-5 fw-bold font-weight-bold card-title">${ofm.vis_res_name}</h2>
         
         <hr>
         <h5 class="col-md-12"><i class="fa-solid fa-calendar-days"></i> &nbsp;&nbsp;${ofm.vis_date}</h5>
         <p>
        <h5 class="col-md-12 "><i class="fa-solid fa-clock"></i> &nbsp;&nbsp;${ofm.vis_time}</h5>
        <p>
        <h5 class="col-md-12  "><i class="fa-solid fa-location-dot"></i> &nbsp;&nbsp;${ofm.vis_location}</h5>
        <p>
        <h5 class="col-md-12  "><i class="fa-solid fa-user-group"></i> &nbsp;&nbsp;${ofm.vis_num}人</h5>
        <p>
        <h5 class="col-md-12  "> &nbsp;&nbsp;${ofm.vis_condition}</h5>	
        <hr>
          <h3 class="display-5 fw-bold font-weight-bold card-title">舉辦人： ${ofmid.memberName}</h3>
        </div>
      </div>
      <div class="col-md-6">
        <div class="h-100 p-5 text-white bg-dark rounded-3">
          <h2>目前參加者</h2>
          <hr>
          <c:forEach var="joinofm" items="${joinofm}">
          <p class="col-md-8 fs-4 "> ${joinofm.memberName}</p>
          </c:forEach>
        </div>
      </div>
     

    </div>
    </div>

    <footer class="pt-3 mt-4 text-muted border-top">
      &copy; 2021
    </footer>
  </div>
		
<script>





</script>		
		


</body>
</html>