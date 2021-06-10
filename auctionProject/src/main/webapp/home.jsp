
<%@page import="com.configure.DBConnect"%>
<%@page import="java.sql.*"%>
 <%@ page import="com.storage.DBData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<%@ include file = "BootstrapCdn.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String email =(String) session.getAttribute("email");
		if(email!=null)
		{
			int b_id = DBData.getBidderId(email);
			String b_name = DBData.getBidderName(email);	
	%>
	
	<div	class="container">
		<div class="row">
			<nav class="navbar navbar-inverse">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="#">Auction Buddy</a>
			    </div>
			    <ul class="nav navbar-nav">
			      <li class="active"><a href="#">Home</a></li>
			     
			      <li><a href="Product_Form.jsp?id=<%=b_id%>"><button class="btn btn-primary navbar-btn">Create Auction</button></a></li>
			    </ul>
			  <a href="LogoutHandler.jsp" class="btn btn-lg btn-danger"> Logout </a>
			  </div>
			</nav>
		</div>
		<div class="row">
			<div class="col-md-6">
				
			
			</div>
			<div class="col-md-6">
				<h3> WELCOME! <%= b_name %> </h3>
			</div>
		
		</div>
		
		<div class="row">
		
		</div>
		
		<div class="row">
			<div class="col-md-4">
				<fieldset>
					<legend>Bidder Information</legend>
					<table class="table">
					<%
					
						try
						{
							Connection con = DBConnect.takeConnection();
							String query = "select * from bidder where email = ?";
							PreparedStatement ps = con.prepareStatement(query);
							ps.setString(1, email);
							ResultSet rs = ps.executeQuery();
							if(rs.next())
							{
								out.println("<tr><th>Name:</th><td>"+rs.getString("name")+"</td></tr>");
								out.println("<tr><th>Email: </th><td>"+rs.getString("email")+"</td></tr>");
								out.println("<tr><th>Occupation:</th><td>"+rs.getString("occupation")+"</td></tr>");
								out.println("<tr><th>Networth:</th><td>"+rs.getString("networth")+"</td></tr>");
								out.println("<tr><th>Location:</th><td>"+rs.getString("location")+"</td></tr>");
								out.println("<tr><th>Mobile:</th><td>"+rs.getString("mobile")+"</td></tr>");
							}
							
						}
						catch(Exception exception)
						{
							exception.printStackTrace();
						}
					
					%>
						<tr><th><button class="btn btn-sm btn-info">Edit</button></th>
					
					</table>
				</fieldset>
							
			</div>
			<div class="col-md-6">
				<jsp:include page="BidderAuctionDetails.jsp">
					<jsp:param name="id" value="<%=b_id %>"></jsp:param>
				</jsp:include>
			
			</div>
		</div>
	
	</div>
	<%} %>

</body>
</html>