<%@page import="CapaEntidad.*" %>
<%@page import="CapaNegocios.clsNegocio" %>
<%@page import="java.util.ArrayList" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<body background="img/logo.jpg">
<%
    // Enlaces del carrito
    String enlace1 = "<a href=index.jsp>Seguir Comprando</a>";
    String enlace2 = "<a href=pagar.jsp>Pagar Compra</a>";
    String enlace3 = "<a href=cancelar.jsp>Cancelar Compra</a>";            
    // Variable de la clase BD
    clsNegocio ObjBD = new clsNegocio();
    // Recuperando los valores del formulario
    String IdPro = (String)request.getParameter("txtid");
    int Cant =  Integer.parseInt(request.getParameter("txtcan"));
    // Agregar los valores del formulario a un objeto de tipo carrito
    carrito ObjC = new carrito(IdPro, Cant);
    // Variable para acceder a la sesion del proyecto web
    HttpSession MiSesion = request.getSession();
    // Declarar un ArrayList de tipo carrito
    ArrayList<carrito> Lista = null;
    // Recuperando los elementos almacenados en la sesion
    Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");
    // Verificar si logro recuperar valores de la sesion
    if(Lista == null){
        Lista = new ArrayList<carrito>();
        Lista.add(ObjC);
    }else{
        // Si ya existen elementos en la lista
        boolean encontrado = false;
        for(int i = 0; i < Lista.size();i++){
            carrito Obj = new carrito();
            Obj = Lista.get(i);
            if(Obj.getIdProducto().equalsIgnoreCase(IdPro)){
                encontrado = true;
                Obj.setCantidad(Obj.getCantidad()+Cant);
                Lista.set(i, Obj);
                break;
            }
        }    
        // Si no encontro el producto añadirlo al cesto
        if(!encontrado && Cant!=0){
            Lista.add(ObjC);
        }
    }
    // Actualizar el valor de la sesion
    if(Cant!=0)MiSesion.setAttribute("cesto", Lista);
    // Construir la factura
%>    
<h1>Cesta de Compras</h1>
<table border=1 align=center class="table">
    <tr bgcolor=Yellow>
        <th>Item</th>
        <th>IdProducto</th>
        <th>Descripcion</th>
        <th>Imagen</th>
        <th>Precio</th>
        <th>Cantidad</th>
        <th>Sub-Total</th>
        <th>Opciones</th>
    </tr>
<%        
    double Total = 0; int i;
    // Recorrer todos los productos de Lista
    for(i = 0; i < Lista.size(); i++){
        Productos Obj = new Productos();
        // Recuperar la informacion de cada producto del cesto
        Obj = ObjBD.BuscarProducto(Lista.get(i).getIdProducto());
        String enlace = "suprimir.jsp?id="+Obj.getIdProducto();
        double Precio = Obj.getPrecioUnidad();
        int Cantidad = Lista.get(i).getCantidad();
        double SubTotal = Precio * Cantidad;
        Total += SubTotal;
%>            
        <tr>
            <td><%=(i+1)%></td>
            <td><%=Obj.getIdProducto()%></td>
            <td><%=Obj.getDescripcion()%></td>
            <td><img src=img/<%=Obj.getImagen()%> width=50 heigth=50></td>
            <td><%=Precio%></td>
            <td><%=Cantidad%></td>
            <td><%=SubTotal%></td>
            <td><a href=<%=enlace%>>Suprimir</a></td>
        </tr>
<%  } %>
        <tr bgcolor=Yellow><th colspan=6>TOTAL GENERAL</th><th><%=Total%></th><th></th></tr>
        <tr><td colspan=8 align=center>[ <%=enlace1%> ][ <%=enlace2%> ][ <%=enlace3%> ]</td></tr>
</table>
<%    
    // Guardar valores en sesion
    MiSesion.setAttribute("numarticulos", i);
    MiSesion.setAttribute("total", Total);
%>
</body>