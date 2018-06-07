/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import basededatos.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletContext;

/**
 *
 * @author josuedaniel
 */
public class Pedido {
    
  private String clvepedido="";
  private String montopedido="";
  private String nombreusuario="";
  private String fechapedido="";
  private String numext="";
  private String numint="";
  private String colonia="";
  private String ciudad="";
  private String cp="";
  private String estado="";
  private String numerotrajeta="";
  private ServletContext contexto;

    public String getClvepedido() {
        return clvepedido;
    }

    public void setClvepedido(String clvepedido) {
        this.clvepedido = clvepedido;
    }

    public String getMontopedido() {
        return montopedido;
    }

    public void setMontopedido(String montopedido) {
        this.montopedido = montopedido;
    }

    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getFechapedido() {
        return fechapedido;
    }

    public void setFechapedido(String fechapedido) {
        this.fechapedido = fechapedido;
    }

    public String getNumext() {
        return numext;
    }

    public void setNumext(String numext) {
        this.numext = numext;
    }

    public String getNumint() {
        return numint;
    }

    public void setNumint(String numint) {
        this.numint = numint;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public ServletContext getContexto() {
        return contexto;
    }

    public void setContexto(ServletContext contexto) {
        this.contexto = contexto;
    }

    public String getNumerotrajeta() {
        return numerotrajeta;
    }

    public void setNumerotrajeta(String numerotrajeta) {
        this.numerotrajeta = numerotrajeta;
    }
  
    
   public void add(String fecha,String valortotal,String calle,String numeroex,String numint,String colonia,String ciudad,String cp,String estado,String numerotarjeta,String usuario) {
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("insert into pedido (montopedido,nombreusuario,fechapedido,numext,numint,colonia,ciudad,cp,estado,numtarjeta) values(?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, valortotal);
                ps.setString(2, usuario);
                ps.setString(3, fecha);
                ps.setString(4, numeroex);
                ps.setString(5, numint);
                ps.setString(6, colonia);
                ps.setString(7, ciudad);
                ps.setString(8, cp);
                ps.setString(9, estado);
                ps.setString(10, numerotarjeta);
                ps.execute();
 
                this.montopedido=valortotal;
                this.nombreusuario=usuario;
                this.fechapedido=fecha;
                this.numext=numeroex;
                this.numint=numint;
                this.colonia=colonia;
                this.ciudad=ciudad;
                this.cp=cp;
                this.estado=estado;
                this.numerotrajeta=numerotarjeta;
                
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
