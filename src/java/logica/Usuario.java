package logica;

import basededatos.Conexion;
import java.sql.*;
import javax.servlet.ServletContext;

/**
 *
 * @author miguel
 */
public class Usuario {
    private String nombreusuario="";
    private String contrasena="";
    private String nombre="";
    private String appat="";
    private String apmat="";
    private String mensaje="";
    private ServletContext contexto;

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    
    
    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAppat() {
        return appat;
    }

    public void setAppat(String appat) {
        this.appat = appat;
    }

    public String getApmat() {
        return apmat;
    }

    public void setApmat(String apmat) {
        this.apmat = apmat;
    }

    public void setContexto(ServletContext contexto) {
        this.contexto = contexto;
    }
    
    //Operaciones SQL
    public void read(String nombreusuario) {
        this.reset();
        this.nombreusuario = nombreusuario;
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("select * from usuario where nombreusuario = ?");
                ps.setString(1, nombreusuario);

                ps.executeQuery();
                ResultSet rs = ps.getResultSet();
                if (rs.next()) {
                    this.mensaje = "Usuario encontrado";
                    this.nombreusuario = nombreusuario;
                    this.contrasena = rs.getString("contrasena");
                    this.nombre = rs.getString("nombre");
                    this.appat=rs.getString("appat");
                    this.apmat=rs.getString("apmat");
                } else {
                    this.mensaje = "Usuario no encontrado";
                }
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Acción no realizada";
        }
    }

    public void add(String nombreusuario, String contrasena, String nombre, String appat, String apmat) {
        this.nombreusuario = nombreusuario;
        this.mensaje = "Se agrego exitosamente al usuario " + nombreusuario;
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("insert into usuario (nombreusuario,contrasena,nombre,appat,apmat) values(?,?,?,?,?)");
                ps.setString(1, nombreusuario);
                ps.setString(2, contrasena);
                ps.setString(3, nombre);
                ps.setString(4, appat);
                ps.setString(5, apmat);
                ps.execute();
                this.nombreusuario = nombreusuario;
                this.contrasena = contrasena;
                this.nombre = nombre;
                this.appat = appat;
                this.apmat = apmat;
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Acción no realizada";
        }
    }

    public void delete(String nombreusuario) {
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("delete from usuario where nombreusuario = ?");
                ps.setString(1, nombreusuario);
                ps.execute();
                this.reset();
                this.mensaje = "Usuario eliminado";
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Acción no realizada";
        }

    }

    public void update(String nombreusuario, String contrasena, String nombre, String appat, String apmat) {
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("select * from usuario where nombreusuario = ?");
                ps.setString(1, nombreusuario);
                ps.executeQuery();
                ResultSet rs = ps.getResultSet();
                if (rs.next()) // Si existe el producto
                {
                    PreparedStatement ps1 = con.prepareStatement("UPDATE usuario SET contrasena = ?, nombre = ?, appat = ?, apmat = ? where nombreusuario = ?");
                    ps1.setString(5, nombreusuario);
                    ps1.setString(1, contrasena);
                    ps1.setString(2, nombre);
                    ps1.setString(3, appat);
                    ps1.setString(4, apmat);
                    ps1.execute();
                    // Actualiza los datos del Bean para mostrarlos en la Vista
                    this.nombreusuario = nombreusuario;
                    this.contrasena = contrasena;
                    this.nombre = nombre;
                    this.appat = appat;
                    this.apmat = apmat;
                    this.mensaje = "Usuario actualizado";
                } else {
                    this.mensaje = "Usuario no encontrado ";
                }
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Acción no realizada";
        }
    }

    public void reset() {
        this.contrasena = "";
        this.nombreusuario = "";
        this.mensaje = "";
        this.nombre = "";
        this.appat = "";
        this.apmat = "";
    }

    public String[][] readAll() {
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                Statement st = con.createStatement();
                st.executeQuery("select * from usuario order by nombreusuario");
                ResultSet rs = st.getResultSet();
                String[][] data = null;
                if (rs.next()) {
                    rs.last();
                    int rows = rs.getRow();
                    if (rows > 0) {
                        data = new String[rows][4];
                        rs.beforeFirst();
                        rows = 0;
                        while (rs.next()) {
                            data[rows][0] = rs.getString("nombreusuario");
                            data[rows][1] = rs.getString("contrasena");
                            data[rows][2] = rs.getString("nombre");
                            data[rows][3] = rs.getString("appat");
                            data[rows][4] = rs.getString("apmat");
                            rows++;
                        }
                    }
                }
                con.close();
                return data;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
