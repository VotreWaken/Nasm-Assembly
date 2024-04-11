global _start 

section .data 
	msg_overflow db 'Overflow Detected', 0xA
	len_overflow equ $ - msg_overflow 
	
	msg_no_overflow db 'No Overflow Detected', 0xA
	len_no_overflow equ $ - msg_no_overflow 

section .text 
_start: 
	mov al, 255
	add al, 1
	
	jnc overflow_not_detected

	mov rsi, msg_overflow
	mov rdx, len_overflow
	jmp display_message

overflow_not_detected: 
	mov rsi, msg_no_overflow
	mov rdx, len_no_overflow 
	jmp display_message

display_message: 
	mov rax, 1
	mov rdi, 1
	syscall 

	jmp exit

exit: 
	mov rax, 60
	xor rdi, rdi 
	syscall
