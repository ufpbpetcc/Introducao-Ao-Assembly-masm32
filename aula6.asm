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
    contador dd 0

.code
start:
    _Inicio:
        mov contador, 0

    _Corpo:
        cmp contador, 50
        jge _Final
        
        ;Faz algo
        printf("%d - ", contador)

        ;incrementa contador
        add contador, 1

        ;reiniciar loop
        jmp _Corpo
    
    _Final:
        invoke ExitProcess, 0
end start