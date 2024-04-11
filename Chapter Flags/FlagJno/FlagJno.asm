global _start
 
section .text
_start:
    mov al, 127
    add al, 1                    ; Если поставим значение 2, то будет происходить переполнение и Overflow флаг будет обновлен
    jo jump_on_sign_detected

    jno no_jump_on_sign_detected

    jmp exit

exit:
    mov rax, 60
    syscall

jump_on_sign_detected:
    ; Jump On Sign Detected
    mov rsi, msg_overflow      ; Load address of message
    mov rdx, len_overflow      ; Load message length
    jmp display_message           ; Jump to display the message

no_jump_on_sign_detected:
    mov rsi, msg_no_overflow   ; Load address of message
    mov rdx, len_no_overflow   ; Load message length
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
    msg_overflow  db 'Overflow Detected', 0xA, 0
    len_overflow  equ $ - msg_overflow 
    msg_no_overflow  db 'No Overflow Detected', 0xA, 0
    len_no_overflow  equ $ - msg_no_overflow 
