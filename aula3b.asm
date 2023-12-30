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
    num1 dd 50
    num2 dd 3
    resto dd 0
    resultadoDiv dd 0

.code
start:
    ;soma
    mov eax, num1
    add eax, num2
    printf("%d ", eax)


    ;subtracao
    mov eax, num1
    sub eax, num2
    printf("%d ", eax)

    ;produto
    mov eax, num1
    imul eax, num2
    printf("%d ", eax)


    ;divisao e modulo
    xor edx, edx
      
    mov eax, num1
    mov ebx, num2
    div ebx

    mov resultadoDiv, eax
    mov resto, edx


    printf("%d ", resultadoDiv)
    printf("%d ", resto)
    
    invoke ExitProcess, 0
end start