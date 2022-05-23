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

int numeros(char * nometxt){
    printf("%s\n",nometxt);
    FILE * fp = fopen(nometxt,"rt");
    if (fp == NULL) return -1;

    int num1,num2,num3,count=0,i=0,count2=0;

    while (fscanf(fp,"%d ",&num1) != EOF){
        //printf("num1 = %d\n",num1);


        while (fscanf(fp,"%d ",&num2) != EOF){

            while (fscanf(fp,"%d ",&num3) != EOF){
                //printf("num2 = %d, num1 = %d, num3 = %d num1+2+3 = %d\n",num2,num1,num3,num1+num2+num3);
                if (num1+num2+num3==2020){
                    printf("num1 = %d\nnum2 = %d\nnum3 = %d\n",num1,num2,num3);
                    return num1*num2*num3;
                }
            }

            fseek(fp,0,SEEK_SET);
            count2++;
            for (i = 0; i < count2; i++){
                if (fscanf(fp," %*[^\n]") == EOF) return 0; 
                //printf("count = %d, i = %d\n",count,i);
            }
        }

        
        fseek(fp,0,SEEK_SET);
        count++;
        count2=count;
        for (i = 0; i < count; i++){
            if (fscanf(fp," %*[^\n]") == EOF) return 0; 
            //printf("count = %d, i = %d\n",count,i);
        }
    }
    return 0;
}