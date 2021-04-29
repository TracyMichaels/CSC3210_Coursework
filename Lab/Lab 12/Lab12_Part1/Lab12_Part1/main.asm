.386
.model flat, stdcall
.stack 4096

;this program uses mul and div opporators to implement the following sudo code in assembly language
;While (  index < maxlength ){
;If (array1[index] > array2[index]
;   	exp1 = (array1[index] * sample1) / (array2[index] * Sample2)      
;	// only store the quotient of the division in exp1 and exp1 is 			//16 bit long variable
;  else
;	exp1 = 0
;  index = index + 1
;}


ExitProcess proto, dwExitCode:DWORD

.data
	array1 BYTE 13h, 14h, 15h, 16h
	array2 BYTE 12h, 13h, 14h, 15h
	length1 = LENGTHOF array1		
	length2 = LENGTHOF array2
	sample1 BYTE 30h
	sample2 BYTE 5h
	maxlength BYTE ?
	index BYTE 0
	exp1 WORD ?

.code
main proc

	;find max of array lengths, in this case they'll be the same anyway
	mov al, length1
	mov bl, length2
	cmp al, bl
	jge NEXT
	mov maxlength, bl
	jmp CONT
NEXT:
	mov maxlength, al
CONT:	

	mov esi, DWORD PTR index
	mov ecx, DWORD PTR maxlength

WHILELOOP:
	cmp esi, ecx
	jge ENDWHILE
	;if
	mov al, array1[esi * (TYPE array1)]
	cmp al, array2[esi * (TYPE array2)]
	jle ELSEBLOCK
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;exp1 = (array1[esi] * sample1) / (array2[esi] * Sample2)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov edx, 0
	mov al, array2[esi * (TYPE array2)]
	mul sample2
	mov bx, ax
	mov al, array1[esi * (TYPE array1)]
	mul sample1
	;jump to else if divisor is 0
	cmp bx, 0
	je ELSEBLOCK
	div bx
	mov exp1, ax							;save just the quotient in exp1
	jmp END_IF
ELSEBLOCK:
	mov exp1, 0
END_IF:
	inc esi
	jmp WHILELOOP
ENDWHILE:

	invoke ExitProcess, 0
main endp
end main