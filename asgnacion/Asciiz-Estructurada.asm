;Asciiz-Estructurada
lea bx, asciiz
lea si, estruc
mov dl, 4 ; longitud de la cadena asciiz
mov cx, 0

ciclo: ; Pa llegar al final de la estructura
    cmp cl, dl
    je copiar
    inc bx
    inc cl
    jmp ciclo

mov [bx], 0 ; Fin de la cadena asciiz
inc bx ; Siguiente byte libre para comenzar la copia

copiar: ; Insertar la asciiz en la estructura
    mov al, [si]
    cmp al, 0
    je salir
    mov [bx], al
    inc si
    inc bx
    jmp copiar

salir:
    ret

asciiz db "ascii", 0
estruc db 50, 5, "estru"





