 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> vendor Details</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp"/>

      <div align="center">
         <form:form method="post" modelAttribute="vendor">


  <div class="form-group row">
<div class="col-sm-12">
    <h2><span class="glyphicon glyphicon-folder-open" ></span>     Vendor         </h2>
     <h4>    Vendor Details         </h4>
	</div></div>
	
	<div class="form-group row">
         <form:hidden path="vendorID" />
       
         <form:hidden   class="form-control" path="vendorID" />
         
                  
                <label  class="col-sm-4 col-form-label">vendor Name English</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorNameEn" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
              <div class="form-group row">
                 
                <label  class="col-sm-4 col-form-label">Vendor Name Arabic</label>
                    <div class="col-sm-4"><form:input  class="form-control"  path="vendorNameAr" disabled="true" /></div>
                     <div class="col-sm-2"></div>
            </div>
                      
            
            
                         <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label">Email</label>
                    <div class="col-sm-4"><form:input  class="form-control"  path="email" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
             
             
                                      <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label">LAN Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="lanNumber" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label">Mobile Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="mobileNumber" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label">Web Site </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="webSiteurl" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  
                <label  class="col-sm-4 col-form-label">C/R Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="crNumber" disabled="true"/></div>
                     <div class="col-sm-2"></div>
            </div>     
      
      
       		         <div class="form-group row">
                    <div class="col-sm-2"></div>
        <div class="col-sm-8">
                <c:if test="${not empty productList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        Product List       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">​
                    	  <tr>
                 <th class="text-center" scope="col">No</th>
                 <th class="text-center" scope="col">Product Name</th>
                <th class="text-center" scope="col">Category Name</th>
                <th class="text-center" scope="col">Sub Category Name</th>
                <th class="text-center" scope="col">Notes</th>                 
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="productList" items="${productList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${productList.productName}</td>
                    <td class="text-center">${productList.catName}</td>
                    <td class="text-center">${productList.subCatName}</td>
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
             <h2><span class="glyphicon glyphicon-edit" ></span>        Banks       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col">No</th>
                 <th class="text-center" scope="col">Bank Name</th>
                <th  class="text-center" scope="col">IBAN</th>                 
                  
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
             <h2><span class="glyphicon glyphicon-edit" ></span>        Contact List       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col">No</th>
                 <th class="text-center" scope="col">Full Name</th>
                <th  class="text-center" scope="col">Mobile</th>
                <th  class="text-center" scope="col">Email</th>                 
                  
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="contactList" items="${contactList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${contactList.fullName}</td>
                    <td class="text-center">${contactList.mobile}</td> 
                    <td class="text-center">${contactList.email}</td>              
                                               
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
             <h2><span class="glyphicon glyphicon-edit" ></span>        Branches List       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col">No</th>
                 <th class="text-center" scope="col">Country Name</th>
                <th  class="text-center" scope="col">State Name</th>
                <th  class="text-center" scope="col">City Name</th>
                <th  class="text-center" scope="col">Sort Name</th>                 
                  
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
             <h2><span class="glyphicon glyphicon-edit" ></span>        Attachment List       </h2>
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    	  <thead class="bg-primary ">
                    	<tr>
                 <th class="text-center" scope="col">No</th>
                <th  class="text-center" scope="col">Attachment En</th>
                <th  class="text-center" scope="col">Attachment Ar</th>
                <th class="text-center" scope="col">Download</th>    
                
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
                  		<label  class="col-sm-2 col-form-label">Comment</label>                
                  		<div class="col-sm-8">
                  		<form:textarea  class="form-control" path="comment" placeholder="Write Comment to Vendor"/> 
                  		</div>		
               </div>                  
 			     
               
      
             <div class="form-group row">
               <div class="col-sm-2"></div>
                  <div class="col-sm-4">
                    <input type="submit" class="btn btn-success" value="Approve" onclick="return confirm('Are you want to Approve this vendor ?');" name="approve"/> 
                  </div> 
                  <div class="col-sm-4">
                    <input type="submit" class="btn btn-danger" value="Reject" onclick="return confirm('Are you want to Reject this vendor ?');" name="reject"/> 
                  </div>  	 
              </div>  
       
 			</form:form>	
      
 		
 		
    </div>
 

</body>
</html>