SYS_EXIT equ 1
SYS_WRITE equ 4
SYS_READ equ 3
STDOUT equ 1
STDIN equ 0

section .data
	msg1 db "What is your name?", 0xa, 0xb
	lenOfMsg1 equ $ - msg1

	msg2 db "Hello "
	lenOfMsg2 equ $ - msg2

section .bss
	name resb 10

section .text
	global _start

_start:
	mov edx, lenOfMsg1
	mov ecx, msg1
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80
	
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, name 
	mov edx, 10	
	int 0x80

	mov edx, lenOfMsg2
	mov ecx, msg2
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80
	
	mov edx, 10
	mov ecx, name
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80	

	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80

