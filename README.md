Proyecto 1 – Reconocedor de Tokens y Lexemas (Versión Consola)
Descripción
Este proyecto implementa un analizador léxico para un lenguaje de programación (por ejemplo C++), usando JFlex.

El programa:
- Lee un archivo de código fuente.
- Clasifica las cadenas como: palabras reservadas, identificadores (variables), operadores, signos de agrupación y errores.
- Muestra un resumen de los tokens y la cantidad de cada uno.
- Indica la línea y columna de cualquier error detectado.
Requisitos
1. Java JDK (versión 8 o superior).
2. JFlex (para generar CppLexer.java).
3. Archivo de código fuente a analizar (.cpp, .alg, etc.).
Archivos del proyecto
- CppLexer.flex → archivo JFlex que define los patrones de los tokens.
- CppLexer.java → lexer generado por JFlex.
- Token.java → clase para almacenar tipo, lexema, línea y columna.
- Main.java → clase principal que recibe el archivo y ejecuta el análisis.
- README.docx → este archivo.
Generar CppLexer.java con JFlex
1. Descargar JFlex desde https://www.jflex.de/.
2. Abrir consola en la carpeta donde está el .flex.
3. Ejecutar:
   java -jar ruta\jflex-full-1.9.1.jar CppLexer.flex

- Esto genera CppLexer.java.
- Copiar este archivo al mismo directorio que Main.java y Token.java.
Compilar el proyecto
En la consola, dentro de la carpeta del proyecto:
   javac *.java

- Esto compila todas las clases (CppLexer.java, Token.java, Main.java).
Ejecutar el proyecto
java Main ruta_del_archivo_a_analizar

Ejemplo:
java Main "C:\Users\kespinoza\Desktop\automatas\test1.cpp"

La salida mostrará:
=== RESUMEN ===
Total tokens: 39

Palabras reservadas:
  if : 1
  int : 2
  return : 1
...

Variables:
  x : 1
  main : 1
...

Signos de agrupación:
  { : 2
  } : 2

Errores detectados:
  Línea 4, Col 12: "lexema no reconocido"
Notas
- Errores: el lexer reporta cualquier cadena que no coincida con los patrones definidos en CppLexer.flex.
- Extensibilidad: se puede modificar CppLexer.flex para agregar nuevas palabras reservadas o operadores.
- Formato de salida: se puede adaptar para generar archivos de resumen si se desea.
