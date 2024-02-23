; Ascii - Fija

cad1 db "123", 0
cad2 db 100 dup ('?')

lea si, cad1
lea di, cad2

ciclo:
  mov cl, [si]
  cmp cl, 0
  je terminar
  mov [di], cl
  inc si
  inc di
  loop ciclo
  
terminar:
  ret
