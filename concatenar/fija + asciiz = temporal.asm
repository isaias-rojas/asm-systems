;fija + asciiz => temporal 
lea bx, fija   ; apuntar 'h'
lea si, asciiz   ; apuntar 'm'
lea di, resultado ; pa guardar la cadena resultante
mov dl, 4      ; longitud de fija1
inc di  

copiar1:
    cmp dl,0
    je copiar2
    mov al, [bx]
    mov [di], al
    inc bx
    inc di
    dec dl
    jmp copiar1

copiar2:
    cmp [si],0
    je agregar_longitud
    mov al, [si]
    mov [di], al
    inc si
    inc di
    dec dh
    jmp copiar2

agregar_longitud:
    lea di, resultado
    mov al, 9  ; longitud total de la cadena
    mov [di], al
    ret

fija db "hola"
asciiz db "mundo",0
resultado db 100 dup ("?")


