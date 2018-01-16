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

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     vendor Product         </h2>
                
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
                     <form:select  path="vendorProductID" class="form-control"  id="ddlSubcategory">
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
                     <div class="col-sm-2"></div>
            </div>
             
             
 
                
                   <div class="form-group row">
                  <div class="col-sm-3"></div>
                <label  class="col-sm-3 col-form-label"></label>

                    <div class="col-sm-4"><input type="submit" value="Save"/></div>
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
    				     url: "subCategory",    				    
    				     data: { id: selectedID } ,// parameters
    				     success : function(response) {    				    	
    				    	 var json = JSON.parse(response);    
    				    	 populateDropdown( '#ddlSubcategory', json)    	
    				    	 alert(selectedID);
    		                     		                
    		                },
    		                error : function(xhr, status, error) {
    		                    alert(xhr.responseText);
    		                    alert(xhr.error);
    		                }
    		            }); });	
	
    	});
     
        </script>
</body>
</html>