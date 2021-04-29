.386
.model flat, stdcall
.stack 4096

;Tracy Michaels
;Class: CSC 3210
;Assignment#: 5 part A
;This program recursively calls a procedure to sum the integers from 1 to a given value n

ExitProcess proto, dwExitCode:DWORD
.code
main proc
	mov eax, 0
	push 4			;n = 4

	call SumInts

	invoke ExitProcess, 0
main endp

;--------------------------------------------------------------
;This procedure sums the integers between 1 and given value n
;Recieves: 
;	[ebp + 8] = n contains the value of n
;Returns:
;	EAX which contains the sum of integers
;Requires: Nothing
;--------------------------------------------------------------
SumInts proc
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	cmp eax, 1
	ja L1
	jmp L2
L1:
	dec eax
	push eax
	call SumInts
 
	add eax, [ebp+8]
L2:
	pop ebp
	ret 4
SumInts endp
end main