section .bss
	digitspace:	resb 100
	backup: 	resb 8

section .text
	global _start

_start:
	mov rax, 908987797877
	call _printRAX
	mov rax, 60
	mov rdi, 0
	syscall

_printRAX:
	mov rcx, digitspace
	mov rbx, 10
	mov [rcx], rbx
	inc rcx

_printRAXloop1:
	mov rdx, 0
	div rbx
	add rdx, 48
	mov [rcx], dl
	inc rcx
	cmp rax, 0
	jne _printRAXloop1
	mov [backup], rcx

_printRAXloop2:
	mov rax, 1
	mov rdi, 1
	mov rsi, [backup]
	mov rdx, 1
	syscall
	mov rcx, [backup]
	dec rcx
	mov [backup], rcx
	cmp rcx, digitspace
	jge _printRAXloop2
	ret