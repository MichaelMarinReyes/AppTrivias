<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 3/09/24
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="styles/registro.css">
</head>
<body>
<div class="login-container">
    <h1>Registrarse</h1>
    <form action="registro" method="get">
        <textarea id="message" name="message" rows="4" cols="50"
                  placeholder="Escribe XML de registro"></textarea><br><br>

        <button type="submit" name="action" value="Registrarse" class="btn">Registrarse</button>
    </form>
</div>
</body>
</html>