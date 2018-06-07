<%-- 
    Document   : AgregarTotal
    Created on : 14/06/2017, 11:21:20 PM
    Author     : josuedaniel
--%>

<%@page import="logica.Carrito"%>
<%@page import="dao.CarritoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Producto"%>
<%@page import="dao.InventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar al carrito</title>
        <style>
            .button {
                text-align: center;
                background:#7f8c8d;
                color:#fff;
                display:inline-block;
                font-size:1em;
                margin:20px;
                padding:10px 0;
                text-align:center;
                width:10px;
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
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script>
            function validateForm() {
                var valordecompra = document.forms["myForm"]["valortotal"].value;
                var tam=valordecompra.length;
                
                if (tam<3) {
                    alert("No ha seleccionado ningun producto en el carrito");
                    return false;
                }
            }       
        </script>
    </head>
    <body>
        <h1>Productos en el carrito</h1>
        <table class="w3-table-all">
            <tr class="w3-red">
                <td>Clave del producto</td>
                <td>Nombre del producto</td>
                <td>Cantidad</td>
                <td>Subtotal</td>
            </tr>
                <%
                    CarritoDAO c =new CarritoDAO();
                    ArrayList<Carrito> carrito = c.obtenerInventario();
                    for(Carrito ca: carrito){
                        out.println("<tr>");
                        out.println("<td>"+ca.getClveproducto()+"</td>");
                        out.println("<td>"+ca.getNombreproducto()+"</td>");
                        out.println("<td>"+ca.getCantidad()+"</td>");
                        out.println("<td>"+ca.getTotal()+"</td>");
                        out.println("</tr>");
                    }
                %>
        </table>
                <%
                    Carrito carro= new Carrito();
                    carro.totalCompra();
                    out.println("<form action='Pedido.jsp' name='myForm' onsubmit='return validateForm()'  method='post'>");
                    out.print("<p>Total ($):<input type='text' readonly='readonly' value='"+carro.getTotalFinal()+"' style'none;' name='valortotal'/></p>");
                    out.println("<td><input type='submit' class='button blue large' value='finalizar compra'></td>");
                    out.println("</form>");
                    out.println("<a href='catalogo.jsp'><button class='button blue large'>Seguir comprando</button></a>"); 
                %>
        
    </body>
</html>
