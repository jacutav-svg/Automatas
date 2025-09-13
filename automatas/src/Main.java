import java.io.*;

public class Main {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Uso: java Main <archivo_entrada>");
            return;
        }

        String archivo = args[0];

        try {
            FileReader fr = new FileReader(archivo);
            CppLexer lexer = new CppLexer(fr);

            Token token;
            while ((token = lexer.yylex()) != null) {
                // Ya no mostramos todo, solo se usa para contar
                if (token.tipo.equals("ERROR")) {
                    System.out.println("⚠ " + token);
                }
            }

            lexer.imprimirResumen();
            System.out.println("✅ Analisis terminado. Revisa el archivo resumen.txt");
            fr.close();
        } catch (FileNotFoundException e) {
            System.out.println("Archivo no encontrado: " + archivo);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
