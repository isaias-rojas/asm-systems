;fija + asciiz => estructurada
lea bx, fija   ; apuntar 'h'
lea si, asciiz   ; apuntar 'm'
lea di, resultado ; pa guardar la cadena resultante
mov dl, 4      ; longitud de fija1
inc di         ; Saltar el primer byte para (reservado)
inc di         ; Saltar el segundo byte para (usado)

; Asignar valores a (reservado) y (usado)
mov byte [di-2], 100 ; (reservado)
mov byte [di-1], 9 ; (usado)

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
    je salir
    mov al, [si]
    mov [di], al
    inc si
    inc di
    dec dh
    jmp copiar2

salir:
    ret

fija db "hola"
asciiz db "mundo",0
resultado db 100 dup ("?")




