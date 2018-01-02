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
            <h1></h1>
             <h2><span class="glyphicon glyphicon-edit" ></span>        User List      </h2>
                    	<table class="table table-dark">
                    	 <thead>
                    	<tr>
                 <th scope="col">No</th>
                 <th scope="col">User Name</th>
                <th scope="col">Email</th>
                  <th scope="col"></th>
                  <th scope="col"></th>
                </tr>
    </thead>
                   <tbody>
                <c:forEach var="user" items="${userList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <th  >
                                     
                    </th>
                    <th  >
                       <a type="button" class="btn btn-danger" href="deleteUser/${user.userID}"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>Delete</a>
                   
                     </th>
                             
                </tr>
                </c:forEach>   
                </tbody>          
            </table>
        </div>
        
        	</c:if>
        	
        	
        	
        	
 <jsp:include page="/WEB-INF/views/footer.jsp"/>

    </body>
</html>
