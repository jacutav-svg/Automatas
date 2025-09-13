/* CppLexer.flex */
package src;
import java_cup.runtime.Symbol;

%%

%class CppLexer
%unicode
%public
%cup
%line
%column

%{
  // Aquí puedes declarar variables auxiliares si quieres
%}

%eof{
  return new Symbol(Token.EOF);
%eof}

%%

/* ===== PALABRAS RESERVADAS ===== */
"if"                { return new Symbol(Token.KW, yyline, yycolumn, "if"); }
"else"              { return new Symbol(Token.KW, yyline, yycolumn, "else"); }
"while"             { return new Symbol(Token.KW, yyline, yycolumn, "while"); }
"for"               { return new Symbol(Token.KW, yyline, yycolumn, "for"); }
"int"               { return new Symbol(Token.KW, yyline, yycolumn, "int"); }
"float"             { return new Symbol(Token.KW, yyline, yycolumn, "float"); }
"double"            { return new Symbol(Token.KW, yyline, yycolumn, "double"); }
"char"              { return new Symbol(Token.KW, yyline, yycolumn, "char"); }
"return"            { return new Symbol(Token.KW, yyline, yycolumn, "return"); }
"using"             { return new Symbol(Token.KW, yyline, yycolumn, "using"); }
"namespace"         { return new Symbol(Token.KW, yyline, yycolumn, "namespace"); }
"include"           { return new Symbol(Token.KW, yyline, yycolumn, "include"); }

/* ===== LIBRERÍAS Y ESPECIALES ===== */
"iostream"          { return new Symbol(Token.LIB, yyline, yycolumn, "iostream"); }
"std"               { return new Symbol(Token.LIB, yyline, yycolumn, "std"); }
"cout"              { return new Symbol(Token.LIB, yyline, yycolumn, "cout"); }
"endl"              { return new Symbol(Token.LIB, yyline, yycolumn, "endl"); }
"main"              { return new Symbol(Token.LIB, yyline, yycolumn, "main"); }

/* ===== OPERADORES ===== */
"="                 { return new Symbol(Token.OP, yyline, yycolumn, "="); }
"<"                 { return new Symbol(Token.OP, yyline, yycolumn, "<"); }
">"                 { return new Symbol(Token.OP, yyline, yycolumn, ">"); }
"<<"                { return new Symbol(Token.OP, yyline, yycolumn, "<<"); }
">>"                { return new Symbol(Token.OP, yyline, yycolumn, ">>"); }
"=="                { return new Symbol(Token.OP, yyline, yycolumn, "=="); }
"!="                { return new Symbol(Token.OP, yyline, yycolumn, "!="); }
"+"                 { return new Symbol(Token.OP, yyline, yycolumn, "+"); }
"-"                 { return new Symbol(Token.OP, yyline, yycolumn, "-"); }
"*"                 { return new Symbol(Token.OP, yyline, yycolumn, "*"); }
"/"                 { return new Symbol(Token.OP, yyline, yycolumn, "/"); }

/* ===== SIGNOS DE AGRUPACIÓN ===== */
"{"                 { return new Symbol(Token.LBRACE, yyline, yycolumn, "{"); }
"}"                 { return new Symbol(Token.RBRACE, yyline, yycolumn, "}"); }
"("                 { return new Symbol(Token.LPAREN, yyline, yycolumn, "("); }
")"                 { return new Symbol(Token.RPAREN, yyline, yycolumn, ")"); }
";"                 { return new Symbol(Token.SEMICOLON, yyline, yycolumn, ";"); }
","                 { return new Symbol(Token.COMMA, yyline, yycolumn, ","); }
"#"                 { return new Symbol(Token.HASH, yyline, yycolumn, "#"); }

/* ===== CONSTANTES ===== */
[0-9]+              { return new Symbol(Token.NUMBER, yyline, yycolumn, yytext()); }
\"([^\"\\]|\\.)*\"  { return new Symbol(Token.STRING, yyline, yycolumn, yytext()); }

/* ===== IDENTIFICADORES (variables) ===== */
[a-zA-Z_][a-zA-Z0-9_]*  { return new Symbol(Token.ID, yyline, yycolumn, yytext()); }

/* ===== ESPACIOS Y COMENTARIOS ===== */
[ \t\r\n]+          { /* ignorar */ }
"//".*              { /* comentario de línea */ }
"/*"([^*]|\\*+[^*/])*"*/"   { /* comentario de bloque */ }

/* ===== ERRORES ===== */
.                   { 
                      System.err.println("Error en línea " + yyline + ", columna " + yycolumn + ": " + yytext());
                      return new Symbol(Token.ERROR, yyline, yycolumn, yytext()); 
                    }
