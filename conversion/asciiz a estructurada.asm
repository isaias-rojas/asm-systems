org 100h             ; origen en "100h"

inicio:
    lea si, cadasc
    lea bx, cadestr
    mov [bx], 100
    inc bx
    inc bx
    mov cl, [si]
    xor dx, dx
    
cicloa:
    
    cmp cl, 0     
    je salir
    mov [bx], cl
    inc si)
    inc bx
    mov cl, [si]
    inc dl
    jmp cicloa
salir:
    lea bx, cadestr
    inc bx
    mov [bx], dl 
    ret              ; cierro    
        


cadasc db "aasdsd", 0
cadestr db 100 dup(?)
