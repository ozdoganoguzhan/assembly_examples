title buyuk_bul_sona_at.asm
.model small
.stack
    DB 0
    DB 127 DUP(?)
.data
    LISTE DB 45, 70, 55, 80, 65, 11, 22, 33, 44, 79
.code
ana proc far
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cx, 10
    mov ax, 0
    mov dl, LISTE
    lea bx, LISTE
    
bul:
    mov al, [bx]
    cmp dl, al
    jae buldevam
    mov dl, al
    mov si, cx
    mov di, bx
    
buldevam:
    inc bx
    loop bul
    
    mov cx, si;kac kere kayacagi
    dec cx
    jcxz bitir
 
kaydir:
    mov al, [di]
    xchg [di+1], al
    mov [di], al
    inc di
    loop kaydir   
     
    
bitir:    
    mov ah, 04ch,
    int 21h
ana endp
end ana
    