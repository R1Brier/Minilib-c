    BITS 64
    SECTION .text
    GLOBAL strcmp

strcmp:
    XOR RAX, RAX                ;

byte_cmp:
    MOV CL, byte[RDI + RAX]              ; 
    CMP byte[RSI + RAX], 0                             ;
    JZ return                             ;
    CMP CL, 0                ;
    JZ return
    CMP CL, byte[RSI + RAX] ; compare bytes
    JNZ return          ;
    INC RAX             ;
    JMP byte_cmp        ;

return:
    SUB CL, byte[RSI + RAX]       ;
    MOVSX RAX, CL                 ;
    RET                        ;
