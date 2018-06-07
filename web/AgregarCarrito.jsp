<%@page import="logica.Carrito"%>
<%@page import="dao.CarritoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.InventarioDAO"%>
<%@page import="logica.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="carrito" scope="session" class="logica.Carrito" />
<%
    carrito.setContexto(application);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Carrito</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <h1>Agregar producto al carrito</h1>
        <div>
         <table class="w3-table-all">
             <tr class="w3-red">
                <td>Datos del producto</td>
                <td></td>
                <td>Precio</td>
                <td>Descripcion</td>
                <td>Disponibles</td>
                <td>Cantidad</td>
            </tr>
        <%
            String clveproducto=(String)request.getParameter("codigo");
            InventarioDAO in=new InventarioDAO();
            /*in.read(clveproducto);
            Producto p=new Producto();*/
            ArrayList<Producto> p = in.read(clveproducto);
                  //for(Producto p2: p)
                  //{
                    out.println("<tr>");
                    out.println("<form action='CarritoServlet' name='myForm' method='post'>");
                    out.println("<td><input style='background-color:#FFFFFD;' type='text' readonly='readonly' value='"+p.get(0).getNombreproducto()+"' style'none;' name='nombreproducto'/></td>");
                    out.println("<td>codigo:<input style='background-color:#FFFFFD;' type='text' readonly='readonly' value='"+p.get(0).getClveproducto()+"' style'none;' name='codigo'/></td>");
                    out.println("<td>$<input style='background-color:#FFFFFD;' type='text' readonly='readonly' value='"+p.get(0).getPrecio()+"' style'none;' name='precio'/></td>");
                    out.println("<td>"+p.get(0).getDescripcion()+"</td>");
                    out.println("<td>"+p.get(0).getExistencia()+"</td>");
                    out.println("<td BGCOLOR='powderblue'><input style='background-color:powderblue;' type='number' min='1' max='"+p.get(0).getExistencia()+"' value='1' style'none;' name='cantidad' required/></td>");
                    out.println("</tr>");
                    out.println("</table>");
                    out.println("<input class='button blue large' type='submit' value='Agregar a carrito'>");
                    out.println("</form>");
                    out.println("<a href='catalogo.jsp'><button class='button blue large'>Seguir comprando</button></a>"); 
                  //}
                  
            
        %>
        </div>
         
        
    </body>
</html>
