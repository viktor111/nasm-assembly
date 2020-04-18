section .data 
	evenMsg db "Even Number!", 0xA, 0xD
	lenEvenMsg equ $ - evenMsg
	
	oddMsg db "Odd number!"
	lenOddMsg equ $ - oddMsg

section .text
	global _start

_start:
	mov ax, 8h
	and ax, 1
	jz evnn
	mov eax, 4
	mov ebx, 1
	mov ecx, odd_msg
	mov edx, lenOddMsg
	jmp outprog

evnn:
	mov ah, 09h
	mov eax, 4
	mov ebx, 1
	mov ecx, evenMsg
	mov edx, lenEvenMsg
	int 0x80

outprog: 
	mov eax, 1
	int 0x80
