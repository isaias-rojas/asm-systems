org 100h             ; origen en "100h"

inicio:
    lea si, cadf       ; cadena 1(fija)
    lea bx, cadte      ; cadena 1(temp)
    mov cl, 4
    mov [bx], cl
    inc bx
    xor dx, dx
cicloa:
    
    cmp cx, dx
    je salir
    mov al, [si]     ; al = valor ascii del valor del puntero de "si"
    mov [bx], al     ; cambio el byte al que apunta "di" por el valor de "al"
    mov ah, [di]     ; almaceno en "ah" el nuevo valor ascii del calor del puntero "di"
    inc si           ; avanzo el puntero de "si" en 1(apunta al siguiente caracter de cadena 1)
    inc bx           ; avanzo el puntero de "di" en 1(apunta al siguiente caracter de cadena 2)
    inc dl  
    jmp cicloa
   
   
salir:
    ret              ; cierro    
        


cadf db "aasd"
cadte db 100 dup(?)
