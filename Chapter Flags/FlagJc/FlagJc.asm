section .text
    global _start

_start:
    ; Perform addition that may cause overflow
    mov al, 255      ; Set AL to 254 (0xFE) to Not Detect Overflow
    add al, 3        ; Add 1 to AL (255 + 1 = 0, Flag CF = 1)

    ; Check Carry Flag (CF) to determine overflow condition
    jc overflow_detected  ; Jump if Carry Flag (CF) is set (overflow detected)

    ; No overflow detected
    mov rsi, msg_no_overflow  ; Load address of message
    mov rdx, len_no_overflow  ; Load message length
    jmp display_message       ; Jump to display the message

overflow_detected:
    ; Overflow detected
    mov rsi, msg_overflow     ; Load address of message
    mov rdx, len_overflow     ; Load message length
    jmp display_message       ; Jump to display the message

display_message:
    mov rax, 1                ; System call number for sys_write (write)
    mov rdi, 1                ; File descriptor 1 (stdout)
    syscall                   ; Invoke syscall to write message to stdout

    ; Exit program
    mov rax, 60               ; System call number for sys_exit (exit)
    xor rdi, rdi              ; Exit status 0
    syscall                   ; Invoke syscall to exit

section .data
    msg_overflow db 'Overflow Detected', 0xA, 0
    len_overflow equ $ - msg_overflow
    msg_no_overflow db 'No Overflow Detected', 0xA, 0
    len_no_overflow equ $ - msg_no_overflow

