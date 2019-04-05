    BITS 64
    SECTION .text
    GLOBAL strcspn

strcspn:
    XOR RAX, RAX                ;
    XOR R9, R9                  ;
cmp:
    MOV R8B, byte[RSI + R9]     ;
    CMP byte[RDI + RAX], 0      ;   
    JZ  return                  ;
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
    
return:
    RET                         ;
