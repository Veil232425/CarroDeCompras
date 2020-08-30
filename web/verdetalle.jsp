<%@page import="CapaEntidad.Productos" %>
<%@page import="CapaNegocios.clsNegocio" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<%
    String IdPro = request.getParameter("id");
    clsNegocio ObjN = new clsNegocio();
    Productos ObjP = new Productos();
    ObjP = ObjN.BuscarProducto(IdPro);
%>
<body background="img/logo.jpg">
<center>
    <h1>DETALLE DEL PRODUCTO</h1>
    <form action="carrito.jsp">
        <input type="hidden" name="txtid" value=<%=ObjP.getIdProducto()%>>
    <table border="1" class="table">
        <tr>
            <td>CODIGO</td><td><%=ObjP.getIdProducto()%></td>
        </tr>
        <tr>
            <td>DESCRIPCION</td><td><%=ObjP.getDescripcion()%></td>
        </tr>
        <tr>
            <td>CATEGORIA</td><td><%=ObjP.getIdCategoria()%></td>
        </tr>
        <tr>
            <td>PRECIO</td><td><%=ObjP.getPrecioUnidad()%></td>
        </tr>
        <tr>
            <td>STOCK</td><td><%=ObjP.getStock()%></td>
        </tr>
        <tr>
            <td>IMAGEN</td><td><img src=img/<%=ObjP.getIdProducto()%>.jpg width="250" height="250"></td>
        </tr>
        <tr>
            <td>CANTIDAD</td><td><input name="txtcan"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="Añadir al Carrito"></td>
        </tr>
    </table>
    </form>
        <a href="javascript:history.back()">Ir a Categorias</a>
</center>
</body>