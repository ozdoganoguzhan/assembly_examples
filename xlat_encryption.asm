title xlatb_encryption.asm
.model small
.data
    xlat_table db "3148527690"
    decrypted db "0123456789"
    encrypted db 10 DUP(' ')
.code
ana proc far
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cx, 10
    lea bx, xlat_table
    lea si, decrypted 
    lea di, encrypted
    
dongu:
    lodsb
    sub al, '0'
    xlatb
    stosb
    loop dongu
    
    mov ah, 04ch
    int 21h
ana endp
end ana
    