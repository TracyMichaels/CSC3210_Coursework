.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD

.data
	array_list DWORD 10, 11, 13, 18, 21, 23, 24, 17, 45
	array_size =  LENGTHOF array_list
	index = 0
	sum DWORD ?


.code
main proc
	mov eax, 0              ;temp sum
	mov ecx, array_size     ;loop counter
	mov esi, index          ;index

	;for loop
	L1:
		;while
		cmp esi, array_size
		jnle ENDWHILE
		jmp WHILE_LOOP
	WHILE_LOOP:
		;if
		test array_list[esi * (TYPE array_list)], 1
		jz IF_BLOCK
		jmp next
	IF_BLOCK:
		add eax, array_list[esi * (TYPE array_list)]
	next:
	ENDWHILE:
		inc esi
		loop L1

	mov sum, eax

	invoke ExitProcess, 0
main endp
end main




mov dl, index
	;while
WHILELOOP:	
	
	cmp dl, maxlength
	jge ENDWHILE
	;if
	mov al, array1[index * (TYPE array1)]
	mov bl, array2[index * (TYPE array2)]
	cmp al, bl
	jle ELSEBLOCK
	mul sample1
	mov cl, al
	mov al, bl
	mul sample2
	mov dl, al
	mov al, cl
	div dl
	mov exp1, ax
	jmp END_IF
ELSEBLOCK:
	mov exp1, 0
END_IF:
	mov dl, index
	inc dl
	mov index, dl
	jmp WHILELOOP	
ENDWHILE:
