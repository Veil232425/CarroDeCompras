package CapaEntidad;

public class Categorias {
    // Campos o atributos
    private String IdCategoria;
    private String Descripcion;
    private String Imagen;
    private char Estado;

    // Métodos Constructores
    public Categorias() {
    }

    public Categorias(String IdCategoria, String Descripcion, String Imagen, char Estado) {
        this.IdCategoria = IdCategoria;
        this.Descripcion = Descripcion;
        this.Imagen = Imagen;
        this.Estado = Estado;
    }

    // Propiedades de Lectura y Escritura
    public char getEstado() {
        return Estado;
    }

    public void setEstado(char Estado) {
        this.Estado = Estado;
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
    
    
}
