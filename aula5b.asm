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
    num1 dd 120
    num2 dd 98
    num3 dd 82

.code
start:
    ;eax para guardar o maior
    mov eax, num1

    cmp eax, num2
    jge _Passo2
    mov eax, num2

    ;verificar se num3 eh maior
    _Passo2:
        cmp eax, num3
        jge _FimDoPrograma
        mov eax, num3
    
    _FimDoPrograma:
        printf("%d", eax)
        invoke ExitProcess, 0
end start