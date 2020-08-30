package CapaEntidad;

public class Clientes {
    // Campos o Atributos
    private String IdCliente;
    private String Apellidos;
    private String Nombres;
    private String Direccion;
    private String FechaNacimiento;
    private char Sexo;
    private String Correo;
    private String Password;
    private char Estado;

    // Métodos Constructores
    public Clientes() {
    }
    
    public Clientes(String IdCliente, String Apellidos, String Nombres, String Direccion, String FechaNacimiento, char Sexo, String Correo, String Password, char Estado) {
        this.IdCliente = IdCliente;
        this.Apellidos = Apellidos;
        this.Nombres = Nombres;
        this.Direccion = Direccion;
        this.FechaNacimiento = FechaNacimiento;
        this.Sexo = Sexo;
        this.Correo = Correo;
        this.Password = Password;
        this.Estado = Estado;
    }
    
    // Propiedades de Lectura y Escritura
    public String getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(String IdCliente) {
        this.IdCliente = IdCliente;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getFechaNacimiento() {
        return FechaNacimiento;
    }

    public void setFechaNacimiento(String FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public char getSexo() {
        return Sexo;
    }

    public void setSexo(char Sexo) {
        this.Sexo = Sexo;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public char getEstado() {
        return Estado;
    }

    public void setEstado(char Estado) {
        this.Estado = Estado;
    }
    
}
