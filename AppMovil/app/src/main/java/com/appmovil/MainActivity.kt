package com.appmovil

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }


        val nombreText: TextView = findViewById(R.id.entradaTexto)
        val iniciarBoton: Button = findViewById(R.id.iniciarSesionBoton)
        val registrarBoton: Button = findViewById(R.id.registrarBoton)

        iniciarBoton.setOnClickListener{
            if (nombreText.getText().isEmpty()) {
                Toast.makeText(this, "Campo vacío", Toast.LENGTH_SHORT).show()
            }
        }

        registrarBoton.setOnClickListener{
            val registro = Intent(this, Registro::class.java)
            startActivity(registro)
        }
    }
}