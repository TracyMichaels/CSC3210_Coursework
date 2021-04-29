; Tracy Michaels
; CSC3210
; Assignment 3 Part 1
; This program creates an uninitalized array of 3 DWord elements then updates them
; with various values

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

	z DWORD 3 DUP(?)
	x WORD 10
	y WORD 15
	r WORD 4

.code
main proc
	movzx eax, x
	movzx ebx, y
	movzx ecx, r


	; z_0 = x + 130
	mov [z+0], eax
	add [z+0], 130

	; z_1 = y + x - z_0
	mov [z+4], ebx
	add [z+4], eax
	mov edx, [z+0]
	sub [z+4], edx

	; z_2 = r + x - 13
	mov [z+8], ecx
	add [z+8], eax
	sub [z+8], 13


	invoke ExitProcess, 0
main endp
end main