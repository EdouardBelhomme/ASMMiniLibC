section .text
        global strchr

strchr:
        cmp byte[rdi], sil      ; Compare the byte at rdi with sil and jump to exit if equal
        je exit
        cmp byte[rdi], 0x00     ; Compare the byte at rdi with 0x00 and jump to exit_null if equal
        je exit_null
        inc rdi                 ; Increment rdi
        jmp strchr              ; Jump to strchr

exit:
        mov rax, rdi            ; Move rdi to rax
        ret

exit_null:
        mov rax, 0x00           ; Move 0x00 to rax
        ret
