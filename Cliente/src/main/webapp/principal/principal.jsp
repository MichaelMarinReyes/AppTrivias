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
    <div class="editor-container">
        <div class="editor-section">
            <h2>Código XSON</h2>
            <div class="line-numbers" id="lineNumbers">1</div>
            <textarea class="editor" id="editor" onscroll="syncScroll()" oninput="updateLineNumbers()" placeholder="Escriba su código XSON aquí..."></textarea>
        </div>

        <div class="editor-section">
            <h2>Consultas SQLKV</h2>
            <textarea class="sqlkv-editor" id="sqlkvEditor" placeholder="Escriba su consulta SQLKV aquí..."></textarea>
        </div>
    </div>

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
        const lineNumbers = document.getElementById('lineNumbers');
        lineNumbers.scrollTop = editor.scrollTop;
    }

    function updateLineNumbers() {
        const editor = document.getElementById('editor');
        const lineNumbers = document.getElementById('lineNumbers');
        const lines = editor.value.split('\n').length;
        let lineNumbersContent = '';
        for (let i = 1; i <= lines; i++) {
            lineNumbersContent += i + '\n';
        }
        lineNumbers.textContent = lineNumbersContent;
    }

    document.addEventListener('DOMContentLoaded', updateLineNumbers);
</script>
</body>
</html>
