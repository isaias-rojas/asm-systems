.model small
.stack 100h
.data
    mensajedeingresodefrase db 9, "ingrese una frase: $" ,10, 13
    bufferdenumerodepalabras db 20 dup ('$')
    bufferMensafe db 20 dup ('$')
    
    readdx macro message
              lea dx, message
              call showstringproc
    endm
.code
main:
    mov ax, @data
    mov ds, ax

    readdx mensajedeingresodefrase
    xor cx, cx
    xor bx, bx
    
    lea di, bufferMensafe

    lector:
    
    ciclocomparativodeespaciosparafelicidaddelhugo: ;Comparador de espacios aclaro
        mov al, [di]
        cmp al, 13
        je safar
        cmp al, 20
        je incrementadordebl
        inc di
        jmp ciclocomparativodeespaciosparafelicidaddelhugo
   
    incrementadordebl:
        inc bl
        ret

    safar:
        lea si, bufferdenumerodepalabras
        mov [si], bl
        readdx bufferdenumerodepalabras
        mov ah, 4ch
        int 21h
        
    showstringproc:
    mov ah, 9
    int 21h
    ret
    
    errormessage:
    readchar: 
    mov ah, 1
    int 21h
    ret

end main


