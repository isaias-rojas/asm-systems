; est + fija = temp
lea bx, cadest1
lea si, cadfija2 
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
mov cl, 5
add dl, 5       
copiar2:
    mov al, [si]
    mov [di], al
    inc di
    inc si
    loop copiar2  

lea di, cadtempres
mov [di], dl
ret               

cadfija2 db "56789"       ;si
cadest1 db 100, 4, "1234"    ;bx
cadtempres db 200 dup ("?")
