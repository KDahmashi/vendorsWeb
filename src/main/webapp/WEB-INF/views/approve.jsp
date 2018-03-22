 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="VendorDetails"/></title>
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
    $('#langBar').addClass( "hide" );
} );
      
      
      </script>
      
      <div align="center">
         <form:form method="post" modelAttribute="vendor">


  <div class="form-group row">
<div class="col-sm-12">
    <h2><span class="glyphicon glyphicon-folder-open" ></span>  <spring:message code="Vendor"/>  </h2>
     <h4>    <spring:message code="VendorDetails"/>         </h4>
	</div></div>
	
	<div class="form-group row">
         <form:hidden path="vendorID" />
       
         <form:hidden   class="form-control" path="vendorID" />
         
                  
                <label  class="col-sm-4 col-form-label"><spring:message code="VendorNameEnglish"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorNameEn" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
              <div class="form-group row">
                 
                <label  class="col-sm-4 col-form-label"><spring:message code="VendorNameArabic"/></label>
                    <div class="col-sm-4"><form:input  class="form-control"  path="vendorNameAr" disabled="true" /></div>
                     <div class="col-sm-2"></div>
            </div>
                      
            
            
                         <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label"><spring:message code="Email"/></label>
                    <div class="col-sm-4"><form:input  class="form-control"  path="email" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
             
             
                                      <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label"><spring:message code="LANNumber"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="lanNumber" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label"><spring:message code="MobileNumber"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="mobileNumber" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label"><spring:message code="WebSite"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="webSiteurl" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label"><spring:message code="C/RNumber"/></label>
                    <div class="col-sm-4"><form:input  class="form-control" path="crNumber" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>     
      
      
       		         <div class="form-group row">
                    <div class="col-sm-2"></div>
        <div class="col-sm-8">
                <c:if test="${not empty productList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span><spring:message code="ProductList"/></h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">​
                    	  <tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="CategoryName"/></th>
                 <th class="text-center" scope="col"><spring:message code="SubCategoryName"/></th>
                 <th class="text-center" scope="col"><spring:message code="ProductName"/></th>
                <th class="text-center" scope="col"><spring:message code="Notes"/></th>                 
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="productList" items="${productList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${productList.catName}</td>
                    <td class="text-center">${productList.subCatName}</td>
                    <td class="text-center">${productList.productName}</td>
                    <td class="text-center">${productList.notes}</td>              
                                               
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
     <div class="col-sm-2"></div>
        </div>
      
       		         <div class="form-group row">
                  <div class="col-sm-2"></div> 
        <div class="col-sm-4">
                <c:if test="${not empty bankList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span><spring:message code="Banks"/></h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="BankName"/></th>
                <th  class="text-center" scope="col"><spring:message code="IBAN"/></th>                 
                  
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="bank" items="${bankList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${bank.bankName}</td>
                    <td class="text-center">${bank.iban}</td>              
                  
                                    
                                                 
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
       
      
      
                    
        <div class="col-sm-4">
                <c:if test="${not empty contactList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span><spring:message code="ContactList"/></h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="FullName"/></th>
                <th  class="text-center" scope="col"><spring:message code="Mobile"/></th>
                <th  class="text-center" scope="col"><spring:message code="Email"/></th>                 
                  
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="contactList" items="${contactList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${contactList.fullName}</td>
                    <td class="text-center">${contactList.mobile}</td> 
                    <td class="text-center">${contactList.emailPerson}</td>              
                                               
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
        <div class="col-sm-2"></div> </div>
      
      <div class="form-group row">
      
                        <div class="col-sm-2"></div>  
        <div class="col-sm-8">
                <c:if test="${not empty branchesList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span><spring:message code="BranchesList"/></h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                 <th class="text-center" scope="col"><spring:message code="CountryName"/></th>
                <th  class="text-center" scope="col"><spring:message code="StateName"/></th>
                <th  class="text-center" scope="col"><spring:message code="CityName"/></th>
                <th  class="text-center" scope="col"><spring:message code="SortName"/></th>                 
                  
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="branchesList" items="${branchesList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${branchesList.countryName}</td>
                    <td class="text-center">${branchesList.stateName}</td> 
                    <td class="text-center">${branchesList.cityName}</td>
                    <td class="text-center">${branchesList.sortname}</td>              
                                              
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
     <div class="col-sm-2"></div>
        </div>
      
            <div class="form-group row">
      
                        <div class="col-sm-2"></div>  
        <div class="col-sm-8">
                <c:if test="${not empty attachList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span><spring:message code="AttachmentList"/></h2>
                    	<table id="attachmentTable" class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col"><spring:message code="No"/></th>
                <th  class="text-center" scope="col"><spring:message code="AttachmentEn"/></th>
                <th  class="text-center" scope="col"><spring:message code="AttachmentAr"/></th>
                <th class="text-center" scope="col"><spring:message code="Download"/></th>    
                
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="attachList" items="${attachList}" varStatus="status">
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
                    <td class="text-center">${attachList.attachmentAr}</td>
                    <td class="text-center"><a href=${attachList.url} target="_blank"> <i class="fa fa-cloud-download fa-2x" aria-hidden="true"></i></a></td>              
                                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
     <div class="col-sm-2"></div>
        </div>
      </form:form>      
      
               <form:form method="post" modelAttribute="update">
               <div class="form-group row">
                  		<label  class="col-sm-2 col-form-label"><spring:message code="Comment"/></label>                
                  		<div class="col-sm-8">
                  		<form:textarea  class="form-control" path="comment" placeholder="Write Comment To Vendor"/> 
                  		</div>		
               </div>                  
 			     
               
      
             <div class="form-group row">
               <div class="col-sm-2"></div>
                  <div class="col-sm-4">
                    <input type="submit" class="btn btn-success" value=<spring:message code="Approve"/> onclick="return confirm(<spring:message code="ApproveClick"/>);" name="approve"/> 
                  </div> 
                  <div class="col-sm-4">
                    <input type="submit" class="btn btn-danger" value=<spring:message code="Reject"/> onclick="return confirm(<spring:message code="RejectClick"/>);" name="reject"/> 
                  </div>  	 
              </div>  
       
 			</form:form>	
      
 		
 		
    </div>
 

</body>
</html>