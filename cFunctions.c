#include <stdio.h>

void display(char *arr[]){
    for(int i = 0; i < 10; i++){
        printf("Message[%d]: %s\n", i, arr[i]);
    }
}

void read(char *arr[]){
    int index = -1;
    while(index < 0 || index > 9){
        printf("What string do you want to replace? ");
        scanf("%d", &index);
        if(index < 0 || index > 9)
            printf("Invalid String Location. \n");
    }
}