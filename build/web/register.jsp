<%-- 
    Document   : index
    Created on : 10-jun-2021, 12:59:12
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
    <!-- Hoja de estilos personalizada -->
    <link rel="stylesheet" href="css/estilo-login.css">
    <!-- Iconos varios -->
    <script src="https://kit.fontawesome.com/00392aceb1.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="imagen/favicon.png" type="imagen/favicon.png">
</head>
<body>
    <img src="imagen/fondoregistro.jpg" style="position: absolute; height: 100%; width: 100%; opacity: 90%">
    <img src="imagen/icono.png" style="position: relative; width: 10%; left: 44%; top: 1em;" alt="">
    <div class="container" style="background-color: rgba(0, 204, 255, 0.8)" >
        <form action="registercod.jsp" method="post" name="register">
        <div class="log">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                <i class="fas fa-user input-group-text" style="background-color: rgba(20, 85, 75, 0.9); font-size: 2em; border-color: rgba(255, 255, 255, 0); color: white"></i>
                </div>
                <input type="text" minlength="5" maxlength="20" name="Usuario" class="form-control" placeholder="Usuario" style="border-color: rgba(0, 17, 255, 0); background-color: rgba(255, 255, 255, 0.479);" required>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <i class="fas fa-key input-group-text" style="background-color: rgba(20, 85, 75, 0.9); color: white; font-size: 2em;  border-color: rgba(255, 255, 255, 0);"></i>
            </div>
        <input type="password" class="form-control" required
      pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*+`~=?\|<>/]).{8,}" name="Contrasena" placeholder="Contraseña con Mayuscula, minuscula, número, carácter especial y 8 caracteres " style="border-color: rgba(0, 0, 0, 0); background-color: rgba(255, 255, 255, 0.479);" required>
        </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                <i class="fas fa-envelope input-group-text" style="background-color: rgba(20, 85, 75, 0.9); color: white; font-size: 2em; border-color: rgba(255, 255, 255, 0);"></i>
                </div>
            <input type="email" class="form-control" name="Correo" placeholder="Correo" style="border-color: rgba(0, 17, 255, 0); background-color: rgba(255, 255, 255, 0.479);" required>
        </div>
            
                <button class="btn btn-lg" style="width: 100%; background-color: rgba(36, 140, 201, 0.876); border: rgb(73, 68, 68);">
                <div class="text-shadow">REGISTRAR</div>
                </button>               
         
    </div>
        </form>
        <div class="row align-items-start">
            
            <div class="col">
                <a href="index.jsp" style="text-decoration: none;"><div class="col py-3" style="text-align: right; font-size: 1em; color: rgb(255, 255, 255); font-weight: 500;">
                <b>Logueate</b>
                </div></a></div>
            </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>
