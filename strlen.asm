
    
    SECTION .text
    GLOBAL strlen


strlen: 
    XOR RAX, RAX                  ; clear return value's bits
len:
    CMP byte[RDI + RAX], 0      ; comparing stop condition 
    JZ  return                  ; if CMP == 0
    INC RAX                     ;
    JMP len                     ; loop

return:
    RET                         ; return
