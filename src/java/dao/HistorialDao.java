package dao;

import basededatos.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import logica.Pedido;

public class HistorialDao {
    public static final String QUERY_OBTENER_INVENTARIO = "SELECT * FROM pedido";

    public static ArrayList<Pedido> obtenerInventario() throws SQLException {
        ArrayList<Pedido> pedido = new ArrayList<>();

        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        con = new Conexion().getConexion();
        rs = con.createStatement().executeQuery(QUERY_OBTENER_INVENTARIO);
        while (rs.next()) {
            Pedido p = new Pedido();
            p.setClvepedido(rs.getString(1));
            p.setMontopedido(rs.getString(2));
            p.setNombreusuario(rs.getString(3));
            p.setFechapedido(rs.getString(4));
            pedido.add(p);
        }
        rs.close();
        con.close();
        return pedido;
    }    
}
