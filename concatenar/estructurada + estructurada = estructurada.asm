; est + est = est
lea bx, cadest1
lea si, cadest2 
lea di, cadestres
inc bx
mov cl, [bx]
mov dl, [bx]
inc bx
inc di
inc di
copiar1:
    mov al, [bx]
    mov [di], al
    inc di
    inc bx
    loop copiar1
inc si
mov cl, [si]
add dl, [si]    
inc si          
copiar2:
    mov al, [si]
    mov [di], al
    inc di
    inc si
    loop copiar2  

lea di, cadestres
mov [di], 200
inc di
mov [di], dl
ret               

cadest2 db 100, 5, "56789"
cadest1 db 100, 4, "1234"
cadestres db 200 dup ("?")

