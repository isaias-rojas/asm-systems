;AscciZ + Final

lea si, cad1
lea di, cad2
mov dl, 3
xor cx, cx

ciclo:
  cmp [si], 0
  je copiar
  inc si
  jmp ciclo


copiar:
  cmp cl, dl
  je salir
  mov al, [di]
  mov [si], al
  inc si
  inc di
  inc cl
  jmp copiar

salir:
  mov [si], 0  
  ret


cad1 db "1234", 0
cad2 db "abc"
