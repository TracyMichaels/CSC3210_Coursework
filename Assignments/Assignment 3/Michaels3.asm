; Tracy Michaels
; CSC3210
; Assignment 3 Part 3
; This program sums segmented values from a larger value

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	;initialize varable with value
	qVal QWORD 0506030704080102h

.code
main proc
	
	; pre-pro
	mov eax, 0
	mov ebx, 0

	; loop counter
	mov ecx, SIZEOF QWORD / SIZEOF WORD
	

L1:
	; add segments of qVal to eax register

	mov ebx, ecx
	dec ebx
	add ebx, ebx


	add ax, WORD PTR [qVal + [ebx]]

	loop L1




	invoke ExitProcess, 0
main endp
end main