%% 
%class CppLexer
%unicode
%public
%type String
%line
%column


%{

// Puedes agregar imports si los necesitas
%}

ID = [a-zA-Z_][a-zA-Z0-9_]*
INT = [0-9]+
FLOAT = ({INT}"."{INT}([eE][+-]?{INT})? | {INT}[eE][+-]?{INT})

%%



// ---- Comentarios ----
"//".*                          { return "COMMENT|" + yytext() + "|" + yyline + "|" + yycolumn; }
"/*"([^*]|\*+[^*/])*\*+"/"      { return "COMMENT|" + yytext() + "|" + yyline + "|" + yycolumn; }

// ---- Literales ----
\"([^\"\\\n]|\\.)*\"             { return "STRING|" + yytext() + "|" + yyline + "|" + yycolumn; }
\'([^\'\\\n]|\\.)*\'             { return "CHAR|" + yytext() + "|" + yyline + "|" + yycolumn; }

// ---- Palabras reservadas (se devuelven como KW) ----
"int"        { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"float"      { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"double"     { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"char"       { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"bool"       { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"void"       { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"if"         { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"else"       { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"while"      { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"for"        { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"do"         { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"switch"     { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"case"       { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"default"    { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"return"     { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"class"      { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"struct"     { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"public"     { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"private"    { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"protected"  { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"include"    { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"using"      { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"namespace"  { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"new"        { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"delete"     { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"true"       { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }
"false"      { return "KW|" + yytext() + "|" + yyline + "|" + yycolumn; }

// ---- Identificadores ----
{ID}        { return "ID|" + yytext() + "|" + yyline + "|" + yycolumn; }

// ---- Números ----
{FLOAT}     { return "NUMBER|" + yytext() + "|" + yyline + "|" + yycolumn; }
{INT}       { return "NUMBER|" + yytext() + "|" + yyline + "|" + yycolumn; }

// ---- Operadores / símbolos (orden: tokens largos primero) ----
"=="        { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"!="        { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"<="        { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
">="        { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"++"        { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"--"        { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"="         { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"+"         { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"-"         { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"*"         { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"/"         { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"%"         { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
"<"         { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }
">"         { return "OP|" + yytext() + "|" + yyline + "|" + yycolumn; }

// ---- Paréntesis y llaves (los contamos según requisito) ----
"{"         { return "LBRACE|" + yytext() + "|" + yyline + "|" + yycolumn; }
"}"         { return "RBRACE|" + yytext() + "|" + yyline + "|" + yycolumn; }
"("         { return "LPAREN|" + yytext() + "|" + yyline + "|" + yycolumn; }
")"         { return "RPAREN|" + yytext() + "|" + yyline + "|" + yycolumn; }
";"         { return "SEMICOLON|" + yytext() + "|" + yyline + "|" + yycolumn; }
","         { return "COMMA|" + yytext() + "|" + yyline + "|" + yycolumn; }
"#"         { return "HASH|" + yytext() + "|" + yyline + "|" + yycolumn; }

// ---- Espacios ----
[\t\r\n ]+  { /* ignorar */ }


// ---- Error: cualquier otro caracter ----
.           { return "ERROR|" + yytext() + "|" + yyline + "|" + yycolumn; }

// ---- Fin de archivo ----
<<EOF>>     { return null; }

