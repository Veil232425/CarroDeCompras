<%@page import="CapaEntidad.Productos" %>
<%@page import="CapaNegocios.clsNegocio" %>
<%@page import="java.util.ArrayList" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<%
    String IdCat = request.getParameter("id");
    clsNegocio ObjN = new clsNegocio();
    ArrayList<Productos> ListaP = new ArrayList<Productos>();
    ListaP = ObjN.ListaProductos(IdCat);
    int Col = 0;
%>    
<body background="img/logo.jpg">
<center>
<h1>Tienda Virtual de Compras</h1>
<table border="1" class="table">
    <tr>
    <% for(Productos ObjP:ListaP){ 
        if(Col % 2 == 0){ out.print("</tr><tr>"); Col = 1; }else{ Col++; } 
    %>
        <td align="center">
            IdProducto : <%=ObjP.getIdProducto()%>
            <br>Descripcion : <%=ObjP.getDescripcion()%>
            <br><img src=img/<%=ObjP.getIdProducto()%>.jpg width="100" height="100">
            <br><a href=verdetalle.jsp?id=<%=ObjP.getIdProducto()%>>Ver Detalle</a>
        </td>
    <% } %>
</table>
    </tr>
<a href="index.jsp">Regresar a la Pagina Principal</a>
</center>
</body>