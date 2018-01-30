 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vendor Information</title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center">
 

    <form:form method="post" modelAttribute="bank">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     vendor Registration         </h2>
     <h4>    Bank Details         </h4>

                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Bank Name</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="bankName" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Bank IBAN</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="iban" /></div>
                     <div class="col-sm-2"> <input type="submit" class="btn btn-info" value="Add Bank" name="AddBank"/>  </div>
            </div>
        </form:form>    
        
        
        
         <div class="form-group row">
                  <div class="col-sm-3"></div>  
        <div class="col-sm-6">
                <c:if test="${not empty bankList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        banks       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th scope="col">No</th>
                 <th scope="col">Bank Name</th>
                <th scope="col">iban</th>                 
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="bank" items="${bankList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${bank.bankName}</td>
                    <td>${bank.iban}</td>              
                    <th  >
                       <a type="button" class="btn btn-danger" href="deleteBank/${bank.bankID}" onclick="return confirm('Are you sure you want to delete this item?');"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
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
                      
      <h4>   Contact Person   </h4>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Full Name </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="fullName" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
            
                         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Mobile Number</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="mobile" /></div>
                     <div class="col-sm-2"></div>
            </div>
             
             
                                      <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Email </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="email" /></div>
                     <div class="col-sm-2">
                     <input type="submit" class="btn btn-info" value="Add Person" name="AddPerson"/> </div>
            </div>
            
            
       </form:form>   
       
       
       <div class="form-group row">
                  <div class="col-sm-3"></div>  
        <div class="col-sm-6">
                <c:if test="${not empty contactPersonList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        Contact Persons       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th scope="col">No</th>
                 <th scope="col">Full Name</th>
                <th scope="col">Mobile Number</th>
                <th scope="col">Email</th>                 
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="contactPerson" items="${contactPersonList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${contactPerson.fullName}</td>
                    <td>${contactPerson.mobile}</td>
                    <td>${contactPerson.email}</td>              
                    <th  >
                       <a type="button" class="btn btn-danger" href="deleteContactPerson/${contactPerson.contactPersonID}" onclick="return confirm('Are you sure you want to delete this item?');"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
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
         
            
           <h4>   Branch  </h4>
            
                                 <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Country</label>
                    <div class="col-sm-4">                     
                     <form:select  path="branchesID" class="form-control"  id="ddlCountry">
                     <form:option value = "0" label = "Select"/>     
                      <form:options items = "${countryList}" />              
                  </form:select>   </div>
                     <div class="col-sm-2"></div>
            </div>
                                <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">state</label>
                    <div class="col-sm-4">                     
                     <form:select  path="branchesID" class="form-control"  id="ddlStateID">
                     <form:option value = "0" label = "Select"/>                   
                  </form:select>   </div>
                     <div class="col-sm-2"></div>
            </div>
                                <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">City</label>
                    <div class="col-sm-4">                     
                     <form:select  path="cityID" class="form-control"  id="ddlCity">
                     <form:option value = "0" label = "Select"/>                   
                  </form:select>   </div>
                     
                     <div class="col-sm-2"> <input type="submit" class="btn btn-info" value="Add Branch" name="branch"/>  </div>
            </div>
                        
            
    </form:form>
    
                 <div class="form-group row">
                  <div class="col-sm-1"></div>  
        <div class="col-sm-10">
                <c:if test="${not empty BrancheList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        Branch Lists    </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th scope="col">No</th>
                 <th scope="col">Country  Name</th>
                <th scope="col">State Name </th>
                 <th scope="col">City Name </th>
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                  <c:forEach var="branch" items="${BrancheList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${branch.countryName}</td>
                    <td>${branch.stateName}</td>      
                     <td>${branch.cityName}</td>
                              
                    <th  >
                       <a type="button" class="btn btn-danger" href="deleteBranches/${branch.branchesID}" onclick="return confirm('Are you sure you want to delete this item?');"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
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
                     <div class="col-sm-2"><a href="vendorMain"  class="btn btn-warning" > Back</a></div>
                      <div class="col-sm-2"></div>
                      <div class="col-sm-2"><a href="vendorProduct"  class="btn btn-success" > Save & Continue</a></div>
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
    	 			
    		</script>
     
     
     
     
</body>
</html>