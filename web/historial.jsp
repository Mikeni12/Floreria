<%-- 
    Document   : historial
    Created on : 16/06/2017, 01:52:10 PM
    Author     : miguel
--%>

<%@page import="logica.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.HistorialDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <div class="w3-container">
            <h2>Historial de compras.</h2>
            <p>Arreglos de flores elaborados para esas ocasiones especiales con las personas que quieres.</p>
            <table class="w3-table-all">
                <thead>
                    <tr class="w3-red">
                        <td>Clave</td>
                        <td>Nombre</td>
                        <td>Monto</td>
                        <td>Fecha</td>
                    </tr>
                </thead>
                <%
                    HistorialDao i = new HistorialDao();
                    ArrayList<Pedido> producto2 = i.obtenerInventario();
                    for (Pedido p : producto2) {
                        out.println("<tr>");
                        out.println("<td>" + p.getClvepedido() + "</td>");
                        out.println("<td>" + p.getNombreusuario() + "</td>");
                        out.println("<td>" + p.getMontopedido() + "</td>");
                        out.println("<td>" + p.getFechapedido() + "</td>");
                        out.println("</tr>");
                    }
                %>
            </table>
        </div>    
    </body>
</html>
