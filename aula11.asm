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

.code
;EAX eh usado como retorno
_Soma Proc
    push ebp
    mov ebp, esp

    mov eax, [ebp+8] ;param1
    add eax, [ebp+12] ;param2
    add eax, [ebp+16] ;param3

    pop ebp
    ret 12 ; 3 x 4bytes
_Soma Endp


start:
    push 13
    push 25
    push 32
    call _Soma
    printf("%d", eax)

    invoke ExitProcess, 0
end start