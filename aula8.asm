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
_Soma Proc
    push ebp
    mov ebp, esp

    ;soma -> eax
    xor eax, eax ; eax=0
    xor ebx, ebx ; ebx -> contador

    _Loop:
        cmp ebx, 50
        jge _FinalizarLoop

        add eax, ebx
        add ebx, 1 ; incremento o contador
        jmp _Loop

        _FinalizarLoop:
            printf("%d", eax)

    mov esp, ebp
    pop ebp
    ret ; return
_Soma Endp

start:
    call _Soma
    invoke ExitProcess, 0
end start