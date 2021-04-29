.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD

.data
	myBytes BYTE 10h, 20h, 30h, 40h
	myWords WORD 8Ah, 3Bh, 72h, 44h, 66h
	myDoubles DWORD 1, 2, 3, 4, 5
	myPointer DWORD myDoubles

	array1 DWORD 50h, 51h

	

.code
main proc
	mov eax, 0

	mov ax, 0BFFh
	add ah, 117
	add al, 1

	mov eax, array1

	mov esi, OFFSET myBytes
	mov ax, [esi]
	mov eax, DWORD PTR myWords
	mov esi, myPointer
	mov ax, [esi+2]
	mov ax, [esi+6]
	mov ax, [esi+4]

	invoke ExitProcess,0
main endp
end main