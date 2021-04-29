.386
.model flat, stdcall
.stack 4096

;Tracy Michaels
;Class: CSC3210
;Assignemnt# 4
;This program evaluates the following expression
; Sum = 0
; while X >= 0
;	if(X!=3) AND (X <= (A+3) OR X < (B-3))
;		X = X - 2
;		Sum += 1
;	else
;		X = X - 1;

ExitProcess proto, dwExitCode:DWORD

.data
	A SWORD 9
	B SWORD 8
	X SWORD 15
	Sum SWORD 0

.code
main proc
	
	mov ax, A
	add ax, 3
	mov bx, B
	sub bx, 3
	mov dx, X

	;while
	beginwhile:
		cmp dx, 0
		jl endwhile

		;if
		cmp dx, 3
		je else_statement
		cmp dx, ax
		jle if_statement
		cmp dx, bx
		jge else_statement
	if_statement:
		sub dx, 2
		inc Sum
		jmp beginwhile
	else_statement:
		dec dx
		jmp beginwhile
	endwhile:
	
	mov X, dx	


	invoke ExitProcess, 0
main endp
end main