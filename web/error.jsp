<%@page isErrorPage="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h1>Ha ocurrido un error ${error}
        </h1>
        <form action="salir">
            <input type="submit" value="Cerrar Sesion">
        </form>

    </body>
</html>
