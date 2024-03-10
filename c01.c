#include <stdio.h>
#include <string.h>

int main() {
    int qtd_passageiros;
    char data_rg[11], data_passagem[11], doc_rg[3], doc_passagem[9], assento[4];

    printf("Seja bem-vindo(a) ao nosso aeroporto!\n");
    printf("Primeiro me informe o número de passageiros => ");
    scanf("%d", &qtd_passageiros);

    for (int i = 1; i <= qtd_passageiros; i++) {
        printf("Olá passageiro %d! Vamos validar suas informações...\n", i);

        printf("Insira seu RG => ");
        scanf("%s", doc_rg);

        printf("Insira a data de nasc. de seu RG (DD/MM/YYYY) => ");
        scanf("%s", data_rg);

        printf("Insira sua passagem => ");
        scanf("%s", doc_passagem);

        printf("Insira a data de nasc. da sua passagem (DD/MM/YYYY) => ");
        scanf("%s", data_passagem);

        printf("Insira seu assento => ");
        scanf("%s", assento);

        if (strcmp(doc_rg, "RG") != 0) {
            printf("A saída é nessa direção...\n");
        }
        else if (strcmp(doc_passagem, "Passagem") != 0) {
            printf("A recepção é nessa direção...\n");
        }
        else if (strcmp(data_passagem, data_rg) != 0) {
            printf("190\n");
        }
        else {
            printf("Seu assento é %s! Tenha um ótimo dia.\n", assento);
        }
    }

    return 0;
}
