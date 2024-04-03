title liste_byk_kck_bul.asm
.model small
.stack 128h
.data                        
    liste dw 2245, 4425, 40008, 22012, 34209, 36377, 1071
    kckSayi dw 0
    bykSayi dw 0
.code
ana proc far
    cld
    mov ax, @data
    mov ds, ax
    mov es, ax
    mov cx, 7
    
    lea di, liste
    mov ax, [di]
    mov kckSayi, ax
    mov bykSayi, ax 
    
dongu:
    mov ax, [di]
    
    cmp bykSayi, ax
    jb buyuk       
    
    cmp kckSayi, ax
    jae kucuk

devam:
    add di, 2    
    loop dongu
    jmp bitir
 
buyuk:
    mov bykSayi, ax
    jmp devam
    
kucuk:
    mov kckSayi, ax
    jmp devam
    
bitir:
    mov ah, 4ch
    int 21h
ana endp
end ana
    
    
                     