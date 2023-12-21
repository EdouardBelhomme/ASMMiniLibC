section .text
    global memcpy

memcpy:
    xor rcx, rcx                    ; set rcx to 0

loop:
    cmp rcx, rdx                    ; check if rcx == rdx
    je exit                         ; if so, exit loop
    mov r10b, byte [rsi + rcx]      ; copy byte at rsi + rcx to r10
    mov byte [rdi + rcx], r10b      ; copy byte at r10 to rdi + rcx
    inc rcx                         ; increment rcx
    jmp loop                        ; jump to start of loop

exit:                               ; exit loop
    mov rax, rdi                    ; copy rdi to rax
    ret                             ; return rax