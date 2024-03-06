import java.util.Scanner;

public class Java03 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int qtd_jogos, qtd_15;
        double valor_arrecadado, valor_bonus, valor_receber, pct;

        System.out.println("Olá Catarina, vamos fazer sua prestação de contas.");
        System.out.printf("Quantos jogos foram vendidos este mês? ");
        qtd_jogos = input.nextInt();

        valor_arrecadado = qtd_jogos * 19.9;

        qtd_15 = Math.round(qtd_jogos/15);
        pct = (qtd_15*8);

        valor_bonus = (valor_arrecadado * (pct/100));

        valor_receber = (valor_arrecadado/2) + valor_bonus;

        System.out.println("Valor arrecadado no mês: " + valor_arrecadado);
        System.out.println("Valor do bônus: " + valor_bonus);
        System.out.println("Valor a receber total: " + valor_receber);

        input.close();
    }
}
