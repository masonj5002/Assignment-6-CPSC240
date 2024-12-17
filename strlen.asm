;Mason Jennings
;masonj@csu.fullerton.edu
global strlen

segment .data
welcome_message db "Hello from strlen!", 10, 0      ;DELETEME
;hello_world db "HELLO WORLD!", 10, 0

segment .bss

segment .text
    ;****Program begins executing here****
strlen:     ;****
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
mov r13, rdi    ;string array
xor rcx, rcx ;counter
input_loop:
    mov al, [r13 + rcx]
    cmp al, 10
    je end_input_loop
    cmp al, 0
    je end_input_loop
    inc rcx
    jmp input_loop
end_input_loop:

;return to faraday
mov rax, rcx

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