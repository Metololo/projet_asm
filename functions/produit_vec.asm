
extern scanf
extern printf

%define BYTE 1
%define WORD 2
%define DWORD 4

global main:

section .data

P: dw  10,15
I: dw 25,20
Q: dw 15,25

result: db "Le produit vectorielle est : %d",10,0
printco: db "x = %d y = %d",10,0
count: db 0
section .bss

pi: resw 2
iq: resw 2


section .text

main:
	push rbp

boucle:
	movzx ecx,byte[count]
	mov ax,[P+ecx*WORD]
	mov bx,[I+ecx*WORD]

	mov word[pi+ecx*WORD],ax
	sub word[pi+ecx*WORD],bx

	inc byte[count]
	cmp byte[count],2
	jb boucle

	push rax
	mov rdi,printco
	movsx rsi,word[pi]
	movsx rdx,word[pi+1*WORD]
	mov rax,0
	call printf
	pop rax


	pop rbp

mov rax,0
mov rdi,60
syscall
ret
