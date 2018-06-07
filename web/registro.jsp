<%-- 
    Document   : registo
    Created on : 28/05/2017, 02:18:35 AM
    Author     : miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="w3-card-4">
            <div class="w3-container w3-teal">
                <h2>Registro de usuario.</h2>
            </div>
            <form class="w3-container" name="myForm" onsubmit="return validateForm()" action="registroprocess.jsp">
                <p>      
                    <label class="w3-text-teal"><b>Usuario:</b></label>
                    <input class="w3-input w3-border w3-sand" name="usuario" type="text" required></p>
                <p>      
                    <label class="w3-text-teal"><b>Contraseña:</b></label>
                    <input class="w3-input w3-border w3-sand" name="contrasena" type="password" required></p>
                <p>      
                    <label class="w3-text-teal"><b>Nombre:</b></label>
                    <input class="w3-input w3-border w3-sand" name="nombre" pattern="[A-Za-z ]+" title="Solo se permiten letras" type="text" required></p>
                <p>      
                    <label class="w3-text-teal"><b>Apellido paterno:</b></label>
                    <input class="w3-input w3-border w3-sand" name="appat" pattern="[A-Za-z ]+" title="Solo se permiten letras" type="text" required></p>
                <p>      
                    <label class="w3-text-teal"><b>Apellido materno:</b></label>
                    <input class="w3-input w3-border w3-sand" name="apmat" pattern="[A-Za-z ]+" title="Solo se permiten letras" type="text" required></p>
                <p><button class="w3-btn w3-teal" type="submit" value="Registrarse">Registrarse</button></p>
            </form>            
        </div>        
    </body>
</html>
