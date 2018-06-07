package logica;

/**
 *
 * @author josuedaniel
 */
public class Inventario {
    
    private int idProducto;
    private String nombreProducto;
    private float precio;
    private String descripcion;
    private int existencia;

    public Inventario(){
        this(0,"",0,"",0);
    }
    
    public Inventario(int idProducto, String nombreProducto, float precio, String descripcion, int existencia) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.precio = precio;
        this.descripcion = descripcion;
        this.existencia = existencia;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public float getPrecio() {
        return precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    @Override
    public String toString() {
        return "Inventario{" + "idProducto=" + idProducto + ", nombreProducto=" + nombreProducto + ", precio=" + precio + ", descripcion=" + descripcion + ", existencia=" + existencia + '}';
    }
}
