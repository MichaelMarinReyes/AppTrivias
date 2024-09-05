<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 4/09/24
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrador de Trivias</title>
    <link rel="stylesheet" type="text/css" href="styles/usuarioLogeado.css">
</head>
    <body>
        <div class="button-grid">
            <button onclick="window.location.href='crear_trivia.jsp'">Crear Trivia</button>
            <button onclick="window.location.href='modificar_trivia.jsp'">Modificar Trivia</button>
            <button onclick="window.location.href='eliminar_trivia.jsp'">Eliminar Trivia</button>
            <button onclick="window.location.href='reportes.jsp'">Reportes</button>
            <button onclick="window.location.href='importar_trivia.jsp'">Importar Trivia</button>
            <button onclick="window.location.href='exportar_trivia.jsp'">Exportar Trivia</button>
            <button onclick="window.location.href='modificar_usuario.jsp'">Modificar Usuario</button>
            <button onclick="window.location.href='cerrar_sesion.jsp'">Cerrar Sesión</button>
        </div>
        </body>
    </body>
</html>
