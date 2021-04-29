; Tracy Michaels
; CSC3210
; Assignment 2 question 1
; this program evaluates the expression AL = (val3 + 7) - (var2 + val1) + (5/3)*7


.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
val1 BYTE 12
val2 BYTE 9
val3 BYTE 2

.code
main proc
mov eax, 0
mov ebx, 0


mov al, val3
add al, 7
mov bl, val2
add bl, val1
sub al, bl
add al, (5/3)*7




invoke ExitProcess,0
main endp
end main
