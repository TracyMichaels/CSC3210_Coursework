.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD

.data
	arrayD DWORD 10000h, 20000h, 30000h


.code
main proc
	;direct-offset addressing (doubleword array)
	mov eax, arrayD
	mov ebx, [arrayD+4]
	mov edx, [arrayD+8]


	invoke ExitProcess,0
main endp
end main