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
                  <div class="form-group row">                <div class="col-sm-1"> </div>        
 <div class="col-sm-10"><div class='alert alert-danger ${alert.getVisible()}' id='alertBar' role="alert"> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i> <div id='alert'> ${alert.getMessage()}</div>  </div>
       </div><div class="col-sm-1"></div>            </div>  
       
            
                   <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label">Category</label>
                    <div class="col-sm-4">
                     <form:select  path="vendorProductID" class="form-control" id="ddlCategory">
                     <form:option value = "0" label = "Select"/>
                     <form:options items = "${categoryList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-4">                

                     </div>
            </div>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label">Sub Category</label>
                    <div class="col-sm-4">                     
                     <form:select  path="SubCatID" class="form-control"  id="ddlSubcategory">
                     <form:option value = "0" label = "Select"/>                   
                  </form:select>   </div>
                     <div class="col-sm-4"></div>
            </div>
            
            
                         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label">Products</label>
                    <div class="col-sm-4"> 
                    <form:select  path="productID" class="form-control"  id="ddlproduct">
                     <form:option value = "0" label = "Select"/>                   
                  </form:select></div>
                     <div class="col-sm-2">
                     <form:input  class="form-control invisible" path="otherProduct"   id="otherProduct" placeholder="other Product (if not in list)" /> 
                     </div>  <div class="col-sm-2"></div>
            </div>
             
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label">Notes</label>
                    <div class="col-sm-6"><form:textarea  class="form-control" id="txtNote" path="notes" /></div>
                     <div class="col-sm-2">  </div>
            </div>
 
                
                   <div class="form-group row">
                  <div class="col-sm-3"></div>
                <label  class="col-sm-4 col-form-label"></label>

                    <div class="col-sm-3"><input type="submit"  id= "btnVendorProduct" value="Save" onclick="return validateVendorProduct();" class="btn btn-info" name="vendorProduct"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
              </form:form>
            
                 <div class="form-group row">
                  <div class="col-sm-1"></div>  
        <div class="col-sm-10">
                <c:if test="${not empty productList}">    
        <div align="center">
            <h1></h1>
             <h2>  <i class="glyphicon glyphicon-tags" aria-hidden="true"></i>       products Lists    </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	 <thead class="bg-primary">
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
                       <a type="button" class="btn btn-danger" href="deleteProduct/${product.vendorProductID}" onclick="return confirm('Are you sure you want to delete this item?');"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
                     </th>                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
      <div class="col-sm-1"></div>  </div>

                       <div class="form-group row">
                  <div class="col-sm-1"></div>  
        <div class="col-sm-10">
                <c:if test="${not empty attachmentTypeList}">    
        <div align="center">
            <h1></h1>
             <h2><i class="fa fa-paperclip  fa-2x" aria-hidden="true"></i>   Upload   Attachments    </h2>
          
            
                    	
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	 <thead class="bg-primary ">
                    	<tr>
                 <th scope="col">No</th>
                 <th scope="col">Attachment  Name</th>
                <th scope="col"> </th>
                 <th scope="col">file </th>              
                  <th scope="col"> <h5 > ${message}</h5> </th>
                </tr>
    </thead>
                   <tbody>
                  <c:forEach var="type" items="${attachmentTypeList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${type.attachmentAr}</td>
                    <td colspan="2"> 
  
                           <form method="post" action="uploadFile" enctype="multipart/form-data">     
              <div class="form-group row"> 
               <div class="col-sm-4"> <input type="text" name="name" value=${type.fileName} class="invisible">
               <input type="text" name="typeID" value=${type.attachmentTypeID} class="invisible"></div>
             <div class="col-sm-4">  <input type="file" name="file"/> </div>
              <div class="col-sm-4"><button type="submit" class="btn btn-info"   > <i class="fa fa-cloud-upload " aria-hidden="true"> </i>Upload</button>
              
              </div>
              
                              
           </div>
        </form>                    
                    </td>                       
                   
                    <th >${attachment.fileName}
                     <c:set var="rowTypeId" value="${type.attachmentTypeID}"/>
                      <c:forEach var="attachment" items="${attachmentList}" varStatus="status">     
                      <c:set var="typeId" value="${attachment.attachmentTypeID}"/>                
                         <c:if test="${rowTypeId ==typeId}"> 
                          <a href=${attachment.fileName} target="_blank"> <i class="fa fa-cloud-download fa-2x" aria-hidden="true"></i> View</a>  
                          </c:if>  
                           </c:forEach>            
                     </th>                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
      <div class="col-sm-1"></div>  </div>
      
        <form:form method="post" >
    
         <div class="form-group row">
                  <div class="col-sm-3"></div>
                <label  class="col-sm-4 col-form-label"></label>

                    <div class="col-sm-3"></div>
                     <div class="col-sm-2"></div>
            </div>
            
                <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label"></label>
                     <div class="col-sm-2"><a href="vendorInfo"  class="btn btn-warning" > Back</a></div>
                      <div class="col-sm-2"></div>
                      <div class="col-sm-2">
                      <input type="submit" value="submit Profile"  class="btn btn-success"  name="completeProfile"/></div>
                     <div class="col-sm-2"></div>
                     
                     
            </div>
           </form:form> 
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

     
     
     function validateVendorProduct() {  	
    	 $('#alert').empty(); 
    	 var isValid = true;
    	
    		var selectedID  =$( "#ddlproduct option:selected" ).val();	  
    	  
    	  if ($( "#ddlproduct option:selected" ).val()==0)
    	  {    
    		 
    		  if (($("#ddlSubcategory option:selected").text() =='Other')&& ($("#otherProduct").val().length >1))
        	  { 
        		  isValid = true;   		      		  
        	  } else
        	  {    	
        		  $('#alert').append("please select the product details ! ");
        		  isValid = false; 
        	  }
    	  } 
        	   
    	
 	  if (isValid)
	  {    		 
		  $('#alertBar').removeClass( "show" );		  $('#alertBar').addClass( "hide" );			  return true;
	  }
	  else
		  {    		  
		  $('#alertBar').removeClass( "hide" );		  $('#alertBar').addClass( "show" );		$(window).scrollTop(0);  return false;
		  } 
    	
     }
     
        </script>
</body>
</html>