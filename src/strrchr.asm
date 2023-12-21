section .text
    global strrchr

strrchr:
    mov r10, 0x00           ;init return value to null

loop:
    cmp byte [rdi], sil     ; compare the current character in the string with the character to be found
    jne not_matched         ; if they are not equal, jump to not_matched
    mov r10, rdi            ; otherwise, save the current position

not_matched:
    cmp byte [rdi], 0x00    ; check if the end of the string has been reached
    je exit                 ; if so return null
    inc rdi                 ; otherwise, increment the position in the string
    jmp loop                ; and jump back to the start of the loop

exit:
    mov rax, r10            ; save the position of the last occurrence of the character to be found in rax
    ret
