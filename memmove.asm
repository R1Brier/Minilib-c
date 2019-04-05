
    SECTION .text
    GLOBAL memmove

memmove:
    XOR RAX, RAX                ;
    CMP RAX, RDX                ;
    JZ  return                  ;
    MOV R9, RDX                 ;
    MOV R8, RDI                 ;
    SUB R8, RSI                ;
    CMP R8, 0                  ;
    JLE cpy                     ;   

rev_cpy:
    DEC R9                     ;
    MOV R8B, byte[RSI + R9]   ;
    MOV byte[RDI + R9], R8B        ;
    CMP R9, 0                 ;
    JZ  return                ;
    JMP rev_cpy                  ;
    
cpy:
    MOV R8B, byte[RSI + RAX]                ;
    MOV byte[RDI + RAX], R8B                ;
    INC RAX                                 ;
    CMP RAX, RDX                            ;
    JZ return                               ;
    JMP cpy                            ;

return:
    MOV RAX, RDI                ;
    RET                         ;
