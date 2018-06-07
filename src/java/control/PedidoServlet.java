/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Carrito;
import logica.Pedido;

/**
 *
 * @author josuedaniel
 */
@WebServlet(name = "PedidoServlet", urlPatterns = {"/PedidoServlet"})
public class PedidoServlet extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession ses = request.getSession(true);
        Pedido pedido = (Pedido) ses.getAttribute("pedido");
        Carrito c=new Carrito();

        if (pedido == null) {
            pedido = new Pedido();
            ses.setAttribute("pedido", pedido);
        }
        
        
        String fecha = request.getParameter("fecha");
        String valortotal=request.getParameter("valorfinal");
        String calle=request.getParameter("calle");
        String numeroex=request.getParameter("numeroex");
        String numint=request.getParameter("numeroin");
        String colonia=request.getParameter("colonia");
        String ciudad=request.getParameter("ciudad");
        String cp=request.getParameter("cp");
        String estado=request.getParameter("estado");
        String numerotarjeta=request.getParameter("numerotarjeta");
        String usuario=request.getParameter("usuario");
        
        if (numint == null) {
            numint = "";
        }
        System.out.println(fecha+" "+valortotal);
        
        pedido.add(fecha,valortotal,calle,numeroex,numint,colonia,ciudad,cp,estado,numerotarjeta,usuario);
        c.delete();

        RequestDispatcher rd = request.getRequestDispatcher("catalogo.jsp");
        rd.forward(request, response);
    }
    

}
