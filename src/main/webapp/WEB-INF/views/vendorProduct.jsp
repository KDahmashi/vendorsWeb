 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="VendorProduct"/></title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
             	<!-- <script type='text/javascript' src='resources/lib/jquery-1.12.4.js'></script> -->
<script type='text/javascript' src='resources/lib/jquery.dataTables.min.js'></script>
<script type='text/javascript' src='resources/lib/dataTables.bootstrap.min.js'></script>
<script type='text/javascript' src='resources/lib/dataTables.bootstrap.min.css'></script>
<!-- <script type='text/javascript' src='resources/lib/bootstrap.min.css'></script> -->
   
         <script type="text/javascript">  
      $(document).ready(function() {
    $('#attachmentTable').DataTable();
    $('#productsTable').DataTable();
} );
      </script>
   
  <div align="center">
 

    <form:form method="post" modelAttribute="vendorProduct">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     <spring:message code="Products"/>         </h2>             
            </div>
                  <div class="form-group row">                <div class="col-sm-1"> </div>        
 <div class="col-sm-10"><div class='alert alert-danger ${alert.getVisible()}' id='alertBar' role="alert"> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i> <div id='alert'> ${alert.getMessage()}</div>  </div>
       </div><div class="col-sm-1"></div>            </div>  
       
            
                   <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label"><spring:message code="Category"/></label>
                    <div class="col-sm-4">
                     <form:select  path="vendorProductID" class="form-control" id="ddlCategory">
                     <form:option value = "0" label = "Select Category"/>
                     <form:options items = "${categoryList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-4">                

                     </div>
            </div>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label"><spring:message code="SubCategory"/></label>
                    <div class="col-sm-4">                     
                     <form:select  path="SubCatID" class="form-control"  id="ddlSubcategory">
                     <form:option value = "0" label = "Select Sub Category"/>                   
                  </form:select>   </div>
                     <div class="col-sm-4"></div>
            </div>
            

                         <div class="form-group row">
                         <h3><spring:message code="SelectMultiple"/></h3>
                  <div class="col-sm-2"></div>
                <form:label path="productIDList"  class="col-sm-2 col-form-label"><spring:message code="Products"/></form:label>
                    <div class="col-sm-4"> 
                    <form:select multiple="true" class="form-control"  path="productIDList"  id="ddlproduct">
                     <form:options value = "0" label = "Select Product"  />                    
                  </form:select>
                  </div>
                     <div class="col-sm-2">
                     <input  class="form-control invisible" path="otherProduct"   id="otherProduct" placeholder="other Product (if not in list)" /> 
                     </div>  <div class="col-sm-2"></div>
            </div>
             
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label"><spring:message code="Notes"/></label>
                    <div class="col-sm-6"><form:textarea  class="form-control" id="txtNote" path="notes" placeholder="Write Note"/></div>
                     <div class="col-sm-2">  </div>
            </div>
 
                
                   <div class="form-group row">
                  <div class="col-sm-3"></div>
                <label  class="col-sm-4 col-form-label"></label>

                    <div class="col-sm-3"><input type="submit"  id= "btnVendorProduct" value=<spring:message code="Save"/> onclick="return validateVendorProduct();" class="btn btn-info" name="vendorProduct"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
              </form:form>
            
                 <div class="form-group row">
                  <div class="col-sm-1"></div>  
        <div class="col-sm-10">
                <c:if test="${not empty productList}">    
        <div align="center">
            <h1></h1>
             <h2>  <i class="glyphicon glyphicon-tags" aria-hidden="true"></i>       <spring:message code="ProductsLists"/>    </h2>
                    	<table id="productsTable" class="table table-sm table-hover table-striped table-bordered">
                    	 <thead class="bg-primary">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="CategoryName"/></th>
                <th  class="text-center" scope="col"><spring:message code="SubCategoryName"/></th>
                 <th class="text-center" scope="col"><spring:message code="ProductName"/></th>
                <th  class="text-center"scope="col"><spring:message code="Details"/></th>
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                  <c:forEach var="product" items="${productList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${product.catName}</td>
                    <td class="text-center">${product.subCatName}</td>      
                     <td class="text-center">${product.productName}</td>
                    <td class="text-center">${product.notes}</td>          
                    <th class="text-center">
                       <a type="button" class="btn btn-danger" href="deleteProduct/${product.vendorProductID}" onclick="return confirm(<spring:message code="DeleteClick"/>);"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
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
       
       <div align="center">
             <h2><span class="glyphicon glyphicon-edit" ></span>        <spring:message code="ReferenceProjectsDownload"/>       </h2>
             <h3><spring:message code="YouMust"/></h3>
                    	
                    	<table id="downloadTable" class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="AttachmentName"/></th>
                 <th class="text-center" scope="col"><spring:message code="Download"/></th>    
                </tr>
                
                </thead>
                
                <tbody>
                
                <td class="text-center">${status.index + 1}</td>
                <td class="text-center"><spring:message code="ReferenceProjects"/></td>
        		<td class="text-center"><a href="resources\download/referenceProjects.xlsx" target="_blank"> <i class="fa fa-cloud-download fa-2x" aria-hidden="true"></i></a></td>
      
      		</tbody>          
            </table>
      
      </div></div></div>
      
         <div class="form-group row">
                  
        <div class="col-sm-1"></div>
       <div class="col-sm-10">
      
       <c:if test="${not empty attachmentList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        <spring:message code="AttachmentList"/>       </h2>
                    	
                    	<table id="attachmentTable" class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="AttachmentName"/></th>
                 <th class="text-center" scope="col"><spring:message code="Download"/></th>    
                 <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="attachList" items="${attachmentList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td> 
                    <td class="text-center">
                    
                    <c:set var="typeId" value="${attachList.attachmentTypeID}"/> 
                    <c:if test="${typeId >0}"> 
                         ${attachList.attachmentEn}
                          
                          </c:if>                 
                         <c:if test="${typeId ==0}"> 
                         ${attachList.fileName}
                          
                          </c:if>  
                    
                    
                    </td>
                    <td class="text-center"><a href="downloadFile/${attachList.attachmentID}" target="_blank"> <i class="fa fa-cloud-download fa-2x" aria-hidden="true"></i></a></td>              
                     <th  class="text-center">
                       <a type="button" class="btn btn-danger" href="deleteAttachment/${attachList.attachmentID}" onclick="return confirm(<spring:message code="DeleteClick"/>);"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
                     </th>                            
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>  
      
      </div>    <div class="col-sm-1"></div></div>
      

                       <div class="form-group row">
                    <div class="col-sm-1"></div>
        <div class="col-sm-10">
                <c:if test="${not empty attachmentTypeList}">    
        <div align="center">
            <h1></h1>
             <h2><i class="fa fa-paperclip  fa-2x" aria-hidden="true"></i>   <spring:message code="UploadAttachments"/>    </h2>
          
            
                    	
                    	<table id="uploadTable" class="table table-sm table-hover table-striped table-bordered">
                    	 <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="AttachmentAr"/></th>
                 <th class="text-center" scope="col"><spring:message code="AttachmentEn"/></th>
                 <th class="text-center" scope="col"><spring:message code="File"/> <h5 > ${message}</h5></th>              
                </tr>
    </thead>
                   <tbody>
                  <c:forEach var="type" items="${attachmentTypeList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${type.attachmentAr}</td>
                    <td class="text-center">${type.attachmentEn}</td>
                    <td colspan="3"> 
  
                           <form method="post" action="uploadFile" enctype="multipart/form-data">     
              <div class="form-group row"> 
               <div class="col-sm-4"> <input type="text" name="name" value=${type.fileName} class="invisible">
               <input type="text" name="typeID" value=${type.attachmentTypeID} class="invisible"></div>
             <div class="col-sm-4">  <input type="file" name="file"/> </div>
              <div class="col-sm-4"><button type="submit" class="btn btn-info"   > <i class="fa fa-cloud-upload " aria-hidden="true"> </i> <spring:message code="Upload"/> </button>
              
              </div>
              
                              
           </div>
        </form>                    
                    </td>                     
                     
                </tr>
                </c:forEach>  
                 
                                <tr class="text-center">
                    <td></td>
                    <td class="text-center"><spring:message code="OtherAttachments"/></td>
                    <td class="text-center" colspan="2"> 
  
                           <form method="post" action="uploadFile" enctype="multipart/form-data">     
              <div class="form-group row"> 
               <div class="col-sm-4"> <spring:message code="AttachmentName"/> <input type="text" name="name"  >
               <input type="text" name="typeID" value=0 class="invisible"></div>
             <div class="col-sm-4">  <input type="file" name="file"/> </div>
              <div class="col-sm-4"><button type="submit" class="btn btn-info"   > <i class="fa fa-cloud-upload " aria-hidden="true"> </i> <spring:message code="Upload"/> </button>
              
              </div>
              
                              
           </div>
        </form>                    
                    </td>                       
                   
                                               
                </tr>
                
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
                     <div class="col-sm-2"><a href="vendorInfo"  class="btn btn-warning" > <spring:message code="Back"/></a></div>
                      <div class="col-sm-2"></div>
                      <div class="col-sm-2">
                      <input type="submit" value=<spring:message code="SubmitProfile"/>  class="btn btn-success"  name="completeProfile"/></div>
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
        
        <script type="text/javascript">
        $(document).ready(function() {
    	    $("ul.dropdown-menu input[type=checkbox]").each(function() {
    	        $('#ddlproduct').change(function() {
    	            var line = "";
    	            $("ul.dropdown-menu input[type=checkbox]").each(function() {
    	                if($(this).is(":checked")) {
    	                    line += $("+ span", this).text() + ";";
    	                }
    	            });
    	            $("input.form-control").val(line);
    	        });
    	    });
    	});
        </script>
</body>
</html>