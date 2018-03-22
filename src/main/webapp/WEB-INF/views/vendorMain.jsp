<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="VendorMain"/></title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   <script src="resources/lib/moment.min.js"></script>                       
   <script src="resources/lib/bootstrap-datetimepicker.min.js"></script>
  <div align="center">
 

    <form:form method="post" modelAttribute="vendorMain">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     <spring:message code="VendorRegistration"/>         </h2>
     <h4>    <spring:message code="VendorDetails"/>         </h4>
         <div class="form-group row">                <div class="col-sm-1"> </div>        
 <div class="col-sm-10"><div class='alert alert-danger ${alert.getVisible()}' id='alertBar' role="alert"> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i> <div id='alert'>${alert.getMessage()} </div>  </div>
       </div><div class="col-sm-1"></div>            </div>

         <form:hidden path="vendorID" />
       
         <form:hidden   class="form-control" path="vendorID" />
         
         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="CompanyType"/></label>
                    <div class="col-sm-4">
                     <form:select  path="vendorTypeID" class="form-control" id="ddlCompanyType">
                     <form:option value = "0" label = "Select Company Type"/>
                     <form:options items = "${CompanyTypeList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-2">                     
                     </div>
            </div>
         
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="VendorNameEnglish"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorNameEn"  id="vendorNameEn" placeholder="Vendor Name English"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="VendorNameArabic"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorNameAr" id="vendorNameAr" placeholder="Vendor Name Arabic"/></div>
                     <div class="col-sm-2"></div>
            </div>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="VendorType"/></label>
                    <div class="col-sm-4">
                     <form:select  path="vendorTypeID" class="form-control" id="ddlVendorType">
                     <form:option value = "0" label = "Select Vendor Type"/>
                     <form:options items = "${VendorTypeList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-2">                     
                     </div>
            </div>
            
            
                         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="Email"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="email" id="email" placeholder="Email"/></div>
                     <div class="col-sm-2"></div>
            </div>
             
             
                                      <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="LANNumber"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="lanNumber" id="lanNumber" placeholder="LAN Number"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="MobileNumber"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="mobileNumber" id="mobileNumber" placeholder="Mobile Number"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="WebSite"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="webSiteurl" id="webSiteurl" placeholder="Web Site URL"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="C/RNumber"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="crNumber" id="crNumber" placeholder="C/R Number"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
            
            <div class="form-group row">
                  <div class="col-sm-2"></div>
                	   <label  class="col-sm-4 col-form-label"><spring:message code="crDateBeginning"/></label>
                    		<div class="col-sm-4">
                    			<div class='input-group date' id="crDateBeginning">
                    				<form:input  class="form-control" path="crDateBeginning" id="crDateBeginning" placeholder="CR Date Beginning"/>
                    					<span class="input-group-addon">
                        					<span class="glyphicon glyphicon-calendar"></span>
                    					</span>
                    			</div>
                     	<div class="col-sm-2"></div>
            </div></div>
            
            <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="crDateExpire"/></label>
                    <div class="col-sm-4">
                    <div class="input-group date" id="crDateExpire">
                    <form:input class="form-control" path="crDateExpire" id="crDateExpire" placeholder="CR Date Expire"/>
                    <span class="input-group-addon">
                        					<span class="glyphicon glyphicon-calendar"></span>
                    					</span>
                    			</div>
                     <div class="col-sm-2"></div>
            </div></div>
            
            


            
            <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="fax"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="fax" id="fax" placeholder="FAX Number"/></div>
                     <div class="col-sm-2"></div>
            </div>     
                
                   <div class="form-group row">
                  <div class="col-sm-3"></div>
                <label  class="col-sm-3 col-form-label"></label>
                 
                    <div class="col-sm-4"><input type="submit" class="btn btn-success" value=<spring:message code="Save&Continue"/> /></div>
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
    	  
    	  if($( "#ddlCompanyType option:selected" ).val() ==1){
    	  if ($('#crNumber').val().length !=10)
    	  {    		 
    		  $('#alert').append("enter currect CR Number! ");
    		  isValid = false;
    	  }}
    	 
	 
    	  
    	  
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
    
    
    $(function () {
        $('#crDateBeginning').datetimepicker();
        $('#crDateExpire').datetimepicker({
            useCurrent: false //Important! See issue #1075
        });
        $("#crDateBeginning").on("dp.change", function (e) {
            $('#crDateExpire').data("DateTimePicker").minDate(e.date);
        });
        $("#crDateExpire").on("dp.change", function (e) {
            $('#crDateBeginning').data("DateTimePicker").maxDate(e.date);
        });
    });
    </script>
    

    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>
          
</body>
</html>