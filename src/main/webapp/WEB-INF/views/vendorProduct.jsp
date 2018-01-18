 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vendor Product</title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center">
 

    <form:form method="post" modelAttribute="vendorProduct">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     Products         </h2>
                
            </div>
            
                   <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Category</label>
                    <div class="col-sm-4">
                     <form:select  path="vendorProductID" class="form-control" id="ddlCategory">
                     <form:option value = "0" label = "Select"/>
                     <form:options items = "${categoryList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-2">                

                     </div>
            </div>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Sub Category</label>
                    <div class="col-sm-4">                     
                     <form:select  path="SubCatID" class="form-control"  id="ddlSubcategory">
                     <form:option value = "0" label = "Select"/>                   
                  </form:select>   </div>
                     <div class="col-sm-2"></div>
            </div>
            
            
                         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Products</label>
                    <div class="col-sm-4"> 
                    <form:select  path="productID" class="form-control"  id="ddlproduct">
                     <form:option value = "0" label = "Select"/>                   
                  </form:select></div>
                     <div class="col-sm-2">
                     <form:input  class="form-control invisible" path="otherProduct"   id="otherProduct" placeholder="other Product (if not in list)" /> 
                     </div>
            </div>
             
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Notes</label>
                    <div class="col-sm-5"><form:textarea  class="form-control" path="notes" /></div>
                     <div class="col-sm-1">  </div>
            </div>
 
                
                   <div class="form-group row">
                  <div class="col-sm-3"></div>
                <label  class="col-sm-3 col-form-label"></label>

                    <div class="col-sm-4"><input type="submit" value="Save" name="vendorProduct"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
              </form:form>
            
                 <div class="form-group row">
                  <div class="col-sm-1"></div>  
        <div class="col-sm-10">
                <c:if test="${not empty productList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        products Lists    </h2>
                    	<table class="table table-dark">
                    	 <thead>
                    	<tr>
                 <th scope="col">No</th>
                 <th scope="col">Category  Name</th>
                <th scope="col">Subcategory Name </th>
                 <th scope="col">product Name </th>
                <th scope="col">Details </th>
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                  <c:forEach var="product" items="${productList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${product.catName}</td>
                    <td>${product.subCatName}</td>      
                     <td>${product.productName}</td>
                    <td>${product.notes}</td>          
                    <th  >
                       <a type="button" class="btn btn-danger" href="deleteProduct/${product.vendorProductID}"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
                     </th>                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
      <div class="col-sm-1"></div>  </div>
      
  

    </div>
    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>
     
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
    				    	 populateDropdown( '#ddlSubcategory', json)    	
    				    	 clearDropdown('#ddlproduct');
    		                },
    		                error : function(xhr, status, error) {
    		                 /*    alert(xhr.responseText);
    		                    alert(xhr.error); */
    		                }
    		            }); });	
    		
    		
    		$('#ddlSubcategory').change(    				
    	 			function() {
    	 				
    	 				var selectedID  =$( "#ddlSubcategory option:selected" ).val();
    	 				var Product  =$( "#ddlSubcategory option:selected" ).text()
    	 				    	 			
    	 				if(Product=='Other'){
    	 					 $('#otherProduct').removeClass( "invisible" );
    	 	    		  $('#otherProduct').addClass( "visible" );
    	 				}
    	 				else
    	 					{
    	 					 $('#otherProduct').removeClass( "visible" );
       	 	    		  $('#otherProduct').addClass( "invisible" );
    	 					}
    	 				$('#otherProduct').val('');
    	 				
    	 				$.ajax({    					
    	 				     type: "GET",
    	 				     url: "GetProducts",    				    
    	 				     data: { id: selectedID } ,// parameters
    	 				     success : function(response) {    				    	
    	 				    	 var json = JSON.parse(response);    
    	 				    	 populateDropdown( '#ddlproduct', json)       		                     		                
    	 		                },
    	 		                error : function(xhr, status, error) {
    	 		                   /*  alert(xhr.responseText);
    	 		                    alert(xhr.error); */
    	 		                }
    	 		            });
    	 			});	
    		
    		$('#ddlproduct').change(    				
    	 			function() {   	 	
    	 				
    	 				var Product  =$( "#ddlSubcategory option:selected" ).text()
    	 				var selectedID  =$( "#ddlproduct option:selected" ).val(); 	 			
		    	 			
    	 				if((Product=='Other') && (selectedID==0)){
    	 					 $('#otherProduct').removeClass( "invisible" );
    	 	    		  $('#otherProduct').addClass( "visible" );
    	 				}
    	 				else
    	 					{
    	 					 $('#otherProduct').removeClass( "visible" );
       	 	    		  $('#otherProduct').addClass( "invisible" );
    	 					}
    	 				$('#otherProduct').val('');
    	 	    	});
	
    	});

     
        </script>
</body>
</html>