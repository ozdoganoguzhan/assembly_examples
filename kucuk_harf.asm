title kucuk_harf.asm
.model small
.stack 128h
.data
    DIZIN DB 'BILGISAYAR'
.code
ana proc far
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    lea bx, DIZIN
    mov cx, 10
dongu:
    add [bx], 32
    inc bx
    loop dongu
    
    mov ah, 04ch
    int 21h
ana endp
end ana