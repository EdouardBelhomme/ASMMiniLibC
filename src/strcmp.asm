section .text
    global strcmp

strcmp:
    mov r10b, byte [rdi]  ; Load 1st byte of first string into r10b
    mov r11b, byte [rsi]  ; Load 1st byte of second string into r11b
    cmp r10b, r11b        ; Compare bytes in r10b and r11b
    jne different_strings ; Jump to "different_strings" if not equal
    cmp r10b, 0x00        ; Compare byte in r10b with 0x00
    je same_strings       ; Jump to "same_strings" if equal
    inc rdi               ; Increment rdi by 1
    inc rsi               ; Increment rsi by 1
    jmp strcmp            ; Jump to "strcmp" to check next bytes

different_strings:
    sub r10b, r11b        ; Subtract byte in r10b from byte in r11b
    movsx rax, r10b       ; Move byte in r10b into rax (sign extending)
    ret                   ; Return from function

same_strings:
    mov rax, 0x00         ; Move 0x00 into rax
    ret                   ; Return from function