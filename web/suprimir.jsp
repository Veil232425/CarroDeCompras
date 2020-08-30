<%@page session="true" %>
<%@page import="java.util.ArrayList" %>
<%@page import="CapaEntidad.carrito" %>
<%
    // Recuperar el codigo del producto
    String IdPro = request.getParameter("id");
    // Recuperar el valor de cesto
    HttpSession MiSesion = request.getSession();
    // Declarar el arraylist 
    ArrayList<carrito> Lista = new ArrayList<carrito>();
    // Guardar en Lista lo que esta en el cesto
    Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");
    // Recorrer el arraylista para suprimir el producto seleccionado
    for(int i = 0; i < Lista.size(); i++){
        if(Lista.get(i).getIdProducto().equalsIgnoreCase(IdPro)){
            Lista.remove(i);
            break;
        }
    }
    // Actualizar el cesto de la sesion
    MiSesion.setAttribute("cesto", Lista);
    // Redireccionar
    response.sendRedirect("carrito.jsp?txtcan=0");
%>