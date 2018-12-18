
;build to executable with
;  nasm -f elf hmmm.asm
;  ld -s -o hmmm hmmm.o

section .text
global _start

section .data
msg db  'hmmm',0xa
len equ $ - msg

section .text
;entry point
_start:

;write to stdout
mov edx,len ;msg len
mov ecx,msg ;msg to write
mov ebx,1   ;file desc
mov eax,4   ;sys call num
int 0x80    ;call kernel

;exit with kernel
mov ebx,0   ;proc exit
mov eax,1   ;sys call num
int 0x80    ;call kernel, no return
