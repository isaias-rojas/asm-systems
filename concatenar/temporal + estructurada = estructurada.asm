;temp + estruc = estruc
lea bx, cadtemp
lea si, cadestruc
lea di, cadfinal  

mov cl, [bx] 
mov dl, [bx]
inc bx
inc si

ciclo:
inc bx
loop ciclo
jmp continuar

continuar:
mov cl, [si]
inc si

ciclo2:
mov al, [si] 
mov [bx], al
inc si
inc bx
inc dl 
loop ciclo2 
jmp continuar2

continuar2:
lea bx, cadtemp
mov [bx], dl
inc bx
mov [di], 100
inc di
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
cadestruc db 100,3,"ghi"   
cadfinal db 100 dup("?")