
    SECTION .text
    GLOBAL memset

memset:
    XOR RAX, RAX                ; clear return value

fill_byte:
    CMP RAX, RDX                         ; check fill
    JZ  return                           ; return
    MOV byte[RDI + RAX], SIL             ; fill current byte with SIL
    INC RAX                              ; return++
    JMP fill_byte                        ; rejump to fill_byte

return:
    MOV RAX, RDI                ; set return value to pointer
    RET                         ; return
