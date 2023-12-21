section .text
    global  strlen
strlen:
    strlen:
        Mov     rax, 0                      ; Rax = 0
        Jmp     check
    
    loop:
        Inc     rax                         ; Rax++
    
    check:
        Cmp     byte[rdi + rax], 0          ; if rdi[rax] == 0 ?
        Jne     loop                        ; non -> loop
        Ret                                 ; return rax



