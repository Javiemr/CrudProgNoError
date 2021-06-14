<%-- 
    Document   : bienvenida
    Created on : 10 jun 2021, 14:39:55
    Author     : zaiiche
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Hoja de estilos de bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/login.css">
    <!-- iconos y cosas -->
    <script src="https://kit.fontawesome.com/00392aceb1.js" crossorigin="anonymous"></script>
    <title>Bienvenido</title>
    <link rel="shortcut icon" href="imagen/favicon.png" type="imagen/favicon.png">
</head>
<body>
         <%   
          HttpSession sesion = request.getSession(); 
          Class.forName("com.mysql.jdbc.Driver");
          Connection connection = DriverManager
                  .getConnection("jdbc:mysql://localhost:3306/arkdata", "root", "");
                   Statement s= connection.createStatement();
          
                ResultSet listado = s.executeQuery("SELECT zona.NomZona, zona.CodZona, zona.Dificultad, infodino.NomDino FROM zona LEFT JOIN infodino ON zona.CodZona = infodino.Zona_CodZona ORDER BY zona.CodZona");
%>
   <!-- Imagen de fondo -->
    <img src="imagen/fondobienvenida.jpg" alt="" style="width: 100%; height: 100%; background-size: cover; position: absolute; z-index: -99;">
    <div class="collapse" id="navbarToggleExternalContent">
        <div class="p-4" style="background-color: rgba(0, 0, 0, 0.42);">
            <div class="row">
                <% if (sesion.getAttribute("admin").equals("1")){%>
                <div class="col-md-3">
                    <div class="card-body" style="text-align: center;">
                        <h1 style="margin-left: 3%;"><i class="fas fa-user-check"></i></h1>
                        <a href="AltaDino.jsp" class="py-3" style="text-decoration: none; color: white; font-weight: 500; font-size: 20px;">Añadir</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-body" style="text-align: center;">
                        <h1 style="margin-left: 3%;"><i class="fas fa-user-times"></i></h1>
                        <a href="borradodino.jsp" class="py-3" style="text-decoration: none; color: white; font-weight: 500; font-size: 20px;">Eliminar</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-body" style="text-align: center;">
                        <h1><i class="fas fa-cogs"></i></h1>
                        <p></p>
                        <a href="modificarDinos.jsp" style="text-decoration: none; color: white; font-weight: 500; font-size: 20px;">Modificaciones</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-body" style="text-align: center;">
                        <h1><i class="fas fa-file-signature"></i></h1>
                        <a href="zonasdino.jsp" class="py-3 mb-0" style="text-decoration: none; color: white; font-weight: 500; font-size: 20px;">Ubicaciones</a>
                    </div>
                </div>
                 <% }%>
            </div>
           
        </div>
    </div>
    
    <class class="navbar navbar-light py-4 sticky-top" style="z-index: 99; background-color: rgb(246, 243, 243); box-shadow: 0px 0px 7px 0px;">
          <% if (sesion.getAttribute("admin").equals("1")){%>  
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation" style="margin-left: 2%;">
            <span class="navbar-toggler-icon"></span>
            </button>
        <% }%>
        
            <a href="#" style="text-decoration: none; color:  rgb(25, 111, 223); position: relative;"><h2><b>Página de Zonas</b></h2></a>
            <div class="dropdown">
                <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <a href="#" style="text-decoration: none; color: rgb(25, 111, 223);"><%out.print(sesion.getAttribute("usuario")); %><i class="fas fa-user input-group-text" style="font-size: 2em; background-color: rgba(255, 255, 255, 0); border-color: rgba(255, 255, 255, 0);"></i></a>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="margin-left: 30%">
                    <li><a class="dropdown-item" href="bienvenida.jsp">Inicio</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="index.jsp">Cerrar sesión</a></li>
                </ul>
            </div>
    </class>
<div style="margin: 3%;">
    <div class="row" style="text-align: center; font-size: 20px;">
        <table class="table" style="background-color: aquamarine">
            <tr><th>NumeroZona</th><th>Zona</th><th>Dificultad</th><th>Nombre de dino</th></tr>
                
                    <tr></tr> 
					<%
					while(listado.next()){
						%>
                    <tr>
                            <td><%=listado.getString("CodZona")%></td>
                            <td><%=listado.getString("NomZona")%></td>
                            <td><%=listado.getBoolean("Dificultad")? "Difícil" : "Fácil"%></td>
                            <td><%=listado.getString("NomDino")%></td>
							
						  						                                           
                        </tr>
					<%}%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>



