.model small
.stack 100h
.data
    mensaje1 db 10, 13, 9, "Ingrese su cadena: $" ;el primer mensaje que se pedira al usuario
    
    resultado db 10, 13, 9, "numero de vocales es:$" ;el mensaje del resultado

    buffer1 db 20 dup ('$') ;Esto es un buffer y 1 porque es el primero
    buffer2 db 20 dup ('$') ;Esto es otro buffer y 2 porque es el segundo

    readdx macro message
              lea dx, message
              call showstringproc
    endm

.code
main:

    readdx mensaje1
    xor cx, cx
    mov cl, 20
    lea si, buffer1
    
leerCadena:
    call readchar
    cmp al, 13
    je matate
    mov [si], al
    inc si
    loop leerCadena


matate:
    xor dx, dx
    mov byte ptr [si], 0
    lea si, buffer1
continuar:
    mov al, [si]
    cmp al, 0
    jz salir
    cmp al, "a"
    je incrementador
    cmp al, "e"
    je incrementador
    cmp al, "i"
    je incrementador
    cmp al, "o"
    je incrementador
    cmp al, "u"
    je incrementador
    cmp al, "A"
    je incrementador
    cmp al, "E"
    je incrementador
    cmp al, "I"
    je incrementador
    cmp al, "O"
    je incrementador
    cmp al, "U"
    je incrementador
    jmp continuar

incrementador:
    inc dl
    ret

readchar: 
    mov ah, 1
    int 21h
    ret
    
salir:
    lea di, buffer2 
    mov [di], dl
    readdx buffer2
    mov ah, 4ch
    int 21h

showstringproc:
    mov ah, 9
    int 21h
    ret
end main
