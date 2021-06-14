<%-- 
    Document   : altadinocod
    Created on : 11 jun 2021, 20:30:42
    Author     : zaiiche
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
  String nombre;
  String doma = request.getParameter("domesticable");
  String desc;
  String zona = request.getParameter("zona");
	if(doma == null)
	{
		doma = "0";
	}
  nombre = request.getParameter("nombredino"); 
  desc = request.getParameter("descdino");

  Class.forName("com.mysql.jdbc.Driver");
  Connection connection = DriverManager
          .getConnection("jdbc:mysql://localhost:3306/arkdata", "root", "");

  Statement st = connection.createStatement();
  ResultSet rs = st.executeQuery("SELECT * FROM infodino");
  st.execute("INSERT INTO InfoDino (Nomdino, Domesticable, Utilidad, Zona_CodZona) VALUE ('" + nombre + "','" + doma + "','" + desc + "','" + zona + "')");
  response.sendRedirect("modificarDinos.jsp");
%> 
