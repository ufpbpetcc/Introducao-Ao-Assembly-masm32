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
    x dd 4
    y dd 7
    soma dd 0
    subtracao dd 0
    produto dd 0


.code
start:
    ;soma
    mov eax, x
    add eax, y
    mov soma, eax

    ;subtracao
    mov eax, x
    sub eax, y ; x-y
    mov subtracao, eax

    ;produto
    mov eax, x
    imul eax, y
    mov produto, eax

    printf("%d\n", soma)
    printf("%d\n", subtracao)
    printf("%d\n", produto)

    invoke ExitProcess, 0
end start