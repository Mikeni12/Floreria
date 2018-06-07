<%@page import="java.util.ArrayList"%>
<%@page import="dao.InventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="logica.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h2>Catálogo de productos.</h2>
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Flores</a></li>
                <li><a data-toggle="tab" href="#menu1" >Arreglos</a></li>
                <li><a data-toggle="tab" href="#menu2">Celebraciones</a></li>
                <li><a data-toggle="tab" href="#menu3">Eventos</a></li>
                <li><a data-toggle="tab" href="#menu4">Regalos</a></li>
            </ul>

            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <h3>Flores</h3>
                    <p>Ramos de flores simples, perfectos para dar un detalle a esa persona que tanto quieres.</p>
                    <table class="table">
                        <tr>
                            <td>Nombre</td>
                            <td>Código</td>
                            <td>Precio</td>
                            <td>Descripcion</td>
                            <td>Existencias</td>
                            <td>Foto</td>
                            <td>Categoria</td>
                            <td>Opción</td>
                        </tr>
                        <%
                            InventarioDAO i = new InventarioDAO();
                            ArrayList<Producto> producto2 = i.obtenerInventarioCat("Flores");
                            for (Producto p : producto2) {
                                out.println("<tr>");                                
                                out.println("<td>" + p.getNombreproducto() + "</td>");
                                out.println("<form action='AgregarCarrito.jsp' method='post'>");
                                out.println("<td><input type='text' readonly='readonly' value='"+p.getClveproducto()+"' style'none;' name='codigo'/></td>");
                                out.println("<td>" + p.getPrecio() + "</td>");
                                out.println("<td>" + p.getDescripcion() + "</td>");
                                out.println("<td>" + p.getExistencia() + "</td>");
                                out.println("<td><img src='images/" + p.getFoto() + "' width=180 height=214></td>");
                                out.println("<td>" + p.getCategoria() + "</td>");
                                out.println("<td><input type='submit' value='comprar'></td>");
                                out.println("</form>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </div>
                <div id="menu1" class="tab-pane fade">
                    <h3>Arreglos</h3>
                    <p>Arreglos de flores elaborados para esas ocasiones especiales con las personas que quieres.</p>
                    <table class="table">
                        <tr>
                            <td>Id</td>
                            <td>Nombre</td>
                            <td>Precio</td>
                            <td>Descripcion</td>
                            <td>Existencias</td>
                            <td>Foto</td>
                            <td>Categoria</td>
                            <td>Opción</td>
                        </tr>
                        <%
                            producto2=null;
                            producto2 = i.obtenerInventarioCat("Arreglos");
                            for (Producto p : producto2) {
                                out.println("<tr>");                                
                                out.println("<td>" + p.getNombreproducto() + "</td>");
                                out.println("<form action='AgregarCarrito.jsp' method='post'>");
                                out.println("<td><input type='text' readonly='readonly' value='"+p.getClveproducto()+"' style'none;' name='codigo'/></td>");
                                out.println("<td>" + p.getPrecio() + "</td>");
                                out.println("<td>" + p.getDescripcion() + "</td>");
                                out.println("<td>" + p.getExistencia() + "</td>");
                                out.println("<td><img src='images/" + p.getFoto() + "' width=180 height=214></td>");
                                out.println("<td>" + p.getCategoria() + "</td>");
                                out.println("<td><input type='submit' value='comprar'></td>");
                                out.println("</form>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <h3>Celebraciones</h3>
                    <p> Arreglos florales para decorar tu hogar en las diferentes epocas del año.</p>
                    <table class="table">
                        <tr>
                            <td>Id</td>
                            <td>Nombre</td>
                            <td>Precio</td>
                            <td>Descripcion</td>
                            <td>Existencias</td>
                            <td>Foto</td>
                            <td>Categoria</td>
                            <td>Opción</td>
                        </tr>
                        <%
                            producto2=null;
                            producto2 = i.obtenerInventarioCat("Celebraciones");
                            for (Producto p : producto2) {
                                out.println("<tr>");                                
                                out.println("<td>" + p.getNombreproducto() + "</td>");
                                out.println("<form action='AgregarCarrito.jsp' method='post'>");
                                out.println("<td><input type='text' readonly='readonly' value='"+p.getClveproducto()+"' style'none;' name='codigo'/></td>");
                                out.println("<td>" + p.getPrecio() + "</td>");
                                out.println("<td>" + p.getDescripcion() + "</td>");
                                out.println("<td>" + p.getExistencia() + "</td>");
                                out.println("<td><img src='images/" + p.getFoto() + "' width=180 height=214></td>");
                                out.println("<td>" + p.getCategoria() + "</td>");
                                out.println("<td><input type='submit' value='comprar'></td>");
                                out.println("</form>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <h3>Eventos</h3>
                    <p>Arreglos de flores para esas fiestas especiales, desde XV años hasta bodas y bautizos.</p>
                    <table class="table">
                        <tr>
                            <td>Nombre</td>
                            <td>Código</td>
                            <td>Precio</td>
                            <td>Descripcion</td>
                            <td>Existencias</td>
                            <td>Foto</td>
                            <td>Categoría</td>
                            <td>Opción</td>
                        </tr>
                        <%
                            producto2=null;
                            producto2 = i.obtenerInventarioCat("Eventos");
                            for (Producto p : producto2) {
                                out.println("<tr>");                                
                                out.println("<td>" + p.getNombreproducto() + "</td>");
                                out.println("<form action='AgregarCarrito.jsp' method='post'>");
                                out.println("<td><input type='text' readonly='readonly' value='"+p.getClveproducto()+"' style'none;' name='codigo'/></td>");
                                out.println("<td>" + p.getPrecio() + "</td>");
                                out.println("<td>" + p.getDescripcion() + "</td>");
                                out.println("<td>" + p.getExistencia() + "</td>");
                                out.println("<td><img src='images/" + p.getFoto() + "' width=180 height=214></td>");
                                out.println("<td>" + p.getCategoria() + "</td>");
                                out.println("<td><input type='submit' value='comprar'></td>");
                                out.println("</form>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </div>
                <div id="menu4" class="tab-pane fade">
                    <h3>Regalos</h3>
                    <p>Detalles perfectos para esas personas que celebren un momento especial en su vida.</p>
                    <table class="table">
                        <tr>
                            <td>Id</td>
                            <td>Nombre</td>
                            <td>Precio</td>
                            <td>Descripcion</td>
                            <td>Existencias</td>
                            <td>Foto</td>
                            <td>Categoria</td>
                            <td>Opción</td>
                        </tr>
                        <%
                            producto2=null;
                            producto2 = i.obtenerInventarioCat("Regalos");
                            for (Producto p : producto2) {
                                out.println("<tr>");                                
                                out.println("<td>" + p.getNombreproducto() + "</td>");
                                out.println("<form action='AgregarCarrito.jsp' method='post'>");
                                out.println("<td><input type='text' readonly='readonly' value='"+p.getClveproducto()+"' style'none;' name='codigo'/></td>");
                                out.println("<td>" + p.getPrecio() + "</td>");
                                out.println("<td>" + p.getDescripcion() + "</td>");
                                out.println("<td>" + p.getExistencia() + "</td>");
                                out.println("<td><img src='images/" + p.getFoto() + "' width=180 height=214></td>");
                                out.println("<td>" + p.getCategoria() + "</td>");
                                out.println("<td><input type='submit' value='comprar'></td>");
                                out.println("</form>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
