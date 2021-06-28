package com.fun;
import java.sql.*;
import com.bean.LoginBean;

public class LoginDetails 
{
	public static Connection getConnection() 
	{
		Connection con = null;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			String path = "jdbc:mysql://localhost:3306/CRIME_REPORT_DB";
			String user = "root";
			String pass = "KUMARharshit";
			con=DriverManager.getConnection(path, user, pass );
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return con;
	}
	
	public static String checkLogin(LoginBean obj) throws SQLException 
	{
		try 
		{
			Connection con = LoginDetails.getConnection();
			String query = "select * from login where email = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, obj.getEmail());
			ps.setString(2, obj.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) 
			{
				return "true";
			}
			else 
			{
				return "false";
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return "error";
	}
}
