;fija + temporal => temporal
lea bx, fija   ; apuntar 'h'
lea si, temporal   ; apuntar 'm'
lea di, resultado ; pa guardar la cadena resultante
mov dl, 4      ; longitud de fija
mov dh, 6      ; longitud de temp + 1, porque cuenta el length
inc di

copiar1:
    cmp dl, 0
    je copiar2
    mov al, [bx]
    mov [di], al
    inc bx
    inc di
    dec dl
    jmp copiar1 

copiar2:
    cmp dh, 1
    je agregar_longitud
    inc si
    mov al, [si]
    mov [di], al
    inc di
    dec dh
    jmp copiar2
    
agregar_longitud:
    lea di, resultado
    mov al, 10  ; longitud total de la cadena
    mov [di], al
    ret

fija db "hola"
temporal db 6, "mundo"
resultado db 100 dup ("?")


