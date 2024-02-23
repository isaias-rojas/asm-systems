org 100h             ; origen en "100h"

inicio:
    lea si, cadte       ; cadena 1(temp)
    lea bx, cadf      ; cadena 1(fija)
    mov dl, [si]
    xor cx, cx
    inc si
    
cicloa:
    cmp cx, dx
    je salir
    mov al, [si]     ; al = valor ascii del valor del puntero de "si"
    mov [bx], al     ; cambio el byte al que apunta "di" por el valor de "al"
    mov ah, [di]     ; almaceno en "ah" el nuevo valor ascii del calor del puntero "di"
    inc si           ; avanzo el puntero de "si" en 1(apunta al siguiente caracter de cadena 1)
    inc bx           ; avanzo el puntero de "di" en 1(apunta al siguiente caracter de cadena 2)
    inc cl
    jmp cicloa
salir:
    ret              ; cierro    
        


cadte db 4, "aasd"
cadf db 100 dup(?)
