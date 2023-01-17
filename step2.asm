extern scanf
extern printf

%define BYTE 1
%define WORD 2
%define DWORD 4
%define POINT_NUMBER 6
%define QWORD 8

global main:

section .data
result: db "(%d:%d)",10,0
xcoord: dw 1,4,2,5,6,2
ycoord: dw 2,2,4,5,3,6
l: dw 0
i: db 0
divide: dw 5

section .bss
p: resw 1
q: resw 1
temp: resd 1
temp2: resq 1
temp3: resq 1

section .text

main:
	push rbp

	searchP:
    inc byte[i]
    mov ecx,ecx
    movzx ecx,byte[i]
    
    mov edx,edx,
    movzx edx,word[l]
    
    mov ax,word[xcoord+edx*WORD]
    
    cmp word[xcoord+ecx*WORD],ax
    
    
    
    jb isbelow
    jmp isabove

    isbelow:
    mov word[l],cx
    isabove:
	
	cmp byte[i],POINT_NUMBER-1
	jb searchP
	
	mov ax,word[l]
	mov word[p],ax
	
	movzx eax,word[p]
        mov rdi,result
        movzx rsi,word[xcoord+eax*WORD]
        movzx rdx,word[ycoord+eax*WORD]
        mov rax,0
        call printf
	
	
	searchq:
	mov ax,word[p]
	mov bx,POINT_NUMBER
	inc ax
	xor dx,dx
	div bx
	mov word[q],dx
        
        mov byte[i],0
        
        findi:
            movzx ecx,word[q]
            movzx ebx,byte[i]
            movzx r8d,word[p]
            
           
            
            movzx eax,word[xcoord+ecx*WORD]
            movzx edx,word[xcoord+ebx*WORD]
            sub eax,edx
            mov dword[temp],eax
            
            movzx eax,word[ycoord+ebx*WORD]
            movzx edx,word[ycoord+r8d*WORD]
            sub eax,edx
            
            imul dword[temp]
        
            push rbx
            
            mov rbx,temp3 ; adresse de 'resultat1' dans ebx
            mov [rbx],eax ; on copie ax dans les 2 octets de poids faible de ebx
            mov [rbx+QWORD],edx
            
            mov rax,qword[temp3]
            
            mov qword[temp2],rax
            
            pop rbx
            
            
            
            
            movzx eax,word[ycoord+ecx*WORD]
            movzx edx,word[ycoord+ebx*WORD]
            sub eax,edx
            mov dword[temp],eax
            
            movzx eax,word[xcoord+ebx*WORD]
            movzx edx,word[xcoord+r8d*WORD]
            sub eax,edx
            
            imul dword[temp]
            
            push rbx
            
            mov rbx,temp3 ; adresse de 'resultat1' dans ebx
            mov [rbx],eax ; on copie ax dans les 2 octets de poids faible de ebx
            mov [rbx+QWORD],edx
                        
            pop rbx
            
            mov rax,qword[temp3]
            sub qword[temp2],rax
            
            cmp dword[temp2],0
            jle notBetter

            
            movzx bx,byte[i]
            mov word[q],bx
            
            notBetter:
            
            inc byte[i]
            cmp byte[i],POINT_NUMBER
            jb findi
            
            
            
        mov ax,word[q]
        mov word[p],ax
        
        movzx eax,word[p]
        mov rdi,result
        movzx rsi,word[xcoord+eax*WORD]
        movzx rdx,word[ycoord+eax*WORD]
        mov rax,0
        call printf
        
        
        mov ax,word[l]
        cmp word[p],ax
        jne searchq
        
        
            
        
	pop rbp

mov rax,0
mov rdi,60
syscall
ret


