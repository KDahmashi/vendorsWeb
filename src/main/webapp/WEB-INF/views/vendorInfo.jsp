 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="VendorInformation"/></title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center">
 

    <form:form method="post" modelAttribute="bank">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     <spring:message code="VendorRegistration"/>         </h2>
     <div class="form-group row">                <div class="col-sm-1"> </div>        
 <div class="col-sm-10"><div class='alert alert-danger ${alert.getVisible()}' id='alertBar' role="alert"> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i> <div id='alert'>${alert.getMessage()} </div>  </div>
       </div><div class="col-sm-1"></div>            </div>
    
     <h4>    <spring:message code="BankDetails"/>         </h4>

			<div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="BankName"/></label>
                    <div class="col-sm-4">
                     <form:select  path="bankID" class="form-control" id="ddlBankName">
                     <form:option value = "0" label = "Select Bank Name"/>
                     <form:options items = "${BankNameList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-2">                     
                     </div>
            </div>
              
        </div>
            
            
            
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="IBAN"/> </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="iban" id="iban" placeholder="Bank IBAN"/></div>
                     <div class="col-sm-2"> <input type="submit" class="btn btn-info" value=<spring:message code="AddBank"/> name="AddBank" onclick="return validateBank();"/>  </div>
            </div>
        </form:form>    
        
        
        
         <div class="form-group row">
                  <div class="col-sm-3"></div>  
        <div class="col-sm-6">
                <c:if test="${not empty bankList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        <spring:message code="Banks"/>       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="BankName"/></th>
                <th  class="text-center" scope="col"><spring:message code="IBAN"/></th>                 
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="bank" items="${bankList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${bank.bankName}</td>
                    <td class="text-center">${bank.iban}</td>              
                    <th class="text-center" >
                       <a type="button" class="btn btn-danger" href="deleteBank/${bank.bankID}" onclick="return confirm(<spring:message code="DeleteClick"/>);"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
                     </th>                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
      <div class="col-sm-3"></div>  </div>
      
     
      <form:form method="post" modelAttribute="contactPerson">
                      
      <h4>   <spring:message code="ContactPerson"/>   </h4>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="FullName"/> </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="fullName" id="fullName" placeholder="Full Name"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
            
                         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="MobileNumber"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="mobile" id="mobile" placeholder="Mobile Number"/></div>
                     <div class="col-sm-2"></div>
            </div>
             
             
                                      <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="Email"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="emailPerson" id="email" placeholder="email"/></div>
                     <div class="col-sm-2">
                     <input type="submit" class="btn btn-info" value=<spring:message code="AddPerson"/> name="AddPerson"  onclick="return validatePerson();"/> </div>
            </div>
            
            
       </form:form>   
       
       
       <div class="form-group row">
                  <div class="col-sm-3"></div>  
        <div class="col-sm-6">
                <c:if test="${not empty contactPersonList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        <spring:message code="ContactList"/>       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="FullName"/></th>
                <th  class="text-center" scope="col"><spring:message code="MobileNumber"/></th>
                <th  class="text-center" scope="col"><spring:message code="Email"/></th>                 
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="contactPerson" items="${contactPersonList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${contactPerson.fullName}</td>
                    <td class="text-center">${contactPerson.mobile}</td>
                    <td class="text-center">${contactPerson.emailPerson}</td>              
                    <th class="text-center">
                       <a type="button" class="btn btn-danger" href="deleteContactPerson/${contactPerson.contactPersonID}" onclick="return confirm(<spring:message code="DeleteClick"/>);"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
                     </th>                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
       
         </div>
       
       <form:form method="post" modelAttribute="branch">
         
            
           <h4>   <spring:message code="Branch"/>  </h4>
            
                                 <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="Country"/></label>
                    <div class="col-sm-4">                     
                     <form:select  path="branchesID" class="form-control"  id="ddlCountry" >
                     <form:option value = "0" label = "Select Country"/>     
                      <form:options items = "${countryList}" />              
                  </form:select>   </div>
                     <div class="col-sm-2"></div>
            </div>
                                <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="State"/></label>
                    <div class="col-sm-4">                     
                     <form:select  path="branchesID" class="form-control"  id="ddlStateID">
                     <form:option value = "0" label = "Select State"/>                   
                  </form:select>   </div>
                     <div class="col-sm-2"></div>
            </div>
                                <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"><spring:message code="City"/></label>
                    <div class="col-sm-4">                     
                     <form:select  path="cityID" class="form-control"  id="ddlCity">
                     <form:option value = "0" label = "Select City"/>                   
                  </form:select>   </div>
                     
                     <div class="col-sm-2"> <input type="submit" class="btn btn-info" value=<spring:message code="AddBranch"/> name="branch" onclick="return validateBranch();"/>  </div>
            </div>
                        
            
    </form:form>
    
                 <div class="form-group row">
                  <div class="col-sm-1"></div>  
        <div class="col-sm-10">
                <c:if test="${not empty BrancheList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        <spring:message code="BranchesList"/>    </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="CountryName"/></th>
                <th  class="text-center" scope="col"><spring:message code="StateName"/> </th>
                 <th class="text-center" scope="col"><spring:message code="CityName"/> </th>
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                  <c:forEach var="branch" items="${BrancheList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${branch.countryName}</td>
                    <td class="text-center">${branch.stateName}</td>      
                     <td class="text-center">${branch.cityName}</td>
                              
                    <th  class="text-center">
                       <a type="button" class="btn btn-danger" href="deleteBranches/${branch.branchesID}" onclick="return confirm(<spring:message code="DeleteClick"/>);"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
                     </th>                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
    
    <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label"></label>
                     <div class="col-sm-2"><a href="vendorMain"  class="btn btn-warning" > <spring:message code="Back"/></a></div>
                      <div class="col-sm-2"></div>
                      <div class="col-sm-2"><a href="vendorProduct"  class="btn btn-success" > <spring:message code="Save&Continue"/></a></div>
                     <div class="col-sm-2"></div>
                     
                     
            </div>
    
    
    
  <div class="form-group row" style="height:100px;"></div>
 
  
    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>
     
     
     
       <script language="javascript" type="text/javascript"> 
     $(document).ready(function() { 
    		$('#ddlCountry').change(    				
    			function() {
    				
    				var selectedID  =$( "#ddlCountry option:selected" ).val()
    				$.ajax({    					
    				     type: "GET",
    				     url: "GetAllStates",    				    
    				     data: { id: selectedID } ,// parameters
    				     success : function(response) {    				    	
    				    	 var json = JSON.parse(response);    
    				    	 populateDropdown( '#ddlStateID', json)    	
    				    	 clearDropdown('#ddlCity');
    		                },
    		                error : function(xhr, status, error) {
    		                 /*    alert(xhr.responseText);
    		                    alert(xhr.error); */
    		                }
    		            }); });	
     });	
    		
    		
    		$('#ddlStateID').change(    				
    	 			function() {
    	 				var selectedID  =$( "#ddlStateID option:selected" ).val()
        				$.ajax({    					
        				     type: "GET",
        				     url: "GetAllCities",    				    
        				     data: { id: selectedID } ,// parameters
        				     success : function(response) {    				    	
        				    	 var json = JSON.parse(response);    
        				    	 populateDropdown( '#ddlCity', json)    	
        				    	 
        		                },
        		                error : function(xhr, status, error) {
        		                 /*    alert(xhr.responseText);
        		                    alert(xhr.error); */
        		                }
        		            }); });	
    	 			
    		
    		
    		
    		function validateBank() {  	
    	    	 $('#alert').empty(); 
    	    	 var isValid = true;    	    	
    	   
    	    	 if ( $( "#ddlBankName option:selected" ).val() ==0)
    	    	  {    		 
    	    		  $('#alert').append("select Bank Name! ");
    	    		  isValid = false;
    	    	  } 
    	    	  

    	    	  if ($('#iban').val().length <1)
    	    	  {    		 
    	    		  $('#alert').append("enter iban ! ");  isValid = false;   		      		  
    	    	  } 	    	  
 
    	    	  if (isValid)	  {   		 
    	    		  $('#alertBar').removeClass( "show" ); 		  $('#alertBar').addClass( "hide" ); 		  return true;
    	    	  }
    	    	  else  {    		  
    	    		  $('#alertBar').removeClass( "hide" ); 		  $('#alertBar').addClass( "show" );   $(window).scrollTop(0);		  return false;
    	    		  }
    	    	
    	    	}
    		
    		function validatePerson() {  	
   	    	 $('#alert').empty(); 
   	    	 var isValid = true;    
   	    	 
   	    	if ($('#fullName').val().length <1)
	    	  {    		 
	    		  $('#alert').append("enter full Name ! ");  isValid = false;
	    	  }  
   	   
	   	   if ($('#email').val().length <1)
	       	  {    		 
	       		  $('#alert').append("enter email ! ");	       		  isValid = false;   		      		  
	       	  }
	       	  else
	       		  if (!validateEmail($('#email').val()))
	           	  {    		 
	           		  $('#alert').append("wrong email ! ");	           		  isValid = false;
	           	  }

       	  if ($('#mobile').val().length <10)
       	  {    		 
       		  $('#alert').append("enter currect mobile Number ! ");       		  isValid = false;
       	  }	    	  

   	    	  if (isValid)	  {   		 
   	    		  $('#alertBar').removeClass( "show" ); 		  $('#alertBar').addClass( "hide" ); 		  return true;
   	    	  }
   	    	  else  {    		  
   	    		  $('#alertBar').removeClass( "hide" ); 		  $('#alertBar').addClass( "show" );   $(window).scrollTop(0);		  return false;
   	    		  }
   	    	
   	    	}
    		
    		function validateBranch() {  	
   	    	 $('#alert').empty(); 
   	    	 var isValid = true;    	    	
   	   
   	    	 if ( $( "#ddlCity option:selected" ).val() ==0)
       	  {    		 
       		  $('#alert').append("select your Branch ! ");
       		  isValid = false;
       	  } 
       	  	    	  

   	    	  if (isValid)	  {   		 
   	    		  $('#alertBar').removeClass( "show" ); 		  $('#alertBar').addClass( "hide" ); 		  return true;
   	    	  }
   	    	  else  {    		  
   	    		  $('#alertBar').removeClass( "hide" ); 		  $('#alertBar').addClass( "show" );   	 $(window).scrollTop(0);	  return false;
   	    		  }
   	    	
   	    	}
    		
    		
    		</script>
     
     
     
     
</body>
</html>