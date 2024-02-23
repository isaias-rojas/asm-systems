lea si, cad1
lea di, cad2

xor cx, cx
xor ax, ax

mov bx, [si]
mov dx, [di]
inc si
inc di

inicio:
  cmp al, bl
  je copiar
  inc al
  inc si
  jmp inicio  
  
copiar:
  cmp cl, dl
  je salir
  mov al, [di]
  mov [si], al
  inc di
  inc si
  inc cl
  jmp copiar
  
  
salir:
  lea si, cad1
  add [si], cl
  ret
  
  
cad2 db 4, "1234"
cad1 db 3, "abc"

