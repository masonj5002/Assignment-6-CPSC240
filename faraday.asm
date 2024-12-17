;Mason Jennings
;masonj@csu.fullerton.edu
global faraday
extern strlen

segment .data
name_input_msg db "Please enter your full name: ", 0
career_input_msg db "Please enter the career path you are following: ", 0
sample_message db "HELLO WORLD!", 10, 0 ;DELETE ME!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
thankyou_msg_p1 db "Thank you. We appreciate all ", 0
thankyou_msg_p3 db "s.", 10, 0
volts_input_msg db "Please enter the EMF of your circuit in volts: ", 0
goodbye_msg db "Thank you ", 0
newline db "", 10, 0

segment .bss
name_input resb 75
career_input resb 75

segment .text
    ;****Program begins executing here****
faraday:     ;****
;Back up registers
;PROLOG Backup GPRs (15 pushes)
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf
;flow begins here:
;   --> r12, char array name length
;   --> r13, char array career length
;***name input msg***
mov rax, 1
mov rdi, 1
mov rsi, name_input_msg
mov rdx, 29
syscall

;name input
mov rax, 0
mov rdi, 0
mov rsi, name_input
mov rdx, 75
syscall

;null-terminate input
mov rbx, rax    ;# of bytes read
mov byte [name_input + rbx - 1], 0  ;replace newline w/ NULL TERMINATOR

;check name string length
mov rax, 0
mov rdi, name_input
call strlen
mov r12, rax    ;mov to r12


;***career input msg***
mov rax, 1
mov rdi, 1
mov rsi, career_input_msg
mov rdx, 49
syscall

;career input
mov rax, 0
mov rdi, 0
mov rsi, career_input
mov rdx, 75
syscall

;null-terminate input
mov rbx, rax    ;# of bytes read
mov byte [career_input + rbx - 1], 0  ;replace newline w/ NULL TERMINATOR

;check career string length
mov rax, 0
mov rdi, career_input
call strlen
mov r13, rax    ;string length

;**OUTPUT**
;Thank you message p1
mov rax, 1
mov rdi, 1
mov rsi, thankyou_msg_p1
mov rdx, 30
syscall

;Thank you message p2 (career)
mov rax, 1
mov rdi, 1
mov rsi, career_input
mov rdx, r13
syscall

;Thank you message p3
mov rax, 1
mov rdi, 1
mov rsi, thankyou_msg_p3
mov rdx, 3
syscall

;***Computations START here

;***Computations END here

;goodbye message p1
mov rax, 1
mov rdi, 1
mov rsi, goodbye_msg
mov rdx, 11
syscall

;goodbye message p2 (print name & newline)
mov rax, 1
mov rdi, 1
mov rsi, name_input
mov rdx, r12
syscall
;Three newline commands
mov rax, 1
mov rdi, 1
mov rsi, newline
mov rdx, 2
syscall
mov rax, 1
mov rdi, 1
mov rsi, newline
mov rdx, 2
syscall
;flow ends here:
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp
; system stack has returned to initial state
ret
;** End of program **