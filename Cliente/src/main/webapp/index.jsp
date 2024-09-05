<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Autenticación</title>
    <link rel="stylesheet" type="text/css" href="styles/index.css">
</head>
<body>
<div class="login-container">
    <h1>Iniciar Sesión o Registrarse</h1>
    <form action="hello-servlet" method="get">
        <textarea id="message" name="message" rows="4" cols="50"
                  placeholder="Escribe XML de login"></textarea><br><br>

        <button type="submit" name="action" value="Iniciar Sesión" class="btn">Iniciar Sesión</button>
        <button type="submit" name="action" value="Registrarse" class="btn">Registrarse</button>
    </form>
</div>
</body>
</html>
