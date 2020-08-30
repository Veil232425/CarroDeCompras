package CapaEntidad;

public class Ventas {
    // Campos o Atributos
    private String IdVenta;
    private String IdCliente;
    private String FechaVenta;
    private double MontoTotal;
    private char Estado;

    // Métodos Constructores
    public Ventas() {
    }
    
    public Ventas(String IdVenta, String IdCliente, String FechaVenta, double MontoTotal, char Estado) {
        this.IdVenta = IdVenta;
        this.IdCliente = IdCliente;
        this.FechaVenta = FechaVenta;
        this.MontoTotal = MontoTotal;
        this.Estado = Estado;
    }
    
    // Propiedades de Lectura y Escritura
    public String getIdVenta() {
        return IdVenta;
    }

    public void setIdVenta(String IdVenta) {
        this.IdVenta = IdVenta;
    }

    public String getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(String IdCliente) {
        this.IdCliente = IdCliente;
    }

    public String getFechaVenta() {
        return FechaVenta;
    }

    public void setFechaVenta(String FechaVenta) {
        this.FechaVenta = FechaVenta;
    }

    public double getMontoTotal() {
        return MontoTotal;
    }

    public void setMontoTotal(double MontoTotal) {
        this.MontoTotal = MontoTotal;
    }

    public char getEstado() {
        return Estado;
    }

    public void setEstado(char Estado) {
        this.Estado = Estado;
    }
    
}
