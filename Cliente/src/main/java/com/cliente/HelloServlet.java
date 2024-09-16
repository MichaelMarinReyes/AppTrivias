package com.cliente;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private SocketCliente client;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Obtener un mensaje del cliente y enviarlo al servidor de sockets
        String userMessage = request.getParameter("message");
        String action = request.getParameter("action");

        if ("Registrarse".equals(action)) {
            response.sendRedirect("registro.jsp");
        } else if ("Iniciar Sesión".equals(action)) {
            response.sendRedirect("principal/principal.jsp");
            // Iniciar la comunicación con el servidor de sockets
            client = new SocketCliente("localhost", 8000); // Cambia 'localhost' a la IP del servidor de sockets si están en diferentes máquinas.
            try {
                client.connect();

                if (userMessage != null && !userMessage.trim().isEmpty()) {
                    // Enviar el mensaje al servidor de sockets
                    client.sendMessage(userMessage);

                    // Recibir la respuesta del servidor de sockets
                    String responseFromServer = client.receiveMessage();

                    if (responseFromServer != null) {
                        response.sendRedirect("principal/principal.jsp");
                    }

                } else {
                    // Si el mensaje está vacío, mostrar un error
                    PrintWriter out = response.getWriter();
                    out.println("<html><body>");
                    out.println("<h1>Error: El mensaje no puede estar vacío</h1>");
                    out.println("</body></html>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<h1>Error al conectarse al servidor de sockets</h1>");
                out.println("</body></html>");
            }/* finally {
                // Cerrar la conexión con el servidor de sockets
                try {
                    client.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }*/
        }
    }

    public void destroy() {
        try {
            client.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}