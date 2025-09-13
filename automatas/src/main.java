import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        String inputPath;
        String outputPath = "Salida.txt";
        if (args.length >= 1) inputPath = args[0];
        else {
            System.out.println("Ruta del archivo de entrada (.cpp): ");
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            inputPath = br.readLine().trim();
        }

        FileReader fr = new FileReader(inputPath);
        CppLexer lexer = new CppLexer(fr);

        BufferedWriter bw = new BufferedWriter(new FileWriter(outputPath));

        // Contadores
        Map<String,Integer> reservedCounts = new TreeMap<>();
        int identifiers = 0;
        int lbrace = 0;
        int lparen = 0;
        int errors = 0;
        int totalTokens = 0;

        String tok;
        while ((tok = lexer.yylex()) != null) {
            // tok = TYPE|LEXEMA|LINE|COL
            String[] parts = tok.split("\\|", 4);
            if (parts.length < 4) continue; // seguridad
            String type = parts[0];
            String lexeme = parts[1];
            String line = parts[2];
            String col = parts[3];

            // Escribe línea de detalle
            bw.write(String.format("L%s:C%s\t%-10s\t%s%n", line, col, type, lexeme));

            // Actualiza contadores
            totalTokens++;
            switch (type) {
                case "KW":
                    reservedCounts.put(lexeme, reservedCounts.getOrDefault(lexeme, 0) + 1);
                    break;
                case "ID":
                    identifiers++;
                    break;
                case "LBRACE":
                    lbrace++;
                    break;
                case "LPAREN":
                    lparen++;
                    break;
                case "ERROR":
                    errors++;
                    break;
                default:
                    // otros tokens (OP, NUMBER, STRING, COMMENT, etc.)
            }
        }

        // Resumen
        bw.write("\n=== RESUMEN ===\n");
        bw.write("Total tokens: " + totalTokens + "\n\n");

        bw.write("Palabras reservadas (por token):\n");
        for (Map.Entry<String,Integer> e : reservedCounts.entrySet()) {
            bw.write(String.format("  %s : %d%n", e.getKey(), e.getValue()));
        }
        bw.write("\nIdentificadores (variables): " + identifiers + "\n");
        bw.write("Llaves abiertas '{' : " + lbrace + "\n");
        bw.write("Paréntesis abiertos '(' : " + lparen + "\n");
        bw.write("Errores detectados: " + errors + "\n");

        bw.close();
        fr.close();

        System.out.println("Análisis completado. Archivo de salida: " + outputPath);
    }
}
