.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD

.data
	array WORD 10, 2, 23, 45, 21, 11
	maximum WORD ?

.code
main proc
	mov eax, 0
	mov ebx, 0

	mov ax, array
	mov maximum, ax
	mov ecx, LENGTHOF array
	
	L1:
		mov ax, [array+bx]
		add ebx, TYPE array

		cmp maximum, ax
		jle IF_BLOCK
		jmp next
		IF_BLOCK:	
			mov maximum, ax
		next:
		loop L1


	invoke ExitProcess,0

main endp
end main