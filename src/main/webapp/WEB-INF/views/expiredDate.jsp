<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title><spring:message code="ExpiredDate"/></title>
    </head>
    <body> 
    
  
 
   <jsp:include page="/WEB-INF/views/header.jsp"/>
          	<!-- <script type='text/javascript' src='resources/lib/jquery-1.12.4.js'></script> -->
<script type='text/javascript' src='resources/lib/jquery.dataTables.min.js'></script>
<script type='text/javascript' src='resources/lib/dataTables.bootstrap.min.js'></script>
<script type='text/javascript' src='resources/lib/dataTables.bootstrap.min.css'></script>
<!-- <script type='text/javascript' src='resources/lib/bootstrap.min.css'></script> -->
   
         <script type="text/javascript">  
      $(document).ready(function() {
    $('#expiredDateTable').DataTable();
} );
      </script>
    
    <c:if test="${not empty listExpiedDate}">
    
        <div align="center">         
             <h2><span class="glyphicon glyphicon-edit" ></span><spring:message code="ExpiredDateList"/></h2>
                    
                       <div class="form-group row">
                  <div class="col-sm-2"></div> <div class="col-sm-8">
                  
                    	<table id="expiredDateTable" class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="VendorNameEnglish"/></th>
                <th  class="text-center" scope="col"><spring:message code="VendorNameArabic"/></th>
                <th  class="text-center" scope="col"><spring:message code="MobileNumber"/></th>
                <th class="text-center" scope="col"><spring:message code="Email"/></th>
                <th class="text-center" scope="col"><spring:message code="StatusAr"/></th>
                <th  class="text-center" scope="col"><spring:message code="StatusEn"/></th>
                <th class="text-center" scope="col"><spring:message code="crDateBeginning"/></th>
                <th  class="text-center" scope="col"><spring:message code="crDateExpire"/></th>               
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="listExpiedDate" items="${listExpiedDate}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${listExpiedDate.vendorNameEn}</td>
                    <td class="text-center">${listExpiedDate.vendorNameAr}</td>
                    <td class="text-center">${listExpiedDate.mobileNumber}</td>
                    <td class="text-center">${listExpiedDate.email}</td>
                    <td class="text-center">${listExpiedDate.statusAr}</td>
                    <td class="text-center">${listExpiedDate.statusEn}</td>
                    <td class="text-center">${listExpiedDate.crDateBeginning}</td>
                    <td class="text-center">${listExpiedDate.crDateExpire}</td>
                    
                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        </div>
                  <div class="col-sm-2"></div>
                  </div>
        	</c:if>
        	
        	
        	
        	
 <jsp:include page="/WEB-INF/views/footer.jsp"/>

    </body>
</html>
