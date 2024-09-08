<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 5/09/24
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Administrador de Trivias</title>
    <link rel="stylesheet" type="text/css" href="../styles/principal.css">
</head>
<body>
<div class="navbar">
    <button onclick="window.location.href='crearTrivia.jsp'">Crear Trivia</button>
    <button onclick="window.location.href='modificarTrivia.jsp'">Modificar Trivia</button>
    <button onclick="window.location.href='eliminarTrivia.jsp'">Eliminar Trivia</button>
    <button onclick="window.location.href='reportes.jsp'">Reportes</button>
    <button onclick="window.location.href='importarTrivia.jsp'">Importar Trivia</button>
    <button onclick="window.location.href='exportarTrivia.jsp'">Exportar Trivia</button>
    <button onclick="window.location.href='modificarUsuario.jsp'">Modificar Usuario</button>
    <button onclick="window.location.href='consultasSQLKV.jsp'">Consultas SQLKV</button>
    <button onclick="window.location.href='../index.jsp'">Cerrar Sesión</button>
</div>

<div class="container">
    <div class="contenedor-editor">
        <div class="editor">
            <h2>Código XSON</h2>
            <div class="editor-wrapper">
                <div class="numero-linea" id="numeroLinea">1</div>
                <textarea class="editor" id="editor" onscroll="syncScroll()" oninput="actualizarNumeroLinea()" placeholder="Escriba su código XSON aquí..."></textarea>
            </div>
        </div>
    </div>
    <br><br>
    <div class="response-container">
        <h2>Área de Respuesta</h2>
        <table id="responseTable">
            <thead>
            <tr>
                <th>Tipo</th>
                <th>Descripción</th>
            </tr>
            </thead>
            <tbody>
            <!-- Aquí se llenarán los datos de errores y mensajes -->
            </tbody>
        </table>
    </div>
</div>

<script>
    function syncScroll() {
        const editor = document.getElementById('editor');
        const lineNumbers = document.getElementById('numeroLinea');
        lineNumbers.scrollTop = editor.scrollTop;
    }

    function actualizarNumeroLinea() {
        const editor = document.getElementById('editor');
        const lineNumbers = document.getElementById('numeroLinea');
        const lines = editor.value.split('\n').length;
        let lineNumbersContent = '';

        // Agregamos un salto de línea después de cada número
        for (let i = 1; i <= lines; i++) {
            lineNumbersContent += i + '\n';
        }

        lineNumbers.textContent = lineNumbersContent;
    }


    document.addEventListener('DOMContentLoaded', updateLineNumbers);
</script>
</body>
</html>
