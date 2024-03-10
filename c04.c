#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int calcularNota(int respostas[], int gabarito[]) {
    int nota = 0;
    for (int i = 0; i < 10; i++) {
        if (respostas[i] == gabarito[i]) {
            nota++;
        }
    }
    return nota;
}

int main() {
    printf("Vamos calcular notas do vestibular!\n");
    printf("Insira o gabarito da prova com 10 inteiros separados por espaco (1 a 5):\n");

    int gabarito[10];
    for (int i = 0; i < 10; i++) {
        scanf("%d", &gabarito[i]);
    }

    printf("Insira o nome do participante seguido de suas respostas (10 inteiros separados por espaco), ou * para finalizar:\n");
    char nomeParticipante[100];
    int participantes[100][10];
    char nomes[100][100];
    int numParticipantes = 0;

    while (scanf("%s", nomeParticipante) && strcmp(nomeParticipante, "*") != 0) {
        strcpy(nomes[numParticipantes], nomeParticipante);
        for (int i = 0; i < 10; i++) {
            scanf("%d", &participantes[numParticipantes][i]);
        }
        numParticipantes++;
        printf("Insira o proximo participante ou * (asterisco) para finalizar:\n");
    }

    printf("a) Participantes e notas:\n");
    for (int i = 0; i < numParticipantes; i++) {
        int nota = calcularNota(participantes[i], gabarito);
        printf("%s: %d\n", nomes[i], nota);
    }

    int maiorPontuacao = 0;
    int menorPontuacao = 10;
    char melhoresParticipantes[100][100];
    char pioresParticipantes[100][100];
    int numMelhores = 0;
    int numPiores = 0;

    for (int i = 0; i < numParticipantes; i++) {
        int nota = calcularNota(participantes[i], gabarito);
        if (nota > maiorPontuacao) {
            maiorPontuacao = nota;
            strcpy(melhoresParticipantes[0], nomes[i]);
            numMelhores = 1;
        } else if (nota == maiorPontuacao) {
            strcpy(melhoresParticipantes[numMelhores], nomes[i]);
            numMelhores++;
        }

        if (nota < menorPontuacao) {
            menorPontuacao = nota;
            strcpy(pioresParticipantes[0], nomes[i]);
            numPiores = 1;
        } else if (nota == menorPontuacao) {
            strcpy(pioresParticipantes[numPiores], nomes[i]);
            numPiores++;
        }
    }
    printf("b) Maior pontuacao: %d, Participantes: ", maiorPontuacao);
    for (int i = 0; i < numMelhores; i++) {
        printf("%s", melhoresParticipantes[i]);
        if (i < numMelhores - 1) {
            printf(", ");
        }
    }
    printf("\n   Menor pontuacao: %d, Participantes: ", menorPontuacao);
    for (int i = 0; i < numPiores; i++) {
        printf("%s", pioresParticipantes[i]);
        if (i < numPiores - 1) {
            printf(", ");
        }
    }
    printf("\n");

    int contagemMaisDaMetade = 0;
    for (int i = 0; i < numParticipantes; i++) {
        int nota = calcularNota(participantes[i], gabarito);
        if (nota > 5) {
            contagemMaisDaMetade++;
        }
    }
    double percentualMaisDaMetade = (double) contagemMaisDaMetade / numParticipantes * 100;
    printf("c) Percentual de participantes com mais da metade das questoes certas: %.1f%%\n", percentualMaisDaMetade);

    return 0;
}
