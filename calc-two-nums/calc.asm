section .data
        word1 db "writen", 0xa
        lenOfWord equ $ - word1


section .text
        global _start

_start:
	mov edx, lenOfWord
        mov ecx, word1                                               
        mov ebx, 1                                                     
        mov eax, 4                                           
        int 0x80                                                                                
        mov eax, 1                                                    
        int 0x80
