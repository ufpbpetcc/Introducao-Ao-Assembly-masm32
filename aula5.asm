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
    numero dd 45

.code
start:
    xor edx, edx
    mov eax, numero
    mov ebx, 2
    div ebx ;resto -> edx

    cmp edx, 0
    je _EhPar
    jmp _EhImpar
    

    _EhPar:
        printf("numero e par")
        jmp _FimDoPrograma

    _EhImpar:
        printf("numero e impar")
        jmp _FimDoPrograma
    
    _FimDoPrograma:
        printf("\nPrograma Finalizou")
        invoke ExitProcess, 0
end start