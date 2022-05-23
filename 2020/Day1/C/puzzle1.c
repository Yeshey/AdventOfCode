// Works Well
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int diferenca(char * nometxt);

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

    int num1,num2,num3,count=0,i=0;

    while (fscanf(fp,"%d ",&num1) != EOF){
        printf("num1 = %d\n",num1);


        while (fscanf(fp,"%d ",&num2) != EOF){
            printf("num2 = %d, num1 = %d, num1+2 = %d\n",num2,num1,num1+num2);
            if (num1+num2==2020){
                printf("num1 = %d\nnum2 = %d\n",num1,num2);
                return num1*num2;
            }
        }

        
        fseek(fp,0,SEEK_SET);
        count++;
        for (i = 0; i < count; i++){
            if (fscanf(fp," %*[^\n]") == EOF) return 0; 
            printf("count = %d, i = %d\n",count,i);
        }
    }
    return 0;
}