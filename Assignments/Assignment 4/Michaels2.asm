.386
.model flat, stdcall
.stack 4096

;Tracy Michaels
;Class: CSC3210
;Assignemnt# 4 Part 2
;This program tests if the MSB of al register is set
;if it is set, it divides the contents of al register by 8
;else multiplies contents by 4 using bit shift operators


ExitProcess proto, dwExitCode:DWORD

.code
main proc

	mov al, 88h

	;if
	test al, 1000000b ;bit mask to check msb only
	jnz L1
	shr al, 3
	jmp end_if
L1: shl al, 2
end_if:

	invoke ExitProcess, 0
main endp
end main