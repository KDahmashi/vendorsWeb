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
    <h2><i class="fa fa-exclamation-circle fa-3x" aria-hidden="true"></i>           </h2>
          <div class="form-group row">             
       
                  <div class="col-sm-2"></div> <div class="col-sm-8"> <h5 style="color:#069">  ${message}     </h5> </div>
              
      
                  <div class="col-sm-2"></div>
                  </div>
       
    </div>
    

    </div>
        	
        	
        	
        	
 <jsp:include page="/WEB-INF/views/footer.jsp"/>

    </body>
</html>
