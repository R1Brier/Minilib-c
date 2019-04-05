
    SECTION .text
    GLOBAL rindex

rindex:
    XOR RAX, RAX                ;

incr:
    CMP byte[RDI + RAX], 0      ; go to
    JZ  find_oc                 ; last character
    INC RAX                     ; of the
    JMP incr                    ; string

find_oc:
    CMP byte[RDI + RAX], SIL    ;
    JZ  return                  ; last occurence found
    CMP RAX, 0                  ; 
    JZ  ret_null                ; no occurence found
    DEC RAX                     ; RAX--
    JMP find_oc                 ;

return:
    ADD RAX, RDI                ; set to pointer at last occurence (RDI + offset)
    RET                         ;
ret_null:
    XOR RAX, RAX                ; clear return value's byte
    RET                         ;
