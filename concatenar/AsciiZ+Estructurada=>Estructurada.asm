; asciiz + Estructurada => Estructurada

lea si, cadena1
lea bx, cadena2
lea di, cadena3
inc bx
mov cx, [bx]
xor dx, dx
inc bx
inc di
inc di

ciclo1:
  cmp [si], 0
  je ciclo2
  mov al, [si]
  mov [di], al
  inc si
  inc di
  inc dx
  jmp ciclo1


ciclo2:
  cmp cl, 0
  je terminar
  mov al, [bx]
  mov [di], al
  inc bx
  inc di
  inc dx
  dec cl
  jmp ciclo2

terminar:
  lea di, cadena3
  mov [di], 100
  inc di
  mov [di], dl
  ret


cadena1 db "abc",0
cadena2 db 100, 3, "123"

cadena3 db 100 dup("?")
