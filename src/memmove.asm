section .text
    global memmove

memmove:
    xor     rcx, rcx                    ; Set counter to zero
    cmp     rcx, rdx                    ; Compare counter to size of memory to copy
    je      exit                        ; If counter equals size of memory to copy, jump to exit

push_stack:
    cmp     rcx, rdx                    ; Compare counter to size of memory to copy
    je      loop                        ; If counter equals size of memory to copy, jump to loop
    mov     r10b, byte [rsi + rcx]      ; Move the current byte from the memory to copy to r10
    push    r10                         ; Push the current byte onto the stack
    inc     rcx                         ; Increment the counter
    jmp     push_stack

loop:
    dec     rcx                         ; Decrement the counter
    pop     r10                         ; Pop the current byte off the stack
    mov     byte [rdi + rcx], r10b      ; Move the current byte from r10 to the memory to copy to
    cmp     rcx, 0x00                   ; Compare counter to zero
    je      exit                        ; If counter equals zero, jump to exit
    jmp     loop

exit:
    mov     rax, rdi                    ; Move the memory to copy to rax
    ret
