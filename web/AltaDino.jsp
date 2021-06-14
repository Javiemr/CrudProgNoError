<%-- 
    Document   : AltaDino
    Created on : 11 jun 2021, 12:34:56
    Author     : zaiiche
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Hoja de estilos de bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/estilo-login.css">
    <!-- iconos y cosas -->
    <script src="https://kit.fontawesome.com/00392aceb1.js" crossorigin="anonymous"></script>
    <title>Alta</title>
    <link rel="shortcut icon" href="imagen/favicon.png" type="imagen/favicon.png">
</head>
<body>
    <%
    HttpSession sesion = request.getSession();%>
    
   <!-- Imagen de fondo -->
    <img src="imagen/fondobienvenida.jpg" alt="" style="width: 100%; height: 100%; background-size: cover; position: absolute; z-index: -99;">
    <div class="collapse" id="navbarToggleExternalContent">
        <div class="p-4" style="background-color: rgba(0, 0, 0, 0.42);">
            <div class="row">
                <div class="col-md-3">
                    <div class="card-body" style="text-align: center;">
                        <h1 style="margin-left: 3%;"><i class="fas fa-user-check"></i></h1>
                        <a href="#" class="py-3" style="text-decoration: none; color: white; font-weight: 500; font-size: 20px;">Añadir</a>
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
            <a href="#" style="text-decoration: none; color:  rgb(25, 111, 223); position: relative;"><h2><b>Añadir Dinosaurios</b></h2></a>
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
<form action="altadinocod.jsp" method="post" name="alta">
    <div class="container" style="background-color: cyan; opacity: 90%">
        <div class="log" >
            
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <i class="fas fa-signature input-group-text" style="background-color: rgba(20, 85, 75, 0.9); color: white; font-size: 2em;  border-color: rgba(255, 255, 255, 0);"></i>
            </div>
        <input type="text" name="nombredino" class="form-control" placeholder="NombreDino" style="border-color: rgba(0, 0, 0, 0); background-color: rgba(255, 255, 255, 0.479);"required>
        </div>
            
            <div class="input-group mb-3">
            <div class="input-group-prepend">
                <i class="fas fa-signature input-group-text" style="background-color: rgba(20, 85, 75, 0.9); color: white; font-size: 2em;  border-color: rgba(255, 255, 255, 0);"></i>
            </div>
        <input type="text" name="descdino" class="form-control" placeholder="Descripcion de dinosaurio" style="border-color: rgba(0, 0, 0, 0); background-color: rgba(255, 255, 255, 0.479);">
        </div>
            
            <div class="form-check py-3" style="text-align: left; font-size: 1em; color: rgb(255, 255, 255); font-weight: 500;">
                    <input class="form-check-input" type="checkbox" value="1" id="domesticable" name="domesticable" style="background-color: rgba(20, 85, 75, 0.3); border-color: rgba(20, 85, 75, 0.5);">
                    <label class="form-check-label" for="domesticable" style="background-color: rgba(20, 85, 75, 0.9); box-shadow: 10px 5px 5px black;">
                        <b>domesticable</b>
                    </label>
                </div>
            <div class="input-group mb-3">   
               <select name="zona" id="zona">
  <option value="1">Volcán</option>
  <option value="2">Ártico</option>
  <option value="3">Playa</option>
 <option value="4">Bosque</option>
 
</select>
        </div>			          
                <a href="modificarDinos.jsp"> <button class="btn btn-lg" style="width: 100%; background-color: rgba(36, 140, 201, 0.876); border: rgb(73, 68, 68);">
                    <a href="modificarDinos.jsp"><div class="text-shadow">Guardar</div>
                </button>  
                </a>
         
    </div>
 </div>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>



