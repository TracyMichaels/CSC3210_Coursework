; Tracy Michaels
; CSC3210
; Assignment 2
; this program evaluates the expression BX = -val2 + 7 - (-val3 + val1)


.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
val1 SBYTE 12
val2 SBYTE 9
val3 SBYTE 2

.code
main proc

mov eax, 0
mov ebx, 0
mov ecx, 0
movzx bx, val2
neg bx
add bx, 7
movzx ax, val3
neg ax
movzx cx, val1
add ax, cx
sub bx, ax

invoke ExitProcess,0
main endp
end main