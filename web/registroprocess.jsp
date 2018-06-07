<%@page import="dao.RegistroDAO"%>
<jsp:useBean id="obj" class="logica.RegistroBean"/>

<jsp:setProperty property="*" name="obj"/>
    <%
    boolean status=RegistroDAO.validate(obj);
    if(status){
        out.println("\n\n\nRegistro realizado con éxito.");
        %>
        <jsp:include page="presentacion.html"></jsp:include>
        <%
    }
    else
    {
        out.print("Error, verifique los campos.");
        %>
        <jsp:include page="registro.jsp"></jsp:include>
        <%
    }
%>
