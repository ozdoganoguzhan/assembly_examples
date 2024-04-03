title sonrasina_string_at.asm
.model small
.stack 128h
.data
    DIZIN DB 'Agacin Kurdu'
.code
ana proc far
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cx, 12
    lea si, DIZIN
    lea di, DIZIN+12
    
    rep movsb
    
    mov ah, 04ch
    int 021h
ana endp
end ana