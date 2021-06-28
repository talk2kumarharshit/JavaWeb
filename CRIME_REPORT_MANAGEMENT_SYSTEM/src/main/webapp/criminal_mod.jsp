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
		<h3 align="center" style="background-color: grey; height:40px">Criminal Data</h3>
		 <a href = "criminal_reg.jsp" class="btn btn-danger m-3">Add Criminal</a>
		
		<table class="table table-bordered table-striped table-dark table-responsive-sm">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">NAME</th>
			      <th scope="col">NICK NAME</th>
			      <th scope="col">AGE</th>
			      <th scope="col">GENDER</th>
			      <th scope="col">OCCUPATION</th>
			      <th scope="col">CRIME TYPE</th>
			      <th scope="col">ADDRRESS</th>
			      <th scope="col">ACTION</th>
			    </tr>
			  </thead>
			  
			  <%
				  	try
				  	{
					  	Connection con=LoginDetails.getConnection();
					  	String query="select * from criminal";
						
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
			      <td><%=rs.getString("nickname")%></td>
			      <td><%=rs.getString("age")%></td>
			      <th><%=rs.getString("gender")%></th>
			      <td><%=rs.getString("Occupation")%></td>
			      <td><%=rs.getString("crimeType")%></td>
			      <td><%=rs.getString("address")%></td>
			      <td> 
			      	 <a href = "criminal_update.jsp?id=<%=id%>" class="btn btn-info">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   	 
				   	   <a href = "criminal_delete.jsp?id=<%=id%>" class="btn btn-danger">Delete</a>
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