
    SECTION .text
    GLOBAL memcpy

memcpy:
    XOR RAX, RAX            ; clear return value

byte_cpy:
    CMP RAX, RDX                ; check count
    JZ return                   ; return
    MOV CL, byte[RSI + RAX]     ; move current src byte in rcx first byte
    MOV byte[RDI + RAX], CL     ; move CL to current dest byte
    INC RAX                     ; return++;
    JMP byte_cpy                ; rejump
return:
    MOV RAX, RDI                ; set value to dest pointer
    RET                         ; return

