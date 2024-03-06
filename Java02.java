import java.util.Scanner;

public class Java02 {
    public static void main(String[] args) {
        
        Scanner input = new Scanner (System.in);

        int qtd_termos;
        double soma, denominador, pi;

        System.out.println("Vamos calcular o valor aproximado de PI!");
        System.out.printf("Com quantos termos devemos fazer o cálculo? ");
        qtd_termos = input.nextInt();

        soma = 0;
        denominador = 1;

        for (int i = 0; i < qtd_termos; i++) {
            soma = i % 2 == 0 ? soma + (1 / Math.pow(denominador, 3)) : soma - (1 / Math.pow(denominador, 3));
            denominador+=2;
        }
        pi = Math.cbrt(soma * 32);
        System.out.printf("pi = %.5f", pi);

        input.close();
    }
}
