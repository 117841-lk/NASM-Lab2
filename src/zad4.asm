global _start

section .data
    arr db 3, 4, 1, 2, 5

section .text
_start:
    mov al, [arr+1] ; lub movzx rax, byte [arr+1]
    mov bl, [arr+0]
    cmp al, bl
    
    mov rax, 60
    xor rdi, rdi
    syscall
