lea bx, estruc
lea si, temp
mov cx, 5 

; Avanzar al final de la estructurada
ciclo:
    dec cx
    jle copiar ; Usamos jle para incluir el caso cuando cx llega a 0
    add bx, word [bx] ; Sumar el tamaño del numero
    inc bx ; Avanzar a la siguiente posicion después del numero
    loop ciclo


; Copiar la cadena temporal a la estructura
copiar:
    mov al, [si]
    cmp al, 0 ; Hemos terminado de copiar?
    je salir
    mov [bx], al
    inc si
    inc bx
    jmp copiar

salir:
    ret

estruc db 40, 5, "estru" ; 
temp db 5, "tempo"
