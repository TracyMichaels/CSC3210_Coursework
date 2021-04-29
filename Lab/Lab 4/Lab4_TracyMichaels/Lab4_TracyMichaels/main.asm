.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	;pre-pro for readability purposes of lab answer sheet
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	;AL = (AL-DL)+CL-BL
	mov al, 245
	mov bl, 41
	mov cl, 11
	mov dl, 215
	sub al, dl
	add al, cl
	sub al, bl
	invoke ExitProcess,0
main endp
end main