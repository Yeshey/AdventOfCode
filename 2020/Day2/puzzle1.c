// Works Well
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int numeros(char * nometxt);

void main(){
    char * nometxt = "input.txt";
    int result = numeros(nometxt);
    printf("result= %d\n",result);
    return;
}

int numeros(char * nometxt){ // Exercicio 1 a
    printf("%s\n",nometxt);
    FILE * fp = fopen(nometxt,"rt");
    if (fp == NULL) return -1;


    int min,max,countleters=0,countgoods=0,i=0,cntiterations=0;
    char car,carread;

    while (fscanf(fp," %d-%d %c: ",&min,&max,&car) != EOF){
        cntiterations++;
        printf("%.4d | %d-%d %c: ",cntiterations,min,max,car);

        do{
            fscanf(fp,"%c",&carread);
            if (carread==car){
                countleters++;
            }
            carread != '\n' ? printf("%c",carread) : printf("- ");
        } while (carread!='\n');

        if (countleters<min || countleters>max){
            printf("bad\n");
        } else { 
            countgoods++;
            printf("good\n"); 
        }
        countleters=0;
    }
    return countgoods;
}