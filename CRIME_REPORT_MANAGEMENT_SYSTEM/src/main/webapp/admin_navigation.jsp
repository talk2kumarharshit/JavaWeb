<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		
		
		<style type="text/css">
		
			img
			{
				height: 80px;
				width: 50px;
			}
			.logout
			{
				margin-left: -2px;
			}
			li
			{
				padding-left: 25px;
			}
	
		</style>
		
	</head>
	<body>
		<%
			String email=(String)session.getAttribute("email");
			if(email==null)
				response.sendRedirect("login.jsp");	
				
		%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top" id="main_navbar">
		
		 	<div class="container-fluid">
		          	<img src="img/logo.jpeg" alt="">
			   		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
		                aria-label="Toggle navigation">
		                <span class="navbar-toggler-icon"></span>
            		</button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-2">
			      	<li class="nav-item">
			          <a class="nav-link" href="home.jsp">Home</a>
			        </li>
			        <!-- <li class=" nav-item dropdown ">
			          <a class="dropdown-toggle nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">User Data</a>
			          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
	                      <li><a class="nav-link"  href="#">Add</a></li>
	                      <li><a class="nav-link"  href="#">View or Modify</a></li>
	                  </ul>
			        </li> -->
			       <!-- <li class=" nav-item dropdown ">
			          <a class="dropdown-toggle nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Mostwanted Person</a>
			          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
	                      <li><a class="nav-link"  href="mostwanted_reg.jsp">Add</a></li>
	                      <li><a class="nav-link"  href="#">View or Modify</a></li>
	                  </ul>
			        </li> -->
			        
			        <li class=" nav-item dropdown ">
			          <a class="dropdown-toggle nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Missing Person</a>
			          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
	                      <li><a class="nav-link"  href="missing_reg.jsp">Add</a></li>
	                      <li><a class="nav-link"  href="missing_mod.jsp">View or Modify</a></li>
	                  </ul>
			        </li>
			       <li class=" nav-item dropdown ">
			          <a class="dropdown-toggle nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Criminal Registration</a>
			          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
	                      <li><a class="nav-link"  href="criminal_reg.jsp">Add</a></li>
	                      <li><a class="nav-link"  href="criminal_mod.jsp">View or Modify</a></li>
	                  </ul>
			        </li>
			        <li class=" nav-item dropdown ">
			          <a class="dropdown-toggle nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Prisoner Report</a>
			          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
	                      <li><a class="nav-link"  href="prisoner_reg.jsp">Add</a></li>
	                      <li><a class="nav-link"  href="prisoner_mod.jsp">View or Modify</a></li>
	                  </ul>
			        </li>
			        <li class=" nav-item dropdown ">
			          <a class="dropdown-toggle nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin</a>
			          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
	                      <li><a class="nav-link"  href="admin_reg.jsp">Add</a></li>
	                  </ul>
			        </li>
			        <li class="nav-item logout">
			          <a class="nav-link btn btn-danger" href="logout.jsp">Logout</a>
			        </li>
			      </ul>
			     
			   </div>
			   <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			  		<li class="nav-item logout">
				          <h6 style="color: red">Hello: <%=email%></h6>
					</li>
			</ul>
		  </div>
		  
		</nav>
	</body>
</html>