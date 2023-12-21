section .text
    global strncmp

strncmp:
    xor     rcx, rcx                ; initialize loop counter

loop:
    cmp     rcx, rdx                ; check if loop counter same string length
    jge     same_string            ; if so, break
    mov     r10b, byte [rdi]        ; copy byte from string 1 to r10
    mov     r11b, byte [rsi]        ; copy byte from string 2 to r11
    cmp     r10b, r11b              ; compare r10 and r11
    jne     different_strings       ; jump if they are different
    cmp     r10b, 0x00              ; check if r10 is null
    je      same_string             ; if so, break
    inc     rdi                     ; increment pointer to string 1
    inc     rsi                     ; increment pointer to string 2
    inc     rcx                     ; increment loop counter
    jmp     loop                    ; jump to compare next two characters

different_strings:
    sub     r10b, r11b              ; subtract r11 from r10
    movsx   rax, r10b               ; copy r10 to rax
    ret

same_string:
    mov     rax, 0x00               ; set rax to 0
    ret