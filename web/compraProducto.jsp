<%-- 
    Document   : compraProducto
    Created on : 10/06/2017, 08:25:37 PM
    Author     : josuedaniel
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.InventarioDAO"%>
<%@ page import="logica.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jardin de huron</title>
    </head>
    <body>
        <table border=".5">
            <tr>
                    <td>Nombre</td>
                    <td>Codigo</td>
                    <td>Precio</td>
                    <td>Descripción</td>
                    <td>Disponibles</td>
            </tr>
                <%
                    InventarioDAO i =new InventarioDAO();
                    ArrayList<Producto> producto2 = i.obtenerInventario();
                    for(Producto p: producto2){
                        out.println("<tr>");
                        out.println("<td>"+p.getNombreproducto()+"</td>");
                        out.println("<form action='AgregarCarrito.jsp' method='post'>");
                        out.println("<td><input type='text' readonly='readonly' value='"+p.getClveproducto()+"' style'none;' name='codigo'/></td>");
                        out.println("<td>"+p.getPrecio()+"</td>");
                        out.println("<td>"+p.getDescripcion()+"</td>");
                        out.println("<td>"+p.getExistencia()+"</td>");
                        out.println("<td><input type='submit' value='comprar'></td>");
                        out.println("</form>");
                        out.println("</tr>");
                    }
                %>   
        </table>
    </body>
</html>
