package com.appmovil.analizadores;

import java_cup.runtime.*;
import java.util.ArrayList;
import com.appmovil.reportes.ErrorLexico;
import com.appmovil.analizadores.Token;

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
%}


%%

[ \t\n\r\f]  { /* Ignorar espacios en blanco */ }

// Etiquetas de apertura y cierre
[0-9]+\.[0-9]+         { return new Symbol(ParserSym.DECIMAL); }
[0-9]+                 { return new Symbol(ParserSym.ENTERO); }
// Elementos JSON
"{"                     { return new Symbol(ParserSym.LLAVE_ABIERTA); }
"}"                     { return new Symbol(ParserSym.LLAVE_CERRADA); }
"["                     { return new Symbol(ParserSym.CORCHETE_ABIERTO); }
"]"                     { return new Symbol(ParserSym.CORCHETE_CERRADO); }
":"                     { return new Symbol(ParserSym.DOS_PUNTOS); }
","                     { return new Symbol(ParserSym.COMA); }
"_"                     { return new Symbol(ParserSym.GUION_BAJO); }
"-"                     { return new Symbol(ParserSym.GUION); }

// Cadenas de texto
[_|\-|$]+[a-zA-z]       { return new Symbol(ParserSym.CADENA); }

// Nombres de campos
"USUARIO"                { return new Symbol(ParserSym.USUARIO); }
"PASSWORD"               { return new Symbol(ParserSym.PASSWORD); }
"NOMBRE"                 { return new Symbol(ParserSym.NOMBRE); }
"INSTITUCION"            { return new Symbol(ParserSym.INSTITUCION); }
"NUEVO"                  { return new Symbol(ParserSym.NUEVO); }
"FECHA"                  { return new Symbol(ParserSym.FECHA); }
"CREACION"               { return new Symbol(ParserSym.CREACION); }

// Caracteres no reconocidos
[^]                      { System.err.println("Caracter no reconocido: " + yytext()); }


