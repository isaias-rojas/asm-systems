.model small  

.stack 100h

.data
       mensaje1 db 9, "=====================",10, 13
              db 9,  "Add two numbers",10, 13
              db 9, "=====================$"
       mensaje2 db 10,13,"Enter number 1: $"
       mensaje3 db 10,13,"Enter number 2: $"
       mensajeerror db 9, "tas mal uwu", 10, 13
              db "$"
       resultado db "El resultado de la suma aritmetica ingresada por el estimadpo usuario trabajada en los numeros reales entre un rango limitado es equivalente especifca y literalmente, lo demas son emociones reprimidas contra las docentes: $"

       buffer1 db 20 dup ('$')
       buffer2 db 20 dup ('$')
       buffer3 db 21 dup ('0')

       
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

main:

       mov ax, @data  
       mov ds, ax

       readdx mensaje1
       xor dx, dx
       recievenumber mensaje2, buffer1
       mov bl, dl
       mov dl, 0
       recievenumber mensaje3, buffer2

       readdx resultado
       lea si, buffer1
       lea bx, buffer2
       lea di, buffer3
       xor cx, cx
contardigitos:
       mov al, [si]
       cmp al, 0
       je contardigitos2
       inc cl
       inc si
       jmp contardigitos
contardigitos2:
       mov al, [bx]
       cmp al, 0
       je continuar
       dec cl
       inc bx
       jmp contardigitos2
continuar:
       lea si, buffer1
       lea bx, buffer2
       lea di, buffer3
       inc di  ; movernos al 2do espacio de di para tener un digito extra en caso de necesitar 1 extra
       add cl, 20
       cmp cl, 20
       je continuar2
       jl secondgreater
       jg firstgreater
secondgreater:
       mov dl, [bx]
       cmp cl, 20
       je continuar2
       mov [di], dl
       inc di
       inc bx
       inc cl
       jmp secondgreater
firstgreater:
       mov al, [si]
       cmp cl, 20 
       je continuar2
       mov [di], al 
       inc di
       inc si
       dec cl
       jmp firstgreater

continuar2:
       xor cx, cx  ; inicializa cx en 0
sumardigitos:       
       mov al, [si]  ; almacenar valor de si en al
       mov dl, [bx]  ; almacenar valor de bx en dl
       cmp al, 0     ; compararlo con 0 para saber que se llegó al final de la cadena asciiz
       je terminar
       cmp dl, 0     ; compararlo con 0 para saber que se llegó al final de la cadena asciiz
       je terminar
       sub al, "0"   ; restarle el valor ascii de 0 para tener el resultado como digito
       sub dl, "0"   ; restarle el valor ascii de 0 para tener el resultado como digitoe
       inc si        ; apuntar al siguiente digito de si
       inc bx        ; apuntar al siguiente digito de bx
       mov dh, [di]  ; almacenar valor de di en dh
       sub dh, "0"   ; restarle el valor ascii de 0 para tener el resultado como digito
       add al, dl    ; sumar al con dl y guardar en al
       add al, dh    ; sumar al con dh y guardar en al
       cmp al, 9     ; verificar que el resultado de la suma sea solo 1 digito
       jg carry
       add [di], al  ; guardar el resultado en el lugar correcto de di mediante suma
       inc di        ; apuntar al siguiente espacio de di(resultado)
       jmp sumardigitos
carry:
       sub al, 10    ; restar 10 a al para asi tener el digito solo
       add [di], al  ; colocar el digito en di
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
       inc di
       jmp sumardigitos              
terminar:
       mov byte ptr [di], "$"
       readdx buffer3
       mov ah, 04ch
       int 21h
showstringproc:
       mov ah, 9
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

terminarmacro:
       mov byte ptr [di], 0
       ret

readchar:
       mov ah, 1
       int 21h
       ret


end main