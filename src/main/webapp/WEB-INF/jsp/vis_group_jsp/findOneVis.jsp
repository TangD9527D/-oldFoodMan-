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
<style>
.bcolor{

/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#f2e5d2+0,bfa276+50,b29974+51,e8d7be+100 */
background: #f2e5d2; /* Old browsers */
background: -moz-linear-gradient(top,  #f2e5d2 0%, #bfa276 50%, #b29974 51%, #e8d7be 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #f2e5d2 0%,#bfa276 50%,#b29974 51%,#e8d7be 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #f2e5d2 0%,#bfa276 50%,#b29974 51%,#e8d7be 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2e5d2', endColorstr='#e8d7be',GradientType=0 ); /* IE6-9 */




}

.btnadd{

/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#f6f8f9+0,e5ebee+50,d7dee3+51,f5f7f9+100 */
background: #f6f8f9; /* Old browsers */
background: -moz-linear-gradient(top,  #f6f8f9 0%, #e5ebee 50%, #d7dee3 51%, #f5f7f9 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #f6f8f9 0%,#e5ebee 50%,#d7dee3 51%,#f5f7f9 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #f6f8f9 0%,#e5ebee 50%,#d7dee3 51%,#f5f7f9 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f6f8f9', endColorstr='#f5f7f9',GradientType=0 ); /* IE6-9 */

font-weight:bolder;
}


.btnadd:hover{
/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#f5f7f9+0,d7dee3+49,e5ebee+50,f6f8f9+100 */
background: #f5f7f9; /* Old browsers */
background: -moz-linear-gradient(top,  #f5f7f9 0%, #d7dee3 49%, #e5ebee 50%, #f6f8f9 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #f5f7f9 0%,#d7dee3 49%,#e5ebee 50%,#f6f8f9 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #f5f7f9 0%,#d7dee3 49%,#e5ebee 50%,#f6f8f9 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f5f7f9', endColorstr='#f6f8f9',GradientType=0 ); /* IE6-9 */


}

</style>
</head>
<body>

<div class="container">
		<p />
		
		 <div class="container py-4 ">
    <header class="pb-3 mb-4 border-bottom">
     
       <div>
        <h1 class=" fw-bold font-weight-bold ">揪團資訊</h1>
        </div>
     
    </header>

<form:form class="form" action="${contextRoot}/findOneVis" modelAttribute="ofm"  method="post" >

    <form:input type="hidden"  path="vis_id"/>
<form:input type="hidden"  path="added"/>
 </form:form>
    

    <div class="row align-items-md-stretch ">
    

    <div class="col-md-4 bcolor">
    
        <div class="h-100 p-5 bg-light border rounded-3">
         <h2 class="display-5 fw-bold font-weight-bold card-title">${ofm.vis_res_name}</h2>
         
         <hr>
         <h5 class="col-md-12"><i class="fa-solid fa-calendar-days"></i> &nbsp;&nbsp;${ofm.vis_date}</h5>
         <p>
        <h5 class="col-md-12 "><i class="fa-solid fa-clock"></i> &nbsp;&nbsp;${ofm.vis_time}</h5>
        <p>
        <h5 class="col-md-12  "><i class="fa-solid fa-location-dot"></i> &nbsp;&nbsp;${ofm.vis_location}</h5>
        <p>
        <h5 class="col-md-12  "><i class="fa-solid fa-user-group"></i> &nbsp;&nbsp;希望人數：${ofm.vis_num}人</h5>
        <p>
        <h5 class="col-md-12  "> &nbsp;&nbsp;${ofm.vis_condition}</h5>	
        <hr>
          <h3 class="display-5 fw-bold font-weight-bold card-title">舉辦人： </h3>
           <h3 class="display-5 fw-bold font-weight-bold card-title">${ofmid.memberName}</h3>
        </div>
      </div>
      <div class="col-md-4 ">
        <div class="h-100 p-5 bg-light  rounded-3">
          <h2>目前參加者</h2>
          <hr>
          <c:forEach var="joinofm" items="${joinofm}">
          <h5 class="col-md-12  "><i class="fa-solid fa-user-group"></i> &nbsp;&nbsp;${joinofm.memberName}</h5>
          </c:forEach>
        </div>
      </div>
     
      <div class="col-md-4 bcolor">
        <div class="h-100 p-5 bg-light border rounded-3">
        <form:form class="form" action="${contextRoot}/addjoinvis/${ofm.vis_id} "
							modelAttribute="ofm" method="post">
          <h2 class="display-5 fw-bold font-weight-bold card-title">加入揪團Eat</h2>
          <hr>
          <div class="form-group">
          
          <p >加入原因</p>
          <input type="text"  name="add_condition" class="form-control" />
          </div>
          <button class="btn btn-lg btnadd " type="submit" id="checkaddvis">確定加入</button>
        </form:form>
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