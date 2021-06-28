<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ page import = "java.sql.* , com.fun.*" %> 
     
      <%
	    if(request.getParameter("submit")!=null)
	    {
		    String name=request.getParameter("name");
			String nameofpolicestation=request.getParameter("nameofpolicestation");
			String district=request.getParameter("district");
			String dateofmissing=request.getParameter("dateofmissing");
			String gender=request.getParameter("gender");
			String age=request.getParameter("age");
			String complex=request.getParameter("complex");
			String height=request.getParameter("height");
			String idmark=request.getParameter("idmark");
			String address=request.getParameter("address");
			try
			{
				Connection con=LoginDetails.getConnection();
				String query = "insert into missing (name, nameofpolicestation, district, dateofmissing, gender, age, complex, height, idmark, address)  values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, name); 
				ps.setString(2, nameofpolicestation);
				ps.setString(3, district);
				ps.setString(4, dateofmissing); 
				ps.setString(5, gender);
				ps.setString(6, age);
				ps.setString(7, complex);
				ps.setString(8, height);
				ps.setString(9, idmark);
				ps.setString(10, address);
				
				ps.executeUpdate();
				con.close();
			
				response.sendRedirect("missing_mod.jsp");
			}
			catch(Exception E)
			{
				
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
         
            	<a href="missing_mod.jsp" class="btn btn-primary">&#8592;</a>
            
                <h4>Missing Person Registration</h4>
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="name" class="form-control" autofocus="autofocus">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-5 control-label">Name of Police Station</label>
                    <div class="col-sm-9">
                        <input type="text" name="nameofpolicestation" class="form-control" autofocus="autofocus">
                    </div>
                </div>
                
                 <div class="form-group">
                    <label class="col-sm-3 control-label">District</label>
                    <div class="col-sm-9">
                        <input type="text" name="district" class="form-control" autofocus="autofocus">
                    </div>
                </div>
                
                
                 <div class="form-group">
                    <label class="col-sm-4 control-label">Date of Missing</label>
                    <div class="col-sm-9">
                        <input type="text" name="dateofmissing" class="form-control" autofocus="autofocus"/>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-sm-4 control-label">Gender</label>
                    <div class="col-sm-9">
                        <input type="text" name="gender" class="form-control" autofocus="autofocus">
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="identificationmark" class="col-sm-5 control-label">Age</label>
                    <div class="col-sm-9">
                        <input type="text" name="age" class="form-control" autofocus="autofocus">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="height" class="col-sm-3 control-label">Complex</label>
                    <div class="col-sm-9">
                       <input type="text" name="complex" autofocus="autofocus" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="weight" class="col-sm-3 control-label">Height</label>
                    <div class="col-sm-9">
                       <input type="text" name="height" class="form-control" autofocus="autofocus">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="color" class="col-sm-4 control-label">Identification Mark</label>
                    <div class="col-sm-9">
                        <input type="text" name="idmark" class="form-control" autofocus="autofocus">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="color" class="col-sm-3 control-label">Address</label>
                    <div class="col-sm-9">
                        <input type="text" name="address" class="form-control" autofocus="autofocus">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block" style="color: red">All fields are Required</span>
                    </div>
                </div>
                <input type="submit" name="submit" class="btn btn-primary btn-block">
               
            </form> 
        </div> 
		
	</body>
</html>