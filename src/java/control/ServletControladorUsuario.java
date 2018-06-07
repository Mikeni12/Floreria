/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import logica.Usuario;

/**
 *
 * @author miguel
 */
public class ServletControladorUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession ses = request.getSession(true);
        Usuario usuario = (Usuario) ses.getAttribute("usuario");

        if (usuario == null) {
            usuario = new Usuario();
            ses.setAttribute("usuario", usuario);
        }

        String accion = request.getParameter("submit");
        String nombreusuario = request.getParameter("nombreusuario");
        String contrasena = request.getParameter("contrasena");
        String nombre = request.getParameter("nombre");
        String appat = request.getParameter("appat");
        String apmat = request.getParameter("apmat");

        if (accion == null) {
            accion = "";
        }
        
        if (nombreusuario == null) {
            nombreusuario = "";
        }
        
        if (contrasena == null) {
            contrasena = "";
        }

        if (nombre == null) {
            nombre = "";
        }
        
        if (appat == null) {
            appat = "";
        }

        if (apmat == null) {
            apmat = "";
        }

        if (accion.equals("Consulta")) {
            usuario.read(nombreusuario);
        } else if (accion.equals("Actualiza")) {
            usuario.update(nombreusuario, contrasena, nombre, appat, apmat);
        } else if (accion.equals("Alta")) {
            usuario.add(nombreusuario, contrasena, nombre, appat, apmat);
        } else if (accion.equals("Baja")) {
            usuario.delete(nombreusuario);
        }

        RequestDispatcher rd = request.getRequestDispatcher("CRUDusuario.jsp");
        rd.forward(request, response);
    }
}
