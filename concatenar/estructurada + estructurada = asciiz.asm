; est + est = asciiz                            
lea bx, cadest1
lea si, cadest2 
lea di, cadascres
inc bx
mov cl, [bx]
inc bx
copiar1:
    mov al, [bx]
    mov [di], al
    inc di
    inc bx
    loop copiar1
inc si
mov cl, [si]    
inc si          
copiar2:
    mov al, [si]
    mov [di], al
    inc di
    inc si
    loop copiar2

mov [di],0
ret               

cadest2 db 100, 5, "56789"
cadest1 db 100, 4, "1234"
cadascres db 200 dup ("?")

