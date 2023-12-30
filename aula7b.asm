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
    qtdSomados dd 0
    soma dd 0

.code
start:
    _CorpoDoWhile:
        cmp qtdSomados, 100
        jge _Finalizar

        _VerificaPares:
            xor edx, edx 
            mov eax, contador
            mov ebx, 2    
            div ebx
            cmp edx, 0

            jne _Incrementa ; quando eh impar, apenas incrementa
            mov eax, contador
            add soma, eax
            add qtdSomados, 1 ; somou mais um numero valido
            
        _Incrementa:
            add contador, 1
            jmp _CorpoDoWhile 

    _Finalizar:
        printf("%d", soma)
        invoke ExitProcess, 0
end start