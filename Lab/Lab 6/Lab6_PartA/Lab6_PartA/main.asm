.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD


.data
	Xval SDWORD 26
	Yval DWORD 30
	Zval DWORD 40

; EAX = Xval - (Yval + Zval)
.code
main proc
	mov eax, 0
	mov ebx, 0

	mov ebx, Yval
	add ebx, Zval	
	sub Xval, ebx
	mov eax, Xval

	invoke ExitProcess,0
main endp
end main