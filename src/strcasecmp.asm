section .text
    global strcasecmp

strcasecmp:
    mov     r10b, byte [rdi]        ; Copy the first character from the first string to r10b
    mov     r11b, byte [rsi]        ; Copy the first character from the second string to r11b
    jmp     check_maj_rdi           ; Jump to check_maj_rdi

comparison:
    cmp     r10b, r11b              ; Compare r10b and r11b
    jne     exit                    ; Jump to exit if they are not equal
    cmp     r10b, 0x00              ; Compare r10b and 0x00
    je      exit                    ; Jump to exit if they are equal
    inc     rdi                     ; Increment rdi by 1
    inc     rsi                     ; Increment rsi by 1
    jmp     strcasecmp              ; Jump to strcasecmp

check_maj_rdi:
    cmp     r10b, 'A'                   ; Compare r10b and 'A'
    jl      check_maj_rsi                ; Jump to check_maj_rsi if r10b is less than 'A'
    cmp     r10b, 'Z'                   ; Compare r10b and 'Z'
    jg      check_maj_rsi                ; Jump to check_maj_rsi if r10b is greater than 'Z'
    add     r10b, 0x20                  ; Add 0x20 to r10b

check_maj_rsi:
    cmp     r11b, 'A'                   ; Compare r11b and 'A'
    jl      comparison                   ; Jump to comparison if r11b is less than 'A'
    cmp     r11b, 'Z'                   ; Compare r11b and 'Z'
    jg      comparison                   ; Jump to comparison if r11b is greater than 'Z'
    add     r11b, 0x20                  ; Add 0x20 to r11b
    jmp     comparison                  ; Jump to comparison

exit:
    sub     r10b, r11b                  ; Subtract r11b from r10b
    movsx   rax, r10b                 ; Move r10b to rax
    ret
