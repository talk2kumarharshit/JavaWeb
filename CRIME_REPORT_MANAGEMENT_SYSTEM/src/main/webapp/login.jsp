<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<style type="text/css">
		body 
		{
		  margin: 0;
		  padding: 0;
		  background-color: #17a2b8;
		  height: 100vh;
		  background: url('https://cdn.pixabay.com/photo/2016/11/27/08/24/crime-1862312_960_720.jpg') fixed;
		  background-size: cover;
		}
		#login .container #login-row #login-column #login-box 
		{
		  margin-top: 120px;
		  max-width: 600px;
		  height: 340px;
		  border: 1px solid #9C9C9C;
		  background-color: #EAEAEA;
		}
		#login .container #login-row #login-column #login-box #login-form 
		{
		  padding: 20px;
		}
		#login .container #login-row #login-column #login-box #login-form #register-link 
		{
		  margin-top: -85px;
		}
	
	</style>	
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	</head>
	<body>
	
		<%
			String email = (String) session.getAttribute("email");
			if(email!=null)
			{
				response.sendRedirect("home.jsp");
			}
		%>

		<div id="login">
	        <h3 class="text-center text-white pt-5">Login form</h3>
	        <div class="container">
	            <div id="login-row" class="row justify-content-center align-items-center">
	                <div id="login-column" class="col-md-6">
	                    <div id="login-box" class="col-md-12">
	                        <form id="login-form" class="form" action="LoginHandler.jsp" method="post">
	                            <h3 class="text-center text-info">Login</h3>
	                            <%
	                            	String status = request.getParameter("status");
	                				if(status!=null)
		                			{
		                				if(status.equals("false"))
		                				{
		                					out.println("invalid login details");
		                				}
		                				else
		                				{
		                					out.println("Something went wrong!");
		                				}
		                			}                            
	                            %>
	                            <div class="form-group">
	                                <label for="email" class="text-info">Email:</label><br>
	                                <input type="email" name="email" id="email" class="form-control">
	                            </div>
	                            <div class="form-group">
	                                <label for="password" class="text-info">Password:</label><br>
	                                <input type="text" name="password" id="password" class="form-control">
	                            </div>
	                            <div class="form-group">
	                                
	                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Login">
	                            </div>
	                         
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</body>
</html>