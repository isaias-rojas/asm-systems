org 100h ; Punto de entrada del programa



    lea si, cadena_estructurada ; Puntero a la cadena estructurada
    lea di, cadena_temporal ; Puntero a la cadena temporal

    ; Copia las horas (HH)       
    mov bx, di
    mov dx, si
    inc si ; Saltar el delimitador ':'            
    mov cx, 0
    ciclo:
        mov al, [si]
        mov [di], al
        inc si
        inc di                  
        inc cx
        cmp cx, 8
        je end_ciclo
        jmp ciclo
                 
    end_ciclo:                                     
    
        
        lea dx, [bx] ; Carga la dirección de la cadena temporal en dx
        ret
    
                                
    cadena_estructurada db 100, 8, "12:34:56"; Cadena estructurada de entrada
    cadena_temporal db 100 dup('?') ; Cadena temporal de salida    
