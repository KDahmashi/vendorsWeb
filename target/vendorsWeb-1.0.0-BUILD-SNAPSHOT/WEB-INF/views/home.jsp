<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body> 
    
  
    
    
    <c:if test="${not empty userList}">

	 
<h1>Addresses</h1>
<table>
 <tr>
  <td width="100">Id</td>
  <td width="150">Street</td>
  <td width="150">City</td>
  <td width="150">Zip Code</td>
 </tr>
 <c:forEach items="${userList}" var="address">
  <tr>
   <td><c:out value="${address.name}"/></td>
   <td><c:out value="${address.email}" /></td>
   <td><c:out value="${address.name}" /></td>
   <td><c:out value="${address.email}" /></td>
  </tr>
 </c:forEach>
</table>


 

	</c:if>
    
        <div align="center">
            <h1>Contact List</h1>
            <table border="1">
                <th>No</th>
                <th>Username</th>
                <th>Email</th>
                
    
                 
                <c:forEach var="user" items="${userList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                             
                </tr>
                </c:forEach>             
            </table>
        </div>
    </body>
</html>
