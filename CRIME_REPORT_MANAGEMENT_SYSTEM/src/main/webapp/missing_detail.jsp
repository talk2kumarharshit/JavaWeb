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
			  	String query="select * from missing where id=?";
				
			  	PreparedStatement ps=con.prepareStatement(query);
			  	
			  	ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				 while(rs.next())
				{
            %>
            	<a href="missing_mod.jsp" class="btn btn-primary">&#8592;</a>
            
                <h4>Missing Person Details</h4>
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Name</label>
                    <div class="col-sm-9">
                        <input type="text" value="<%=rs.getString("name")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-5 control-label">Name of Police Station</label>
                    <div class="col-sm-9">
                        <input type="text" value="<%=rs.getString("nameofpolicestation")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                
                 <div class="form-group">
                    <label class="col-sm-3 control-label">District</label>
                    <div class="col-sm-9">
                        <input type="text"  value="<%=rs.getString("district")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                
                
                 <div class="form-group">
                    <label class="col-sm-4 control-label">Date of Missing</label>
                    <div class="col-sm-9">
                        <input type="text"  value="<%=rs.getString("dateofmissing")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-sm-4 control-label">Gender</label>
                    <div class="col-sm-9">
                        <input type="text"  value="<%=rs.getString("gender")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="identificationmark" class="col-sm-5 control-label">Age</label>
                    <div class="col-sm-9">
                        <input type="text" value="<%=rs.getString("age")%>"  class="form-control" readonly="readonly">
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="height" class="col-sm-3 control-label">Complexion</label>
                    <div class="col-sm-9">
                       <input type="text" value="<%=rs.getString("complex")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="weight" class="col-sm-3 control-label">Height</label>
                    <div class="col-sm-9">
                       <input type="text"  value="<%=rs.getString("height")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="color" class="col-sm-4 control-label">Identification Mark</label>
                    <div class="col-sm-9">
                        <input type="text" value="<%=rs.getString("idmark")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="color" class="col-sm-3 control-label">Address</label>
                    <div class="col-sm-9">
                        <input type="text" value="<%=rs.getString("address")%>" class="form-control" readonly="readonly">
                    </div>
                </div>
                
                 <% } %>
            
            </form> 
        </div> 
		
	</body>
</html>