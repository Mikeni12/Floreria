/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package basededatos;

import java.sql.*;
import javax.servlet.ServletContext;

/**
 *
 * @author jesus
 */
public class Conexion {
    private static Connection conexion;
    private static final String SERVER = "jdbc:mysql://localhost:";
    private static final String PORT = "3306";
    private static final String DBNAME = "/tiendaflores";
    private static final String USR = "root";
    private static final String PSW = "db";

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(SERVER + PORT + DBNAME, USR, PSW);
            System.out.println("Conexión Exitosa!");
        } catch (ClassNotFoundException e) {
            System.out.println("Conexión Fallida");
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println("Conexión Fallida");
            System.out.println(e);
        }
    }

    public Connection getConexion() {
        return conexion;
    }
    public static Connection obtieneConexion(ServletContext contexto) {
        Connection con = null;
        try {
            String mySQLHost = contexto.getInitParameter("mySQLHost");
            String dbName = contexto.getInitParameter("dbName");
            String user = contexto.getInitParameter("user");
            String password = contexto.getInitParameter("password");

            Class.forName("com.mysql.jdbc.Driver");
            String urlBD = mySQLHost + dbName + "?user=" + user + "&password=" + password;
            con = DriverManager.getConnection(urlBD);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
}
