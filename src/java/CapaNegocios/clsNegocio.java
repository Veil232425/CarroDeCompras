package CapaNegocios;
import CapaEntidad.*;
import CapaDatos.clsDatos;
import java.util.ArrayList;

public class clsNegocio {
    private clsDatos ObjD;

    // Método Constructor
    public clsNegocio() {
        ObjD = new clsDatos();
    }
    
    // Métodos a exponer
    public ArrayList<Categorias> ListaCategorias(){
        return ObjD.ListaCategorias();
    }
    
    public ArrayList<Productos> ListaProductos(String IdCat){
        return ObjD.ListaProductos(IdCat);
    }
    
    public Productos BuscarProducto(String Id){
        return ObjD.BuscarProducto(Id);
    }
    
    public int NumeroFilas(String NombreTabla){
        return ObjD.NumeroFilas(NombreTabla);
    }
    
    public void InsertarVenta(Ventas ObjV){
        ObjD.InsertarVenta(ObjV);
    }
    
    public void InsertarDetalle(Detalle ObjT){
        ObjD.InsertarDetalle(ObjT);
    }
    
    public Clientes InfoCliente(String IdCliente){
        return ObjD.InfoCliente(IdCliente);
    }
    
    public boolean VerificaUsuario(String IdCliente,String Password){
        return ObjD.VerificaUsuario(IdCliente, Password);
    }
    
    public Productos InfoProducto(String IdPro){
        return ObjD.InfoProducto(IdPro);
    }
}
