;Fija-AsciiZ
lea bx,fija
lea si,asciiz
mov dl,4
mov cx,0

ciclo: ;Pa llegar al final de la fija
    cmp cl,dl
    je copiar
    inc bx
    inc cl
    jmp ciclo

inc bx ;Siguiente byte libre para comenzar la copia
        
copiar: ;Insertarle la asciiz a la fija
    mov al, [si]
    cmp al, 0
    je salir
    mov [bx], al
    inc si
    inc bx
    jmp copiar

    
salir:
    mov [bx],0 ;El null de la asciiz insertado al final
    ret
    

fija db "fija"
asciiz db "asci",0
