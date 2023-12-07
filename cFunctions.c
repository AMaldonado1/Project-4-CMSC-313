#include <stdio.h>

void display(char *arr[]){
    for(int i = 0; i < 10; i++){
        printf("Message[%d]: %s\n", i, arr[i]);
    }
}