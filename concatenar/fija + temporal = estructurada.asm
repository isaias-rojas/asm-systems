;fija + temporal => estructurada 
lea bx, fija   ; apuntar 'h'
lea si, temporal   ; apuntar 'm'
lea di, resultado ; pa guardar la cadena resultante
mov dl, 4      ; longitud de fija 
mov dh, 6      ; longitud de temp + 1, porque cuenta el length

inc di         ; Saltos solo para poder ver mejor el resultado 
inc di
 
inc di         ; Saltar el primer byte para (reservado)
inc di         ; Saltar el segundo byte para (usado)

; Asignar valores a (reservado) y (usado)
mov byte [di-2], 100 ; (reservado)
mov byte [di-1], 10 ; (usado)


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
    je salir
    inc si
    mov al, [si]
    mov [di], al
    inc di
    dec dh
    jmp copiar2
    
salir:
    ret

fija db "hola"
temporal db 6, "mundo"
resultado db 100 dup ("?")
