<%-- 
    Document   : borradodinos
    Created on : 10 jun 2021, 21:46:59
    Author     : zaiiche
--%>
<%@page import="java.util.HashMap"%>
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
    <title>Consultas</title>
    <!-- Enlace a estilos de bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <!-- Enlace a estilos personalizados -->
    <link rel="stylesheet" href="estilo/estilo-consultas.css">
    <!-- Enlace a iconos e imagenes -->
    <script src="https://kit.fontawesome.com/00392aceb1.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="imagen/favicon.png" type="imagen/favicon.png">
</head>
<body>
     <%      
          HttpSession sesion = request.getSession();
          Class.forName("com.mysql.jdbc.Driver");
          Connection connection = DriverManager
                  .getConnection("jdbc:mysql://localhost:3306/arkdata", "root", "");
                   Statement s= connection.createStatement();
          
                ResultSet listado = s.executeQuery("SELECT infodino.CodDino, infodino.NomDino, infodino.Domesticable, infodino.Utilidad, zona.NomZona FROM infodino LEFT JOIN zona ON infodino.Zona_CodZona = zona.CodZona ORDER BY zona.CodZona");
%>
        
    <img class= "fondo2" src="imagen/fondobienvenida.jpg" style="width: 100%; height: 100%; position: relative; z-index: -99; position: absolute;">
    <div class="fondo"></div>
    <div class="collapse" id="navbarToggleExternalContent">
        <div class="p-4" style="background-color: rgba(0, 0, 0, 0.50);">
            <div class="row">
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
                        <a href="zonasdino.jsp" class="py-3 mb-0" style="text-decoration: none; color: white; font-weight: 500; font-size: 20px;">Mapas</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <class class="navbar navbar-light py-4 sticky-top" style="z-index: 99; background-color: rgb(246, 243, 243); box-shadow: 0px 0px 7px 0px;">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation" style="margin-left: 2%;">
            <span class="navbar-toggler-icon"></span>
            </button>
            <a href="#" style="text-decoration: none; color: rgb(25, 111, 223); position: relative;"><h2><b>Página de Borrado</b></h2></a>
            <div class="dropdown">
                <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <a href="#" style="text-decoration: none; color:  rgb(25, 111, 223);"><%out.print(sesion.getAttribute("usuario")); %><i class="fas fa-user input-group-text" style="font-size: 2em; background-color: rgba(255, 255, 255, 0); border-color: rgba(255, 255, 255, 0);"></i></a>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="margin-left: 32%;">
                    <li><a class="dropdown-item" href="bienvenida.jsp">Inicio</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="index.jsp">Cerrar sesión</a></li>
                </ul>
            </div>
    </class>
    <div style="margin: 3%;">
    <div class="row" style="text-align: center; font-size: 20px;">
        <table class="table" style="background-color: aquamarine">
                <tr><th></th><th>NomDino</th><th>Domesticable</th><th>Utilidad</th><th>Zona</th></tr>         
                    <tr></tr>                                 
                <%
                    while (listado.next()) {
                %>
                <tr>
                    <td></td>
                    <td><%=listado.getString("NomDino")%></td>
                    <td><%=listado.getBoolean("Domesticable")? "Sí" : "No"%></td>
                    <td><%=listado.getString("Utilidad")%></td>
                    <td><%=listado.getString("NomZona")%></td>
                    
                    
                    <td>
                        
                        
                     <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="font-size: 20px; margin-top: -4%;">
                <i class="far fa-trash-alt" style="font-size: 27px;"></i>
            </button>
                    </td>
                </tr>
               
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Eliminación de entidad</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    ¿Estás seguro de que deseas eliminar esta entidad?
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="boton">No</button>
                    <button onclick="location.href='borrardino.jsp?id=<%=listado.getString("CodDino")%>';" style="color: black; background-color: rgb(25, 111, 223);" type="button" class="btn" data-bs-dismiss="modal">Sí</button>
                    
                    </div>
                </div>
                </div>
                     <%
                    }
                %>
            </table>
     
</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>
