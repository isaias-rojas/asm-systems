.model tiny

.code

org 100h
main:

getuser:
    lea dx, usuariomessage
    lea bx, usuarioget 
    call showString
    mov cl, 20
    mov ah, 1
    call getcicle
    
    lea si, usuarioget
    lea bx, usuariores
    call verifiercicle 
    
    lea dx, passwordmessage
    lea bx, passwordget 
    call showString
    mov cl, 20
    mov ah, 7
    call getcicle
    
    lea si, passwordget
    lea bx, passres
    call verifiercicle
    
    call exitmenu   
    
getcicle:
    call readL
    cmp cl, 0
    je error
    cmp al, 13
    je return
    mov [bx], al
    inc bx
    dec cl
    jmp getcicle
                    
verifiercicle:
    mov al, [si]
    cmp [bx], 0
    je return
    mov cl, [bx]
    cmp [bx], al
    jne error
    inc bx
    inc si
    jmp verifiercicle

showString:
    mov ah, 9
    int 21h
    ret

readL:
    int 21h
    ret

error:
    lea dx, errormessage
    call showString
    int 20h

exitmenu:    
    lea dx, menu
    call showString
    int 20h

return:
    ret            
    
    usuariomessage db "Usuario : $"
    usuarioget db 20 dup("$")
    usuariores db "123", 0

    errormessage db " tas maaaaal$"
    
    passwordmessage db "Contrasenia: $"
    passwordget db 20 dup("$")
    passres db "123", 0

    menu db "....menu....$"
    end main
