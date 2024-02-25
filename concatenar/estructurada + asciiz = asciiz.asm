; est + asciiz = asciiz
lea bx, cadest1
lea si, cadasciiz2 
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
    
copiar2:
    
    mov al, [si]
    cmp al, 0
    je salir
    mov [di], al
    inc di
    inc si  
    jmp copiar2
    
salir:
mov [di], 0
ret               

cadasciiz2 db "56789", 0       ;si
cadest1 db 100, 4, "1234"    ;bx
cadascres db 200 dup ("?")
