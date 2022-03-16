<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../menu.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>食記分析</title>

<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="${contextRoot}/js/jquery.dataTables.min.js"></script>

</head>
<body>
<p>
<div class="container">

<table id="table_id" class="display">


 	<thead>
        <tr>
            <th>類型</th>
        	<th>次數</th>
        </tr>
    </thead>
    	<tbody>
    		<c:forEach var="shopType" items="${type}"> 
    		 <tr>
    		 <td><c:out value="${shopType.type}"/>
             <td><c:out value="${shopType.Q'ty}"/>        
          </tr>
    		  </c:forEach>
    	</tbody>
    	
</table>
    
 
</div>
		
		
		<script>
		
	
		
		</script>

		
</body>
</html>