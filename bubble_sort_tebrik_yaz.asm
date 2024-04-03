title bubble_sort.asm
.model small
.stack 128h
.data
    liste DB 07Dh, 57h, 60h, 2Dh, 56h, 0Dh, 38h
    uznluk = 7
    tebrik DB 16, "Liste siralandi."
.code
ana proc far
    cld
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cx, 6
    
anadongu:
    push cx  
    lea si, liste
    
icdongu:
    mov al, [si]
    cmp al, [si+1]
    jbe icdevam
    xchg al, [si+1]
    mov [si], al
    
icdevam:
    inc si
    loop icdongu

anadevam:    
    pop cx
    loop anadongu
    
    call stryaz
    
bitir:
    mov ah, 04ch
    int 021h
    
ana endp
stryaz proc near
    pusha
    mov cl, tebrik;uzunluk al
    lea si, tebrik+1;ilk harf
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
stryaz endp 
end ana
    
    
    