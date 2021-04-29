.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD

.data
	arrayB WORD 1,2,3,4

.code
main proc

	movzx eax, arrayB
	xchg ax, [arrayB+4]
	xchg ax, [arrayB+2]
	xchg ax, [arrayb+6]
	mov arrayB, ax

	;;for debugging
	;expected values:
	;eax = 00000004
	;ebx = 00000003
	;ecx = 00000001
	;edx = 00000002
	movzx eax, arrayB
	movzx ebx, [arrayB+2]
	movzx ecx, [arrayB+4]
	movzx edx, [arrayB+6]

	invoke ExitProcess,0
main endp
end main