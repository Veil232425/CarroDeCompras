package CapaEntidad;

public class Productos {
    // Campos o atributos
    private String IdProducto;
    private String IdCategoria;
    private String Descripcion;
    private String Imagen;
    private double PrecioUnidad;
    private int Stock;
    private char Estado;

    // Métodos Constructores
    public Productos() {
    }

    public Productos(String IdProducto, String IdCategoria, String Descripcion, String Imagen, double PrecioUnidad, int Stock, char Estado) {
        this.IdProducto = IdProducto;
        this.IdCategoria = IdCategoria;
        this.Descripcion = Descripcion;
        this.Imagen = Imagen;
        this.PrecioUnidad = PrecioUnidad;
        this.Stock = Stock;
        this.Estado = Estado;
    }

    // Propiedades de Lectura y Escritura
    public char getEstado() {
        return Estado;
    }

    public void setEstado(char Estado) {
        this.Estado = Estado;
    }

    public String getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(String IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(String IdCategoria) {
        this.IdCategoria = IdCategoria;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public double getPrecioUnidad() {
        return PrecioUnidad;
    }

    public void setPrecioUnidad(double PrecioUnidad) {
        this.PrecioUnidad = PrecioUnidad;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }
    
    
}
