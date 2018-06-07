<%@page import="java.util.ArrayList"%>
<%@page import="dao.InventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="logica.*" %>
<jsp:useBean id="producto" scope="session" class="logica.Producto" />

<%
    producto.setContexto(application);
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
                document.getElementById("clveproducto").value = "";
                document.getElementById("nombreproducto").value = "";
                document.getElementById("precio").value = "";
                document.getElementById("descripcion").value = "";
                document.getElementById("existencia").value = "";
                document.getElementById("categoria").value = "";
            }
        </script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <div class="w3-card-4">
            <div class="w3-container w3-teal">
                <h5>Productos.</h5>
            </div>
            <form class="w3-container" name="form01" method="post" action="controlador">
                <p>      
                    <label class="w3-text-teal"><b>Id:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="clveproducto" name="clveproducto" value='<jsp:getProperty name="producto" property="clveproducto"/>'>
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Producto:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="nombreproducto" name="nombreproducto" value='<jsp:getProperty name="producto" property="nombreproducto" />'>
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Precio:</b></label>
                    <input class="w3-input w3-border w3-sand" <input type="text" id="precio" name="precio" value='<jsp:getProperty name="producto" property="precio" />'>
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Descripción:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="descripcion" name="descripcion" value='<jsp:getProperty name="producto" property="descripcion" />' />
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Existencias:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="existencia" name="existencia" value='<jsp:getProperty name="producto" property="existencia" />' />
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Foto:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="foto" name="foto" value='<jsp:getProperty name="producto" property="foto" />' />
                </p>
                <p>      
                    <label class="w3-text-teal"><b>Categoría:</b></label>
                    <input class="w3-input w3-border w3-sand" type="text" id="categoria" name="categoria" value='<jsp:getProperty name="producto" property="categoria" />' />
                </p>
                <div style="width:900px; margin:0 auto;">                
                    <button class="w3-btn w3-teal" type="submit" name="submit" value="Consulta">Consulta</button>
                    <button class="w3-btn w3-teal" type="submit" name="submit" value="Actualiza">Actualiza</button>
                    <button class="w3-btn w3-teal" type="submit" name="submit" value="Alta">Alta</button>
                    <button class="w3-btn w3-teal" type="submit" name="submit" value="Baja">Baja</button>
                    <button class="w3-btn w3-teal" type="button" value="Limpiar" onClick="limpiar()">Limpiar</button>                         
                </div>                              
                <h7><jsp:getProperty name="producto" property="mensaje" /></h7>
            </form>            
        </div>
        <div>
            <br><br><br><br><br>
            <h5>Tabla de productos.</h5>
        </div>
        <table class="table">
            <tr>
                <td>Id</td>
                <td>Nombre</td>
                <td>Precio</td>
                <td>Descripcion</td>
                <td>Existencias</td>
                <td>Foto</td>
                <td>Categoria</td>
            </tr>
            <%
                InventarioDAO i = new InventarioDAO();
                ArrayList<Producto> producto2 = i.obtenerInventario();
                for (Producto p : producto2) {
                    out.println("<tr>");
                    out.println("<td>" + p.getClveproducto() + "</td>");
                    out.println("<td>" + p.getNombreproducto() + "</td>");
                    out.println("<td>" + p.getPrecio() + "</td>");
                    out.println("<td>" + p.getDescripcion() + "</td>");
                    out.println("<td>" + p.getExistencia() + "</td>");
                    out.println("<td><img src='images/" + p.getFoto() + "' width=180 height=214></td>");
                    out.println("<td>" + p.getCategoria() + "</td>");
                    out.println("</tr>");
                }
            %>
        </table>
    </body>
</html>