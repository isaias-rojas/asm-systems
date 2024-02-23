;Temporal-Fija

lea bx, temp
lea si,fija
mov dl,5
mov cx,0
mov [bx],dl

ciclo:
    cmp cl,dl
    je copiar
    inc bx
    inc cl
    jmp ciclo 
  
    
copiar:
    mov al, [si]
    mov [bx], al
    cmp al, 0
    je salir
    inc si
    inc bx
    jmp copiar


salir:
    ret 
    

temp db 5,"temp"
fija db "fija"