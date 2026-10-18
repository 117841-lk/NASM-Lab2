global _start

section .text
_start:
  mov rcx, 10 ; licznik, petla ma sie wykonac 10 razy
  xor rax, rax ; zerowanie eax

  _petla_start:
  add rax, 3 ; zwiekszamy wartosc eax o 3
  loop _petla_start
  mov rbx, rax ; przenosimy wartosc eax do ebx
  mov rax, 1 ; sys_exit, koniec programu
  int 0x80 ; wywołanie
