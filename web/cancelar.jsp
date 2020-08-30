<%@page session="true" %>
<%
    // Recuperar la sesion actual
    HttpSession MiSesion = request.getSession();
    // Eliminar el valor de cesto de la sesion actual
    MiSesion.removeAttribute("cesto");
    // Redireccionar a la pagina principal
    response.sendRedirect("index.jsp");
%>    
