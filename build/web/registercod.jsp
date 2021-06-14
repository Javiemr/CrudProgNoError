<%-- 
    Document   : registercod
    Created on : 11 jun 2021, 7:27:31
    Author     : zaiiche
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  
  String usuario;
  String contrasena;
  String correo;
 
  usuario = request.getParameter("Usuario");
  contrasena = request.getParameter("Contrasena");
  correo = request.getParameter("Correo");

  Class.forName("com.mysql.jdbc.Driver");
  Connection connection = DriverManager
          .getConnection("jdbc:mysql://localhost:3306/arkdata", "root", "");
  
  Statement st = connection.createStatement();
  ResultSet rs = st.executeQuery("SELECT NomUsu FROM Credencial");
  ArrayList <String> users = new ArrayList ();
  while (rs.next()) {
    String userName = rs.getString("NomUsu");
    users.add(userName);
  }
  
 if (users.contains(usuario)){
    response.sendRedirect("index.jsp");
  } else {
      st.execute("INSERT INTO credencial (NomUsu, PassUsu, EmailUsu) VALUE ('" + usuario + "','" + contrasena + "','" + correo + "')");
   response.sendRedirect("register.jsp");
 }

%>