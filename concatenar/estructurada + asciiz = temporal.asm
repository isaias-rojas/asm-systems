; est + asciiz = temp
lea bx, cadest1
lea si, cadasciiz2 
lea di, cadtempres
inc bx
mov cl, [bx]
mov dl, [bx]
inc bx      
inc di

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
lea di, cadtempres
mov [di], dl
ret               

cadasciiz2 db "56789", 0       ;si
cadest1 db 100, 4, "1234"    ;bx
cadtempres db 200 dup ("?")

