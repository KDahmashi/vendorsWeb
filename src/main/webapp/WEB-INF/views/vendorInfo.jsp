 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vendor Information</title>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
  <div align="center">
 

    <form:form method="post" modelAttribute="bank">
    
    
       <div class="form-group row">

    <h2><span class="glyphicon glyphicon-folder-open" ></span>     vendor Registration         </h2>
     <h4>    Bank Details         </h4>

                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Bank Name</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="bankName" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Bank IBAN</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="iban" /></div>
                     <div class="col-sm-2"> <input type="submit" class="btn btn-success" value="Add Bank" name="AddBank"/>  </div>
            </div>
        </form:form>    
        
        
        
         <div class="form-group row">
                  <div class="col-sm-3"></div>  
        <div class="col-sm-6">
                <c:if test="${not empty bankList}">    
        <div align="center">
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        banks       </h2>
                    	<table class="table table-dark">
                    	 <thead>
                    	<tr>
                 <th scope="col">No</th>
                 <th scope="col">Bank Name</th>
                <th scope="col">iban</th>                 
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="bank" items="${bankList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${bank.bankName}</td>
                    <td>${bank.iban}</td>              
                    <th  >
                       <a type="button" class="btn btn-danger" href="deleteBank/${bank.bankID}"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>                   
                     </th>                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>        
     </div>
      <div class="col-sm-3"></div>  </div>
      
     
      <form:form method="post" modelAttribute="contactPerson">
                      
      <h4>   Contact Person   </h4>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Full Name </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="fullName" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
            
                         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Mobile Number</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="mobile" /></div>
                     <div class="col-sm-2"></div>
            </div>
             
             
                                      <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Email </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="email" /></div>
                     <div class="col-sm-2">
                     <input type="submit" class="btn btn-success" value="Add Person" name="AddPerson"/> </div>
            </div>
            
            
       </form:form>   
       
       
       <form:form method="post" modelAttribute="branch">
         
            
        <h4>   Branch Information   </h4>
            
             	<%-- 					  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Mobile Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="mobileNumber" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Web Site </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="webSiteurl" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">C/R Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="crNumber" /></div>
                     <div class="col-sm-2"></div>
            </div>     
                
                   <div class="form-group row">
                  <div class="col-sm-3"></div>
                <label  class="col-sm-3 col-form-label"></label>

                    <div class="col-sm-4"><input type="submit" value="Save"/></div>
                     <div class="col-sm-2"></div>
            </div> --%>
      
    </form:form>

    </div>
    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>