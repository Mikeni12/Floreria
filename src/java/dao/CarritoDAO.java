/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import basededatos.Conexion;
import static dao.InventarioDAO.QUERY_OBTENER_INVENTARIO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import logica.Carrito;

/**
 *
 * @author josuedaniel
 */
public class CarritoDAO {
    public static final String QUERY_OBTENER_INVENTARIO="SELECT * from carrito";
  public static ArrayList<Carrito> obtenerInventario() throws SQLException{
       ArrayList<Carrito> carrito =new ArrayList<>();
        
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        
        con = new Conexion().getConexion();
        rs = con.createStatement().executeQuery(QUERY_OBTENER_INVENTARIO);
        while (rs.next()) {
            Carrito c=new Carrito();
            c.setClveproducto(rs.getString(1));
            c.setNombreproducto(rs.getString(2));
            c.setCantidad(rs.getString(3));
            c.setTotal(rs.getString(4));
            
            carrito.add(c);
        }
        rs.close();
        con.close();
        return carrito;
    }
  
}
