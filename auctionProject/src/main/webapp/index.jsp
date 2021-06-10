<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file = "BootstrapCdn.jsp"%>
		
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script type="text/javascript" src="./js/CheckPassword.js" ></script>
		 <%
		
			String email=(String)session.getAttribute("email");
		 	if(email != null)
			{
				response.sendRedirect("home.jsp"); 
			}
		 	
			String status=request.getParameter("status");
			
			if(status!=null)
			{

				if(status.equals("false"))
				{
					out.println("Invalid Login Details");
				}
				else
				{
					out.println("Something wen Wrong");
				}
			}
			
		
		%>
		
	</head>
	
	<body>

		<div class="container">
			<div class="row">
				<img alt="banner" src="./img/banner.jpg" width="100%" height="200px"
					class="img-rounded">
			</div>
			
			<br />
			
			<div class="row">
				<div class="col-md-3"></div>
				
				<div class="col-md-6">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#login">Login</a></li>
						<li><a data-toggle="tab" href="#new_bidder">New Bidder</a></li>
					</ul>
	
					<div class="tab-content">
						<div id="login" class="tab-pane fade in active">
							<h3>Login</h3>
							<form action="LoginHandler.jsp" method="post">
								<input type="email" name="email" class="form-control" placeholder="Enter Email" required /> <br/>
								<input type="password" name="password" class="form-control" placeholder="Enter Password" required /> <br/>
								<input type="submit" value="Login" class="btn-block btn-lg btn-info" />
							</form>
						</div>
						
						<div id="new_bidder" class="tab-pane fade">
							<h3>New Bidder</h3>
							<form action="SignupHandler.jsp" method="post" name="signupForm">
								<input type="text" name="name" class="form-control" placeholder="Enter Name" required/> <br/>
								<input type="text" name="email" class="form-control" placeholder="Enter Email" required/> <br/>
								<input type="text" name="occupation" class="form-control" placeholder="Enter Occupation" required/> <br/>
								<input type="text" name="networth" class="form-control" placeholder="Enter Networth" required/> <br/>
								<select name="location" id="location" class="form-control">
								<option value="" disabled selected>Select Location</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
									<option value="Daman and Diu">Daman and Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Puducherry">Puducherry</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jammu and Kashmir">Jammu and Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>
								</select> <br/>
								<input type="text" name="mobile" class="form-control" placeholder="Enter Mobile" required/> <br/>
								<input type="text" name="password" class="form-control" placeholder="Enter Password" required/> <br/>
								<input type="text" name="password2" onkeyup="checkPassword()" class="form-control" placeholder="Re-enter Password" required/> 
									<span id="msg"></span>
								
								<br/>
								<input type="submit" value="Sign Up" class="btn-block btn-lg btn-info" /> <br/> <br/>
							
							</form>
						</div>
					</div>
				</div>
				
				<div class="col-md-3"></div>
				
			</div>
			<div class="row"></div>
		</div>

</body>
</html>