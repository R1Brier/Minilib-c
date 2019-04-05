    BITS 64
    SECTION .text
    GLOBAL strpbrk

strpbrk:
    XOR RAX, RAX                ;
    XOR R9, R9                  ;
cmp:
    MOV R8B, byte[RSI + R9]     ;
    CMP byte[RDI + RAX], 0      ;   
    JZ  ret_null                ;
    CMP R8B, byte[RDI + RAX]    ;
    JZ  return                  ;
    CMP R8B, 0                  ;
    JNZ inc                     ;
    XOR R9, R9                  ;
    INC RAX                     ;
    JMP cmp                     ;
        
inc:
    INC R9                      ;
    JMP cmp                     ;
    
ret_null:
    XOR RAX, RAX                ;
    RET                         ;

return:
    ADD RAX, RDI                ;
    RET                         ;
