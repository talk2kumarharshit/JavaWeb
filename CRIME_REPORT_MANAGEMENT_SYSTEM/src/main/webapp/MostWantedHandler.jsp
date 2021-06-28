<%-- <%@page import="com.fun.MostWantedData"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <jsp:useBean id="obj" class="com.bean.MostWantedBean"/>
    <jsp:setProperty property="*" name="obj"/>
    
   
    <%
    	int i = MostWantedData.insertMostWanted(obj);
    	if (i==1)
    		out.print("Uploaded");
    	/* response.sendRedirect("mostwanted_reg.jsp"); */
    %> --%>