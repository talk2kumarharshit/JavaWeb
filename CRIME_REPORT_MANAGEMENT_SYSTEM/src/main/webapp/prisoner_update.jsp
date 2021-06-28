<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ page import = "java.sql.* , com.fun.*" %> 
    
    <%
   
   if(request.getParameter("submit")!=null)
   {
	   	String id=request.getParameter("id");
	    String name=request.getParameter("name");
		String chargesheetno=request.getParameter("chargesheetno");
		String nickname=request.getParameter("nickname");
		String typeofcrime=request.getParameter("typeofcrime");
		String familymembers=request.getParameter("familymembers");
		String identitficationmark=request.getParameter("identitficationmark");
		String height=request.getParameter("height");
		String weight=request.getParameter("weight");
		String color=request.getParameter("color");
		try
		{
			Connection con=LoginDetails.getConnection();
			String query = "update prisoner set name=?, chargesheetno=?, nickname=?, typeofcrime=?, familymembers=?, identitficationmark=?, height=?, weight=?, color=? WHERE (id = ?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, name); 
			ps.setString(2, chargesheetno);
			ps.setString(3, nickname);
			ps.setString(4, typeofcrime); 
			ps.setString(5, familymembers);
			ps.setString(6, identitficationmark);
			ps.setString(7, height);
			ps.setString(8, weight);
			ps.setString(9, color);
			ps.setString(10, id);
			
			ps.executeUpdate();
			con.close();
			response.sendRedirect("prisoner_mod.jsp"); 
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
			  	String query="select * from prisoner where id=?";
				
			  	PreparedStatement ps=con.prepareStatement(query);
			  	
			  	ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				 while(rs.next())
				{
            %>
            	<a href="prisoner_mod.jsp" class="btn btn-primary">&#8592;</a>
            
                <h4>Modify Prisoner Details</h4>
                
                <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="name" value="<%=rs.getString("name")%>" name="name" placeholder="Enter Name" class="form-control" autofocus>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="csn" class="col-sm-5 control-label">Charge Sheet Number</label>
                    <div class="col-sm-9">
                        <input type="text" id="csn" value="<%=rs.getString("chargesheetno")%>" name="chargesheetno" placeholder="Enter Charge Sheet Number" class="form-control" autofocus>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="nickname" class="col-sm-3 control-label">Nickname</label>
                    <div class="col-sm-9">
                        <input type="text"  value="<%=rs.getString("nickname")%>" id="nickname" name="nickname" placeholder="Enter Nickname" class="form-control" autofocus>
                    </div>
                </div>
                
                
                 <div class="form-group">
                    <label for="crimeType" class="col-sm-4 control-label">Type of Crime</label>
                    <div class="col-sm-9">
                        <input type="text"  value="<%=rs.getString("typeofcrime")%>" id="crimeType" name="typeofcrime" placeholder="Enter Crime Type" class="form-control" autofocus>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="familymembers" class="col-sm-4 control-label">Family Members</label>
                    <div class="col-sm-9">
                        <input type="text" id="familymembers"  value="<%=rs.getString("familymembers")%>" name="familymembers" placeholder="Enter Family Members" class="form-control" autofocus>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="identificationmark" class="col-sm-5 control-label">Identification Marks</label>
                    <div class="col-sm-9">
                        <input type="text" id="identificationmark"  value="<%=rs.getString("identitficationmark")%>" name="identitficationmark" placeholder="Enter Identification Marks" class="form-control" autofocus>
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="height" class="col-sm-3 control-label">Height</label>
                    <div class="col-sm-9">
                       <input type="text" id="height" name="height"  value="<%=rs.getString("height")%>" placeholder="Enter Height" class="form-control" autofocus>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="weight" class="col-sm-3 control-label">Weight</label>
                    <div class="col-sm-9">
                       <input type="text" id="weight" name="weight"  value="<%=rs.getString("weight")%>" placeholder="Enter Weight" class="form-control" autofocus>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="color" class="col-sm-3 control-label">Face Color</label>
                    <div class="col-sm-9">
                        <input type="text" id="color" name="color"  value="<%=rs.getString("color")%>" placeholder="Enter Face Color" class="form-control" autofocus>
                    </div>
                </div>
                
                 <% } %>
                
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block" style="color: red">All fields are Required</span>
                    </div>
                </div>
                <input type="submit" name="submit" class="btn btn-primary btn-block" value="Save Changes">
                <input type="reset" class="btn btn-primary btn-block">
            </form> 
        </div> 
		
	</body>
</html>