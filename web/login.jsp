<%-- 
    Document   : login
    Created on : 28/05/2017, 01:54:06 AM
    Author     : miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            .button {
                text-align: center;
                background:#7f8c8d;
                color:#fff;
                display:inline-block;
                font-size:1.25em;
                margin:20px;
                padding:10px 0;
                text-align:center;
                width:200px;
                text-decoration:none;
                box-shadow:0px 3px 0px #373c3c;
            }

            .button span {
                margin-right:10px;
            }

            /*Colores*/
            .button.blue {
                background:#3498db;
                box-shadow:0px 3px 0px #266792;
            }

            .button.large {
                width:150px;
            }


            .button.radius {
                border-radius:50px;
            }

            /*Efectos, Hover*/
            .button:hover {
                box-shadow:0px 0px 0px;
                padding-top:7px;
            }
        </style>
        <script>
            function validateForm() {
                var emailv = document.forms["myForm"]["email"].value;
                var passw = document.forms["myForm"]["pass"].value;
                if (emailv == "") {
                    alert("No haz colocado tu nombre de usuario");
                    return false;
                }
                if (passw == "") {
                    alert("No haz colocado tu contraseña");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="w3-card-4">
            <div class="w3-container w3-teal">
                <h2>Inicio de sesión.</h2>
            </div>
            <form class="w3-container" action="loginprocess.jsp" name="myForm" onsubmit="return validateForm()" method="POST">
                <p>      
                    <label class="w3-text-teal"><b>Usuario:</b></label>
                    <input class="w3-input w3-border w3-sand" name="email" type="text" required></p>
                <p>      
                    <label class="w3-text-teal"><b>Contraseña:</b></label>
                    <input class="w3-input w3-border w3-sand" name="pass" type="password"></p>              
                <p><button class="w3-btn w3-teal" type="submit" name="btnIngresar" value="Ingresar" required>Ingresar</button></p>
            </form>            
        </div>
        <div class="w3-padding w3-display-bottommiddle">
        <a href="index.jsp" class="button blue large">
                <span class="icon-house"></span>Inicio
            </a>
            </div>
        <%
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
            }
        %>
    </body>
</html>
