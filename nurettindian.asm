.model small
.stack
    DW 2244h
    DW 3366h
    DW 126 DUP(0)
.data
    dusukDeger DB ?, ?
    yuksekDeger DB ?, ?
.code
ana proc near
    start:
        mov ax, @data
        mov ds, ax
        mov es, ax   
        
        pop ax
        mov dusukDeger[0], al
        mov yuksekDeger[0], ah
        
        pop ax
        mov dusukDeger[1], al
        mov yuksekDeger[1], ah
        
        mov ax, 4ch
        int 21h
        
endp
end ana
        
        
        
 