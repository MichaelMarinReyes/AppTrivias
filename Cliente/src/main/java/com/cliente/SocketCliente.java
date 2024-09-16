package com.cliente;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;

public class SocketCliente {
    private String host;
    private int port;
    private Socket socket;
    private DataOutputStream salida;
    private DataInputStream entrada;

    public SocketCliente(String host, int port) {
        this.host = host;
        this.port = port;
    }

    public void connect() throws Exception {
        socket = new Socket(host, port);
        salida = new DataOutputStream(socket.getOutputStream());
        entrada = new DataInputStream(socket.getInputStream());
    }

    public void sendMessage(String message) throws Exception {
        salida.writeUTF(message);
    }

    public String receiveMessage() throws Exception {
        return entrada.readUTF();
    }

    public void close() throws Exception {
        if (socket != null) socket.close();
    }
}
