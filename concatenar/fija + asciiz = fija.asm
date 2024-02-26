;fija + asciiz => fija
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

