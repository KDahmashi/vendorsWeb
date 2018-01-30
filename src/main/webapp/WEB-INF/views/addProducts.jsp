 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Category Information</title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center">
 

   
      
        
        
    <form:form method="post" modelAttribute="products">
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     Add new Products          </h2>
                
            </div>
            
                   <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Category</label>
                    <div class="col-sm-4">
                     <form:select  path="productID" class="form-control" id="ddlCategory">
                     <form:option value = "0" label = "Select"/>
                     <form:options items = "${categoryList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-2"></div>                
                 </div>
                 
                <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"> Sub Category</label>
                    <div class="col-sm-4">
                     <form:select  path="subCatID" class="form-control" id="ddlSubCategory">
                     <form:option value = "0" label = "Select"/>
                    
                  </form:select>   
                    </div>
                     <div class="col-sm-2"></div>                
                 </div>
                 
                 
                     <div class="form-group row">
                  <div class="col-sm-3"></div>  
        <div class="col-sm-6">
                    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        List of Products       </h2>

                    	 <table id="tblGrid" class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary ">​
                    	<tr>
                 <th scope="col">No</th>
                 <th scope="col">Product Name</th>                
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                   
                </tbody>          
            </table>
        </div> 
       </div>
       <div class="col-sm-3"></div>
       </div>
       
             
       
       
       
       
      
        <div class="form-group row">
       
            
             <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Product Name</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="productName" /></div>
                     <div class="col-sm-2"><input type="submit" class="btn btn-info" value="Add Product" name="addProducts"/></div>
        </div>
   
   </form:form>
        </div>
   
   
    <script language="javascript" type="text/javascript"> 
     $(document).ready(function() { 
    		$('#ddlCategory').change(    				
    			function() {
    				
    				var selectedID  =$( "#ddlCategory option:selected" ).val()
    				$.ajax({    					
    				     type: "GET",
    				     url: "GetSubCategory",    				    
    				     data: { id: selectedID } ,// parameters
    				     success : function(response) {    				    	
    				    	 var json = JSON.parse(response);    
    				    	 populateDropdown( '#ddlSubCategory', json)    	
    				    	 
    		                },
    		                error : function(xhr, status, error) {
    		                 /*    alert(xhr.responseText);
    		                    alert(xhr.error); */
    		                }
    		            }); });	
    		
    		$('#ddlSubCategory').change(    				
    	 			function() {
    	 				
    	 				var selectedID  =$( "#ddlSubCategory option:selected" ).val()
    	 				$.ajax({    					
    	 				     type: "GET",
    	 				     url: "GetProducts",    				    
    	 				     data: { id: selectedID } ,// parameters
    	 				     success : function(response) {    				    	
    	 				    	 var json = JSON.parse(response);    
    	 				    	 populateGrid(json)   
    	 		                },
    	 		                error : function(xhr, status, error) {
    	 		                 /*    alert(xhr.responseText);
    	 		                    alert(xhr.error); */
    	 		                }
    	 		            }); });
    		
    		
     });
    	
    	
  
  function populateGrid(json){  
 		$('#tblGrid  tbody tr').remove();
 	 var siNum=0;
 	 $.each( json, function( id, val ) {	  
 	      	            	    	siNum=siNum+1;    	      	            	    
 	    	   $("#tblGrid tbody").append(
 	                    "<tr>"
 	                      +"<td>"+siNum+"</td>"
 	                      +"<td>"+val+"</td>"
 	                     +"<td> <a type='button' class='btn btn-danger' onclick='return confirm(\" Are you sure you want to delete this item?\");'  href='DeletProduct/"+id+"' > <span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a></td>"
 	                    +"</tr>" )
 	               
 	  	  });       
 	 
 	}

     
        </script>
     
</body>
</html>