.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
myWord word 4 dup(1,2,3,4,5)

.code
main proc

mov eax, 0
mov ax, myWord+0

add ax, myWord + 2
add ax, myWord + 4
add ax, myWord + 6
add ax, myWord + 8

invoke ExitProcess,0
main endp
end main