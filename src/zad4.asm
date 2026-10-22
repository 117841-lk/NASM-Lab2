global _start

section .data
    arr db 3, 4, 1, 2, 5

section .text
_start:
    mov al, [arr+1] ; lub movzx rax, byte [arr+1]

    jmp _again
    _outer_loop:
        mov al, [arr + rsi + 1]
        mov bl, [arr + rsi] 

        cmp al, bl
        jge _skip ; jezeli 2 element większy od pierwszego pomijamy zamianę miejscami
        _change:
            mov [arr + rsi], al ; zamiana miejscami
            mov [arr + rsi + 1], bl
            inc rcx ; zwiększ licznik zmian

        _skip:
            inc rsi ; zwiększ liczbę iteracji
            cmp rsi, 4
            jl _outer_loop ; tablica ma 5 elementów więc iteracji nie może być więcej

        _is_sorted:
            cmp rcx, 0 
            jnz _again ; jeżeli wystąpiła conajmniej jedna zamiana miejscami, sprawdź tablicę jeszcze raz
    mov rax, 60
    xor rdi, rdi
    syscall
    _again:
        xor rsi,rsi ; zeruj licznik iteracji
        xor rcx, rcx ; zeruj licznik zmian
        jmp _outer_loop
