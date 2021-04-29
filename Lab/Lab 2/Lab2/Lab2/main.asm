.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
count DWORD ?

.code
main proc

mov eax, 14
mov ecx, 2
L1:
    mov count, ecx
    mov ecx, 4
    L2:
         add eax, count
         sub ecx, 3
        Loop L2
    mov ecx, count
    Loop L1


	


	invoke ExitProcess, 0
main endp
end main