section .text
    global memset

memset:
    xor     rcx, rcx                        ; set the counter to 0

loop:
    cmp     rcx, rdx                        ; compare the counter to the size
    je      exit                             ; if they are equal, exit the loop
    mov     byte [rdi + rcx], sil           ; otherwise, store the byte in the current position
    inc     rcx                             ; increment the counter
    jmp     loop                            ; and jump back to the loop

exit:
    mov     rax, rdi                        ; return the pointer
    ret
