<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form action="loginprocess.jsp" action="POST"></form>
        <%@page import="dao.LoginDAO"%>
        <%@page session="true"%>
        <jsp:useBean id="obj" class="logica.LoginBean"/>

        <jsp:setProperty property="*" name="obj"/>
        <%                    
            String nombre=request.getParameter("email");
            HttpSession sesion=request.getSession();
            int status=LoginDAO.validate(obj);
            if(status==1){
                out.println("Inicio de sesión correcto. Bienvenido, administrador.");
                session.setAttribute("session","TRUE");
                sesion.setAttribute("user",nombre);
                %>
                <script>location.replace('indexA.jsp');</script>
                <%
            }
            else if (status==2)
            {
                out.println("Inicio de sesión correcto. Bienvenido, usuario.");
                session.setAttribute("session","TRUE");
                sesion.setAttribute("user",nombre);
                %>
                <meta http-equiv="Refresh" content="1; url=indexU.jsp">
                <%
                      
            }
            else
            {
                out.print("Error, verifique su usuario o contraseña.");
                %>
                <jsp:include page="login.jsp"></jsp:include>
                <%
            }            
        %>
    </body>
</html>