section .text
    global strcspn

strcspn:
    xor     r10b, r10b                  ; r10b = 0

start_iteration:
    xor     rcx, rcx                    ; rcx = 0
    cmp     byte [rdi] , 0x00           ; check end of string
    je      exit                        ; if end of string, exit
    mov     r11b, byte [rsi]            ; load current byte from rsi

look_for_char:
    cmp     byte [rdi], r11b            ; compare it with current byte from rdi
    je      exit

empty_rsi:
    cmp     byte [rsi], 0x00            ; check end of string
    jne     filled_rsi                  ; if not end of string, go to filled_rsi
    inc     r10b                        ; increment index of byte to be returned
    jmp     loop                        ; go to loop

filled_rsi:
    inc     rcx                         ; increment index of rsi
    mov     r11b, byte [rsi + rcx]      ; load current byte from rsi
    cmp     r11b, 0x00                  ; check end of string
    jne     look_for_char               ; if not end of string, go to look_for_char
    inc     r10b                        ; increment index of byte to be returned

loop:
    inc     rdi                         ; move to next byte in rdi
    jmp     start_iteration             ; go to start_iteration

exit:
    movsx   rax, r10b                   ; return index
    ret
