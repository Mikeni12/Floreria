package dao;

import java.sql.*;  
import logica.RegistroBean;
import basededatos.Conexion;

public class RegistroDAO {
    public static boolean validate(RegistroBean bean){  
        boolean status=false;  
        try{  
        Connection con=new Conexion().getConexion();  
        Statement st = con.createStatement();
        st.executeUpdate("INSERT INTO usuario values ('" + bean.getUsuario() + "','" + bean.getContrasena() + "','" 
                + bean.getNombre() + "','" + bean.getAppat() + "','" + bean.getApmat() + "')");
        status=true;
        }catch(SQLException e){}  
        return status;
    }
}
