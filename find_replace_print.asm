title kurtmen_emre
.stack 128h
.data      
    yazi db 18, "cCc Tumen Emre cCc"
.code
ana proc far
    cld
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    xor ax, ax
    xor cx, cx
    
    mov cl, yazi
    lea di, yazi+1
               
    mov al, 'u'
    repne scasb
    jne yok
    mov al, '*'
    mov [di-1], al
yok:
    call chryaz
    
bitir:
    mov ah, 04ch
    int 21h
    
ana endp   

chryaz proc near
    pusha
    mov cl, yazi;uzunluk al
    lea si, yazi+1;ilk harf
  yaz:
    push cx
    mov ah, 09h
    mov al, [si]
    mov bh, 0
    mov bl, 0Bh
    mov cx, 1
    int 10h
    inc si
    
    mov ah, 03h
    int 10h
    
    mov ah, 02h
    inc dl
    int 10h
    
    pop cx
    loop yaz 
    
    popa
    ret
chryaz endp 
end ana
