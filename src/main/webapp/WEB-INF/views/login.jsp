
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center" >

    <form:form method="post" modelAttribute="user">
    
    <div class="row">
    
<div class="col-md-4 text-center"></div>
<div class="col-md-4">
	<h1><i class="fa fa-lock red"></i> Login </h1>
	
	<div class='alert alert-danger ${alert.getVisible()}' id='alertBar' role="alert"> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i> <div id='alert'>${alert.getMessage()} </div>  </div>
       
  <div class="form-group">   
             <div class="form-group row">
             
                <label  class="col-sm-4 col-form-label">Email</label>                
                 <div class="col-sm-8">
                 <form:input  class="form-control" path="email" id="email"/>
 		</div></div>
        
                 <div class="form-group row">
                 
                <label  class="col-sm-4 col-form-label">Password</label>
                    <div class="col-sm-8"><form:input type="password" class="form-control" path="password" id="password"/></div>
            </div>
           
               <div class="form-group row">
                <div class="col-sm-4"> </div>
                <div class="col-sm-4"> <a href="login"  class="btn btn-warning" > cancel</a>  </div>
                 <div class="col-sm-4"> <input type="submit" class="btn btn-success" value="Login" name="Login"/>           </div>
                
            </div>
       
  

</div>
	</div>
	<div class="col-md-2"></div>
	
		</div>
			
	
	
	  </form:form>
	</div>


    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>
     
     
         <script language="javascript" type="text/javascript">

    
    $("form").submit(function() {  	
    	 $('#alert').empty(); 
    	 var isValid = true;
    		
    	
       if ($('#email').val().length <1)
    	  {    		 
    		  $('#alert').append("enter the email ! ");
    		  isValid = false;   		      		  
    	  }
    	
       /*  else
    		  if (!validateEmail($('#email').val()))
        	  {    		 
        		  $('#alert').append("wrong email ! ");
        		  isValid = false;
        	  }	   
       */  	 
    	      	  
    	  
    	  if ($('#password').val().length <1)
    	  {    		 
    		  $('#alert').append("enter the Password ! ");
    		  isValid = false;
    	  }
    	
 	  if (isValid)
	  {    		 
		  $('#alertBar').removeClass( "show" );
		  $('#alertBar').addClass( "hide" );
		  return true;
	  }
	  else
		  {    		  
		  $('#alertBar').removeClass( "hide" );
		  $('#alertBar').addClass( "show" );
		  return false;
		  }
    	
    	});
    </script>

</body>
</html>