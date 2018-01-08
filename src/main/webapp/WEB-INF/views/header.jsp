<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


  <link rel='stylesheet' href='resources/lib/theme/theme.css'>
    <script type='text/javascript' src='resources/lib/plugins/jquery-2.1.4.min.js'></script>
    <script type='text/javascript' src='resources/lib/plugins/bootstrap/js/bootstrap.min.js'></script>
     <script type='text/javascript' src='resources/lib/utils.js'></script>
  


<nav class="navbar navbar-default header">
 
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header1">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">
      <i class="fa fa-home" aria-hidden="true"> Vendor Management </i>      
      	
      </a>
    </div>

    <!--  --  menu are from database -- -->
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       <%--  <li class="active"><a href="home">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="<c:url value='/addUser' />">Add User</a></li> --%>        
 
           <c:if test="${not empty userSession}">
            <c:forEach var="menu" items="${userSession.menu}" varStatus="status">
             <li><a href="<c:url value='${menu.menuUrl}' />"> <i class="fa fa-bars text-danger" aria-hidden="true"></i> ${menu.menuEn}</a></li>
            </c:forEach>   
           	</c:if>
        
      </ul>
      
     
      <ul class="nav navbar-nav navbar-right">
       <c:if test="${not empty userSession.name}"> 
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" 
          			  data-toggle="dropdown" 
          			  role="button" 
          			  aria-haspopup="true" 
          			  aria-expanded="false">
          	<span class="badge">${userSession.name} <span class="glyphicon glyphicon-user"></span> </span>
          </a>
          <ul class="dropdown-menu">           
            <!-- <li role="separator" class="divider"></li> -->
            <li> <a href="logout"><i class="fa fa-sign-out fa-1x text-danger" aria-hidden="true"></i>Logout</a> </li>
          </ul>
        </li>
         	</c:if>
        
            <!--  --  menu for public user -- -->
       <c:if test="${empty userSession.name}"> 
      	 <li class="active"><a href="login"><i class="fa fa-sign-in fa-1x text-danger" aria-hidden="true"></i> Login <span class="sr-only">(current)</span></a></li>
        <li><a href="<c:url value='addUser' />"><i class="fa fa-registered fa-1x text-danger" aria-hidden="true"></i> Registration</a></li> 
      	</c:if>
      </ul>
     

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>