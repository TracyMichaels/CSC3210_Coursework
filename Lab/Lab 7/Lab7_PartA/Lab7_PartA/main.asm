.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD

.data
	count BYTE 100
	wVal WORD 2
	wVal2 WORD 4

.code
main proc
	mov bl, count
	mov ax, wVal
	mov count, al

	mov ax, wVal
	mov al, count
	movzx eax, count
	mov cx, wVal
	mov wVal2, cx

	invoke ExitProcess,0

main endp
end main