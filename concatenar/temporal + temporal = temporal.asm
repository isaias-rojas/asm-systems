;temp + temp2 = temp3
lea bx, cadtemp
lea si, cadtemp2
lea di, cadfinal

mov cl, [bx] 
mov dl, [bx]
inc bx

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
cadtemp2 db 3,"ghi" 
cadfinal db 100 dup("?")