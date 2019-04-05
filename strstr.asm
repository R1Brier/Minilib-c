
    SECTION .text
    GLOBAL strstr

strstr:
    XOR RAX, RAX                ;
    XOR R9, R9                  ;
    
find_oc:
    MOV R8B, byte[RDI + RAX]    ;
    CMP R8B, 0                  ;
    JZ ret_null                 ;
    CMP byte[RSI + R9], 0       ;
    JZ return                  ;
    CMP R8B, byte[RSI + R9]     ;
    JNZ reset                   ;
    INC R9                      ;
    INC RAX                     ;
    JMP find_oc                 ;

reset:
    SUB RAX, R9                  ;
    INC RAX                      ;
    XOR R9, R9                   ;
    JMP find_oc                  ;

ret_null:
    XOR RAX, RAX                ;
    RET                          ;

return:
    ADD RAX, RDI                ;
    SUB RAX, R9                 ;
    RET                         ;
