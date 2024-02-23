org 100h             ; origen en "100h"

inicio:
    lea si, cadtemp    ; carga la dirección de cadtemp en SI
    lea bx, cadestr    ; carga la dirección de cadestr en BX
    mov [bx], 100        ; supongo que esto estaba para otra cosa, dejé la línea igual
    inc bx             ; avanzo al siguiente byte en cadestr
    mov al, [si]
    mov [bx], al        ; 5 es el tamaño de la cadena
    inc bx             ; avanzo al siguiente byte en cadestr
    mov cl, [si]       ; carga el primer byte de cadtemp (longitud) en CL
    inc si             ; avanzo al primer carácter de cadtemp
    xor dx, dx         ; reinicia DX a 0

cicloa:
    cmp cl, 0          ; compara CL con 0
    jz salir           ; si CL es cero, salta a salir
    mov al, [si]       ; carga el byte apuntado por SI en AL
    mov [bx], al       ; copia el byte de cadtemp a cadestr
    inc si             ; avanza el puntero de si
    inc bx             ; avanza el puntero de bx
    dec cl             ; decrementa el contador de longitud
    jmp cicloa         ; salta de vuelta al principio del ciclo

salir:
    ret                ; retorno al finalizar

cadtemp db 5, "abcde" ; longitud de la cadena seguido de la cadena
cadestr db 100 dup(?) ; reserva espacio para la cadena copiada