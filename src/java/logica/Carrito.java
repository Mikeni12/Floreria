/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import basededatos.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;


/**
 *
 * @author josuedaniel
 */
public class Carrito {
    
    private String clveproducto="";
    private String nombreproducto="";
    private String cantidad="";
    private String total="";
    private ServletContext contexto;
    private String totalFinal=""; 

    public String getClveproducto() {
        return clveproducto;
    }

    public void setClveproducto(String clveproducto) {
        this.clveproducto = clveproducto;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public ServletContext getContexto() {
        return contexto;
    }

    public void setContexto(ServletContext contexto) {
        this.contexto = contexto;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getNombreproducto() {
        return nombreproducto;
    }

    public void setNombreproducto(String nombreproducto) {
        this.nombreproducto = nombreproducto;
    }

    public String getTotalFinal() {
        return totalFinal;
    }

    public void setTotalFinal(String totalFinal) {
        this.totalFinal = totalFinal;
    }
    
 
    
    public void add(String clveproducto, String nombreproducto, String cantidad, String total) {
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("insert carrito (clveproducto,cantidad,nombreproducto,total) values (?,?,?,?)");
                ps.setString(1, clveproducto);
                ps.setString(2, cantidad);
                ps.setString(3, nombreproducto);
                ps.setString(4, total);
                
                ps.execute();
 
                this.clveproducto = clveproducto;
                this.nombreproducto = nombreproducto;
                this.cantidad = cantidad;
                this.total = total;
                
                
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void totalCompra() {
        int sum = 0;
        try {
            Connection con = new Conexion().getConexion();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("select sum(total) as SUM_TOTAL from carrito");
                ResultSet rs = ps.executeQuery();
                
                while (rs.next()) {
                    int c = rs.getInt("SUM_TOTAL");
                    String totalF = Integer.toString(c);
                    System.out.println(totalF);
                    this.totalFinal=totalF;
                }
                

                
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void delete() {
        try {
            Conexion con =new Conexion();
            con.getConexion();
            if (con != null) {
                PreparedStatement ps = con.getConexion().prepareStatement("delete from carrito");
                ps.execute();
                con.getConexion().close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
    
}
