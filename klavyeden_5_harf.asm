org 100h
mov cx, 5
basadon:
    push cx
    mov ah, 00h
    int 16h
    
    mov ah, 0Ah
    mov bh, 0
    mov cx, 1
    int 10h
    
    mov ah, 03h
    int 10h
    
    mov ah, 02h
    inc dl
    int 10h
    pop cx
    loop basadon
    ret
    