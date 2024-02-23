; Fija + Estructural
lea si, cad1
lea di, cad2

xor cx, cx
mov bx, 3
inc di
mov dx, [di]
inc di

inicio:
  add si, bx
  
  
copiar:
  cmp dl, cl
  je salir
  mov al, [di]
  mov [si], al
  inc si
  inc di
  inc cl
  jmp copiar
  

salir:
  ret
  
cad2 db 4, 4, "1234"
cad1 db "abc"

