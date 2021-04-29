.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD

.data
	myByte1 BYTE 9Bh

.code
main proc
	
	mov bx, 0A69Bh
	movzx eax, bx

	movzx eax, myByte1

	mov bx, 0A69Bh
	movsx eax, bx

	invoke ExitProcess,0

main endp
end main