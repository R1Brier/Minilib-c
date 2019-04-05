    BITS 64
    SECTION .text
    GLOBAL strcasecmp

strcasecmp:
    XOR RAX, RAX                ;

byte_cmp:
    MOV CL, byte[RDI + RAX]     ;
    MOV DL, byte[RSI + RAX]     ;
    CMP DL, 0                   ;
    JZ  return                  ;
    CMP CL, 0                   ;
    JZ  return                  ;
    CMP CL, DL                  ;
    JNZ check_1                 ;
    INC RAX                     ;
    JMP byte_cmp                ;

inc:
    INC RAX                     ;
    JMP byte_cmp                ;
    
check_1:
    CMP CL, 65                  ;
    JL  return                  ;
    CMP DL, 65                  ;
    JL  return                  ;
    CMP CL, 122                 ;
    JG  return                  ;
    CMP DL, 122                 ;
    JG  return                  ;
    MOV R8B, 91                 ;
    JMP check_2                 ;

check_2:
    CMP R8B, 97                 ;
    JZ  force_lower             ;
    CMP CL, R8B                 ;
    JZ  return                  ;
    CMP DL, R8B                 ;
    JZ  return                  ;
    INC R8B                     ;
    JMP check_2                 ;
force_lower:
    OR DL, 32                 ;
    OR CL, 32                 ;
    CMP CL, DL                ;
    JNZ  return               ;
    JMP inc                   ;

return:
    MOV CL, byte[RDI + RAX]     ;
    SUB CL, byte[RSI + RAX]    ;
    MOVSX RAX, CL               ;
    RET                         ;
