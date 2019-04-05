
    SECTION .text
    GLOBAL strchr

strchr:
    XOR RAX, RAX                    ; clear return value's bits

find_oc:
    CMP byte[RDI + RAX], SIL        ; compare byte at [RDI + RAX] with RSI
    JZ  return                      ; if CMP == 0
    CMP byte[RDI + RAX], 0          ; end condition
    JZ  ret_null                    ; if CMP == 0
    INC RAX                         ; return_val++
    JMP  find_oc                    ; rejump to find_oc

return:
    ADD RAX, RDI                   ; set pointer to the first occurence found
    RET                             ;return

ret_null:
    XOR RAX, RAX                    ; clear RAX bits
    RET                             ; return NULL
