<%-- 
    Document   : actualizardino
    Created on : 12 jun 2021, 0:10:35
    Author     : zaiiche
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>dino</title>
  </head>
  <body>
    <%
      request.setCharacterEncoding("UTF-8");
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/arkdata", "root", "");
      
      Statement s = connection.createStatement();
      
      String actualizacion = "UPDATE infodino SET NomDino='";
      actualizacion += request.getParameter("NomDino");
      actualizacion += "', Domesticable='";
      actualizacion += request.getParameter("Domesticable") == null ? "0":request.getParameter("Domesticable");
      actualizacion += "', Utilidad='";
      actualizacion += request.getParameter("Utilidad");
      actualizacion += "', Zona_CodZona='";
      actualizacion += request.getParameter("zona");
      actualizacion += "' WHERE CodDino=";
      actualizacion += request.getParameter("id");
      //out.print(actualizacion);
      s.execute(actualizacion);
      connection.close();
	  response.sendRedirect("modificarDinos.jsp");
    %>  
  </body>
</html>