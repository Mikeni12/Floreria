<%-- 
    Document   : index
    Created on : 25/05/2017, 01:02:25 PM
    Author     : josuedaniel
--%>

<%@page import="basededatos.Consultas"%>
<%@page import="java.sql.Types"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Producto"%>
<%@page import="logica.Producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logica.Inventario"%>
<%@page import="logica.Inventario"%>
<%@page import="dao.InventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jardin de Huron</title>
    </head>
    <body>
        <table border="1">
<tr>
<td>ID Producto</td>
<td>Nombre</td>
<td>Precio</td>
<td>Descripcion</td>
<td>Existencia</td>
</tr>
<!-- <%
    Consultas c =new Consultas();
    ArrayList<Producto> productos = c.obtenerInventario();
    for(Producto p: productos){
    }
%>
-->
        </table>
    </body>
</html>
