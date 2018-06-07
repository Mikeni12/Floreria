package logica;

import java.sql.*;
import javax.servlet.ServletContext;
import basededatos.Conexion;

/**
 *
 * @author josue
 */
public class Producto {
    private String clveproducto="";
    private String nombreproducto="";
    private String precio="";
    private String descripcion="";
    private String existencia="";
    private String foto="";
    private String categoria="";
    private String mensaje = "";
    private ServletContext contexto; 

    public String getClveproducto() {
        return clveproducto;
    }

    public void setClveproducto(String clveproducto) {
        this.clveproducto = clveproducto;
    }

    public String getNombreproducto() {
        return nombreproducto;
    }

    public void setNombreproducto(String nombreproducto) {
        this.nombreproducto = nombreproducto;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public void setContexto(ServletContext contexto) {
        this.contexto = contexto;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
    
    //Operaciones SQL
    public void read(String clveproducto) {
        this.reset();
        this.clveproducto = clveproducto;
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("select * from producto where clveproducto = ?");
                ps.setString(1, clveproducto);

                ps.executeQuery();
                ResultSet rs = ps.getResultSet();
                if (rs.next()) {
                    this.mensaje = "Producto encontrado";
                    this.clveproducto = clveproducto;
                    this.nombreproducto = rs.getString("nombreproducto");
                    this.precio = rs.getString("precio");
                    this.descripcion=rs.getString("descripcion");
                    this.existencia=rs.getString("existencias");
                    this.foto=rs.getString("foto");
                    this.categoria=rs.getString("categoria");
                } else {
                    this.mensaje = "Producto no encontrado";
                }
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Acción no realizada";
        }
    }

    public void add(String nombreproducto, String precio, String descripcion, String existencia, String imagen, String categoria) {
        //this.idProducto = id;
        this.mensaje = "Se agrego exitosamente el producto " + nombreproducto;
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("insert producto (nombreproducto,precio,descripcion,existencias,foto,categoria) values (?,?,?,?,?,?)");
                ps.setString(1, nombreproducto);
                ps.setString(2, precio);
                ps.setString(3, descripcion);
                ps.setString(4, existencia);
                ps.setString(5, imagen);
                ps.setString(6, categoria);
                ps.execute();
                //this.idProducto = id;
                this.nombreproducto = nombreproducto;
                this.precio = precio;
                this.descripcion=descripcion;
                this.existencia=existencia;
                this.categoria=categoria;
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Acción no realizada";
        }
    }

    public void delete(String id) {
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("delete from producto where clveproducto = ?");
                ps.setString(1, id);
                ps.execute();
                this.reset();
                this.mensaje = "Producto eliminado";
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Acción no realizada";
        }

    }

    public void update(String clveproducto, String nombreproducto, String precio, String descripcion, String existencia,String foto, String categoria) {
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("select * from producto where clveproducto = ?");
                ps.setString(1, clveproducto);
                ps.executeQuery();
                ResultSet rs = ps.getResultSet();
                if (rs.next()) // Si existe el producto
                {
                    PreparedStatement ps1 = con.prepareStatement("UPDATE producto SET nombreproducto = ?, precio = ?, descripcion = ?, existencias = ?, foto=?, categoria=? where clveproducto = ?");
                    ps1.setString(7, clveproducto);
                    ps1.setString(1, nombreproducto);
                    ps1.setString(2, precio);
                    ps1.setString(3, descripcion);
                    ps1.setString(4, existencia);
                    ps1.setString(5, foto);
                    ps1.setString(6, categoria);
                    ps1.execute();
                    // Actualiza los datos del Bean para mostrarlos en la Vista
                    this.clveproducto = clveproducto;
                    this.nombreproducto = nombreproducto;
                    this.precio = precio;
                    this.descripcion = descripcion;
                    this.existencia = existencia;
                    this.foto = foto;
                    this.categoria=categoria;
                    this.mensaje = "Producto actualizado";
                } else {
                    this.mensaje = "Producto no encontrado ";
                }
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Acción no realizada";
        }
    }

    public void reset() {
        this.clveproducto = "";
        this.nombreproducto = "";
        this.mensaje = "";
        this.precio = "";
        this.descripcion = "";
        this.existencia = "";
        this.foto = "";
        this.categoria="";
    }

    public String[][] readAll() {
        try {
            Connection con = Conexion.obtieneConexion(contexto);
            if (con != null) {
                Statement st = con.createStatement();
                st.executeQuery("select * from producto order by clveproducto");
                ResultSet rs = st.getResultSet();
                String[][] data = null;
                if (rs.next()) {
                    rs.last();
                    int rows = rs.getRow();
                    if (rows > 0) {
                        data = new String[rows][6];
                        rs.beforeFirst();
                        rows = 0;
                        while (rs.next()) {
                            data[rows][0] = rs.getString("clveproducto");
                            data[rows][1] = rs.getString("nombreproducto");
                            data[rows][2] = rs.getString("precio");
                            data[rows][3] = rs.getString("descripcion");
                            data[rows][4] = rs.getString("existencias");
                            data[rows][5] = rs.getString("foto");
                            data[rows][6] = rs.getString("categoria");
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
