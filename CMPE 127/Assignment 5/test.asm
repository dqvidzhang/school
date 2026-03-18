.386
.model flat, stdcall
option casemap:none
ExitProcess proto :DWORD

.data
a      WORD  9
b      WORD  5
maskw  WORD  30
x      WORD  2

sum        WORD ?   ; sum = a+b
sub1       WORD ?   ; sub1 = a-b
product    WORD ?   ; product = a*b
quotient   WORD ?   ; quotient = a/b
remainder  WORD ?   ; remainder = a%b
a_minus    WORD ?   ; a_minus = -a
b_plus1    WORD ?   ; b_plus1 = b+1 (don't use ADD)
a_and_mask WORD ?   ; a AND mask
b_or_mask  WORD ?   ; b OR mask
a_shr_x    WORD ?   ; a >> x
b_shl_x    WORD ?   ; b << x
a_ror_x    WORD ?   ; rotate right a by x
b_rcl_x    WORD ?   ; rotate left with carry b by x

.code
main proc
    ; sum = a + b
    mov ax, a
    add ax, b
    mov sum, ax

    ; sub1 = a - b
    mov ax, a
    sub ax, b
    mov sub1, ax

    ; product = a * b (unsigned multiply AX by BX, result in DX:AX)
    mov ax, a
    mov bx, b
    mul bx
    mov product, ax   ; store low 16 bits

    ; quotient = a / b, remainder = a % b
    mov ax, a
    xor dx, dx        ; clear DX for 16-bit division
    div b             ; AX = quotient, DX = remainder
    mov quotient, ax
    mov remainder, dx

    ; a_minus = -a (two’s complement negation)
    mov ax, a
    neg ax
    mov a_minus, ax

    ; b_plus1 = b + 1 (increment instead of ADD)
    mov ax, b
    inc ax
    mov b_plus1, ax

    ; a_and_mask = a AND mask
    mov ax, a
    and ax, maskw
    mov a_and_mask, ax

    ; b_or_mask = b OR mask
    mov ax, b
    or  ax, maskw
    mov b_or_mask, ax

    ; a_shr_x = a shifted right logically by x times
    mov ax, a
    mov cl, BYTE PTR x
    shr ax, cl
    mov a_shr_x, ax

    ; b_shl_x = b shifted left logically by x times
    mov ax, b
    mov cl, BYTE PTR x
    shl ax, cl
    mov b_shl_x, ax

    ; a_ror_x = a rotated right by x times
    mov ax, a
    mov cl, BYTE PTR x
    ror ax, cl
    mov a_ror_x, ax

    ; b_rcl_x = b rotated left through carry by x times
    mov ax, b
    clc                 
    mov cl, BYTE PTR x
    rcl ax, cl
    mov b_rcl_x, ax

    invoke ExitProcess, 0
main endp
end main
