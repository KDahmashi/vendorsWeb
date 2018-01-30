 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	 
<title>Insert title here</title>
</head>
<body>



<jsp:include page="/WEB-INF/views/header.jsp"/>


		

      
         <form:form method="post" modelAttribute="searchInput">

    
       <div class="form-group row">
              <div class="col-sm-2"></div>
                <label  class="col-sm-2 col-form-label">Vendor Name</label>                
                 <div class="col-sm-2">
                 <form:input  class="form-control" path="vendorNameEn" />                 
 		</div>
 		<label  class="col-sm-2 col-form-label">Product Name</label>                
                 <div class="col-sm-2">
                 <form:input  class="form-control" path="productName" />
 		</div>
 		 <div class="col-sm-2"></div>
 	</div>
 		
 			 <div class="form-group row">  
 			  <div class="col-sm-2"></div>           
                <label  class="col-sm-2 col-form-label">Category Name</label>                
                 <div class="col-sm-2">
                 <form:input  class="form-control" path="catName" /> 		</div> 		
 			
             
                <label  class="col-sm-2 col-form-label">Sub Category Name</label>                
                 <div class="col-sm-2">
                 <form:input  class="form-control" path="subCatName" /> 		</div>
                  <div class="col-sm-2">
                    <input type="submit" class="btn btn-success" value="Search"/> 
                  </div>
 		</div>
 		
 		
 		
    </form:form>
 
<%--  <c:if test="${not empty search}"> --%>
    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        Vendors Search      </h2>
                    	<table  id="example" class="table table-sm table-hover table-striped table-bordered">
                    	 <thead class="bg-primary ">
                    	<tr>
                <th scope="col">No</th>
                <th scope="col">Vendor Name En</th>
                <th scope="col">Vendor Name Ar</th>
                <th scope="col">Mobile Number</th>
                <th scope="col">Lane Number</th>
                <th scope="col">Web Site url</th>
                <th scope="col">Email</th>
                <th scope="col">Status Ar</th>
                <th scope="col">Status En</th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="vendor" items="${search}" varStatus="status">
                <tr>
                <td>${status.index + 1}</td>
                <td > <a  href="approve?id=${vendor.vendorID}" > ${vendor.vendorNameEn}</a> 
                	 <%--  <a type="button" class="btn btn-danger" href="deleteProduct?id=${product.vendorProductID}" > <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a> --%>
              </td>
                <td >${vendor.vendorNameAr}</td>
                <td >${vendor.mobileNumber}</td>
                <td >${vendor.lanNumber}</td>
                <td >${vendor.webSiteurl}</td>
                 <td >${vendor.email}</td>
                 <td >${vendor.statusAr}</td>
                 <td >${vendor.statusEn}</td>
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