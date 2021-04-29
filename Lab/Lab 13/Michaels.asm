.386
.model flat, stdcall
.stack 4096

; Tracy Michaels
; This program uses a procedure to search an array for a given item
; if the item if found the procedure returns the item otherwise returns -1

ExitProcess proto, dwExitCode:DWORD

.data
	array DWORD 10h, 20h, 30h, 40h, 50h
	sample DWORD 50h

.code
main proc
	
	mov esi, OFFSET array		;beginning address of array
	mov ecx, LENGTHOF array		;number of elements in array
	mov edx, TYPE array			;size (in bytes) of array elements
	mov ebx, sample

	call Search	

	invoke ExitProcess, 0
main endp

;---------------------------------------------------------
; This Procedure search a given item in a given array
; Receives: EBX, ESI, ECX, EDX content as input. 
;	EBX contains the item we want to search on the array
;	ESI contains the address of the first item in the array 
;	ECX contains the number of items in the array
;	EDX contains the size of each item in the array
; Returns : EAX, 
;	If the item found in the array, EAX stores the item we are searching
;	Otherwise, EAX contains -1
; Requires: Nothing
;---------------------------------------------------------
Search PROC
	push esi
	push ecx
	push edx
	mov eax, 0
	
	L1:
		cmp [esi], ebx		;compare array value to sample value
		je match			;if they match jump to match lable
		add esi, edx		;get next array value address
		loop L1				;loops until end of array (ecx = 0)

	mov eax, -1				;only reaches here if loop L1 ends without a match
	jmp end_search

	match:
		mov eax, [esi]		;stores matched value in eax

	end_search:
		pop esi				;restore pushed values
		pop ecx
		pop edx
	ret
Search endp
end main