    .model small
.stack 100h
.data
    mensaje1 db "Enter the number: $", 13
    numero db 20 dup("?"),10,13
    mensaje2 db "Result:$", 13
    resultado db 20 dup("0"),10,13
    mensajeerror db 9, "tas mal uwu", 10, 13
            db "$"

    readdx macro message
              lea dx, message
              call showstringproc
       endm

    recievenumber macro message, buffer
              lea dx, message
              call showstringproc 
              lea di, buffer
              mov cx, 20
              mov dl, 0
              call readcicle

       endm      
.code
sisoyuwu:

    mov ax, @data  
    mov ds, ax

    recievenumber mensaje1, numero
    readdx mensaje2

    ;suma god

    
    lea si, numero
    lea di, resultado
    inc di
    inc di
    xor cx, cx
addDigits:
    
        mov al, [si]  ; almacenar valor de si en al
        mov dl, [di]  ; almacenar valor de di en dl
        cmp al, 0     ; compararlo con 0 para saber que se llegó al final de la cadena asciiz
        je terminar
        sub al, "0"   ; restarle el valor ascii de 0 para tener el resultado como digito
        sub dl, "0"   ; restarle el valor ascii de 0 para tener el resultado como digitoe
        inc si        ; apuntar al siguiente digito de si
        add al, dl    ; sumar al con dl y guardar en al
        cmp al, 9     ; verificar que el resultado de la suma sea solo 1 digito
        jg carry
        add al, "0"
        mov [di], al  ; guardar el resultado en el lugar correcto de di mediante suma
        jmp addDigits
carry:
       sub al, 10    ; restar 10 a al para asi tener el digito solo
       add al, "0"
       mov [di], al  ; colocar el digito en di
carrycicle:
       inc cl               ; incrementar contador de digitos de di recorridos
       dec di               ; apuntar al anterior digito resultado de di
       mov ah, [di]         ; guardar el valor de di en ah
       mov byte ptr [di], "0" ; colocar un 0 provicional en di
       sub ah, "0"          ; restar a ah el valor ascii de 0 para tener el digito en ah
       add ah, 1            ; sumar 1 a ah (el carry de la ultima suma)
       cmp ah, 9            ; comparar si el resultado de la suma es menor a 10
       jg carrycicle        
       add ah, "0"          ; añadir el ascii de 0 a ah para asi tener el ascii del digito en ah
       mov [di], ah         ; asignar a el valor di el de ah
reacomodar:
       inc di               
       loop reacomodar      ; volver a la posicion del digito resultado donde nos habiamos quedado antes
       jmp addDigits              

    

terminar:
    inc di
    mov byte ptr [di], "$"
    readdx resultado
    mov ah, 4ch
    int 21h

readchar:
    mov ah, 1
    int 21h
    ret

    readcicle:
       call readchar
       cmp al, 13
       je terminarmacro
       cmp al, "0"
       jl erroruwu
       cmp al, "9"
       jg erroruwu
       mov [di], al
       inc di
       inc dl
       loop readcicle

    erroruwu:
       readdx mensajeerror
       jmp readcicle

    showstringproc:
       mov ah, 9
       int 21h
       ret
    
    terminarmacro:
       mov byte ptr [di], 0
       ret
   
          

end sisoyuwu