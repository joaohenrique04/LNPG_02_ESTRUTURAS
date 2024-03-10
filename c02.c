#include <stdio.h>
#include <math.h>

int main() {
    int qtd_termos;
    double soma = 0, denominador = 1, pi;

    printf("Vamos calcular o valor aproximado de PI!\n");
    printf("Com quantos termos devemos fazer o cálculo? ");
    scanf("%d", &qtd_termos);

    for (int i = 0; i < qtd_termos; i++) {
        soma = i % 2 == 0 ? soma + (1 / pow(denominador, 3)) : soma - (1 / pow(denominador, 3));
        denominador += 2;
    }

    pi = cbrt(soma * 32);
    printf("pi = %.5f\n", pi);

    return 0;
}
