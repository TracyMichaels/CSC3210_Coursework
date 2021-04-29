; Tracy Michaels
; CSC3210
; Assignment 3 Part 2
; This program uses a loop to reverse the order of a char array

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	; declare array of characters
	inputStr BYTE "ABCDEFGH"

.code
main proc
	
	; move beginning of array to esi
	mov esi, OFFSET inputStr

	;move end of array to edi
	mov edi, OFFSET inputStr
	add edi, SIZEOF inputStr
	sub edi, TYPE inputStr

	; set counter
	mov ecx, LENGTHOF inputStr / 2


L1:
	
	;exchange elements
	mov al, [esi]
	mov bl, [edi]

	mov [esi], bl
	mov [edi], al

	; change target elements
	add esi, TYPE inputStr
	sub edi, TYPE inputStr

	loop L1


	invoke ExitProcess, 0
main endp
end main