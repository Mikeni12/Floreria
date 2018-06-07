/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
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

/**
 *
 * @author josuedaniel
 */
@WebServlet(name = "CarritoServlet", urlPatterns = {"/CarritoServlet"})
public class CarritoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession ses = request.getSession(true);
        Carrito carrito = (Carrito) ses.getAttribute("carrito");

        if (carrito == null) {
            carrito = new Carrito();
            ses.setAttribute("carrito", carrito);
        }
        
        String clveproducto = request.getParameter("codigo");
        String cantidad=request.getParameter("cantidad");
        String nombreproducto=request.getParameter("nombreproducto");
        String precio=request.getParameter("precio");
        
        
        int cantidadCalculo= Integer.parseInt(cantidad);
        float precioCalculo=Float.parseFloat(precio);
        float total=cantidadCalculo*precioCalculo;
        String totalS = Float.toString(total);
        
        
        if (clveproducto == null) {
            clveproducto = "";
        }
        
        carrito.add(clveproducto,nombreproducto,cantidad,totalS);

        RequestDispatcher rd = request.getRequestDispatcher("AgregarTotal.jsp");
        rd.forward(request, response);
    }
}
