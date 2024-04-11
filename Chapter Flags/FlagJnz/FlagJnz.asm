section .data
    nums db 48, 57, 50, 51, 52
    numsLength equ $
section .text
    global _start

_start:

    mov rsi, nums
    mov rdx, 5 
    jmp loop

loop: 

    cmp rdx, 0
    jz exit 

    ; Если флаг нуля не установлен то прыгаем в display_element
    jnz display_element

    dec rdx
    mov rsi, [rsi + rsi * 1]

display_element: 

    mov rax, 1 
    mov rdi, 1 
    syscall

exit:
    mov rax, 60
    mov rdi, 0
    syscall
