
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.* , com.fun.*" %> 
      
    <%
    	if(request.getParameter("submit")!=null)
    	{
			String name=request.getParameter("name");
			String reward=request.getParameter("reward");
			try
			{
				Connection con=LoginDetails.getConnection();
				String query = "insert into mostwanted (name, reward) values(?, ?)";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, name); 
				ps.setString(2, reward);
				ps.executeUpdate();
				con.close();
				/* 
				response.sendRedirect("mostwanted_reg.jsp");
				 */
			}
			catch(Exception E)
			{
				E.printStackTrace();
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
            	<a href="" class="btn btn-primary">&#8592;</a>
                <h4>Upload Most Wanted Person</h4>
                <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">Enter Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="name" name="name" placeholder="Enter Name" class="form-control" autofocus>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="reward" class="col-sm-4 control-label">Reward (in Rs)</label>
                    <div class="col-sm-9">
                        <input type="text" id="reward" name="reward" placeholder="Enter Reward" class="form-control" autofocus>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="photo" class="col-sm-3 control-label">Photo</label>
                    <div class="col-sm-9">
                        <input type="file" id="photo" name="file" class="form-control" autofocus>
                    </div>
                </div>
            
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block" style="color: red">All fields are Required</span>
                    </div>
                </div>
                <input type="submit" name="submit" class="btn btn-primary btn-block">
                <input type="reset"  class="btn btn-primary btn-block">
            </form> 
        </div> 
	</body>
</html>