import java.util.Scanner;

public class Java01 {   

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int qtd_passageiros;
        String data_rg, data_passagem, doc_rg, doc_passagem, assento;

        System.out.println("Seja bem-vindo(a) ao nosso aeroporto!");
        System.out.printf("Primeiro me informe o número de passageiros => ");
        qtd_passageiros = input.nextInt();

        for (int i = 1; i <= qtd_passageiros; i++) {
            System.out.println("Olá passageiro " + i + "! Vamos validar suas informações...");

            System.out.printf("Insira seu RG => ");
            doc_rg = input.next();

            System.out.printf("Insira a data de nasc. de seu RG (DD/MM/YYYY) => ");
            data_rg = input.next();

            System.out.printf("Insira sua passagem => ");
            doc_passagem = input.next();

            System.out.printf("Insira a data de nasc. da sua passagem (DD/MM/YYYY) => ");
            data_passagem = input.next();

            System.out.printf("Insira seu assento => ");
            assento = input.next();

            if (!doc_rg.equals("RG")) {
                System.out.println("A saída é nessa direção...");
            }
            else if (!doc_passagem.equals("Passagem")) {
                System.out.println("A recepção é nessa direção...");
            }
            else if (!data_passagem.equals(data_rg) ) {
                System.out.println("190");
            }
            else {
                System.out.println("Seu assento é "+assento+"! Tenha um ótimo dia.");
            }
        }

        input.close();
    }

}