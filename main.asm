; String Manipulation in ASM and C - CMSC 313 - FA23 - Project 4 - Adrian Maldonado and Jeremy Bruce
extern read
extern display
extern weave
extern printStats
extern free
extern  printf          
extern  scanf

section .data

menu: db "Encryption menu options:", 10, "s - show current messages", 10, "r - read new message", 10, "e - transform", 10, "p - print stats", 10, "q - quit program", 10, "enter option letter -> ", 0
original: db "This is the original message.", 0
stringfmt: db "%s", 0 
charfmt: db "%c", 0
badInput: db "Invalid option! Try again!", 10, 0

section .bss

arr resq 10
input resb 1

section .text

global main

main:
    xor r8, r8

init:
    mov qword[arr+r8], original
    add r8, 8
    cmp r8, 80
    jl init

getInput:
    xor rdi, rdi
    xor rsi, rsi

    
    mov rdi, stringfmt
    mov rsi, menu
    xor rax, rax
    call printf

    push rbp
    mov rdi, charfmt
    mov rsi, input
    mov rax, 0
    call scanf
    pop rbp

    xor r9, r9
    mov r9, [input]
    cmp r9, 's'
    je end
    cmp r9, 'S'
    je end
    cmp r9, 'r'
    je end
    cmp r9, 'R'
    je end
    cmp r9, 'e'
    je end
    cmp r9, 'E'
    je end
    cmp r9, 'p'
    je end
    cmp r9, 'P'
    je end
    cmp r9, 'q'
    je end
    cmp r9, 'Q'
    je end

    mov rdi, badInput
    mov rsi, stringfmt
    xor rax, rax
    call printf
    jmp getInput

end:
    mov rax, 0
    ret
