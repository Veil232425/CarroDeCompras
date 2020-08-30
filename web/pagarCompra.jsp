<%@page session="true" %>
<%@page import="CapaEntidad.*" %>
<%@page import="CapaNegocios.*" %>
<%@page import="java.util.ArrayList" %>
<body background="img/logo.jpg">
<%
    // Recuperar valores de la sesion actual
    HttpSession MiSesion = request.getSession();
    String IdCliente = (String)MiSesion.getAttribute("IdCliente");
    String FechaVenta = (String)MiSesion.getAttribute("Fecha");
    double MontoTotal = (Double)MiSesion.getAttribute("Total");
    ArrayList<carrito> Lista = new ArrayList<carrito>();
    Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");
    
    clsNegocio ObjBD = new clsNegocio();
    // Devuelve el numero de filas de una tabla
    int filas = ObjBD.NumeroFilas("ventas");
    String IdVenta;
    // Si no hay filas genera el primer codigo
    if(filas == 0){
        IdVenta = "VTA0000001";
    }else{
        // Caso contrario genera el correlativo
        IdVenta = "VTA"+String.format("%07d",filas+1);
    }
    
    // Grabar fila en la tabla ventas
    Ventas ObjV = new Ventas(IdVenta, IdCliente, FechaVenta, MontoTotal, '1');
    ObjBD.InsertarVenta(ObjV);
    
    // Grabar filas en la tabla detalle
    for(int i = 0; i < Lista.size(); i++){
        String IdPro = Lista.get(i).getIdProducto();
        Productos ObjP = new Productos();
        ObjP = ObjBD.BuscarProducto(IdPro);
        Detalle ObjD = new Detalle(IdVenta,IdPro,
                Lista.get(i).getCantidad(),ObjP.getPrecioUnidad(),'1');
        ObjBD.InsertarDetalle(ObjD);
        
    }
    //------------------------------------------------
    // Modificacion del Stock en la tabla Productos
    //------------------------------------------------
    
    // Limpiar el cesto de la sesion
    MiSesion.removeAttribute("cesto");
%>    
<center>
<h1>Se ha grabado su Compra Ok</h1>
<a href="index.jsp">Hacer Click para retornar a la Pagina Principal</a>
</center>
</body>