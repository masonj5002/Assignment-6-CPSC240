;Mason Jennings
;masonj@csu.fullerton.edu
extern faraday

segment .data
intro_message db "Welcome to Electricity brought to you by Mason Jennings.", 10, 0
intro_two_message db "This program will compute the resistace in your direct current circut.", 10, 0
test_message db "Hello world!", 10, 0                   ;DELETEME
newline db "", 10, 0

segment .bss
input resb 10

segment .text

driver: ;underscore denotes main function
    ;Intro messages
    mov rax, 1
    mov rdi, 1
    mov rsi, intro_message
    mov rdx, 57
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, intro_two_message
    mov rdx, 71
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, newline ;newline
    mov rdx, 2
    syscall

    ;calling faraday
    mov rax, 0
    call faraday

    ;Text output (of test_message, 14 characters)
    mov rax, 1
    mov rdi, 1
    mov rsi, test_message
    mov rdx, 14
    syscall                                   ;function of cpu

    ; Exit
    mov rax, 60
    mov rdi, 0
    syscall