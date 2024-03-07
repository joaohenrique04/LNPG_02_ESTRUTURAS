import java.util.Scanner;

public class Java05 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        double menor = Double.MAX_VALUE;
        double maior = Double.MIN_VALUE;
        double somaIPCA = 0;
        int quantidadeMeses = 0;
        String menorMes = "";
        String maiorMes = "";

        System.out.println("Vamos fazer um cálculo de IPCA (Índice Nacional de Preços ao Consumidor)!");
        System.out.println("Insira os dados do IPCA (mês/ano IPCA) separados por espaço, ou * para finalizar:");

        String linha;
        while (!(linha = input.nextLine()).equals("*")) {
            String[] dados = linha.split(" ");

            String mesAno = dados[0];
            double ipca = Double.parseDouble(dados[1].replace(",", "."));

            if (ipca < menor) {
                menor = ipca;
                menorMes = mesAno;
            }

            if (ipca > maior) {
                maior = ipca;
                maiorMes = mesAno;
            }

            somaIPCA += ipca;
            quantidadeMeses++;
        }

        double mediaIPCA = somaIPCA / quantidadeMeses;

        // Saída formatada
        System.out.printf("Menor IPCA: %.2f (%s)\n", menor, menorMes);
        System.out.printf("Maior IPCA: %.2f (%s)\n", maior, maiorMes);
        System.out.printf("Média IPCA: %.2f\n", mediaIPCA);

        input.close();
    }
}
