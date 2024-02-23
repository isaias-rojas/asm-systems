; Estructural - fija
estr db 4,2, "1234"
fija db 10 dup(?)

lea si, estr 
lea di, fija
mov bl, [si]
xor cx, cx
add si, 2

ciclo:
  mov al, [si]
  mov [di], al
  inc si
  inc di
  inc cl
  cmp cl, bl
  je terminar
  jmp ciclo

terminar: