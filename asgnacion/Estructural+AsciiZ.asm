; Estructural + AsciiZ
lea si, cad1
lea di, cad2

xor cx, cx
xor ax, ax

inc si
mov bx, [si]

inicio:
  cmp bl, al
  je copiar
  inc ax
  inc si
  jmp inicio
  
copiar:
  inc si
  cmp [di], 0
  je salir
  mov al, [di]
  mov [si], al
  inc di
  inc cl
  jmp copiar
  

salir:
  lea si, cad1
  add [si], cl
  inc si
  add [si], cl
  ret


cad1 db 4, 4, "1234"
cad2 db "abc", 0
