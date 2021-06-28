<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.* , com.fun.*" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		
	</head>
	<body>
		<%
			String email=(String)session.getAttribute("email");
			if(email==null)
				response.sendRedirect("login.jsp");	
				
		%>
		<jsp:include page="admin_navigation.jsp" />
		<h3 align="center" style="background-color: grey; height:40px">Missing Person</h3>
		 <a href = "missing_reg.jsp" class="btn btn-danger m-3">Add Missing Person</a>
		
		<table class="table table-bordered table-striped table-dark table-responsive-sm">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">NAME</th>
			      <th scope="col">Name of Police Station</th>
			      <th scope="col">District</th>
			      <th scope="col">Date of Missing</th>
			      <th scope="col">Gender</th>
			       
			      <th scope="col">........</th>
			      <th scope="col">ACTION</th>
			    </tr>
			  </thead>
			  
			  <%
				  	try
				  	{
					  	Connection con=LoginDetails.getConnection();
					  	String query="select * from missing";
						
					  	PreparedStatement st=con.prepareStatement(query);
						ResultSet rs=st.executeQuery(query);
				  
				  		while(rs.next())
						{
							String id=rs.getString("id");
			  %>
			  
			  <tbody>
			    <tr>
			      <th scope="row"><%=rs.getString("id")%></th>
			      <td><%=rs.getString("name")%></td>
			      <td><%=rs.getString("nameofpolicestation")%></td>
			      <td><%=rs.getString("district")%></td>
			      <th><%=rs.getString("dateofmissing")%></th>
			      <td><%=rs.getString("gender")%></td>
			      <td>........</td>
			      <td> 
			      	 <a href = "missing_detail.jsp?id=<%=id%>" class="btn btn-info">View More Details</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      	 <a href = "missing_update.jsp?id=<%=id%>" class="btn btn-info">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				     <a href = "missing_delete.jsp?id=<%=id%>" class="btn btn-danger">Delete</a>
				  </td>
			    </tr>
			   <% 
				   		}
				  			con.close();
				  	}
					catch(Exception e)
					{
						e.printStackTrace();
					}
			  %>
			  </tbody>
			</table>
		
	</body>
</html>