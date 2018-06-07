    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="logica.*" %>
<jsp:useBean id="usuario" scope="session" class="logica.Usuario" />

<%
    usuario.setContexto(application);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Vista
        </title> 
        <script type="text/javascript">
            function limpiar()
            {
                document.getElementById("nombreusuario").value = "";
                document.getElementById("contrasena").value = "";
                document.getElementById("nombre").value = "";
                document.getElementById("appat").value = "";
                document.getElementById("apmat").value = "";
            }

        </script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <div class="w3-card-4">
            <div class="w3-container w3-teal">
                <h5>Usuarios.</h5>
            </div>
            <form class="w3-container" name="form01" method="post" action="ServletControladorUsuario">
                <p>      
                    <label class="w3-text-teal"><b>Usuario:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="nombreusuario" name="nombreusuario" value='<jsp:getProperty name="usuario" property="nombreusuario"/>'/>
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Contraseña:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="contrasena" name="contrasena" disabled value='<jsp:getProperty name="usuario" property="contrasena"/>'  />
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Nombre:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="nombre" name="nombre" disabled value='<jsp:getProperty name="usuario" property="nombre"/>'  />
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Apellido paterno:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="appat" name="appat" disabled value='<jsp:getProperty name="usuario" property="appat"/>'  />
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Apellido materno:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="apmat" name="apmat" disabled value='<jsp:getProperty name="usuario" property="apmat"/>'  />
                </p>
                <div style="width:900px; margin:0 auto;">                
                    <button class="w3-btn w3-teal" type="submit" name="submit" value="Consulta">Consulta</button>
                    <button class="w3-btn w3-teal" type="submit" name="submit" value="Baja">Baja</button>
                    <button class="w3-btn w3-teal" type="button" value="Limpiar" onClick="limpiar()">Limpiar</button>                         
                </div>                              
            </form>            
        </div>
        
        <h4><jsp:getProperty name="usuario" property="mensaje" /></h4>
    </body>
</html>