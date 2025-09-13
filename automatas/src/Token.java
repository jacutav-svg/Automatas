public class Token {
    // Categorías de tokens
    public static final int KW = 1;         // Palabras reservadas
    public static final int LIB = 2;        // Librerías / elementos especiales (iostream, std, cout, endl, main)
    public static final int ID = 3;         // Identificadores de usuario
    public static final int NUMBER = 4;     // Números
    public static final int STRING = 5;     // Cadenas de texto
    public static final int OP = 6;         // Operadores
    public static final int LBRACE = 7;     // {
    public static final int RBRACE = 8;     // }
    public static final int LPAREN = 9;     // (
    public static final int RPAREN = 10;    // )
    public static final int SEMICOLON = 11; // ;
    public static final int COMMA = 12;     // ,
    public static final int HASH = 13;      // #
    public static final int ERROR = 99;     // Errores léxicos
    public static final int EOF = 100;      // Fin de archivo

    // Información del token
    public int tipo;         // Categoría (KW, LIB, ID, etc.)
    public String lexema;    // Texto del token
    public int linea;        // Línea donde aparece
    public int columna;      // Columna donde aparece

    // Constructor
    public Token(int tipo, String lexema, int linea, int columna) {
        this.tipo = tipo;
        this.lexema = lexema;
        this.linea = linea;
        this.columna = columna;
    }

    @Override
    public String toString() {
        return String.format("Tipo: %d, Lexema: '%s', Línea: %d, Columna: %d",
                tipo, lexema, linea + 1, columna + 1);
    }
}
