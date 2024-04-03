title xlat_uppercase_ve_abs_proc.asm
.model small
.data
    buyuk db "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    kucuk db "abcdefghijklmnopqrstuvwxyz"
    cumle db "NurettinOrospuoglu"
    cumle_byk db 18 DUP(?)
.code
ana proc far
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    xor ax, ax
    
    mov ax, -31313
    call absolute
    
    mov cx, 18
    lea bx, buyuk
    mov si, offset cumle
    mov di, offset cumle_byk
    
dongu:
    lodsb
    cmp al, 'a'
    jb zaten_buyuk
    sub al, 'a'
    xlatb
zaten_buyuk:
    stosb
    loop dongu
    

    
    mov ah, 04ch
    int 21h
ana endp
absolute proc near
    
    ;al'yi mutlak deger yapan prosedur
    mov dx, ax
    sar dx, 15
    xor ax, dx
    sub ax, dx
    
don:
    ret
end ana
    
    