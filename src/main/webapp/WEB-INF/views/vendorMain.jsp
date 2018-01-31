<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vendor Main</title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center">
 

    <form:form method="post" modelAttribute="vendor">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     vendor Registration         </h2>
     <h4>    vendor Details         </h4>
         <div class="form-group row">                <div class="col-sm-1"> </div>        
 <div class="col-sm-10"><div class='alert alert-danger ${alert.getVisible()}' id='alertBar' role="alert"> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i> <div id='alert'>${alert.getMessage()} </div>  </div>
       </div><div class="col-sm-1"></div>            </div>

         <form:hidden path="vendorID" />
       
         <form:hidden   class="form-control" path="vendorID" />
         
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">vendor Name English</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorNameEn"  id="vendorNameEn"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Vendor Name Arabic</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorNameAr" id="vendorNameAr"/></div>
                     <div class="col-sm-2"></div>
            </div>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">VendorType</label>
                    <div class="col-sm-4">
                     <form:select  path="vendorTypeID" class="form-control" id="ddlVendorType">
                     <form:option value = "0" label = "Select"/>
                     <form:options items = "${VendorTypeList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-2">                     
                     </div>
            </div>
            
            
                         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Email</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="email" id="email"/></div>
                     <div class="col-sm-2"></div>
            </div>
             
             
                                      <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Lane Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="lanNumber" id="lanNumber" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Mobile Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="mobileNumber" id="mobileNumber" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Web Site </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="webSiteurl" id="webSiteurl" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">C/R Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="crNumber" id="crNumber"/></div>
                     <div class="col-sm-2"></div>
            </div>     
                
                   <div class="form-group row">
                  <div class="col-sm-3"></div>
                <label  class="col-sm-3 col-form-label"></label>
                 
                    <div class="col-sm-4"><input type="submit" class="btn btn-success" value="Save & continue " /></div>
                     <div class="col-sm-2"></div>
            </div>          

      
    </form:form>

    </div>

    <script language="javascript" type="text/javascript">

    
    $("form").submit(function() {  	
    	 $('#alert').empty(); 
    	 var isValid = true;
    	
    	
    	  if ($('#vendorNameEn').val().length <1)
    	  {    		 
    		  $('#alert').append("enter vendor NameEn ! ");
    		  isValid = false;
    	  }  
    	  
    /* 	  if ($('#vendorNameAr').val().length <1)
    	  {    		 
    		  $('#alert').append("enter vendor NameAr ! ");
    		  isValid = false;   		      		  
    	  } */
    		  
    	  if ($('#email').val().length <1)
    	  {    		 
    		  $('#alert').append("enter email ! ");
    		  isValid = false;   		      		  
    	  }
    	  else
    		  if (!validateEmail($('#email').val()))
        	  {    		 
        		  $('#alert').append("wrong email ! ");
        		  isValid = false;
        	  }
    	  
    	 
    	  if ( $( "#ddlVendorType option:selected" ).val() ==0)
    	  {    		 
    		  $('#alert').append("select Vendor Type! ");
    		  isValid = false;
    	  } 
    	  
    	  
/*     	  if ($('#lanNumber').val().length <8)
    	  {    		 
    		  $('#alert').append("enter currect land line Number ! ");
    		  isValid = false;
    	  } */
    	  if ($('#mobileNumber').val().length <10)
    	  {    		 
    		  $('#alert').append("enter currect mobile Number ! ");
    		  isValid = false;
    	  }
    	  
    	  if ($('#crNumber').val().length !=10)
    	  {    		 
    		  $('#alert').append("enter currect CR Number! ");
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
    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>
          
</body>
</html>