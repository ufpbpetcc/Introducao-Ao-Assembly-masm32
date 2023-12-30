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
    dividendo dd 25
    divisor dd 2
    resto dd 0
    resultado dd 0

.code
start:
    mov eax, dividendo
    mov ebx, divisor

    xor edx, edx ; edx = 0
    div ebx ; res -> eax, resto -> edx

    mov resultado, eax
    mov resto, edx

    printf("resultado: %d\n", resultado)
    printf("resto: %d\n", resto)

    invoke ExitProcess, 0
end start