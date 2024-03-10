#include <stdio.h>
#include <math.h>

int main() {
    int qtd_jogos, qtd_15;
    double valor_arrecadado, valor_bonus, valor_receber, pct;

    printf("Ola Catarina, vamos fazer sua prestacao de contas.\n");
    printf("Quantos jogos foram vendidos este mes? ");
    scanf("%d", &qtd_jogos);

    valor_arrecadado = qtd_jogos * 19.9;

    qtd_15 = round(qtd_jogos / 15);
    pct = qtd_15 * 8;

    valor_bonus = (valor_arrecadado * (pct / 100));

    valor_receber = (valor_arrecadado / 2) + valor_bonus;

    printf("Valor arrecadado no mes: %.2f\n", valor_arrecadado);
    printf("Valor do bonus: %.2f\n", valor_bonus);
    printf("Valor a receber total: %.2f\n", valor_receber);

    return 0;
}
