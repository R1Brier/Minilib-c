    BITS 64
    SECTION .text
    GLOBAL strncmp

strncmp:
    XOR RAX, RAX                ; clear RAX register 

byte_cmp:
    MOV CL, byte[RDI + RAX]              ;   
    CMP RAX, RDX                         ; if all bytes compared
    JZ return_b                            ; return
    CMP byte[RSI + RAX], 0               ; if end of S2
    JZ return                            ; return
    CMP CL, 0                ; if end of S1
    JZ return                ; return
    CMP CL, byte[RSI + RAX] ; compare bytes
    JNZ return          ; if not equals return
    INC RAX             ;
    JMP byte_cmp        ;

return:
    SUB CL, byte[RSI + RAX]       ; substract S1 by S2
    MOVSX RAX, CL                 ; mov signed byte
    RET                             ; return

return_b:
    XOR RAX, RAX                ;
    RET                         ;
