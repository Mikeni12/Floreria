package dao;

import java.sql.*;  
import logica.LoginBean;
import basededatos.Conexion;

public class LoginDAO {
    public static int validate(LoginBean bean){  
        int status=-1;  
        //Niveles: 1 administrador, 2 usuario.
        try{  
            Connection con=new Conexion().getConexion();  
            PreparedStatement ps=con.prepareStatement("select * from usuario where nombreusuario=? and contrasena=?");
            ps.setString(1,bean.getEmail());  
            ps.setString(2, bean.getPass());  
            ResultSet rs=ps.executeQuery();  
            rs.next();
            System.out.println(rs.getString("nombreusuario"));
            if(rs.getString("nombreusuario").equals("admin"))
                status=1;
            else
                status=2;
            System.out.println(status);
        }catch(Exception e){}  
        return status;  
    }
    
    
}
