#include <stdio.h>
#include <stdlib.h>

int challenge(char * nometxt);

void main(){
    char * nometxt = "input.txt";
    int result = challenge(nometxt);
    printf("result= %d\n",result);
    return;
}

int challenge(char * nometxt){ // Exercicio 1 a
    printf("%s\n",nometxt);
    FILE * fp = fopen(nometxt,"rt");
    if (fp == NULL) return -1;


    int pos1,pos2,countpos=0,countgoods=0,i=0,cntiterations=0;
    char car,car1,car2,carread;

    while (fscanf(fp," %d-%d %c: ",&pos1,&pos2,&car) != EOF){
        cntiterations++;
        printf("%.4d | %d-%d %c: ",cntiterations,pos1,pos2,car);

        do{
            countpos++;
            fscanf(fp,"%c",&carread);
            if (countpos==pos1){
                car1=carread;
            }
            if (countpos==pos2){
                car2=carread;
            }
            carread != '\n' ? printf("%c",carread) : printf("ENTER?");
        } while (carread!='\n');

        if (car1==car2 || (car1!=car && car2!=car)){
            printf(" bad\n");
        } else { 
            countgoods++;
            printf(" good\n"); 
        }
        countpos=0;
    }
    return countgoods;
}