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

                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">vendor Name English</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorNameEn" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
              <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Vendor Name Arabic</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorNameAr" /></div>
                     <div class="col-sm-2"></div>
            </div>
                      
                          <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">VendorType</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="vendorTypeID" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
            
                         <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Email</label>
                    <div class="col-sm-4"><form:input  class="form-control" path="email" /></div>
                     <div class="col-sm-2"></div>
            </div>
             
             
                                      <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Lane Number </label>
                    <div class="col-sm-4"><form:input  class="form-control" path="lanNumber" /></div>
                     <div class="col-sm-2"></div>
            </div>
            
             						  <div class="form-group row">
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
            </div>
      
    </form:form>

    </div>
    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>