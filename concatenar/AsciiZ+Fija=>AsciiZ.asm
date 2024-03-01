; asciiz + Fija => AsciiZ

lea si, cadena1
lea bx, cadena2
lea di, cadena3
mov cx, 3

ciclo1:
  cmp [si], 0
  je ciclo2
  mov al, [si]
  mov [di], al
  inc si
  inc di
  jmp ciclo1


ciclo2:
  cmp cl, 0
  je terminar
  mov al, [bx]
  mov [di], al
  inc bx
  inc di
  dec cl
  jmp ciclo2

terminar:
  mov [di], 0
  ret


cadena1 db "abc",0
cadena2 db "123"

cadena3 db 100 dup("?")
