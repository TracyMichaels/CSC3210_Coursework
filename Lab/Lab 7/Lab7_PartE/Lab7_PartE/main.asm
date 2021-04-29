.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD

.data
	Val1 SWORD 23
	Val2 SWORD -35
	Val3 SDWORD 4


.code
main proc

	; EBX = (-Val1 + Val2) + (Val3 * 3)

	;expected value ebx = FFFFFFD2
	mov ebx, Val3
	add ebx, Val3
	add ebx, Val3
	add bx, Val2
	movsx ebx, bx
	sub bx, Val1


	;or this way too works and it's shorter
	movsx ebx, Val2
	sub bx, Val1
	add ebx, Val3
	add ebx, Val3
	add ebx, Val3

	invoke ExitProcess,0
main endp
end main