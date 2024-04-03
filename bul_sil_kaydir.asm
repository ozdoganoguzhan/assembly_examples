title bul_sil_kaydir.asm
.model small
.stack 128h
.data
    DIZI DB 45, 70, 55, 80, 85
.code
ana proc far
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cx, 5
    mov ax, 0 
    lea bx, DIZI
dongu:
    mov al, [bx]
    cmp al, 55
    je sil
    inc bx
    loop dongu
    jmp bitir
sil:
    mov al, [bx+1]
    mov [bx], al
    inc bx      
    loop sil
    

bitir:    
    mov ah, 4ch
    int 21h
    
ana endp
end ana