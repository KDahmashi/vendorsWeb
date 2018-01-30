<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body> 
    
  
 
   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
    
    <div align="center">
 
       <div class="form-group row">
    <h2><i class="fa fa-building-o" aria-hidden="true"></i>    Welcome to Vendor Management           </h2>
          <div class="form-group row">
                  <div class="col-sm-2"></div> <div class="col-sm-8"> <h4>     ${vendor.getCommentReason()}       </h4> </div>
                  <div class="col-sm-2"></div>
                  </div>
       
    </div>
    

    </div>
        	
        	
        	
        	
 <jsp:include page="/WEB-INF/views/footer.jsp"/>

    </body>
</html>
