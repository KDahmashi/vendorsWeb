 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="CategoryInformation"/></title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center">
 

   
      
        
         <div class="form-group row">
                  <div class="col-sm-3"></div>  
        <div class="col-sm-6">
                <c:if test="${not empty categoryList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>  <spring:message code="ListOfCategory"/>  </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="Category"/></th>                             
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="category" items="${categoryList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${category.value}</td>                                                                
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
             <form:form method="post" modelAttribute="category">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>  <spring:message code="AddNewCategory"/>  </h2>
     

                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"> <spring:message code="CategoryName"/> </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="catName" /></div>
                     <div class="col-sm-2"><input type="submit" class="btn btn-info" value=<spring:message code="AddCategory"/> name="addCategory"/></div>
            </div>
            
              
        </form:form>     
        	</c:if>        
     </div>
      <div class="col-sm-3"></div>  </div>
      
      
     
                <form:form method="post" modelAttribute="SubCategory">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>  <spring:message code="SubCategory"/>  </h2>
                
            </div>
            
                   <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"> <spring:message code="Category"/> </label>
                    <div class="col-sm-4">
                     <form:select  path="catID" class="form-control" id="ddlCategory">
                     <form:option value = "0" label = "Select"/>
                     <form:options items = "${categoryList}" />
                  </form:select>   
                    </div>
                     <div class="col-sm-2">                

                     </div>
            </div>     
            
              <div class="form-group row">
                  <div class="col-sm-3"></div>  
        <div class="col-sm-6">
                <c:if test="${not empty categoryList}">   
             <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>  <spring:message code="ListOfSubCategory"/>  </h2>
                    
                  	 <table  id="tblGrid" class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="SubCategoryName"/></th>                
                
                </tr>
    </thead>
                   <tbody class="text-center">
                
                </tbody>          
            </table>
        </div>
                	</c:if>        
     </div>
      <div class="col-sm-3"></div>  </div>
            
             <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label"> <spring:message code="SubCategoryName"/> </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="subCatName" /></div>
                     <div class="col-sm-2"><input type="submit" class="btn btn-info" value=<spring:message code="AddSubCatergory"/> name="addSubCategory"/></div>
 
 
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
    	                    +"</tr>" )
    	               
    	  	  });       
    	 
    	}
     
     </script>
     
</body>
</html>