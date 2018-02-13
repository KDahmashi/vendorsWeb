 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Search</title>
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
    $('#searchTable').DataTable(); 
} );

      </script>


		

      
         <form:form method="post" modelAttribute="searchInput">

    
       <div class="form-group row">
              <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label">Vendor Name</label>                
                 <div class="col-sm-2">
                 <form:input  class="form-control" path="vendorNameEn" placeholder="Vendor Name Arabic or English"/>                 
 		</div>
 		<label  class="col-sm-2 col-form-label">Product Name</label>                
                 <div class="col-sm-2">
                 <form:input  class="form-control" path="productName" placeholder="Product Name"/>
 		</div>
 		 <div class="col-sm-2"></div>
 	</div>
 		
 			 <div class="form-group row">  
 			  <div class="col-sm-2"></div>           
                <label  class="col-sm-2 col-form-label">Category Name</label>                
                 <div class="col-sm-2">
                 <form:input  class="form-control" path="catName" placeholder="Category Name"/> 		</div> 		
 			
             
                <label  class="col-sm-2 col-form-label">Sub Category Name</label>                
                 <div class="col-sm-2">
                 <form:input  class="form-control" path="subCatName" placeholder="Sub Category Name"/> 		</div>
                  <div class="col-sm-2">
                    <input type="submit" class="btn btn-success" value="Search"/> 
                  </div>
 		</div>
 		
 		
 		
    </form:form>
 
  
      
<%--  <c:if test="${not empty search}"> --%>
    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        Vendors Search      </h2>
                    	<table  id="searchTable" class="table table-sm table-hover table-striped table-bordered">
                    	 <thead class="bg-primary ">
                    	<tr>
                <th class="text-center" scope="col">No</th>
                <th class="text-center" scope="col">Vendor Name En</th>
                <th class="text-center" scope="col">Vendor Name Ar</th>
                <th class="text-center" scope="col">Mobile Number</th>
                <th class="text-center" scope="col">LAN Number</th>
                <th class="text-center" scope="col">Web Site URL</th>
                <th class="text-center" scope="col">Email</th>
                <th class="text-center" scope="col">Status Ar</th>
                <th class="text-center" scope="col">Status En</th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="vendor" items="${search}" varStatus="status">
                <tr>
                <td>${status.index + 1}</td>
                <td > <a  href="approve?id=${vendor.vendorID}" > ${vendor.vendorNameEn}</a> 
                	 <%--  <a type="button" class="btn btn-danger" href="deleteProduct?id=${product.vendorProductID}" > <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a> --%>
              </td>
                <td class="text-center">${vendor.vendorNameAr}</td>
                <td class="text-center">${vendor.mobileNumber}</td>
                <td class="text-center">${vendor.lanNumber}</td>
                <td class="text-center">${vendor.webSiteurl}</td>
                 <td class="text-center">${vendor.email}</td>
                 <td class="text-center">${vendor.statusAr}</td>
                 <td class="text-center">${vendor.statusEn}</td>
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        
        <%-- 	</c:if> --%>
        	
        	 <c:if test="${empty search}">
        	 
        	 <script type="text/javascript">
   			 var msg = "No Data Found";
    		alert(msg);
</script>
        </c:if>
        


</body>
</html>