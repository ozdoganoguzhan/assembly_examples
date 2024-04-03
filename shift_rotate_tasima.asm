title shift_rotate_tasima.asm
.model small
.stack 128h
.data
    sayi db 01101001b, 0
    sayi2 db ?
.code
ana proc far
    cld
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cx, 8
    
tasi:
    ror byte ptr sayi, 1
    rcr byte ptr sayi2, 1
    loop tasi
    
bitir:
    mov ah, 04ch
    int 21h
ana endp
end ana