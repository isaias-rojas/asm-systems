;temp + asciz = témp
lea bx, cadtemp
lea si, cadasciz
lea di, cadfinal  

mov cl, [bx] 
mov dl, [bx]
inc bx

ciclo:
inc bx
loop ciclo
jmp ciclo2

ciclo2: 
mov cl, [si]
cmp cl, 0
jz continuar2
mov al, [si]
mov [bx], al
inc si
inc bx
inc dl
jmp ciclo2

continuar2:
lea bx, cadtemp
mov [bx], dl
inc bx      
mov [di], dl
inc di

ciclo3:
cmp dl, 0
jz final
mov al, [bx]
mov [di], al
inc bx
inc di 
dec dl
jmp ciclo3

final:
ret

cadtemp db 5,"abcde"
cadasciz db "ghi",0   
cadfinal db 100 dup("?")


