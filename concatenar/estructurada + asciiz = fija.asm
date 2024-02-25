; est + asciiz = fija
lea bx, cadest1
lea si, cadasciiz2 
lea di, cadfijares
inc bx
mov cl, [bx]
mov dl, [bx]
inc bx      


copiar1:
    mov al, [bx]
    mov [di], al
    inc di
    inc bx
    loop copiar1
    
xor cl, cl
copiar2:
    
    mov al, [si]
    cmp al, 0
    je salir
    mov [di], al
    inc di
    inc si
    inc cl  
    jmp copiar2
    
salir:
add dl, cl
ret               

cadasciiz2 db "56789", 0       ;si
cadest1 db 100, 4, "1234"    ;bx
cadfijares db 200 dup ("?")


