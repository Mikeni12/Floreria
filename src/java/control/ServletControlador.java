/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import logica.Producto;

/**
 *
 * @author Macario
 */
public class ServletControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession ses = request.getSession(true);
        Producto producto = (Producto) ses.getAttribute("producto");

        if (producto == null) {
            producto = new Producto();
            ses.setAttribute("producto", producto);
        }

        String accion = request.getParameter("submit");
        String clveproducto = request.getParameter("clveproducto");
        String nombreproducto = request.getParameter("nombreproducto");
        String precio = request.getParameter("precio");
        String descripcion = request.getParameter("descripcion");
        String existencias = request.getParameter("existencia");
        String foto = request.getParameter("foto");
        String categoria = request.getParameter("categoria");

        if (accion == null) {
            accion = "";
        }
        
        if (clveproducto == null) {
            clveproducto = "";
        }
        
        if (nombreproducto == null) {
            nombreproducto = "";
        }

        if (descripcion == null) {
            descripcion = "";
        }
        
        if (existencias == null) {
            existencias = "";
        }

        if (precio == null) {
            precio = "";
        }

        if (accion.equals("Consulta")) {
            producto.read(clveproducto);
        } else if (accion.equals("Actualiza")) {
            producto.update(clveproducto, nombreproducto, precio, descripcion, existencias, foto, categoria);
        } else if (accion.equals("Alta")) {
            producto.add(nombreproducto, precio, descripcion, existencias, foto, categoria);
        } else if (accion.equals("Baja")) {
            producto.delete(clveproducto);
        }
        RequestDispatcher rd = request.getRequestDispatcher("CRUD.jsp");
        rd.forward(request, response);
    }
}
