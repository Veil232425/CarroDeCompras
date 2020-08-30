package CapaDatos;
import java.sql.*;
import java.util.ArrayList;
import CapaEntidad.*;

public class clsDatos {
    // Campos o atributos
    private String Driver = "com.mysql.jdbc.Driver";
    private String URL = "jdbc:mysql://localhost:3306/tienda2020";
    private String Usuario = "root";
    private String Clave = "mysql";
    
    private Connection Cn;
    private Statement Cmd;
    private CallableStatement Stmt;
    private ResultSet Rs;
    
    private ArrayList<Categorias> ListaC;
    private ArrayList<Productos> ListaP;

    // Método Constructor
    public clsDatos() {
        try {
                Class.forName(Driver);
                Cn = DriverManager.getConnection(URL,Usuario,Clave);
        } catch (ClassNotFoundException | SQLException e) {
                System.out.println("*** ERROR:"+e.getMessage());
        }
    }
    
    // Método recuperar las categorias
    public ArrayList<Categorias> ListaCategorias(){
        String SQL = "CALL ListaCategorias()";
        ListaC = new ArrayList<>();
        try {
                Stmt = Cn.prepareCall(SQL);
                Rs = Stmt.executeQuery();
                while(Rs.next()){
                    ListaC.add(new Categorias(Rs.getString("IdCategoria"),
                        Rs.getString("Descripcion"),
                        Rs.getString("Imagen"),
                        Rs.getString("Estado").charAt(0)));
                }
        } catch (SQLException e) {
                System.out.println("*** ERROR:"+e.getMessage());
        }
        return ListaC;
    }
    
    // Método recuperar los productos
    public ArrayList<Productos> ListaProductos(String IdCat){
        String SQL = "CALL ListaProductos(?)";
        ListaP = new ArrayList<>();
        try {
                Stmt = Cn.prepareCall(SQL);
                Stmt.setString(1, IdCat);
                Rs = Stmt.executeQuery();
                while(Rs.next()){
                    ListaP.add(new Productos(Rs.getString("IdProducto"),
                        Rs.getString("IdCategoria"),
                        Rs.getString("Descripcion"),
                        Rs.getString("Imagen"),
                        Rs.getDouble("PrecioUnidad"),
                        Rs.getInt("Stock"),
                        Rs.getString("Estado").charAt(0)));
                }
        } catch (SQLException e) {
                System.out.println("*** ERROR:"+e.getMessage());
        }
        return ListaP;
    }
    
    // Método para buscar un producto
    public Productos BuscarProducto(String Id){
        String SQL = "CALL BuscaProducto(?)";
        Productos ObjP = null;
        try {
                Stmt = Cn.prepareCall(SQL);
                Stmt.setString(1, Id);
                Rs = Stmt.executeQuery();
                if(Rs.next()){
                    ObjP = new Productos(Rs.getString("IdProducto"),
                        Rs.getString("IdCategoria"),
                        Rs.getString("Descripcion"),
                        Rs.getString("Imagen"),
                        Rs.getDouble("PrecioUnidad"),
                        Rs.getInt("Stock"),
                        Rs.getString("Estado").charAt(0));
                }
        } catch (SQLException e) {
                System.out.println("*** ERROR:"+e.getMessage());
        }
        return ObjP;
    }
    
    // Método para devolver el numero de filas de un tabla
    public int NumeroFilas(String NombreTabla)
    { int filas = 0;
      String SQL = "SELECT Count(*) FROM "+NombreTabla;
        try {
            this.Cmd = this.Cn.createStatement();
            this.Rs = this.Cmd.executeQuery(SQL);
            if(this.Rs.next()){
                filas = Rs.getInt(1);
            }
        } catch (Exception e) {
           System.out.println("***ERROR:"+e.getMessage());   
        }
      return filas;  
    }
    
    // Método para insertar filas en la tabla ventas
    public void InsertarVenta(Ventas ObjV)
    {
        try {
            this.Stmt = this.Cn.prepareCall("CALL InsertaVenta(?,?,?,?,?)");
            this.Stmt.setString(1, ObjV.getIdVenta());
            this.Stmt.setString(2, ObjV.getIdCliente());
            this.Stmt.setString(3, ObjV.getFechaVenta());
            this.Stmt.setDouble(4, ObjV.getMontoTotal());
            this.Stmt.setString(5, ObjV.getEstado()+"");
            this.Stmt.executeUpdate(); // INSERT, DELETE o UPDATE
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());        
        }
    }
    
    // Método para insertar filas en la tabla detalle
    public void InsertarDetalle(Detalle ObjD)
    {
        try {
            this.Stmt = this.Cn.prepareCall("CALL InsertaDetalle(?,?,?,?,?)");
            this.Stmt.setString(1, ObjD.getIdVenta());
            this.Stmt.setString(2, ObjD.getIdProducto());
            this.Stmt.setInt(3, ObjD.getCantidad());
            this.Stmt.setDouble(4, ObjD.getPrecioUnidad());
            this.Stmt.setString(5, ObjD.getEstado()+"");
            this.Stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());  
        }
    }
    
    // Devolver Informacion de Cliente
    public Clientes InfoCliente(String IdCliente)
    { Clientes ObjP = null;      
        try {
            // Establece el nombre del SP a invocar
            this.Stmt = this.Cn.prepareCall("CALL InfoCliente(?)");
            // Asigna el valor del unico parametro del SP
            this.Stmt.setString(1, IdCliente);
            // Ejecuta el SP y almacena los resultados
            this.Rs = this.Stmt.executeQuery();
            // Si recupero filas guardalo en un objeto de tipo Clientes
            if(this.Rs.next()){
                ObjP = new Clientes(
                            this.Rs.getString("IdCliente"),
                            this.Rs.getString("Apellidos"),
                            this.Rs.getString("Nombres"),
                            this.Rs.getString("Direccion"),
                            this.Rs.getString("FechaNacimiento"),
                            this.Rs.getString("Sexo").charAt(0),
                            this.Rs.getString("Correo"),
                            this.Rs.getString("Password"),
                            this.Rs.getString("Estado").charAt(0)
                        );
            }
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());
        }
      return ObjP;  
    }
    
    // Validar IdUsuario y Password
    public boolean VerificaUsuario(String IdCliente,String Password)
    { boolean estado = false;
        String SQL = "SELECT * FROM Clientes WHERE IdCliente='"+
                    IdCliente+"' AND Password='"+Password+"'";
        try {
            this.Cmd = this.Cn.createStatement();
            this.Rs = this.Cmd.executeQuery(SQL);
            if(this.Rs.next()){
                estado = true;
            }
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());
        }
      return estado;
    }
    
    // Método para devolver la informacion de un producto
    public Productos InfoProducto(String IdPro)
    { Productos ObjP = null;
      String SQL = "SELECT * FROM productos WHERE IdProducto='"+IdPro+"'";
        try {
            this.Cmd = this.Cn.createStatement();
            this.Rs = this.Cmd.executeQuery(SQL);
            if(this.Rs.next()){
                ObjP = new Productos(
                        this.Rs.getString("IdProducto"),
                        this.Rs.getString("IdCategoria"),
                        this.Rs.getString("Descripcion"),
                        this.Rs.getString("Imagen"),
                        this.Rs.getDouble("PrecioUnidad"),
                        this.Rs.getInt("Stock"),                        
                        this.Rs.getString("Estado").charAt(0)
                        );
            }
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());
        }
      return ObjP;  
    }
}
