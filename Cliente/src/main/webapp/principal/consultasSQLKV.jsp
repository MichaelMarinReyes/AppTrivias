<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 7/09/24
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Consultas SQLKV</title>
    <link rel="stylesheet" type="text/css" href="../styles/consultasSQLKV.css">
  </head>
  <body>
    <div class="editor">
      <h2>Consultas SQLKV</h2>
      <button onclick="realizarConsulta()">Consultar</button>
      <textarea class="sqlkv-editor" id="sqlkvEditor" placeholder="Escriba su consulta SQLKV aquí..."></textarea>
    </div>
    <div>
      <table>
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

  <script>
    function realizarConsulta() {
      if (sqlkvEditor.value.trim() === '') {
        alert('No hay nada para consultar')
      } else {
        alert('Compilando')
      }
    }
  </script>
  </body>
</html>
