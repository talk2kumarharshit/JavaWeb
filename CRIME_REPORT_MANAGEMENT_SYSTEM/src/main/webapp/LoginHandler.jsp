<%@page import="org.apache.catalina.startup.HomesUserDatabase"%>
<%@ page import="com.fun.LoginDetails"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:useBean id="obj" class="com.bean.LoginBean" scope="session"/>
    <jsp:setProperty property="*" name="obj"/>
    
    <%
    	String res = LoginDetails.checkLogin(obj);
    	if(res.equals("true"))
    	{
    		session.setAttribute("email", obj.getEmail());
    		response.sendRedirect("home.jsp");
    	}
    	if(res.equals("false"))
    	{
    		response.sendRedirect("login.jsp?status=false");
    	}
    	if(res.equals("error"))
    	{
    		response.sendRedirect("login.jsp?status=error");
    	}		
    
    
    %>