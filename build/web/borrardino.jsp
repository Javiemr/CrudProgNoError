<%-- 
    Document   : borrardino
    Created on : 12 jun 2021, 0:21:51
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
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/arkdata", "root", "");
      Statement s = connection.createStatement();
      
      String borrado = "DELETE FROM infodino WHERE CodDino=";
      borrado += request.getParameter("id");
      
      //out.print(borrado);
      s.execute(borrado);connection.close();
      response.sendRedirect("bienvenida.jsp");
    %>
  
  </body>
</html>