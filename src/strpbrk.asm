section .text
    global strpbrk

strpbrk:
    cmp      byte [rsi], 0x00           ; compare bytes at rsi to 0x00
    je       no_match

init_loop:
    xor      rcx, rcx                   ; set rcx to 0x00
    mov      r10b, byte [rdi]           ; move byte at rdi to r10
    cmp      r10b, 0x00                 ; compare r10 to 0x00
    je       no_match                   ; if equal, jump to no_match
    mov      r11b, byte [rsi]           ; move byte at rsi to r11

look_for_char:
    cmp      r10b, r11b                 ; cmp r10 and r11
    je       match                      ; if equal, jump to match
    inc      rcx                        ; increment rcx
    mov      r11b, byte [rsi + rcx]     ; move byte at rsi + rcx to r11
    cmp      r11b, 0x00                 ; compare r11 to 0x00
    jne      look_for_char              ; if not equal, jump to look_for_char


loop:
    inc      rdi                        ; increment rdi
    jmp      init_loop                  ; jump to init_loop

match:
    mov     rax, rdi                    ; move rdi to rax
    ret

no_match:
    mov     rax, 0x00                   ; set rax to 0x00
    ret
