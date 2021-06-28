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
		<h3 align="center" style="background-color: grey; height:40px">Prisoner Data</h3>
		<a href = "prisoner_reg.jsp" class="btn btn-danger m-3">Add Prisoner</a>
		<table class="table table-bordered table-striped table-responsive-sm ">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">NAME</th>
			      <th scope="col">CHARGE SHEET NO</th>
			      <th scope="col">NICKNAME</th>
			      <th scope="col">TYPE OF CRIME</th>
			      <th scope="col">FAMILY MEMBERS</th>
			      <th scope="col">IDENTIFICATION MARK</th>
			      <th scope="col">HEIGHT</th>
			      <th scope="col">WEIGHT</th>
			      <th scope="col">COLOR</th>
			      <th scope="col">ACTION</th>
			    </tr>
			  </thead>
			  
			  <%
				  	try
				  	{
					  	Connection con=LoginDetails.getConnection();
					  	String query="select * from prisoner";
						
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
			      <td><%=rs.getString("chargesheetno")%></td>
			      <td><%=rs.getString("nickname")%></td>
			      <th><%=rs.getString("typeofcrime")%></th>
			      <td><%=rs.getString("familymembers")%></td>
			      <td><%=rs.getString("identitficationmark")%></td>
			      <td><%=rs.getString("height")%></td>
			      <td><%=rs.getString("weight")%></td>
			      <td><%=rs.getString("color")%></td>
			      <td> 
			      	 <a href = "prisoner_update.jsp?id=<%=id%>" class="btn btn-info btn-sm">Edit</a>
				   	 
				   	   <a href = "prisoner_delete.jsp?id=<%=id%>" class="btn btn-danger btn-sm">Delete</a>
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