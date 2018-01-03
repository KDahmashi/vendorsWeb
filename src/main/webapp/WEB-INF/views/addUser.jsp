
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
   
  <div align="center">
 

    <form:form method="post" modelAttribute="user">
    
       <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Full Name</label>
                    <div class="col-sm-3"><form:input  class="form-control" path="name" /></div>
                     <div class="col-sm-3"></div>
            </div>
                  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Email</label>
                    <div class="col-sm-3"><form:input  class="form-control" path="email" /></div>
                     <div class="col-sm-3"></div>
            </div>
                  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Password</label>
                    <div class="col-sm-3"><form:input type="password" class="form-control" path="password" /></div>
                     <div class="col-sm-3"></div>
            </div>
                  <div class="form-group row">
                  <div class="col-sm-2"></div>
                <label  class="col-sm-4 col-form-label">Confirm Password</label>
                    <div class="col-sm-3"><form:input type="password" class="form-control" path="password" /></div>
                     <div class="col-sm-3"></div>
            </div>
                
                             <div class="form-group row">
                <div class="col-sm-2"> </div>
                <div class="col-sm-4"> <input type="submit" class="btn btn-warning" value="Cancel"/> </div>
                 <div class="col-sm-3"> <input type="submit" class="btn btn-success" value="Register"/>           </div>
                 <div class="col-sm-3"></div>
            </div>
            
       
       
    </form:form>

    </div>
    
     <jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>