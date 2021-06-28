<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import = "java.sql.* , com.fun.*" %>  
   
   
   <%
   
   if(request.getParameter("submit")!=null)
   {
	   	String id=request.getParameter("id");
	    String name=request.getParameter("name");
		String nickname=request.getParameter("nickname");
		String age=request.getParameter("age");
		String gender=request.getParameter("gender");
		String occupation=request.getParameter("occupation");
		String crimeType=request.getParameter("crimeType");
		String address=request.getParameter("address");
		try
		{
			Connection con=LoginDetails.getConnection();
			String query = "update criminal set name=?, nickname=?, age=?, gender=?, occupation=?, crimeType=?, address=? WHERE (id = ?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, name); 
			ps.setString(2, nickname);
			ps.setString(3, age);
			ps.setString(4, gender); 
			ps.setString(5, occupation);
			ps.setString(6, crimeType);
			ps.setString(7, address);
			ps.setString(8, id);
			
			ps.executeUpdate();
			con.close();
			response.sendRedirect("criminal_mod.jsp"); 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
   
   }
   
   %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		
		<style type="text/css">
			body {
			     background: url('https://cdn.pixabay.com/photo/2018/06/18/10/56/shoe-print-3482282_960_720.jpg') fixed;
			    background-size: cover;
			}
			
			*[role="form"] {
			    max-width: 530px;
			    padding: 15px;
			    margin: 0 auto;
			    border-radius: 0.3em;
			    background-color: #f2f2f2;
			}
			
			*[role="form"] h4 { 
			    font-family: 'Open Sans' , sans-serif;
			    font-size: 22px;
			    font-weight: 600;
			    color: #000000;
			    margin-top: 5%;
			    text-align: center;
			    text-transform: uppercase;
			    letter-spacing: 4px;
			}
			
		</style>
		
	</head>
	<body>
		<%
			String email=(String)session.getAttribute("email");
			if(email==null)
				response.sendRedirect("login.jsp");	
				
		%>
		<jsp:include page="admin_navigation.jsp" />
		
		<div class="container">
            <form action="" method="post" class="form-horizontal" role="form">
            
            
            <%
            
            	String id= request.getParameter("id");
	            Connection con=LoginDetails.getConnection();
			  	String query="select * from criminal where id=?";
				
			  	PreparedStatement ps=con.prepareStatement(query);
			  	
			  	ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
            %>
            	<a href="criminal_mod.jsp" class="btn btn-primary">&#8592;</a>
            
                <h4>Modify Criminal Registration</h4>
                
                <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="name" name="name" value="<%=rs.getString("name")%>" placeholder="Enter Name" class="form-control" autofocus>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="nickname" class="col-sm-3 control-label">Nickname</label>
                    <div class="col-sm-9">
                        <input type="text" id="nickname" value="<%=rs.getString("nickname")%>" name="nickname" placeholder="Enter Nickname" class="form-control" autofocus>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="age" class="col-sm-3 control-label">Age</label>
                    <div class="col-sm-9">
                        <input type="number" value="<%=rs.getString("age")%>" id="age" name="age" placeholder="Enter Age" class="form-control" autofocus>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="gender" class="col-sm-3 control-label">Gender</label>
                    <div class="col-sm-9">
                        <input type="text" value="<%=rs.getString("gender")%>" id="gender" name="gender" placeholder="Enter Gender" class="form-control" autofocus>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="occupation" class="col-sm-3 control-label">Occupation</label>
                    <div class="col-sm-9">
                        <input type="text" value="<%=rs.getString("occupation")%>" id="occupation" name="occupation" placeholder="Enter Occupation" class="form-control" autofocus>
                    </div>
                </div>
                
                
                 <div class="form-group">
                    <label for="crimeType" class="col-sm-3 control-label">Crime Type</label>
                    <div class="col-sm-9">
                        <input type="text" value="<%=rs.getString("crimeType")%>" id="crimeType" name="crimeType" placeholder="Enter Crime Type" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="col-sm-3 control-label">Address</label>
                    <div class="col-sm-9">
                        <textarea id="address" value="<%=rs.getString("address")%>" name="address" placeholder="Enter Address" class="form-control" autofocus></textarea>
                    </div>
                </div>
                
                <% } %>
                
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block" style="color: red">All fields are Required</span>
                    </div>
                </div>
                <input type="submit" name="submit" value="Save Changes" class="btn btn-primary btn-block">
                <input type="reset" class="btn btn-primary btn-block">
            </form> 
        </div> 
		
	</body>
</html>