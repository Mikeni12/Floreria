<%-- 
    Document   : indexA
    Created on : 31/05/2017, 07:31:37 PM
    Author     : miguel
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
<%@ page session="true" %>
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
                <a  class="button" href="login.jsp"><span>Cerrar sesión <%out.print(usuario);%></span></a>
                <%                
            }
            else
                out.print("<script>location.replace('login.jsp');</script>");
            %>
            <a  class="button" onClick="cargaURL('catalogo.jsp', 'Inicio')"><span>Inicio</span></a>
            <a  class="button" onClick="cargaURL('AgregarTotal.jsp', 'carrito')"><span>Carrito</span></a>
        </div>
    </head>
    <body onload="cargaURL('catalogo.jsp', 'Inicio')">
        <iframe class="area-desplegado" id="marco-desplegado" name="marco-desplegado" frameborder="0"></iframe>
    </body>
</html>