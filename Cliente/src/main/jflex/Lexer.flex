package com.analizadores.lexico;

import java_cup.runtime.*;
import java.util.ArrayList;
import com.analizadores.sintactico.ParserWebSym;
import com.analizadores.lexico.ErrorLexico;

%%
%public
%class Lexer
%unicode
%line
%column
%cup

%{
  public static ArrayList<ErrorLexico> erroresLexicos = new ArrayList<>();

  public ArrayList<ErrorLexico> getErroresLexicos() {
      return erroresLexicos;
  }

  private void agregarError(String lexema, int linea, int columna, String descripcion) {
      erroresLexicos.add(new ErrorLexico(lexema, linea, columna, "Lexico", descripcion));
  }
%}


%%

[ \t\n\r\f]     { /* Ignorar espacios en blanco */ }

// Números enteros y decimales
[0-9]+\.[0-9]+  { return new Symbol(ParserWebSym.DECIMAL); }
[0-9]+          { return new Symbol(ParserWebSym.ENTERO); }

// Elementos JSON
"{"             { return new Symbol(ParserWebSym.LLAVE_ABIERTA); }
"}"             { return new Symbol(ParserWebSym.LLAVE_CERRADA); }
"["             { return new Symbol(ParserWebSym.CORCHETE_ABIERTO); }
"]"             { return new Symbol(ParserWebSym.CORCHETE_CERRADO); }
":"             { return new Symbol(ParserWebSym.DOS_PUNTOS); }
","             { return new Symbol(ParserWebSym.COMA); }
"_"             { return new Symbol(ParserWebSym.GUION_BAJO); }
"-"             { return new Symbol(ParserWebSym.GUION); }
">"             { return new Symbol(ParserWebSym.MAYOR_QUE); }
"<"             { return new Symbol(ParserWebSym.MENOR_QUE); }
"\""            { return new Symbol(ParserWebSym.COMILLAS); }
"="             { return new Symbol(ParserWebSym.IGUAL); }
"?"             { return new Symbol(ParserWebSym.INTERROGACION); }
"!"             { return new Symbol(ParserWebSym.ADMIRACION); }

// ID
[_|\-|$][a-zA-Z0-9]+       { return new Symbol(ParserWebSym.ID); }

// Palabras reservadas
"LOGIN"                  { return new Symbol(ParserWebSym.LOGIN); }
"DATOS"                  { return new Symbol(ParserWebSym.DATOS); }
"USUARIO"                { return new Symbol(ParserWebSym.USUARIO); }
"PASSWORD"               { return new Symbol(ParserWebSym.PASSWORD); }
"NOMBRE"                 { return new Symbol(ParserWebSym.NOMBRE); }
"INSTITUCION"            { return new Symbol(ParserWebSym.INSTITUCION); }
"NUEVO"                  { return new Symbol(ParserWebSym.NUEVO); }
"ANTIGUO"                { return new Symbol(ParserWebSym.ANTIGUO); }
"FECHA"                  { return new Symbol(ParserWebSym.FECHA); }
"MODIFICACION"           { return new Symbol(ParserWebSym.MODIFICACION); }
"CREACION"               { return new Symbol(ParserWebSym.CREACION); }
"ELIMINAR"               { return new Symbol(ParserWebSym.ELIMINAR); }
"TIEMPO"                 { return new Symbol(ParserWebSym.TIEMPO); }
"PREGUNTA"               { return new Symbol(ParserWebSym.PREGUNTA); }
"TEMA"                   { return new Symbol(ParserWebSym.TEMA); }
"CLASE"                  { return new Symbol(ParserWebSym.CLASE); }
"INDICE"                 { return new Symbol(ParserWebSym.INDICE); }
"TEXTO"                  { return new Symbol(ParserWebSym.TEXTO); }
"VISIBLE"                { return new Symbol(ParserWebSym.VISIBLE); }
"OPCIONES"               { return new Symbol(ParserWebSym.OPCIONES); }
"RESPUESTA"              { return new Symbol(ParserWebSym.RESPUESTA); }
"AGREGAR"                { return new Symbol(ParserWebSym.AGREGAR); }
"PASSWORD"               { return new Symbol(ParserWebSym.PASSWORD); }
"realizar"               { return new Symbol(ParserWebSym.REALIZAR); }
"solicitud"              { return new Symbol(ParserWebSym.SOLICITUD); }
"fin"                    { return new Symbol(ParserWebSym.FIN); }
"solicitudes"            { return new Symbol(ParserWebSym.SOLICITUDES); }
"envio"                  { return new Symbol(ParserWebSym.ENVIO); }
"respuestas"             { return new Symbol(ParserWebSym.RESPUESTAS); }
"respuesta"              { return new Symbol(ParserWebSym.RESPUESTA_SING); }
"version"                { return new Symbol(ParserWebSym.VERSION); }
"xson"                   { return new Symbol(ParserWebSym.XSON); }
<<EOF>>                  { return new Symbol(ParserWebSym.EOF); }

// Caracteres no reconocidos
[^]                      { agregarError(yytext(), yyline, yycolumn, "Caracter no reconocido");
                            System.err.println("Caracter no reconocido: " + yytext());
                          }
