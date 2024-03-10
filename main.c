#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include <string.h>

int main() {
    double menor = DBL_MAX;
    double maior = -DBL_MAX;
    double somaIPCA = 0;
    int quantidadeMeses = 0;
    char menorMes[20] = "";
    char maiorMes[20] = "";

    printf("Vamos fazer um calculo de IPCA (Indice Nacional de Precos ao Consumidor)!\n");
    printf("Insira os dados do IPCA (mes/ano IPCA) separados por espaco (Usar '.' no IPCA), ou * para finalizar:\n");

    char linha[100];
    while (fgets(linha, sizeof(linha), stdin) != NULL && strcmp(linha, "*\n") != 0) {
        char mesAno[20];
        double ipca;
        sscanf(linha, "%s %lf", mesAno, &ipca);

        if (ipca < menor) {
            menor = ipca;
            strcpy(menorMes, mesAno);
        }

        if (ipca > maior) {
            maior = ipca;
            strcpy(maiorMes, mesAno);
        }

        somaIPCA += ipca;
        quantidadeMeses++;
    }

    double mediaIPCA = somaIPCA / quantidadeMeses;

    // Saída formatada
    printf("Menor IPCA: %.2f (%s)\n", menor, menorMes);
    printf("Maior IPCA: %.2f (%s)\n", maior, maiorMes);
    printf("Media IPCA: %.2f\n", mediaIPCA);

    return 0;
}
