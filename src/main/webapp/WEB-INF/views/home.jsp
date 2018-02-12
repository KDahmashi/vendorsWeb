<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body> 
    
  
 
   <jsp:include page="/WEB-INF/views/header.jsp"/>
   
    
    <c:if test="${not empty userList}">
    
        <div align="center">         
             <h2><span class="glyphicon glyphicon-edit" ></span>        User List      </h2>
                    
                       <div class="form-group row">
                  <div class="col-sm-2"></div> <div class="col-sm-8">
                    	<table class="table table-sm table-hover table-striped table-bordered">
                    <thead class="bg-primary">​
                    	<tr>
                 <th class="text-center" scope="col">No</th>
                 <th class="text-center" scope="col">User Name</th>
                <th  class="text-center" scope="col">Email</th>               
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="user" items="${userList}" varStatus="status">
                <tr>
                    <td class="text-center">${status.index + 1}</td>
                    <td class="text-center">${user.name}</td>
                    <td class="text-center">${user.email}</td>
                    <th  class="text-center">
                       <a type="button" class="btn btn-danger" href="deleteUser/${user.userID}" onclick="return confirm('Are you sure you want to delete this item?');"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                   
                     </th>
                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        </div>
                  <div class="col-sm-2"></div>
                  </div>
        	</c:if>
        	
        	
        	
        	
 <jsp:include page="/WEB-INF/views/footer.jsp"/>

    </body>
</html>
