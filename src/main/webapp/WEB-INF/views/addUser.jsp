
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center">
 

    <form:form method="post" modelAttribute="user" data-toggle="validator">
    
      <h2><span class="glyphicon glyphicon-user" ></span>     User Registration         </h2>
      
       
       <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Full Name</label>
                    <div class="col-sm-3">
                   <form:input  class="form-control" path="name"   id="name" placeholder="full name" /> </div>
                     <div class="col-sm-3">
                     
                     </div>
            </div>
                  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Email</label>
                    <div class="col-sm-3">
                    <form:input  class="form-control" path="email" id="email" placeholder="Email" data-error="Bruh, that email address is invalid" /></div>
                     <div class="col-sm-3">
                     
                     </div>
            </div>
                  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Password</label>
                    <div class="col-sm-3"><form:input type="password" id="Password" class="form-control" path="password" placeholder="password"/></div>
                     <div class="col-sm-3"></div>
            </div>
                  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Confirm Password</label>
                    <div class="col-sm-3"> <input id="confirmPassword" type="password" class="form-control"  type="text" placeholder="confirm password"/></div>
                     <div class="col-sm-3"></div>
            </div>
                
                             <div class="form-group row">
                <div class="col-sm-2"> </div>
                <div class="col-sm-4"> <a href="login"  class="btn btn-warning" > cancel</a> </div>
                 <div class="col-sm-3"> <input type="submit" class="btn btn-success" value="Register"/>           </div>
                 <div class="col-sm-3"></div>
            </div>
            
                  <div class="form-group row invisible" id='alertBar'>
                  <div class="col-sm-2"></div>
    <div class="col-sm-8">  <div class='alert alert-danger'   role="alert"> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i><div id='alert'> </div>  </div></div>
       <div class="col-sm-2"></div>
       </div>
       
       
    </form:form>

    </div>
    <script language="javascript" type="text/javascript">
   /*  $( "#name" ).focusout(function() {   
    	 $('#alert').empty(); 
		  if ($('#name').val().length <1)
    	  {    		 
    		  $('#alert').append("enter the name");
    	  }
		  
	  }); */
	  

    
    $("form").submit(function() {  	
    	 $('#alert').empty(); 
    	 var isValid = true;
    	
    	
    	  if ($('#name').val().length <1)
    	  {    		 
    		  $('#alert').append("enter the name ! ");
    		  isValid = false;
    	  }    	    	  
    		  
    	  if ($('#email').val().length <1)
    	  {    		 
    		  $('#alert').append("enter the email ! ");
    		  isValid = false;   		      		  
    	  }
    	  else
    		  if (!validateEmail($('#email').val()))
        	  {    		 
        		  $('#alert').append("wrong email ! ");
        		  isValid = false;
        	  }
    	  
    	 
    	  
    	  
    	  
    	  if ($('#Password').val().length <1)
    	  {    		 
    		  $('#alert').append("enter the Password ! ");
    		  isValid = false;
    	  }
    		  
    	 
    	  if ($('#Password').val() != $('#confirmPassword').val())
    	  {    	
    		  $('#alert').append("Password does Not match");
    		  isValid = false;
    	  }
    	 
    	  
    	  
    	  if (isValid)
    	  {    		 
    		  $('#alertBar').removeClass( "visible" );
    		  $('#alertBar').addClass( "invisible" );
    		  return true;
    	  }
    	  else
    		  {    		  
    		  $('#alertBar').removeClass( "invisible" );
    		  $('#alertBar').addClass( "visible" );
    		  return false;
    		  }
    	
    	});
    </script>
    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>