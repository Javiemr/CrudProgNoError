<%-- 
    Document   : modificarDinos
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
    <% if (sesion.getAttribute("admin").equals("1")){%>
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
                        <a href="#" style="text-decoration: none; color: white; font-weight: 500; font-size: 20px;">Modificaciones</a>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="card-body" style="text-align: center;">
                        <h1><i class="fas fa-file-signature"></i></h1>
                        <a href="zonasdino.jsp" class="py-3 mb-0" style="text-decoration: none; color: white; font-weight: 500; font-size: 20px;">Mapas</a>
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
            <a href="#" style="text-decoration: none; color: rgb(25, 111, 223); position: relative;"><h2><b>Página de Modificaciones</b></h2></a>
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
                <tr><th>Id de dinosaurio</th><th>NomDino</th><th>Domesticable</th><th>Utilidad</th><th></th></tr>
                
                    <tr></tr>                
                    
                    
                    <% if (sesion.getAttribute("admin").equals("1")){%>
                       
                    <button onclick="window.location.href='AltaDino.jsp'" type="button" class="btn btn-primary">Añadir</button>
                        
                 <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal" aria-label="Close">Modificar</button>       
                  
                     <% }%>                     
         <a class="btn btn-info" href="zonasdino.jsp" role="button">Zonas</a>
                <%
                    while (listado.next()) {
                %>
                <tr>
                    <td><%=listado.getString("CodDino")%></td>
                    <td><%=listado.getString("NomDino")%></td>
                    <td><%=listado.getBoolean("Domesticable")? "Sí" : "No"%></td>
                    <td><%=listado.getString("Utilidad").equals("")? "Ninguna utilidad principal" : listado.getString("Utilidad")%></td>
                    <td><%=listado.getString("NomZona")%></td>
                    
                    <td>
					<% if (sesion.getAttribute("admin").equals("1")){%>
                        
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
                </div>			<% }%>
                       
                    </td>
                </tr>
                <form action="actualizardino.jsp?CodDino=<%=listado.getString("CodDino")%>" id="actualizar">
                    		<%
                    }
                %>
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                           
                <div class="modal-dialog">
                <div class="modal-content">
                    
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modificación de entidad</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-user" style="border: rgba(255, 192, 203, 0);"></i></span>
                        <input type="text" class="form-control" name="NomDino" placeholder="Nombre de dinosaurio" aria-label="Nombre" aria-describedby="basic-addon1" required>
						<input type="text" class="form-control" name="id" placeholder="Id de dinosaurio" aria-label="Id" aria-describedby="basic-addon1" required>
						</div>
                        <div class="form-check py-3" style="text-align: left; font-size: 1em; color: rgb(255, 255, 255); font-weight: 500;">
                    <input class="form-check-input" type="checkbox" value="1" id="Domesticable" name="Domesticable" style="background-color: rgba(20, 85, 75, 0.3); border-color: rgba(20, 85, 75, 0.5);">
                    <label class="form-check-label" for="Domesticable" style="background-color: rgba(20, 85, 75, 0.9); box-shadow: 10px 5px 5px black;">
                        <b>Domesticable</b>
                    </label>
                </div>
                        <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon3"><i class="fas fa-at"></i></span>
                        <input type="text" class="form-control" name="Utilidad" id="basic-url" placeholder="Utilidad" aria-describedby="basic-addon3">
                        </div>
                        <div class="input-group mb-3">
                        <select name="zona" id="zona">
  <option value="1">Volcán</option>
  <option value="2">Ártico</option>
  <option value="3">Playa</option>
 <option value="4">Bosque</option>
</select>
                        </div>   
                    </div>
                    <div class="modal-footer"> 
                        <a href="actualizardino.jsp"><button type="submit" form ="actualizar"class="btn btn-success">Guardar</button></a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </form>
                    </div>
                </div>
				</div>
				</div>
        
		
				
				</table>
          
     
</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>
