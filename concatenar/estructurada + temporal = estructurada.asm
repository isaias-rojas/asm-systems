; est + temp = est
lea bx, cadest1
lea si, cadtemp2 
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

cadtemp2 db 5, "56789"       ;si
cadest1 db 100, 4, "1234"    ;bx
cadestres db 200 dup ("?")

