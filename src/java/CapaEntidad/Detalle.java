package CapaEntidad;

public class Detalle {
    // Campos o Atributos
    private String IdVenta;
    private String IdProducto;
    private int Cantidad;
    private double PrecioUnidad;
    private char Estado;

    // Métodos Constructores
    public Detalle() {
    }

    public Detalle(String IdVenta, String IdProducto, int Cantidad, double PrecioUnidad, char Estado) {
        this.IdVenta = IdVenta;
        this.IdProducto = IdProducto;
        this.Cantidad = Cantidad;
        this.PrecioUnidad = PrecioUnidad;
        this.Estado = Estado;
    }
    
    // Propiedades de Lectura y Escritura
    public String getIdVenta() {
        return IdVenta;
    }

    public void setIdVenta(String IdVenta) {
        this.IdVenta = IdVenta;
    }

    public String getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(String IdProducto) {
        this.IdProducto = IdProducto;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getPrecioUnidad() {
        return PrecioUnidad;
    }

    public void setPrecioUnidad(double PrecioUnidad) {
        this.PrecioUnidad = PrecioUnidad;
    }

    public char getEstado() {
        return Estado;
    }

    public void setEstado(char Estado) {
        this.Estado = Estado;
    }
    
}
