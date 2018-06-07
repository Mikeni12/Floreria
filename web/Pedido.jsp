<%-- 
    Document   : Pedido
    Created on : 15/06/2017, 10:10:51 AM
    Author     : josuedaniel
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="logica.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pedido" scope="session" class="logica.Pedido" />
<%
    pedido.setContexto(application);
%>
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
                font-size:1em;
                margin:20px;
                padding:10px 0;
                text-align:center;
                width:70px;
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
        <title>Pedido</title>
        <script>
            function validateForm() {
                var codigopostal = document.forms["myForm"]["cp"].value;
                var tam=codigopostal.length;
                
                if (tam<5 || tam>5) {
                    alert("El tamaño del codigo postal es de 5 digitos");
                    return false;
                }
            }       
        </script>
    </head>
    <body>
        <div class="w3-card-4">
            <div class="w3-container w3-teal">
                <h2>Comenzando pedido</h2>
            </div>
            <br>
        <%
            String total=(String)request.getParameter("valortotal");            
            Date myDate = new Date();            
	    String convertido=new SimpleDateFormat("dd-MM-yyyy").format(myDate);	            
            
            out.println("<form action='PedidoServlet' class='w3-container' name='myForm' onsubmit='return validateForm()' method='post'>");
            out.println("<label class='w3-text-teal'>Fecha de pedido:</label><input type='text'  readonly='readonly' value='"+convertido+"' style'none;' name='fecha'/>");
            out.println("<br>");
            out.println("<label class='w3-text-teal'>Monto total ($):</label><input type='text' readonly='readonly' value='"+total+"' style'none;' name='valorfinal'/>");
            out.println("<h1>Datos de envio</h1");
            out.println("<p><b>Domicilio del destinatario</b></p");
            out.println("Calle:<input type='text' name='calle' required/>");
            out.println("<br>");
            out.println("Numero exterior:<input type='number' name='numeroex' min='1' required/>");
            out.println("<br>");
            out.println("Numero interior:<input type='number' name='numeroin' min='1' />");
            out.println("<br>");
            out.println("Colonia:<input type='text' name='colonia' pattern='[A-Za-z ]+' title='Solo se permiten letras'  />");
            out.println("<br>");
            out.println("Delegación:<input type='text' pattern='[A-Za-z ]+' title='Solo se permiten letras' name='ciudad' required />");
            out.println("<br>");
            out.println("Codigo Postal:<input type='number' name='cp' min='1' required/>");
            out.println("<br>");
            out.println("Estado:<input type='text' pattern='[A-Za-z ]+' title='Solo se permiten letras' name='estado' required/>");
            out.println("<br>");
            out.println("<p><b>Datos de pago</b></p>");
            out.println("<p>Numero de Tarjeta:<input type='text' pattern='[0-9]{13,16}' title='Numero de tarjeta invalido' name='numerotarjeta' required/></p>");
            out.println("<br>");
            out.println("<p><b>Datos del usuario</b></p>");
            out.println("<p>Usuario:<input type='text' name='usuario' required/></p>");
            out.println("<td><input class='button blue large' type='submit' value='Finalizar compra'></td>");
            out.println("</form>");
        %>
        </div>
    </body>
</html>
