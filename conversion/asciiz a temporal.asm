org 100h             ; origen en "100h"

inicio:
    lea si, cadasc       ; cadena 1(asciiz)
    lea bx, cadtem       ; cadena 1(temp)
    xor cx, cx
    
cicloa:
    cmp [si], 0
    je salir
    mov al, [si]     ; al = valor ascii del valor del puntero de "si"
    mov [bx], al     ; cambio el byte al que apunta "di" por el valor de "al"
    inc si           ; avanzo el puntero de "si" en 1(apunta al siguiente caracter de cadena 1)
    inc bx           ; avanzo el puntero de "di" en 1(apunta al siguiente caracter de cadena 2)
    jmp cicloa
salir:
    ret              ; cierro    
        


cadasc db "aasd", 0
cadtem db 100 dup(?)
