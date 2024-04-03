title en_buyuk_bul_sona_at.asm
.model small
.stack 128h
.data
    liste dw 8, 11, 22, 33, 44, 35, 55, 46, 66
.code
ana proc far
    cld
    pusha
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cx, word ptr liste
    
    mov di, offset liste+2
dongu: 
    mov ax, [di]
    cmp ax, [di+2]
    jbe devam
    
buyuk:
    mov dx, [di+2]
    mov [di], dx
    mov [di+2], ax
    
devam:
    add di, 2
    loop dongu
    
bitir:
    popa
    mov ah, 04ch
    int 021h
ana endp
end ana
 
    