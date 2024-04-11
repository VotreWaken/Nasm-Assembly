global _start
 
section .text
_start:
    mov al, 10
    sub al, 10                    ; Если поставим значение 11, то будет происходить знаковое изменение и флаг On Sign будет обновлен
    js jump_on_sign_detected

    jns no_jump_on_sign_detected

    jmp exit

exit:
    mov rax, 60
    syscall

jump_on_sign_detected:
    ; Jump On Sign Detected
    mov rsi, msg_jump_on_sign     ; Load address of message
    mov rdx, len_jump_on_sign     ; Load message length
    jmp display_message           ; Jump to display the message

no_jump_on_sign_detected:
    mov rsi, msg_no_jump_on_sign  ; Load address of message
    mov rdx, len_no_jump_on_sign  ; Load message length
    jmp display_message           ; Jump to display the message

display_message:
    mov rax, 1                    ; System call number for sys_write (write)
    mov rdi, 1                    ; File descriptor 1 (stdout)
    syscall                       ; Invoke syscall to write message to stdout

    ; Exit program
    mov rax, 60                   ; System call number for sys_exit (exit)
    xor rdi, rdi                  ; Exit status 0
    syscall                       ; Invoke syscall to exit

section .data
    msg_jump_on_sign db 'Jump On Sign Detected', 0xA, 0
    len_jump_on_sign equ $ - msg_jump_on_sign
    msg_no_jump_on_sign db 'No Jump On Sign Detected', 0xA, 0
    len_no_jump_on_sign equ $ - msg_no_jump_on_sign
