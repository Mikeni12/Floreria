<%-- 
    Document   : index
    Created on : 25/05/2017, 01:02:25 PM
    Author     : josuedaniel
--%>
<%@page import="java.sql.Types"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logica.Inventario"%>
<%@page import="dao.InventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title id="titulo">Jardín de Hurón</title>
        <link rel="stylesheet" href="css/main.css">
        
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        
        <script type="text/javascript">
            function cargaURL(url, titulo)
            {
                window.frames['marco-desplegado'].location = url;
                document.getElementById("titulo").innerHTML = titulo;
            }
        </script>
        
        <div class="navbar navbar-fixed-top">
            <a  class="button" onClick="cargaURL('registro.jsp', 'Registro')"><span>Registrarse</span></a>
            <a  class="button" href="login.jsp"><span>Acceder</span></a>
            <a  class="button" onClick="cargaURL('presentacion.html', 'Inicio')"><span>Inicio</span></a>
        </div>
    </head>
    <body onload="cargaURL('presentacion.html', 'Inicio')">
       <iframe class="area-desplegado" id="marco-desplegado" name="marco-desplegado" frameborder="0"></iframe>
    </body>
</html>
