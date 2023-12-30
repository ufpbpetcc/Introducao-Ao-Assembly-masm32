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
    num2 dd 3

    soma dd 0
    subtracao dd 0
    produto dd 0
    divisao dd 0
    modulo dd 0

.code
;EAX eh usado como retorno
_Soma:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8] ;param1
    add eax, [ebp+12] ;param2

    pop ebp
    ret 8 ; 2 x 4bytes

;EAX eh usado como retorno
_Subtrai:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]  ;param1
    sub eax, [ebp+12] ;param2

    pop ebp
    ret 8

;EAX eh usado como retorno
_Produto:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8] ;param1
    imul eax, [ebp+12] ;param2

    pop ebp
    ret 8 ; 2 x 4bytes

;EAX eh usado como retorno
_Divisao:
    push ebp
    mov ebp, esp

    xor edx, edx
    mov eax, [ebp+8] ;param1
    mov ebx, [ebp+12] ;param2
    div ebx

    pop ebp
    ret 8 ; 2 x 4bytes

;EAX eh usado como retorno
_Modulo:
    push ebp
    mov ebp, esp

    xor edx, edx
    mov eax, [ebp+8] ;param1
    mov ebx, [ebp+12] ;param2
    div ebx

    mov eax, edx ;passa o resto da divisao para eax

    pop ebp
    ret 8 ; 2 x 4bytes

_Printar Proc
    push ebp
    mov ebp, esp

    printf("\nSoma: %d\n", soma)
    printf("Subtracao: %d\n", subtracao)
    printf("Produto: %d\n", produto)
    printf("Divisao: %d\n", divisao)
    printf("Modulo: %d\n", modulo)

    pop ebp
    ret
_Printar Endp 

start:
    ;Soma
    push num2
    push num1
    call _Soma
    mov soma, eax

    ;Subtracao
    push num2
    push num1
    call _Subtrai
    mov subtracao, eax

    ;Produto
    push num2
    push num1
    call _Produto
    mov produto, eax

    ;Divisao
    push num2
    push num1
    call _Divisao
    mov divisao, eax

    ;Modulo
    push num2
    push num1
    call _Modulo
    mov modulo, eax

    call _Printar

    invoke ExitProcess, 0
end start