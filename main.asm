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
badInput: db "Invalid option! Try again!", 10, 0
check: db "check", 10, 0

section .bss

arr resq 10
input resb 2

section .text

global main

main:
    xor r8, r8

init:
    mov qword[arr+r8], original
    add r8, 8
    cmp r8, 80
    jl init

    xor rdi, rdi
    xor rsi, rsi

getInput:
    
    mov rdi, stringfmt
    mov rsi, menu
    xor rax, rax
    call printf
    
    push rbp
    mov rdi, stringfmt
    mov rsi, input
    mov rax, 0
    call scanf
    pop rbp

    xor r9, r9
    mov r9b, [input]
    cmp r9b, 's'
    je end
    cmp r9b, 'S'
    je end
    cmp r9b, 'r'
    je end
    cmp r9b, 'R'
    je end
    cmp r9b, 'e'
    je end
    cmp r9b, 'E'
    je end
    cmp r9b, 'p'
    je end
    cmp r9b, 'P'
    je end
    cmp r9b, 'q'
    je end
    cmp r9b, 'Q'
    je end

    mov rdi, badInput
    mov rsi, stringfmt
    xor rax, rax
    call printf
    jmp getInput

end:

    mov rax, 0
    ret
