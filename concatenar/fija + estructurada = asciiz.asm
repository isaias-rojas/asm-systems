;fija + estructurada => asciiz
lea bx, fija          ; apuntar 'h'
lea si, estructurada  ; apuntar 'm'
lea di, resultado     ; pa guardar la cadena resultante
mov dl, 4             ; longitud de fija
mov dh, 5             ; longitud de la estructurada
inc si                ; Salta el byte reservado
inc si                ; Salta el byte usado
inc di                ; Espacio para ver el resultado

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
    cmp dh, 0
    je salir
    mov al, [si]
    mov [di], al
    inc si
    inc di
    dec dh
    jmp copiar2

salir:
    mov [di], 0 ;Le metes el null de asciiz
    ret

fija db "hola"
estructurada db 100, 5, "mundo"
resultado db 100 dup ("?")


