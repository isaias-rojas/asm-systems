org 100h             ; origen en "100h"

inicio:
    lea si, cadf       ; cadena 1(fija)
    lea bx, cadestr      ; cadena 1(estructurada)
    mov [bx], 100
    inc bx
    mov [bx], 6
    inc bx
    mov cx, 6        ; al = valor ascii del valor del puntero de "si"
    
cicloa:
    
    mov al, [si]     ; cambio el byte al que apunta "di" por el valor de "al"
    mov [bx], al
    inc si           ; avanzo el puntero de "si" en 1(apunta al siguiente caracter de cadena 1)
    inc bx           ; avanzo el puntero de "di" en 1(apunta al siguiente caracter de cadena 2)
    loop cicloa
salir:
    ret              ; cierro    
        


cadf db "aasdsd"
cadestr db 100 dup(?)