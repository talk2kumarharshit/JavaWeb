<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <%@ page import = "java.sql.* , com.fun.*" %> 
    
    
    <%
    
    try
	{
		Connection con=LoginDetails.getConnection();
		String id=request.getParameter("id");
		String query = "delete from missing where id=?";
		
		
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, id);
		ps.executeUpdate();
		con.close();

		response.sendRedirect("missing_mod.jsp"); 
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
    
    
    %>