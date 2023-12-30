.686
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\msvcrt.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\msvcrt.lib
include \masm32\macros\macros.asm


.data
    num1 dd 10
    num2 dd 12
    num3 dd 12
    num4 dd 10
    num5 dd 10

.code
start:
    mov eax, num1
    add eax, num2
    add eax, num3
    add eax, num4
    add eax, num5

    printf("%d", eax)
    
    invoke ExitProcess, 0
end start