title listedensil.asm
.model small
.stack 128h
.data
    liste db 5, 040h, 071h, 0EFh, 045h, 0CDh
.code
ana proc far
    cld
    mov ax, @data
    mov ds, ax
    mov es, ax
    xor cx, cx
    
    ;istenen karakteri bul sil kaydir
    mov al, 0CDh
    mov cl, byte ptr liste
    lea di, liste+1;+1 cunku ilk deger uzunluk
    
    repne scasb
    jne bitir
    jcxz sonel;son eleman ise direkt 0 yap

kaydir:
    mov bx, [di]    
    mov [di-1], bx
    inc di
    loop kaydir
    jmp bitir

sonel:
    mov [di-1], 0;-1 cunku di son+1'de
    
bitir:
    mov ah, 4ch
    int 21h
    
ana endp
end ana
    
    