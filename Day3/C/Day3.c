#include <stdlib.h>
#include <stdio.h>

int day3 ();


int main(){
    
    day3(3,1);
    
    return 0;
}

int day3 (int right, int down){
    FILE *p;
    char string[100];
    int i,k = 0;
    p = fopen("../input.txt","r");

    if (p == NULL){
        printf("Erro ao abrir ficheiro");
    }
     while(fscanf(p, "%s",&string) != EOF){
         printf("%c",string);
        for (i=0 ; string[i]!='\n' ; i++){

        }
        //while(fscanf(p, "%c",&character) != EOF){}
        /*
        for(int  i = 0; i < right; i++){
            printf("%c",string);
        }
        */
    } 
    



}