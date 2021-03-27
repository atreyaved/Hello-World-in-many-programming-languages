	BITS 16

start:
	mov ax, 07C0h		
	add ax, 288		
	mov ss, ax
	mov sp, 4096

	mov ax, 07C0h		
	mov ds, ax


	mov si, text_string	
	call print_string	

	jmp $			


	text_string db 'Hello World', 0


print_string:			
	mov ah, 0Eh		

.repeat:
	lodsb			
	cmp al, 0
	je .done		
	int 10h			
	jmp .repeat

.done:
	ret


	times 510-($-$$) db 0	
	dw 0xAA55


	;this is an literall operating system, if you want to try it then you would have to convert it into a 
	;.img file u can probably search on the internet on how to do that
