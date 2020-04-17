SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
	msg1 db "Enter a number: ", 0xA, 0xD
	lenOfMsg1 equ $ -msg1

	msg2 db "Enter a second number: ", 0xA, 0xD
	lenOfMsg2 equ $ - msg2
	
	msg3 db "The result is: ", 0xA, 0xD
	lenOfMsg3 equ $ - msg3

section .bss 
	num1 resb 2
	num2 resb 2
	res resb 1

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
	mov ecx, num1
	mov edx, 2
	int 0x80

	mov edx, lenOfMsg2
	mov ecx, msg2
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80
	
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 0x80

	mov edx, lenOfMsg3
	mov ecx, msg3
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80

	mov eax, [num1]
	sub eax, "0"
	
	mov ebx, [num2]
	sub ebx, "0"

	add eax, ebx
	add eax, "0"

	mov [res], eax

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
