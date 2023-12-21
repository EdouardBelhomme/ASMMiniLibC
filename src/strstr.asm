section .text
    global strstr

strstr:
    cmp     byte[rsi], 0x00             ; if the first character of the string to search for is a null character,
    je      match                       ; then the string to search in will be returned

loop:
    xor     rcx, rcx                    ; set rcx to 0
    mov     r10b, byte [rdi]            ; move the current character of the string to search in to r10b
    cmp     byte [rsi], r10b            ; compare the first character of the string to search for with the current character of the string to search in
    je      compare                     ; if they are the same, then compare the rest of the string to search for
    cmp     r10b, 0x00                  ; if the current character of the string to search in is a null character,
    je      no_match                    ; then the string to search for is not in the string to search in
    inc     rdi                         ; otherwise, move to the next character of the string to search in
    jmp     loop

compare:
    inc     rcx                         ; increment rcx
    cmp     byte [rsi + rcx], 0x00      ; if the next character of the string to search for is a null character,
    je      match                       ; then the string to search in has been found
    mov     r10b, byte [rdi + rcx]      ; otherwise, move the next character of the string to search in to r10b
    cmp     byte [rsi + rcx], r10b      ; compare the next character of the string to search for with the next character of the string to search in
    je      compare                     ; if they are the same, then continue comparing
    inc     rdi                         ; otherwise, move to the next character of the string to search in
    jmp     loop

no_match:
    mov     rax, 0x00                   ; if the string to search for is not in the string to search in, then return null
    ret

match:
    mov     rax, rdi                    ; otherwise, return the string to search in
    ret