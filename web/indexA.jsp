<%@page import="java.sql.Types"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logica.Inventario"%>
<%@page import="dao.InventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@page session="true"%>
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
        <div class="navbar">
            <%
            HttpSession sesion = request.getSession();
            String usuario;
            
            if (sesion.getAttribute("user")!=null)
            {
                usuario=sesion.getAttribute("user").toString();
                %>
                <a  class="button" href="login.jsp?cerrar=true"><span>Cerrar sesión <%out.print(usuario);%></span></a>
                <%
                
            }
            else
                out.print("<script>location.replace('login.jsp');</script>");
            %>
            <a  class="button" onClick="cargaURL('CRUDusuario.jsp', 'Usuarios')"><span>CRUD Usuarios</span></a>
            <a  class="button" onClick="cargaURL('CRUD.jsp', 'Productos')"><span>CRUD Productos</span></a>
            <a  class="button" onClick="cargaURL('historial.jsp', 'Historial')"><span>Historial</span></a>            
            <a  class="button" onClick="cargaURL('presentacion.html', 'Inicio')"><span>Inicio</span></a>            
        </div>
        <style>
            .bg-1 { 
                background-color: #1abc9c; /* Green */
                color: #ffffff;
            }
        </style>
    </head>
    <body onload="cargaURL('presentacion.html', 'Inicio')">   
        <iframe class="area-desplegado" id="marco-desplegado" name="marco-desplegado" frameborder="0">            
        </iframe>
        
        <input type ></input>
    </body>
</html>
