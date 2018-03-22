<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><spring:message code="Home"/></title>
    </head>
    <body> 
    
  
 
   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
    
    <div align="center">
 
       <div class="form-group row">
    <h2><i class="fa fa-building-o" aria-hidden="true"></i>    <spring:message code="WelcomeToVendorManagement"/>           </h2>
          <div class="form-group row">
             
           <c:choose>
            <c:when test="${not empty vendor.getCommentReason()}">
                 <div class="col-sm-2"></div> <div class="col-sm-8"> <h4 style="color:#069">     ${vendor.getCommentReason()}       </h4> </div>
            </c:when>
            <c:otherwise>
                  <div class="col-sm-2"></div> <div class="col-sm-8"> <h4 style="color:#069">    <spring:message code="WelcomeTCC"/>        </h4> </div>
            </c:otherwise>
        </c:choose>             
                         
      
                  <div class="col-sm-2"></div>
                  </div>
       
    </div>
    

    </div>
        	
        	
        	
        	
 <jsp:include page="/WEB-INF/views/footer.jsp"/>

    </body>
</html>
