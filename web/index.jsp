<%@page import="CapaEntidad.Categorias" %>
<%@page import="CapaNegocios.clsNegocio" %>
<%@page import="java.util.ArrayList" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<%
    clsNegocio ObjN = new clsNegocio();
    ArrayList<Categorias> ListaC = new ArrayList<Categorias>();
    ListaC = ObjN.ListaCategorias();
    int Col = 0;
%>
<body background="img/logo.jpg">
<center>
<h1>Tienda Virtual de Compras</h1>
<table border="1" class="table">
    <tr>
    <% for(Categorias ObjC:ListaC){ 
        if(Col % 2 == 0){ out.print("</tr><tr>"); Col = 1; }else{ Col++; } 
    %>
        <td align="center">
            IdCategoria : <%=ObjC.getIdCategoria()%>
            <br>Descripcion : <%=ObjC.getDescripcion()%>
            <br><img src=img/<%=ObjC.getIdCategoria()%>.jpg width="100" height="100">
            <br><a href=verproductos.jsp?id=<%=ObjC.getIdCategoria()%>>Ver Productos</a>
        </td>
    <% } %>
</table>
    </tr>
</center>
</body>