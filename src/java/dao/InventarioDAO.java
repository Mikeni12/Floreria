/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import basededatos.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import logica.Producto;

/**
 *
 * @author josuedaniel
 */
public class InventarioDAO {

    public static final String QUERY_OBTENER_INVENTARIO = "SELECT * FROM producto";

    public static ArrayList<Producto> obtenerInventario() throws SQLException {
        ArrayList<Producto> producto = new ArrayList<>();

        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        con = new Conexion().getConexion();
        rs = con.createStatement().executeQuery(QUERY_OBTENER_INVENTARIO);
        while (rs.next()) {
            Producto p = new Producto();
            p.setClveproducto(rs.getString(1));
            p.setNombreproducto(rs.getString(2));
            p.setPrecio(rs.getString(3));
            p.setDescripcion(rs.getString(4));
            p.setExistencia(rs.getString(5));
            p.setFoto(rs.getString(6));
            p.setCategoria(rs.getString(7));
            producto.add(p);
        }
        rs.close();
        con.close();
        return producto;
    }

    public static ArrayList<Producto> read(String clveproducto) {
        ArrayList<Producto> producto = new ArrayList<>();
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        try {
            con = new Conexion().getConexion();
            PreparedStatement ps = con.prepareStatement("select * from producto where clveproducto = ?");
            ps.setString(1, clveproducto);
            rs = ps.executeQuery();

            if (con != null) {
                Producto p = new Producto();
                if (rs.next()) {
                    p.setClveproducto(clveproducto);
                    p.setNombreproducto(rs.getString(2));
                    p.setPrecio(rs.getString(3));
                    p.setDescripcion(rs.getString(4));
                    p.setExistencia(rs.getString(5));
                    p.setFoto(rs.getString(6));
                    p.setCategoria(rs.getString(7));
                    producto.add(p);
                }
                rs.close();
                con.close();
            }
            System.out.println("Aber..." + producto.isEmpty());
            return producto;

        } catch (Exception ex) {
            ex.printStackTrace();
            return producto;
        }
        //return producto;
    }

    public static ArrayList<Producto> obtenerInventarioCat(String categoria) throws SQLException {
        ArrayList<Producto> producto = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        con = new Conexion().getConexion();
        ps = con.prepareStatement("select * from producto where categoria = ?");
        ps.setString(1, categoria);
        rs = ps.executeQuery();
        while (rs.next()) {
            Producto p = new Producto();
            p.setClveproducto(rs.getString(1));
            p.setNombreproducto(rs.getString(2));
            p.setPrecio(rs.getString(3));
            p.setDescripcion(rs.getString(4));
            p.setExistencia(rs.getString(5));
            p.setFoto(rs.getString(6));
            p.setCategoria(rs.getString(7));
            producto.add(p);
        }
        rs.close();
        con.close();
        return producto;
    }
}
