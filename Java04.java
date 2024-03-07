import java.util.*;

public class Java04 {
     public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Vamos calcular notas do vestibular!");
        System.out.println("Insira o gabarito da prova com 10 inteiros separados por espaço (1 a 5):");
        String[] gabaritoStr = input.nextLine().split(" ");

        int[] gabarito = new int[10];

        for (int i = 0; i < 10; i++) {
            gabarito[i] = Integer.parseInt(gabaritoStr[i]);
        }

        
        System.out.println("Insira o nome do participante seguido de suas respostas (10 inteiros separados por espaço), ou * para finalizar:");
        Map<String, int[]> participantes = new TreeMap<>();
        String nomeParticipante;
        
        while (!(nomeParticipante = input.next()).equals("*")) {
            int[] respostas = new int[10];

            for (int i = 0; i < 10; i++) {
                respostas[i] = input.nextInt();
            }
            participantes.put(nomeParticipante, respostas);
            System.out.println("Insira o próximo participante ou * (asterisco) para finalizar:");
        }

        Map<String, Integer> notas = new TreeMap<>();
        for (Map.Entry<String, int[]> entry : participantes.entrySet()) {
            int nota = calcularNota(entry.getValue(), gabarito);
            notas.put(entry.getKey(), nota);
        }

        System.out.println("a) Participantes e notas:");
        for (Map.Entry<String, Integer> entry : notas.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }

        int maiorPontuacao = Integer.MIN_VALUE;
        int menorPontuacao = Integer.MAX_VALUE;
        List<String> melhoresParticipantes = new ArrayList<>();
        List<String> pioresParticipantes = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : notas.entrySet()) {
            int nota = entry.getValue();
            if (nota > maiorPontuacao) {
                maiorPontuacao = nota;
                melhoresParticipantes.clear();
                melhoresParticipantes.add(entry.getKey());
            } else if (nota == maiorPontuacao) {
                melhoresParticipantes.add(entry.getKey());
            }

            if (nota < menorPontuacao) {
                menorPontuacao = nota;
                pioresParticipantes.clear();
                pioresParticipantes.add(entry.getKey());
            } else if (nota == menorPontuacao) {
                pioresParticipantes.add(entry.getKey());
            }
        }
        System.out.println("b) Maior pontuação: " + maiorPontuacao + ", Participantes: " + melhoresParticipantes);
        System.out.println("   Menor pontuação: " + menorPontuacao + ", Participantes: " + pioresParticipantes);


        int totalParticipantes = notas.size();
        int contagemMaisDaMetade = 0;
        for (int nota : notas.values()) {
            if (nota > 5) { 
                contagemMaisDaMetade++;
            }
        }
        double percentualMaisDaMetade = (double) contagemMaisDaMetade / totalParticipantes * 100;
        System.out.printf("c) Percentual de participantes com mais da metade das questões certas: %.1f%%\n", percentualMaisDaMetade);

        input.close();
    }

    
    public static int calcularNota(int[] respostas, int[] gabarito) {
        int nota = 0;
        for (int i = 0; i < 10; i++) {
            if (respostas[i] == gabarito[i]) {
                nota++;
            }
        }
        return nota;
    }
}
