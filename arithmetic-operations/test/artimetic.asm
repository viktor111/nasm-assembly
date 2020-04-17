SYS_EXIT equ 1
SYS_WRITE equ 4
SYS_READ equ 3

section .data
	msg1 db "hello world", 0xa
	lenOfMsg1 equ $ - msg1

section .text
	global _start

_start:
	mov edx, lenOfMsg1
	mov ecx, msg1
	mov ebx, 1
	mov eax, SYS_WRITE
	int 0x80	

	mov eax, SYS_EXIT
	int 0x80
