#include <stdio.h>
#include <stdlib.h>

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
    char newLine = fgetc(stdin);
    int size = 128;
    int pos = 0;
    char* newString = malloc(sizeof(char) * size);
    char character;
    int flag = 1;
    printf("Enter new message: ");
    while(flag == 1){
        character = fgetc(stdin);
        if(character == '\n'){
            newString[pos] = '\0';
            flag = 0;
        }
        else{
            newString[pos] = character;
        }
        pos++;
        if(pos >= size){
            size += size;
            newString = realloc(newString, size);
        }
    }
    int letter = (int)newString[0];
    flag = 1;
    if(letter < 65 || letter > 90)
        flag = 0;
    pos -= 2;
    if(!(newString[pos] == '.' || newString[pos] == '?' || newString[pos] == '!'))
        flag = 0;
    if(flag != 0)
        arr[index] = newString;
    else{
        printf("Invalid message, keeping current. \n");
        free(newString);
    }
}