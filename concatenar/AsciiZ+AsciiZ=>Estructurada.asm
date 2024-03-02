; asciiz + Asciiz => Estructurada

lea si, cadena1
lea bx, cadena2
lea di, cadena3
inc di
inc di
xor cx, cx

ciclo1:
  cmp [si], 0
  je ciclo2
  mov al, [si]
  mov [di], al
  inc si
  inc di
  inc cx
  jmp ciclo1


ciclo2:
  cmp [bx], 0
  je terminar
  mov al, [bx]
  mov [di], al
  inc bx
  inc di
  inc cx
  jmp ciclo2

terminar:
  lea di, cadena3
  mov [di], 100
  inc di
  mov [di], cl
  ret


cadena1 db "abc",0
cadena2 db "123",0

cadena3 db 100 dup("?")
